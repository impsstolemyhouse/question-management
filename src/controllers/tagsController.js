// src/controllers/tagsController.js
const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

exports.createTag = async (req, res) => {
  const { questionId, name } = req.body;
  try {
    const tag = await prisma.tag.create({
      data: {
        name,
        questionId,
      },
    });
    res.json(tag);
  } catch (error) {
    res.status(500).json({ error: "Failed to create tag" });
  }
};

// Similarly, you can add update, delete, and fetch tags logic.
