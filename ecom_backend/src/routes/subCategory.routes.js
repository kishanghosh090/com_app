import express from "express";
import {
  createSubCategory,
  getSubCategoryByName,
} from "../controllers/subCategory.controller.js";
const router = express.Router();

router.post("/", createSubCategory);
router.post("/:categoryName/subcategories", getSubCategoryByName);

export default router;
