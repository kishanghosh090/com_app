import { ProductReview } from "../models/productReview.model.js";

const productReview = async (req, res) => {
  try {
    const { buyerId, email, fullName, productId, rating, review } = req.body;

    const productReview = new ProductReview({
      buyerId,
      email,
      fullName,
      productId,
      rating,
      review,
    });
    await productReview.save();
    return res.status(201).json({ productReview });
  } catch (error) {
    return res.status(500).json({ error: e.message });
  }
};

const getRreview = async (req, res) => {
  try {
    const reviews = await ProductReview.find();
    if (!reviews || reviews.length == 0) {
      return res.status(404).json({ message: "Product not found" });
    }
    return res.status(200).json({ reviews });
  } catch (error) {
    return res.status(500).json({ error: e.message });
  }
};

export { productReview, getRreview };
