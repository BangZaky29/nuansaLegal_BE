const mysql = require('mysql2/promise');
const fs = require('fs');
require('dotenv').config();

async function initDb() {
  const connection = await mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD
  });

  console.log('Connected to MySQL server.');

  const sql = fs.readFileSync('init.sql', 'utf8');
  const commands = sql.split(';').filter(cmd => cmd.trim().length > 0);

  for (let cmd of commands) {
    await connection.query(cmd);
    console.log('Executed:', cmd.substring(0, 50).replace(/\n/g, ' ') + '...');
  }

  await connection.end();
  console.log('Database initialization completed.');
}

initDb().catch(err => {
  console.error('Initialization failed:', err.message);
  process.exit(1);
});
