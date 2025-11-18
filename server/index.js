import express from "express";
import dotenv from "dotenv";
import connectDb from "./config/db.js";
import authRoutes from "./routes/authRoutes.js";
import noteRoutes from "./routes/noteRoutes.js";

dotenv.config();
connectDb();

const app = express();
app.use(express.json());

app.use("/api/auth", authRoutes);
app.use("/api/notes", noteRoutes);


app.listen(process.env.PORT, () => console.log(`Server running on port ${process.env.PORT}`));
