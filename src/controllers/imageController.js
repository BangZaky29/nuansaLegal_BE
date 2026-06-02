const db = require('../config/database');
const multer = require('multer');
const path = require('path');
const fs = require('fs');

// ── Helper ──────────────────────────────────────────────────────────────────
const getImageUrl = (filePath) => {
  const baseUrl = process.env.BASE_URL || `http://localhost:${process.env.PORT || 5000}`;
  return `${baseUrl}/uploads/${filePath}`;
};

// ── Multer Storage Configuration ────────────────────────────────────────────
const uploadDir = path.join(__dirname, '../../public/uploads');
if (!fs.existsSync(uploadDir)) {
  fs.mkdirSync(uploadDir, { recursive: true });
}

const storage = multer.diskStorage({
  destination: (_req, _file, cb) => {
    cb(null, uploadDir);
  },
  filename: (_req, file, cb) => {
    const timestamp = Date.now();
    // Sanitize filename: remove spaces and special chars
    const cleanName = file.originalname.replace(/\s+/g, '_').replace(/[^a-zA-Z0-9._-]/g, '');
    cb(null, `${timestamp}_${cleanName}`);
  }
});

const fileFilter = (_req, file, cb) => {
  const allowedTypes = /jpeg|jpg|png|gif|webp|svg/;
  const extname = allowedTypes.test(path.extname(file.originalname).toLowerCase());
  const mimetype = allowedTypes.test(file.mimetype);
  if (extname && mimetype) {
    cb(null, true);
  } else {
    cb(new Error('Hanya file gambar yang diizinkan! (.jpg, .jpeg, .png, .gif, .webp, .svg)'));
  }
};

const upload = multer({
  storage,
  fileFilter,
  limits: { fileSize: 10 * 1024 * 1024 } // 10 MB max per file
});

// Export multer middleware for use in routes
exports.uploadMiddleware = upload.array('images', 20); // max 20 files at once

// ── GET All Images ───────────────────────────────────────────────────────────
exports.getAllImages = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM images ORDER BY period DESC, created_at DESC');
    const images = rows.map(img => ({ ...img, url: getImageUrl(img.path) }));
    res.json(images);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
};

// ── GET by Category ──────────────────────────────────────────────────────────
exports.getImagesByCategory = async (req, res) => {
  const { category } = req.params;
  const { period } = req.query;
  try {
    let query = 'SELECT * FROM images WHERE category = ?';
    let params = [category];

    if (period) {
      query += ' AND period = ?';
      params.push(period);
    }

    query += ' ORDER BY id ASC';

    const [rows] = await db.query(query, params);
    const images = rows.map(img => ({ ...img, url: getImageUrl(img.path) }));
    res.json(images);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
};

// ── GET by Sub-Category ──────────────────────────────────────────────────────
exports.getImagesBySubCategory = async (req, res) => {
  const { category, subCategory } = req.params;
  const { period } = req.query;
  try {
    let query = 'SELECT * FROM images WHERE category = ? AND sub_category = ?';
    let params = [category, subCategory];

    if (period) {
      query += ' AND period = ?';
      params.push(period);
    }

    query += ' ORDER BY id ASC';

    const [rows] = await db.query(query, params);
    const images = rows.map(img => ({ ...img, url: getImageUrl(img.path) }));
    res.json(images);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
};

// ── GET by Period ────────────────────────────────────────────────────────────
exports.getImagesByPeriod = async (req, res) => {
  const { period } = req.params;
  try {
    const [rows] = await db.query(
      'SELECT * FROM images WHERE period = ? ORDER BY category ASC, id ASC',
      [period]
    );
    const images = rows.map(img => ({ ...img, url: getImageUrl(img.path) }));
    res.json(images);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
};

// ── POST Upload Images ───────────────────────────────────────────────────────
exports.uploadImage = async (req, res) => {
  try {
    if (!req.files || req.files.length === 0) {
      return res.status(400).json({ message: 'Tidak ada file yang diupload.' });
    }

    const { period, category = 'promo', sub_category, alt_text } = req.body;

    if (!period) {
      // Cleanup uploaded files if period missing
      req.files.forEach(f => fs.unlink(f.path, () => {}));
      return res.status(400).json({ message: 'Field "period" wajib diisi (contoh: 2026/Juni).' });
    }

    const insertedIds = [];

    for (const file of req.files) {
      const name = file.originalname;
      const filePath = file.filename; // just the filename, served via /uploads/

      const [result] = await db.query(
        `INSERT INTO images (name, path, period, category, sub_category, alt_text, original_path, created_at)
         VALUES (?, ?, ?, ?, ?, ?, ?, NOW())`,
        [name, filePath, period, category, sub_category || null, alt_text || null, file.path]
      );

      insertedIds.push({
        id: result.insertId,
        name,
        path: filePath,
        period,
        category,
        sub_category: sub_category || null,
        alt_text: alt_text || null,
        url: getImageUrl(filePath)
      });
    }

    res.status(201).json({
      message: `${insertedIds.length} gambar berhasil diupload.`,
      data: insertedIds
    });
  } catch (error) {
    console.error('Upload error:', error);
    // Cleanup on DB error
    if (req.files) req.files.forEach(f => fs.unlink(f.path, () => {}));
    res.status(500).json({ message: 'Gagal upload gambar.', error: error.message });
  }
};

// ── DELETE Image ─────────────────────────────────────────────────────────────
exports.deleteImage = async (req, res) => {
  const { id } = req.params;
  try {
    const [rows] = await db.query('SELECT * FROM images WHERE id = ?', [id]);
    if (rows.length === 0) {
      return res.status(404).json({ message: 'Gambar tidak ditemukan.' });
    }

    const image = rows[0];
    const filePath = path.join(uploadDir, image.path);

    // Delete from DB first
    await db.query('DELETE FROM images WHERE id = ?', [id]);

    // Then remove physical file (ignore error if file not found)
    fs.unlink(filePath, (err) => {
      if (err) console.warn(`File tidak ditemukan di disk: ${filePath}`);
    });

    res.json({ message: 'Gambar berhasil dihapus.', id: Number(id) });
  } catch (error) {
    console.error('Delete error:', error);
    res.status(500).json({ message: 'Gagal menghapus gambar.', error: error.message });
  }
};
