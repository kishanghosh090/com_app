import { Banner } from "../models/banner.models.js";

const banner = async (req, res) => {
  try {
    const { image } = req.body;
    const banner = new Banner({ image });
    await banner.save();
    return res.status(201).send(banner);
  } catch (error) {
    res.status(400).json({ error: e.message });
  }
};

export { banner };
