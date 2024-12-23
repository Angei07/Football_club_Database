"use server";

import { RowDataPacket } from "mysql2";
import { getDb } from "../_util/db";

interface Row extends RowDataPacket {}

export async function runSingleQuery(query: string, values?: string[]) {
  try {
    const db = await getDb();
    const [rows, fieldPackets] = await db.query<Row[]>(query, values);
    const tableName = fieldPackets[0].table;
    return { rows, tableName, status: true, message: undefined } as const;
  } catch (error: any) {
    console.error(error);
    return { status: false, message: error.sqlMessage } as const;
  }
}
