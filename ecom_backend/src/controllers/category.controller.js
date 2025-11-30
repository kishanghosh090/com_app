import { Category } from "../models/category.models.js";

const createCategory = async (req, res) => {
  try {
    const { name, image, banner } = req.body;
    const categories = new Category({
      name,
      image,
      banner,
    });
    await categories.save();
    return res.status(201).send(categories);
  } catch (error) {
    return res.status(400).json({ error: e.message });
  }
};

const getCategory = async (req, res) => {
  try {
    const categories = await Category.find();
    return res.status(201).send(categories);
  } catch (error) {
    return res.status(400).json({ error: e.message });
  }
};

export { createCategory, getCategory };
