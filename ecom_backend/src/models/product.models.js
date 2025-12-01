import mongoose from "mongoose";
const productSchema = new mongoose.Schema({
  productName: {
    type: String,
    required: true,
    trim: true,
  },
  productPrice: {
    type: Number,
    required: true,
  },
  quantity: {
    type: Number,
    required: true,
  },
  description: {
    type: String,
    required: true,
  },
  category: {
    type: String,
    required: true,
  },
  subCategory: {
    type: String,
    required: true,
  },
  images: [
    {
      type: String,
      required,
    },
  ],
  popular: {
    type: Boolean,
    required: true,
    default: true,
  },
  recomended: {
    type: Boolean,
    required: false,
    default: false,
  },
});

export const Product = mongoose.model("product", productSchema);
