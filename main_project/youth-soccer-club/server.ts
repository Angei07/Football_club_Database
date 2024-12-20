import { seed } from "@/app/_util/seed";
import { createServer } from "http";
import next from "next";
import cron from "node-cron";
import { parse } from "url";

const port = parseInt(process.env.PORT || "3000", 10);
const dev = process.env.NODE_ENV !== "production";
const app = next({ dev });
const handle = app.getRequestHandler();

async function startApp() {
  await app.prepare();
  createServer((req, res) => {
    const parsedUrl = parse(req.url!, true);
    handle(req, res, parsedUrl);
  }).listen(port);

  console.log(
    `> Server listening at http://localhost:${port} as ${
      dev ? "development" : process.env.NODE_ENV
    }`
  );
}

async function sendEmail() {
  // send email to all users
  console.log("Sending email to all users");
}

async function initDbFunctions() {
  // every Sunday at 12:00, call sendEmail
  cron.schedule("0 12 * * 0", sendEmail);
}

if (process.env.SEED === "true") {
  await seed();
}
await startApp();
