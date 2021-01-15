const express= require('express')
const morgan= require('morgan')
const app =express()

app.use(morgan('dev'))

app.get('/',(req,res)=>{
    res.send("<h1>API academia</h1>")
})

app.listen(7777, function(){
    console.log("aplicacion corriendo en 7777")
})