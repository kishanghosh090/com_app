import express from "express";
import { banner } from "../controllers/banner.controller.js";

const router = express.Router();

router.post("/", banner);

export default router;
