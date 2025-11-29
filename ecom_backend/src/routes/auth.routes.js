import express from "express";
import { signIn, signUp } from "../controllers/auth.controller.js";
const routes = express.Router();

routes.post("/signUp", signUp);
routes.post("/signIn", signIn);

export default routes;
