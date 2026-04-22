const express = require('express');
const router = express.Router();
const imageController = require('../controllers/imageController');

router.get('/', imageController.getAllImages);
router.get('/period/:period', imageController.getImagesByPeriod);
router.get('/:category', imageController.getImagesByCategory);
router.get('/:category/:subCategory', imageController.getImagesBySubCategory);

module.exports = router;

