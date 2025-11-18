import express from "express";
import {  createUser, deleteUser, getAllUsers, login, updateUser } from "../controllers/authController.js";

const router = express.Router();

router.post("/register", createUser);
router.post("/login", login);
router.get("/getAll_Users", getAllUsers);
router.put ("/Update_user/:id", updateUser);
router.delete ("/delete/:id", deleteUser);

export default router;
