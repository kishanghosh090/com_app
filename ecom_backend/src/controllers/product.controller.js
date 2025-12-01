import { Product } from "../models/product.models";

const addProduct = async (req, res) => {
  try {
    const {
      productName,
      productPrice,
      quantity,
      description,
      category,
      subCategory,
      images,
    } = req.body;

    const product = new Product(
      productName,
      productPrice,
      quantity,
      description,
      subCategory,
      category,
      images
    );
    await product.save();
    return res.status(201).json(product);
  } catch (error) {
    return res.status(500).json({ error: e.message });
  }
};

export { addProduct };
