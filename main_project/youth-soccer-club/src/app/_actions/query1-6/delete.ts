"use server";

import { readFileSync } from "fs";
import { getDb } from "../../_util/db";

const deleteTablesSql = readFileSync("./sql/Delete.sql", "utf8");

export async function deleteTables() {
  try {
    const db = await getDb();
    await db.query(deleteTablesSql);
    return { status: true };
  } catch (err: any) {
    console.error(err);
    return { status: false, message: err.sqlMessage };
  }
}
