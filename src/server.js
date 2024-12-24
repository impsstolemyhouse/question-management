const express = require("express");
const cors = require("cors");
const multer = require("multer");
const path = require("path");

const routes = require("./routes");

const app = express();

app.use(cors());

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use("/uploads", express.static("uploads"));

app.use("/api", routes);

app.use((err, req, res, next) => {
  console.error(err);
  res.status(500).json({ error: "Internal Server Error" });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
