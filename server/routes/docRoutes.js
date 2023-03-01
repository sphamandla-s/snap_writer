const express = require('express');
const docRouter = express.Router();
const Document = require('../models/documents')

docRouter.post("doc/create/", async (req, res)=>{

    try {
        
        const {createdAt} = req.body;

        let document = new Document({
            uid : '12',
            title : 'Untitled Document',
            createdAt,
        })

        document = await document.save();
        res.json(document);

    } catch (error) {
        console.log(error)
    }
});

module.exports = docRouter;