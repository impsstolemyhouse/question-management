const express = require("express");
const cors = require("cors");
const http = require("http");

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

function tryListenOnPort(port) {
  return new Promise((resolve, reject) => {
    const server = http.createServer(app);

    server.listen(port, () => {
      console.log(`Server is running on http://localhost:${port}`);
      resolve();
    });

    server.on("error", (err) => {
      if (err.code === "EADDRINUSE") {
        reject();
      } else {
        reject(err);
      }
    });
  });
}

const preferredPort = process.env.PORT || 3000;

tryListenOnPort(preferredPort)
  .catch(() => {
    console.log(
      `Port ${preferredPort} is in use. Trying port ${
        Number(preferredPort) + 1
      }...`
    );
    return tryListenOnPort(Number(preferredPort) + 1);
  })
  .catch((err) => {
    console.error("Error starting the server:", err);
  });
