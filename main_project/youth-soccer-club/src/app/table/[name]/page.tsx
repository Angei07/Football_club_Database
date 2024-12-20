import Table from "@/app/_components/Table";
import { getDb } from "@/app/_util/db";
import { RowDataPacket } from "mysql2";

interface Row extends RowDataPacket {}

async function getRows(tableName: string) {
  const db = await getDb();
  const [rows] = await db.execute<Row[]>(
    `SELECT * FROM ${tableName} LIMIT 100`
  );
  return rows;
}

export default async function TablePage({
  params,
}: {
  params: { name: string };
}) {
  const rows = await getRows(params.name).catch(() => null);

  if (!rows) {
    return null;
  }

  return (
    <div>
      <Table tableName={params.name} rows={rows} editable />
    </div>
  );
}
