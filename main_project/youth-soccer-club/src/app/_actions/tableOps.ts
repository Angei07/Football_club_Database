"use server";

import { FieldPacket, ResultSetHeader, RowDataPacket } from "mysql2";
import sql, { join, raw } from "sql-template-tag";
import { getDb } from "../_util/db";

export async function editRow(
  tableName: string,
  originalRow: Record<string, string | number | Date | null>,
  newRow: Record<string, string | number | Date | null>
) {
  try {
    const db = await getDb();

    const q = sql`UPDATE \`${raw(tableName)}\` SET ${newRow} WHERE ${join(
      Object.entries(originalRow).map(
        ([key, value]) => sql`\`${raw(key)}\` = ${value}`
      ),
      " AND "
    )}`;

    console.log("\n\nExecuting query:\n", q.text, q.values, "\n\n");

    await db.query(q.sql, q.values);
  } catch (e: any) {
    console.error(e);
    return { status: false, message: e.sqlMessage };
  }

  return { status: true };
}

export async function deleteRow(
  tableName: string,
  originalRow: Record<string, string | number | Date | null>
) {
  try {
    const db = await getDb();

    const q = sql`DELETE FROM \`${raw(tableName)}\` WHERE ${join(
      Object.entries(originalRow).map(
        ([key, value]) => sql`\`${raw(key)}\` = ${value}`
      ),
      " AND "
    )}`;

    console.log("\n\nExecuting query:\n", q.text, q.values, "\n\n");

    await db.query(q.sql, q.values);
  } catch (e: any) {
    console.error(e);
    return { status: false, message: e.sqlMessage };
  }

  return { status: true };
}

interface Row extends RowDataPacket {}

export async function insertRow(
  tableName: string,
  row: Record<string, string | number | Date | null>
) {
  try {
    const db = await getDb();

    const q = sql`
      INSERT INTO \`${raw(tableName)}\` (${raw(Object.keys(row).join(", "))}) VALUES (${Object.values(row)});
      SELECT * FROM \`${raw(tableName)}\` WHERE ${join(
        Object.entries(row).map(
          ([key, value]) => sql`\`${raw(key)}\` = ${value}`
        ),
        " AND "
      )};
    `;

    console.log("\n\nExecuting query:\n", q.text, q.values, "\n\n");

    const [[_, newDbRow]] = (await db.query(q.sql, q.values)) as unknown as [
      [ResultSetHeader, Row[]],
      FieldPacket[],
    ];
    console.log("newDbRow", newDbRow);
    return { status: true, data: newDbRow };
  } catch (e: any) {
    console.error(e);
    return { status: false, message: e.sqlMessage };
  }
}
