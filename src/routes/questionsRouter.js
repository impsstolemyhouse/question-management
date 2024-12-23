const express = require("express");
const {
  getQuestions,
  createQuestion,
} = require("../controllers/questionsController");

const router = express.Router();

router.get("/", getQuestions);
router.post("/", createQuestion);

module.exports = router;
