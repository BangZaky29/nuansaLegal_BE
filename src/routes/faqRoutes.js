const express = require('express');
const router = express.Router();
const faqController = require('../controllers/faqController');

router.get('/', faqController.getAllFaqs);
router.get('/:category', faqController.getFaqsByCategory);
router.post('/', faqController.createFaq);

module.exports = router;
