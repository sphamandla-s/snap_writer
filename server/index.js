const express = require("express");
const mongoose = require("mongoose");
const app = express();
const port = process.env.PORT | 3005;
const docRoutes = require('./routes/docRoutes.js')

app.use(express.json());
app.use(docRoutes);

mongoose.connect('mongodb://localhost:27017/docs').then(()=> {
    app.listen(port, "0.0.0.0", ()=>{
     console.log(`Listing to port ${port}`)
    })
}).catch(err => {
    console.log("There was an error")
    console.log(err)
});