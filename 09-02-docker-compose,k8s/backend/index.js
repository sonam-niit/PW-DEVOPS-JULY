const express = require('express');
const mysql= require('mysql2');
require('dotenv').config();

const app= express();
const PORT = 5000;

const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user:process.env.DB_USER,
    password:process.env.DB_PASSWORD,
    database:process.env.DB_NAME,
    port:3307
})

db.connect((err)=>{
    if(err)
        console.log('Error occured',err);
    else
        console.log('Connected to MYSQL')
})

app.get('/',(req,res)=>{
    res.send('Backend is Running')
})

app.listen(PORT,()=>{
    console.log('Server is Running on Port',PORT);
    
})