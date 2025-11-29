import { User } from "../models/user.models.js";

const registerUser = async (req, res, next) => {
  const { fullName, email, password } = req.body;
  try {
    const user = await User.findOne({ email });
    if (user) {
      return res.status(400).json({ message: "user with email already exist" });
    } else {
      let newUser = new User({ fullName, email, password });
      newUser = await newUser.save();
      return res
        .status(200)
        .json({ success: true, message: "user created successfully" });
    }
  } catch (error) {
    return res
      .status(500)
      .json({ message: error.message || "Internal server error" });
  }
};

export { registerUser };
