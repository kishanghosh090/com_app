import express from "express";
import { addProduct, getPopulerProject } from "../controllers/product.controller.js";

const router = express.Router();

router.post("/addProduct", addProduct);
router.post("/getPoputerProduct", getPopulerProject);

export default router;
