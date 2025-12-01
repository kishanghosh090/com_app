import { Product } from "../models/product.models.js";

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

const getPopulerProduct = async (req, res) => {
  try {
    const populerProducts = await Product.find({ popular: true });
    if (!populerProducts || populerProducts.length == 0) {
      return res.status(404).json({ message: "Product not found" });
    }
    return res.status(200).json({ populerProducts });
  } catch (error) {
    return res.status(500).json({ error: e.message });
  }
};

const getRecomendedProduct = async (req, res) => {
  try {
    const recomendedProducts = await Product.find({ recomended: true });
    if (!recomendedProducts || recomendedProducts.length == 0) {
      return res.status(404).json({ message: "Product not found" });
    }
    return res.status(200).json({ recomendedProducts });
  } catch (error) {
    return res.status(500).json({ error: e.message });
  }
};
export { addProduct, getPopulerProduct, getRecomendedProduct };
