import mongoose from "mongoose";

const userSchema = new mongoose.Schema(
  {
    fullName: {
      type: String,
      required: true,
      trim: true,
    },
    email: {
      type: String,
      required: true,
      trim: true,
      unique: true,
      validate: {
        validator: (value) => {
          const result = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
          return result.test(value);
        },
        message: "please enter a valid emial",
      },
    },
    state: {
      type: String,
      required: true,
    },
    city: {
      type: String,
      required: true,
    },
    locality: {
      type: String,
      default: "",
    },
    password: {
      type: String,
      required: true,
      trim: true,
      validate: {
        validator: (value) => {
          return value.length >= 6;
        },
        message: "password is atleast 6 charecters long",
      },
    },
  },
  {
    timestamps: true,
  }
);

export const User = mongoose.model("Users", userSchema);
