const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

exports.getQuestions = async (req, res) => {
  try {
    const questions = await prisma.question.findMany();
    res.json(questions);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch questions" });
  }
};

exports.createQuestion = async (req, res) => {
  try {
    const { title, content } = req.body;
    const question = await prisma.question.create({
      data: { title, content },
    });
    res.json(question);
  } catch (error) {
    res.status(500).json({ error: "Failed to create question" });
  }
};
