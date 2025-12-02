import { ProductReview } from "../models/productReview.model.js";

const productReview = async (req, res) => {
  try {
    const { buyerId, email, fullName, productId, rating, review } = req.body;
    if (
      [buyerId, email, fullName, productId, rating, review].some(
        (val) => val == undefined
      )
    ) {
      return res.status(400).json({ message: "All fields are reqired" });
    }
    const productReview = new ProductReview({
      buyerId,
      email,
      fullName,
      productId,
      rating,
      review,
    });
    await productReview.save();
    if (!productReview) {
      return res.status(500).json({ message: "failed to create review" });
    }
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
