// src/controllers/optionsController.js
const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

exports.createOption = async (req, res) => {
  const { questionId, value } = req.body;
  try {
    const option = await prisma.option.create({
      data: {
        value,
        questionId,
      },
    });
    res.json(option);
  } catch (error) {
    res.status(500).json({ error: "Failed to create option" });
  }
};

// Similarly, you can add update, delete, and fetch options logic.
