"use server";

import { readFileSync } from "fs";
import { getDb } from "../../_util/db";

const editTablesSql = readFileSync("./sql/Edit.sql", "utf8");

export async function editTables() {
  try {
    const db = await getDb();
    await db.query(editTablesSql);
    return { status: true };
  } catch (err: any) {
    console.error(err);
    return { status: false, message: err.sqlMessage };
  }
}
