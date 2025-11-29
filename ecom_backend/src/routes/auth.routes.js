import express from "express";
const routes = express.Router();

routes.get("/", (req, res) => {
  return res.json({
    1: "hello from chai code",
  });
});

export default routes;
