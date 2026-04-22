const mysql = require('mysql2/promise');
require('dotenv').config();

async function check() {
    try {
        const connection = await mysql.createConnection({
            host: process.env.DB_HOST || 'localhost',
            user: process.env.DB_USER || 'root',
            password: process.env.DB_PASSWORD || '',
            database: process.env.DB_NAME || 'nuansalegal_db'
        });

        const [rows] = await connection.execute('SELECT category, sub_category, count(*) as count FROM images GROUP BY category, sub_category');
        console.log(JSON.stringify(rows, null, 2));
        await connection.end();
    } catch (err) {
        console.error('DB ERROR:', err.message);
    }
}

check();
