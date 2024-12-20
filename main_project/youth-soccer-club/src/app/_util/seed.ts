import { readFileSync } from "fs";
import { closeDb, getDb } from "./db";

export async function seed() {
  const db = await getDb();

  console.log("Creating database...");
  await db.query(`
    ${readFileSync("./sql/Create.sql", "utf8")}
  `);

  console.log("Populating database...");
  await db.query(`
    ${readFileSync("./sql/Populate.sql", "utf8")}
  `);

  console.log("Creating triggers...");
  await db.query(`
    ${readFileSync("./sql/queries/query19-1.sql", "utf8")}
    ${readFileSync("./sql/queries/query19-2.sql", "utf8")}
    ${readFileSync("./sql/queries/query19-3.sql", "utf8")}
    ${readFileSync("./sql/queries/query19-4.sql", "utf8")}
  `);

  console.log("Seeding complete!");

  await closeDb();
}
