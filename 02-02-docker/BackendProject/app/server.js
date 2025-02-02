const express= require('express');
require('dotenv').config()

const PORT = process.env.PORT;
const app= express();

app.get('/',(req,res)=>{
    res.send('Hello from Docker Port: '+PORT)
})

app.listen(PORT,()=>console.log(`Server is listing on PORT ${PORT}`))