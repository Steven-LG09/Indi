import express from "express";
import dotenv from "dotenv";
import cors from 'cors';
import mongoose from "mongoose";
import {
    google
} from "googleapis";
import streamifier from "streamifier";
import multer from "multer";

dotenv.config();


const app = express();
const PORT = process.env.PORT || 4000;

app.use(cors());
app.use(express.json());

mongoose.connect(process.env.MONGO_URI)
    .then(() => console.log('MongoDB Connected'))
    .catch(err => console.log(err));

const inveSchema = new mongoose.Schema({
    name: String,
    productoimage: String,
    quantity: String,
    category: String
});

const Inventary = mongoose.models[process.env.COLLECTION_NAME] || mongoose.model(process.env.COLLECTION_NAME, inveSchema);

const upload = multer({
    storage: multer.memoryStorage()
});
const auth = new google.auth.GoogleAuth({
    credentials: JSON.parse(process.env.GOOGLE_CREDENTIALS),
    scopes: ["https://www.googleapis.com/auth/drive"],
});

const drive = google.drive({
    version: "v3",
    auth
});

async function makeFilePublic(fileId) {
    await drive.permissions.create({
        fileId,
        requestBody: {
            role: "reader",
            type: "anyone",
        },
    });

    return `https://lh3.googleusercontent.com/d/${fileId}=w1000`;
}

app.get('/', (req, res) => {
    res.send('Servidor funcionando correctamente Test 3');
});

app.post('/login', async (req, res) => {
    try {
        const {
            user,
            password
        } = req.body;

        if (!user || !password) {
            return res.status(400).json({
                success: false,
                message: "Información requerida",
            });
        }

        if (user == "admin" && password == "test2025") {
            res.json({
                message: "Upload successful",
                success: true
            });
        } else {
            res.json({
                message: "Credenciales incorrectas",
                success: false
            });
        }
    } catch (error) {
        res.status(500).json({
            message: "Datos invalidos ",
        });
    }
});

app.post('/add', upload.single('image'), async (req, res) => {
    try {
        const {
            name,
            quantity,
            category
        } = req.body;

        if (!req.file) return res.status(400).json({
            error: "No file uploaded"
        });
        if (!name || !quantity || !category) return res.status(400).json({
            error: "Missing required fields"
        });

        const fileMetadata = {
            name: req.file.originalname,
            parents: [process.env.DRIVE_FOLDER_ID],
        };

        const media = {
            mimeType: req.file.mimetype,
            body: streamifier.createReadStream(req.file.buffer),
        };

        const response = await drive.files.create({
            resource: fileMetadata,
            media: media,
            fields: "id",
        });

        const fileId = response.data.id;

        const publicUrl = await makeFilePublic(fileId);

        const newProduct = new Inventary({
            name: name,
            productoimage: publicUrl,
            quantity: quantity,
            category: category
        });
        await newProduct.save();

        res.json({
            message: "Producto agregado de forma exitosa",
            success: true
        });
    } catch (error) {
        res.status(500).json({
            error: error.message
        });
    }
});

app.get("/ornamental", async (req, res) => {
    try {
        const filter = {
            category: "Ornamental"
        };
        const plants = await Inventary.find(filter, "name productoimage quantity -_id");

        if (plants.length === 0) {
            return res.status(404).json({
                message: "No plants found"
            });
        }

        res.json(plants);
    } catch (error) {
        console.error("Error fetching plants:", error);
        res.status(500).json({
            error: "Failed to fetch plants"
        });
    }
});

app.get("/medicinal", async (req, res) => {
    try {
        const filter = {
            category: "Medicinal"
        };
        const plants = await Inventary.find(filter, "name productoimage quantity -_id");

        if (plants.length === 0) {
            return res.status(404).json({
                message: "No plants found"
            });
        }

        res.json(plants);
    } catch (error) {
        console.error("Error fetching plants:", error);
        res.status(500).json({
            error: "Failed to fetch plants"
        });
    }
});

app.get("/forestal", async (req, res) => {
    try {
        const filter = {
            category: "Forestal"
        };
        const plants = await Inventary.find(filter, "name productoimage quantity -_id");

        if (plants.length === 0) {
            return res.status(404).json({
                message: "No plants found"
            });
        }

        res.json(plants);
    } catch (error) {
        console.error("Error fetching plants:", error);
        res.status(500).json({
            error: "Failed to fetch plants"
        });
    }
});

app.get("/ground", async (req, res) => {
    try {
        const filter = {
            category: "Tierra"
        };
        const plants = await Inventary.find(filter, "name productoimage quantity -_id");

        if (plants.length === 0) {
            return res.status(404).json({
                message: "No plants found"
            });
        }

        res.json(plants);
    } catch (error) {
        console.error("Error fetching plants:", error);
        res.status(500).json({
            error: "Failed to fetch plants"
        });
    }
});


app.listen(PORT, '0.0.0.0', () => {
    console.log(`Servidor corriendo en http://0.0.0.0:${PORT}`);
});