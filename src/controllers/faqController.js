const db = require('../config/database');

exports.getAllFaqs = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM faqs ORDER BY order_index ASC, created_at DESC');
    res.json({
      success: true,
      data: rows
    });
  } catch (error) {
    console.error('Error fetching FAQs:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to fetch FAQs'
    });
  }
};

exports.getFaqsByCategory = async (req, res) => {
  try {
    const { category } = req.params;
    const [rows] = await db.query(
      'SELECT * FROM faqs WHERE category = ? ORDER BY order_index ASC, created_at DESC',
      [category]
    );
    res.json({
      success: true,
      data: rows
    });
  } catch (error) {
    console.error('Error fetching FAQs by category:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to fetch FAQs'
    });
  }
};

exports.createFaq = async (req, res) => {
  try {
    const { question, answer, category, order_index } = req.body;
    const [result] = await db.query(
      'INSERT INTO faqs (question, answer, category, order_index) VALUES (?, ?, ?, ?)',
      [question, answer, category || 'General', order_index || 0]
    );
    res.status(201).json({
      success: true,
      message: 'FAQ created successfully',
      data: { id: result.insertId, ...req.body }
    });
  } catch (error) {
    console.error('Error creating FAQ:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to create FAQ'
    });
  }
};
