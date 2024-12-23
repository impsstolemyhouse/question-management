const express = require("express");
const {
  getQuestions,
  createQuestion,
  deleteQuestion,
  updateQuestion,
  getQuestion,
} = require("../controllers/questionsController");

const router = express.Router();

router.get("/", getQuestions);
router.post("/", createQuestion);
router.put("/:id", updateQuestion);
router.get("/:id", getQuestion);
router.delete("/:id", deleteQuestion);

module.exports = router;
