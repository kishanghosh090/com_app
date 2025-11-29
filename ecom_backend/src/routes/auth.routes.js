import express from "express";
import { registerUser } from "../controllers/auth.controller.js";
const routes = express.Router();

routes.post("/signUp", registerUser);

export default routes;
