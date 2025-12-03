import { Category } from "../models/category.models.js";

const createCategory = async (req, res) => {
  try {
    const { name, image, banner } = req.body;
    if (!name || !image || !banner) {
      return res.status(400).json({ message: "All fields are required" });
    }
    const categories = new Category({
      name,
      image,
      banner,
    });
    await categories.save();
    if (!categories) {
      return res
        .status(500)
        .json({ message: "catrgory creation failed. try again later" });
    }
    return res.status(201).send(categories);
  } catch (error) {
    return res.status(400).json({ error: e.message });
  }
};

const getCategory = async (req, res) => {
  try {
    const categories = await Category.find();
    return res.status(200).send(categories);
  } catch (error) {
    return res.status(400).json({ error: e.message });
  }
};

export { createCategory, getCategory };
