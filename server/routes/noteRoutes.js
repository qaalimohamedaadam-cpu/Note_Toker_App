import express from "express";
import { protect } from "../middleware/authMiddleware.js";
import { createNote, getNotes, deleteNote, updateNote } from "../controllers/noteController.js";

const router = express.Router();

router.post("/create_note", createNote);
router.get("/getNotes", getNotes);
router.delete("/delete/:id", deleteNote);
router.put("/update/:id", updateNote);

export default router;
