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
      resolve(port);
    });

    server.on("error", (err) => {
      if (err.code === "EADDRINUSE") {
        reject("EADDRINUSE");
      } else {
        reject(err);
      }
    });
  });
}

async function findAvailablePort(startingPort) {
  let port = startingPort;
  while (true) {
    try {
      await tryListenOnPort(port);
      return port; // Successfully started the server
    } catch (err) {
      if (err === "EADDRINUSE") {
        console.log(`Port ${port} is in use. Trying port ${port + 1}...`);
        port++;
      } else {
        console.error("Error starting the server:", err);
        process.exit(1); // Exit the process for other errors
      }
    }
  }
}

const preferredPort = parseInt(process.env.PORT, 10) || 3000;

findAvailablePort(preferredPort).then((port) => {
  console.log(`Server successfully started on http://localhost:${port}`);
});
