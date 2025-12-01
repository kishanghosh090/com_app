import express from "express";
import {
  addProduct,
  getPopulerProduct,
  getRecomendedProduct,
} from "../controllers/product.controller.js";

const router = express.Router();

router.post("/addProduct", addProduct);
router.post("/getPopulerProduct", getPopulerProduct);
router.post("/getRecomendedProduct", getRecomendedProduct);

export default router;
