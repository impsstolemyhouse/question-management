// src/controllers/stepsController.js
const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

exports.createStep = async (req, res) => {
  const { questionId, title, result, imageUrl } = req.body;
  try {
    const step = await prisma.step.create({
      data: {
        title,
        result,
        imageUrl,
        questionId,
      },
    });
    res.json(step);
  } catch (error) {
    res.status(500).json({ error: "Failed to create step" });
  }
};

// Similarly, you can add update, delete, and fetch steps logic.
