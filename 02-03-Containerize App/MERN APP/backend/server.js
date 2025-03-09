require('dotenv').config();
const express = require('express');
const mysql = require('mysql2');

const app = express();
const PORT = 5000;

// MySQL Connection
const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    port: process.env.DB_PORT
});

db.connect(err => {
    if (err) {
        console.error('Database connection failed:', err);
    } else {
        console.log('Connected to MySQL');
    }
});

app.get('/', (req, res) => {
    res.send('Welcome to Node.js with MySQL and Docker Compose');
});

app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
