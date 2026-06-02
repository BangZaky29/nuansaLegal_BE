const express = require('express');
const cors = require('cors');
const path = require('path');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 5002;

// CORS configuration
const allowedOrigins = [
  'http://localhost:5173',
  'http://127.0.0.1:5173',
  'http://localhost:5174',
  'http://127.0.0.1:5174',
  'http://localhost:5175',
  'http://127.0.0.1:5175',
  'http://localhost:5176',
  'http://127.0.0.1:5176',
  'http://localhost:5177',
  'http://127.0.0.1:5177',
  'http://localhost:4173',
  'http://127.0.0.1:4173',
  'https://nuansalegal.id',
  'https://www.nuansalegal.id',
  'https://inputlegalweb.nuansalegal.id'
];

app.use(cors({
  origin: function (origin, callback) {
    if (!origin || allowedOrigins.indexOf(origin) !== -1) {
      callback(null, true);
    } else {
      console.log('CORS Blocked for origin:', origin);
      callback(new Error('Not allowed by CORS'));
    }
  }
}));

app.use(express.json());
app.use((req, res, next) => {
  console.log(`${new Date().toISOString()} - ${req.method} ${req.url}`);
  next();
});

// Serve static uploads
app.use('/uploads', express.static(path.join(__dirname, '../public/uploads')));

// Routes
const imageRoutes = require('./routes/imageRoutes');
const faqRoutes = require('./routes/faqRoutes');

console.log('Registering imageRoutes');
app.use('/api/images', imageRoutes);
console.log('Registering faqRoutes:', typeof faqRoutes);
app.use('/api/faqs', faqRoutes);

app.get('/api/test', (req, res) => {
  res.json({ message: 'API is working' });
});

app.get('/', (req, res) => {
  res.json({ message: 'Welcome to PT. Nuansa Berkah Sejahtera API' });
});

const db = require('./config/database');

app.listen(PORT, async () => {
  console.log(`Server is running on port ${PORT}`);
  try {
    const [rows] = await db.query('SELECT 1');
    console.log('Database connected successfully!');
  } catch (err) {
    console.error('Database connection FAILED:', err.message);
  }
});
