const express = require("express");
const questionsRouter = require("./questionsRouter");

const router = express.Router();

router.use("/questions", questionsRouter);
// router.use("/tags", tagsRouter);

module.exports = router;
