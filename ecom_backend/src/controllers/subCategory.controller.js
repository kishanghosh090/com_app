import { subCategory } from "../models/subCategory.models.js";

const createSubCategory = async (req, res) => {
  try {
    const { categoryId, categoryName, image, subCategoryName } = req.body;
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

export {
  createSubCategory
}