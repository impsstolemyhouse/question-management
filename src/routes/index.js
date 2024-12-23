const express = require("express");
const questionsRouter = require("./questionsRouter");

const router = express.Router();

router.use("/questions", questionsRouter);

module.exports = router;
