import express from "express";
import {
  addProduct,
  getPopulerProject,
  getRecomendedProduct,
} from "../controllers/product.controller.js";

const router = express.Router();

router.post("/addProduct", addProduct);
router.post("/getPopulerProduct", getPopulerProject);
router.post("/getRecomendedProduct", getRecomendedProduct);

export default router;
