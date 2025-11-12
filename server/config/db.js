import mongoose from "mongoose";
import dotenv from "dotenv";

dotenv.config();

console.log("Mongo URL:", process.env.MONGO_URL); // Hubi haddii URL la helayo

const connectDb = async () => {
  if (!process.env.MONGO_URL) {
    console.error("Error: MONGO_URI is undefined!");
    process.exit(1);
  }
  try {
    const conn = await mongoose.connect(process.env.MONGO_URL, {
    });
    console.log("Database connected successfully");
  } catch (error) {
    console.error("Database connection failed:", error.message);
    process.exit(1);
  }
};

export default connectDb;