const db = require('../config/database');

const getImageUrl = (path) => {
  const baseUrl = process.env.BASE_URL || `http://localhost:${process.env.PORT || 5000}`;
  return `${baseUrl}/uploads/${path}`;
};

exports.getAllImages = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM images ORDER BY period DESC, created_at DESC');
    const images = rows.map(img => ({
      ...img,
      url: getImageUrl(img.path)
    }));
    res.json(images);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
};

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
    const images = rows.map(img => ({
      ...img,
      url: getImageUrl(img.path)
    }));
    res.json(images);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
};

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
    const images = rows.map(img => ({
      ...img,
      url: getImageUrl(img.path)
    }));
    res.json(images);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
};

exports.getImagesByPeriod = async (req, res) => {
  const { period } = req.params;
  try {
    const [rows] = await db.query('SELECT * FROM images WHERE period = ? ORDER BY category ASC, id ASC', [period]);
    const images = rows.map(img => ({
      ...img,
      url: getImageUrl(img.path)
    }));
    res.json(images);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
};

