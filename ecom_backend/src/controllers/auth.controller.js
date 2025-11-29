import { User } from "../models/user.models.js";

const signUp = async (req, res) => {
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
    console.log(error);

    return res
      .status(500)
      .json({ message: error.message || "Internal server error" });
  }
};
const signIn = async (req, res) => {
  try {
    const { email, password } = req.body;
    const isUserHave = await User.findOne({ email });
    if (!isUserHave) {
      return res.status(400).json({ message: "User not found" });
    }
    if (!isUserHave.isPasswordCorrect(password)) {
      return res.status(400).json({ message: "Incorrect password" });
    } else {
      const token = isUserHave.generateToken();
      // remove sensitive info
      const { password, ...userWithoutPassword } = isUserHave._doc;
      return res.json({ token, ...userWithoutPassword });
    }
  } catch (error) {
    console.log(error);
    
    return res.status(500).json({ message: "Internal server error" });
  }
};
export { signUp, signIn };
