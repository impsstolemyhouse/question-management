const { PrismaClient } = require("@prisma/client");
const multer = require("multer");
const path = require("path");
const prisma = new PrismaClient({
  // log: ["query"],
});

// Define a custom storage engine for multer
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "uploads");
  },

  filename: (req, file, cb) => {
    const fileExtension = path.extname(file.originalname);
    const fileName =
      Date.now() + "-" + Math.round(Math.random() * 1e9) + fileExtension;
    cb(null, fileName);
  },
});

const upload = multer({ storage: storage });

exports.createQuestion = async (req, res) => {
  upload.fields([
    { name: "Problem-Image", maxCount: 1 },
    ...Array.from({ length: 10 }, (_, i) => ({
      name: `Step-${i + 1}-Image`,
      maxCount: 1,
    })),
  ])(req, res, async (err) => {
    if (err) {
      return res.status(500).json({ error: "File upload failed" });
    }

    let jsonData;
    try {
      jsonData = JSON.parse(req.body.jsonData);
    } catch (error) {
      return res.status(400).json({ error: "Invalid JSON data" });
    }

    const { Question, Solution, CorrectAnswer, Options, Steps, Tags } =
      jsonData;

    try {
      // Prepare URLs for uploaded files
      const problemImageUrl = req.files["Problem-Image"]
        ? `/uploads/${req.files["Problem-Image"][0].filename}`
        : null;
      const stepImages = Steps.map((step, index) => {
        const stepKey = `Step-${index + 1}-Image`;
        return req.files[stepKey]
          ? `/uploads/${req.files[stepKey][0].filename}`
          : null;
      });

      // Create the question with associated data
      const createdQuestion = await prisma.question.create({
        data: {
          question: Question,
          solution: Solution,
          correctAnswer: CorrectAnswer,
          imageUrl: problemImageUrl,
          options: {
            create: Options.map((option) => ({ value: option })),
          },
          steps: {
            create: Steps.map((step, index) => ({
              title: step.Title,
              result: step.Result,
              imageUrl: stepImages[index] || null,
            })),
          },
          tags: {
            connectOrCreate: Tags.map((tag) => ({
              where: { name: tag },
              create: { name: tag },
            })),
          },
        },
        include: {
          options: true,
          steps: true,
          tags: true,
        },
      });

      res.json({
        Id: createdQuestion.id,
        Question: createdQuestion.question,
        Solution: createdQuestion.solution,
        CorrectAnswer: createdQuestion.correctAnswer,
        ImageUrl: createdQuestion.imageUrl,
        Options: createdQuestion.options.map((option) => option.value),
        Steps: createdQuestion.steps.map((step) => ({
          Title: step.title,
          Result: step.result,
          ImageUrl: step.imageUrl,
        })),
        Tags: createdQuestion.tags
          ? createdQuestion.tags.map((tag) => tag.name)
          : [],
      });
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: "Failed to create question" });
    }
  });
};

exports.getQuestions = async (req, res) => {
  try {
    const questions = await prisma.question.findMany({
      include: {
        options: true,
        steps: true,
        tags: true,
      },
    });

    // Map each question to the frontend format
    const responseData = questions.map((question) => ({
      Id: question.id,
      Question: question.question,
      Solution: question.solution,
      CorrectAnswer: question.correctAnswer,
      ImageUrl: question.imageUrl,
      Options: question.options.map((option) => option.value),
      Steps: question.steps.map((step) => ({
        Title: step.title,
        Result: step.result,
        ImageUrl: step.imageUrl,
      })),
      Tags: question.tags ? question.tags.map((tag) => tag.name) : [],
    }));

    res.json(responseData);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Failed to fetch questions" });
  }
};

exports.getQuestion = async (req, res) => {
  const { id } = req.params; // Get the question ID from the request parameters

  try {
    const question = await prisma.question.findUnique({
      where: { id: parseInt(id, 10) }, // Use the id from the request parameters
      include: {
        options: true,
        steps: true,
        tags: true, // If you also want to include tags with the question
      },
    });

    if (!question) {
      return res.status(404).json({ error: "Question not found" });
    }

    res.json({
      Id: question.id,
      Question: question.question,
      Solution: question.solution,
      CorrectAnswer: question.correctAnswer,
      ImageUrl: question.imageUrl,
      Options: question.options.map((option) => option.value),
      Steps: question.steps.map((step) => ({
        Title: step.title,
        Result: step.result,
        ImageUrl: step.imageUrl,
      })),
      Tags: question.tags ? question.tags.map((tag) => tag.name) : [],
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Failed to fetch question" });
  }
};

exports.updateQuestion = async (req, res) => {
  const id = parseInt(req.params.id, 10);

  upload.fields([
    { name: "Problem-Image", maxCount: 1 },
    ...Array.from({ length: 10 }, (_, i) => ({
      name: `Step-${i + 1}-Image`,
      maxCount: 1,
    })),
  ])(req, res, async (err) => {
    if (err) {
      return res.status(500).json({ error: "File upload failed" });
    }

    // Parse the jsonData field if it's in form-data
    let jsonData;
    try {
      jsonData = JSON.parse(req.body.jsonData); // Ensure it's a valid JSON string
    } catch (error) {
      return res.status(400).json({ error: "Invalid JSON data" });
    }

    const { Question, Solution, CorrectAnswer, Options, Steps, Tags } =
      jsonData;

    try {
      // Prepare URLs for uploaded files (if any)
      const problemImageUrl = req.files["Problem-Image"]
        ? `/uploads/${req.files["Problem-Image"][0].filename}`
        : null;
      const stepImages = Steps.map((step, index) => {
        const stepKey = `Step-${index + 1}-Image`;
        return req.files[stepKey]
          ? `/uploads/${req.files[stepKey][0].filename}`
          : null;
      });

      // Fetch the current tags associated with the question
      const currentTags = await prisma.question.findUnique({
        where: { id },
        select: {
          tags: {
            select: { name: true },
          },
        },
      });

      // Find which tags to disconnect (i.e., tags that are in the database but not in the updated list)
      const tagsToDisconnect = currentTags.tags.filter(
        (tag) => !Tags.includes(tag.name)
      );
      const tagsToConnect = Tags.filter(
        (tag) => !currentTags.tags.some((t) => t.name === tag)
      );

      // Update the question with associated data
      const updatedQuestion = await prisma.question.update({
        where: { id },
        data: {
          question: Question,
          solution: Solution,
          correctAnswer: CorrectAnswer,
          imageUrl: problemImageUrl || undefined, // Use existing image if no new one is uploaded
          options: {
            deleteMany: {}, // Delete existing options first
            create: Options.map((option) => ({
              value: option,
            })),
          },
          steps: {
            deleteMany: {}, // Delete existing steps first
            create: Steps.map((step, index) => ({
              title: step.Title,
              result: step.Result,
              imageUrl: stepImages[index] || null, // Update the step image URL if uploaded
            })),
          },
          tags: {
            // Disconnect the tags that are no longer part of the question
            disconnect: tagsToDisconnect.map((tag) => ({ name: tag.name })),
            // Connect new tags
            connectOrCreate: tagsToConnect.map((tag) => ({
              where: { name: tag },
              create: { name: tag },
            })),
          },
        },
        include: {
          options: true,
          steps: true,
          tags: true,
        },
      });

      // Return updated question data
      res.json({
        Id: updatedQuestion.id,
        Question: updatedQuestion.question,
        Solution: updatedQuestion.solution,
        CorrectAnswer: updatedQuestion.correctAnswer,
        ImageUrl: updatedQuestion.imageUrl,
        Options: updatedQuestion.options.map((option) => option.value),
        Steps: updatedQuestion.steps.map((step) => ({
          Title: step.title,
          Result: step.result,
          ImageUrl: step.imageUrl,
        })),
        Tags: updatedQuestion.tags
          ? updatedQuestion.tags.map((tag) => tag.name)
          : [],
      });
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: "Failed to update question" });
    }
  });
};

exports.deleteQuestion = async (req, res) => {
  const { id } = req.params;
  try {
    // Delete the question and cascade delete related data
    await prisma.question.delete({
      where: { id: parseInt(id) },
    });

    res.json({ message: "Question deleted successfully" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Failed to delete question" });
  }
};
