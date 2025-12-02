import { subCategory } from "../models/subCategory.models.js";

const createSubCategory = async (req, res) => {
  try {
    const { categoryId, categoryName, image, subCategoryName } = req.body;

    if (!categoryId || !categoryName || !image || !subCategoryName) {
      return res.status(400).json({ message: "All fields are required" });
    }
    const subCategories = new subCategory({
      categoryId,
      categoryName,
      image,
      subCategoryName,
    });
    await subCategories.save();

    return res.status(201).send(subCategories);
  } catch (error) {
    return res.status(400).json({ error: e.message });
  }
};

const getSubCategoryByName = async (req, res) => {
  try {
    const { categoryName } = req.params;
    if (!categoryName) {
      return res.status(400).json({ message: "All fields are required" });
    }
    const subCategoryByName = await subCategory.findOne({
      subCategoryName: categoryName,
    });
    if (!subCategoryByName || subCategoryByName.length == 0) {
      return res
        .status(404)
        .json({ message: "category which you search not found" });
    } else {
      return res.status(200).json(subCategoryByName);
    }
  } catch (error) {
    return res.status(500).json({ error: e.message });
  }
};

export { createSubCategory, getSubCategoryByName };
