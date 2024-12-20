import { getTables } from "@/app/_actions/query1-6/display";
import Table from "@/app/_components/Table";

export default function DisplayTables({
  tableData,
}: {
  tableData: NonNullable<Awaited<ReturnType<typeof getTables>>>;
}) {
  const [tables, tableNames] = tableData;

  return (
    <div className="flex flex-col items-center justify-center gap-6">
      {tables.map((table, index) => (
        <Table
          key={index}
          tableName={tableNames[index]}
          rows={table}
          editable
        />
      ))}
    </div>
  );
}
