import { Banner } from "../models/banner.models.js";

const createBanner = async (req, res) => {
  try {
    const { image } = req.body;
    if (!image) {
      return res.status(400).json({ message: "image is required" });
    }
    const banner = new Banner({ image });
    await banner.save();
    return res.status(201).send(banner);
  } catch (error) {
    return res.status(400).json({ error: e.message });
  }
};

const getBanner = async (req, res) => {
  try {
    const banner = await Banner.find();
    return res.status(200).send(banner);
  } catch (error) {
    return res.status(400).json({ error: e.message });
  }
};

export { createBanner, getBanner };
