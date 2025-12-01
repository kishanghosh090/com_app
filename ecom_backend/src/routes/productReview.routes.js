import express from "express";
import {
  getRreview,
  productReview,
} from "../controllers/productReview.controller.js";

const router = express.Router();

// routes
router.post("/", productReview);
router.get("/", getRreview);

export default router;
