import mongoose from "mongoose";
import { DB_NAME } from "../constant.js";
import winston from "winston";

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
    winston.error(error.message);
    print("mongodb connection failed");
    process.exit(1);
  }
};
export default connectToDB;
