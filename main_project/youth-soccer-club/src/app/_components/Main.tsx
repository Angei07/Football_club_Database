import { RowDataPacket } from "mysql2/promise";
import { getDb } from "../_util/db";
import TableLink from "./Table/TableLink";

interface Table extends RowDataPacket {}

async function getTables() {
  try {
    const db = await getDb();
    const [tables] = await db.execute<Table[]>("SHOW TABLES");

    return tables;
  } catch (error: any) {
    console.error(error);
    return null;
  }
}

export default async function Main() {
  const tables = await getTables();

  if (!tables) {
    return <div>Error: Could not connect to database.</div>;
  }

  return (
    <div>
      <h1>Tables</h1>
      <p>Here is a list of all Tables in the database.</p>
      <p>Click on a table name to view it.</p>
      <br />
      <TableLink tableName={Object.keys(tables)[0]} tables={tables} />
    </div>
  );
}
