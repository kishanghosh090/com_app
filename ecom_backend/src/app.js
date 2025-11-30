import cors from "cors";
import express from "express";
import cookieParser from "cookie-parser";

const app = express();

// middlewares
app.use(
  cors({
    origin: "*",
    credentials: true,
  })
);
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Serve static files
app.use(express.static("public"));

// Middleware for parsing cookies
app.use(cookieParser());
// routes
import authRoutes from "./routes/auth.routes.js";
import bannerRoutes from "./routes/banner.routes.js";

app.use("/api/v1/auth", authRoutes);
app.use("/api/v1/banner", bannerRoutes);

// error handler

// app.use((err, req, res, next) => {
//   return res.s.json();
// });
export { app };
