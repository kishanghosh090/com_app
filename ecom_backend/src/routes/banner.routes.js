import express from "express";
import { createBanner, getBanner } from "../controllers/banner.controller.js";

const router = express.Router();

router.post("/", createBanner);
router.get("/", getBanner);

export default router;
