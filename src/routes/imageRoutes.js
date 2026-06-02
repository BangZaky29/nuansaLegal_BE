const express = require('express');
const router = express.Router();
const imageController = require('../controllers/imageController');

// ── READ ──────────────────────────────────────────────────────────────────
router.get('/', imageController.getAllImages);
router.get('/period/:period', imageController.getImagesByPeriod);
router.get('/:category', imageController.getImagesByCategory);
router.get('/:category/:subCategory', imageController.getImagesBySubCategory);

// ── WRITE ─────────────────────────────────────────────────────────────────
router.post('/upload', imageController.uploadMiddleware, imageController.uploadImage);

// ── DELETE ────────────────────────────────────────────────────────────────
router.delete('/:id', imageController.deleteImage);

module.exports = router;
