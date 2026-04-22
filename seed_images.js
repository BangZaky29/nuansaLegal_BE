require('dotenv').config();
const db = require('./src/config/database');

const images = [
  // Logos & Brand
  {
    name: 'LOGO-NUANSA-LEGAL',
    path: 'logo/logo-nuansa-legal.png',
    category: 'other',
    sub_category: 'brand',
    alt_text: 'Logo PT. Nuansa Berkah Sejahtera',
    original_path: 'src/assets/logo/logo-nuansa-legal.png'
  },
  // Promos for April 2024 (Example)
  {
    name: 'Promo_Pendirian_PT_April',
    path: 'promo/2024/April/promo-pt.jpg',
    category: 'promo',
    sub_category: 'Pendirian Legalitas',
    alt_text: 'Promo Pendirian PT April 2024',
    original_path: '/2024/April/promo-pt.jpg'
  },
  {
    name: 'Promo_Pendirian_CV_April',
    path: 'promo/2024/April/promo-cv.jpg',
    category: 'promo',
    sub_category: 'Pendirian Legalitas',
    alt_text: 'Promo Pendirian CV April 2024',
    original_path: '/2024/April/promo-cv.jpg'
  },
  {
    name: 'Promo_SBUJK_April',
    path: 'promo/2024/April/promo-sbujk.jpg',
    category: 'promo',
    sub_category: 'Pembuatan Legalitas',
    alt_text: 'Promo SBUJK April 2024',
    original_path: '/2024/April/promo-sbujk.jpg'
  }
];

async function seedImages() {
  try {
    // Clear existing images if needed, or just insert
    // await db.query('DELETE FROM images');
    
    for (const img of images) {
      await db.query(
        'INSERT INTO images (name, path, category, sub_category, alt_text, original_path) VALUES (?, ?, ?, ?, ?, ?)',
        [img.name, img.path, img.category, img.sub_category, img.alt_text, img.original_path]
      );
    }
    console.log('Images seeded successfully!');
    process.exit();
  } catch (error) {
    console.error('Error seeding images:', error);
    process.exit(1);
  }
}

seedImages();
