import express from "express";
import { protect } from "../middleware/authMiddleware.js";
import { createNote, getNotes, deleteNote } from "../controllers/noteController.js";

const router = express.Router();

router.post("/", protect, createNote);
router.get("/", protect, getNotes);
router.delete("/:id", protect, deleteNote);

export default router;
