import mongoose from "mongoose";

const subCategorySchema = new mongoose.Schema({
  categoryId: {
    type: String,
    required: true,
  },
  categoryName: {
    type: String,
    required: true,
  },
  image: {
    type: String,
    required: true,
  },
  subCategoryName: {
    type: String,
    required: true,
  },
});
export const subCategory = mongoose.model("subCategory", subCategorySchema);
