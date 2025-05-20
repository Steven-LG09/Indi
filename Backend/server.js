import express from "express";
import dotenv from "dotenv";
import cors from 'cors';
import mongoose from "mongoose";

dotenv.config();


const app = express();
const PORT = process.env.PORT || 4000;

app.use(cors());
app.use(express.json());

mongoose.connect(process.env.MONGO_URI)
    .then(() => console.log('MongoDB Connected'))
    .catch(err => console.log(err));

const inveSchema = new mongoose.Schema({
    name: String
});

const Inventary = mongoose.models[process.env.COLLECTION_NAME] || mongoose.model(process.env.COLLECTION_NAME, inveSchema);

app.get('/', (req, res) => {
  res.send('Servidor funcionando correctamente Test 3');
});

app.post('/add', async (req, res) => {
    try {
        const {
            name
        } = req.body;

        const newProduct = new Inventary({
            name: name
        });
        await newProduct.save();

        res.json({
            message: "Upload successful",
            success: true
        });
    } catch (error) {
        res.status(500).json({
            error: error.message
        });
    }
});

app.listen(PORT, '0.0.0.0', () => {
    console.log(`Servidor corriendo en http://0.0.0.0:${PORT}`);
});