import mongoose from "mongoose";
import { DB_NAME } from "../constant.js";

const MONGODB_URI = process.env.MONGODB_URI;

if (!MONGODB_URI) {
  print("💥 MONGO DB URI missing...");
  process.exit(1);
}
const connectToDB = async () => {
  try {
    const db = await mongoose.connect(`${MONGODB_URI}/${DB_NAME}`);
    return db.connection.host;
  } catch (error) {
    print("mongodb connection failed");
    process.exit(1);
  }
};
export default connectToDB;
