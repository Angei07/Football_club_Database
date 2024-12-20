"use client";

import Link from "next/link";
import Table from ".";

export default function TableLink({
  tables,
  tableName,
}: {
  tables: Record<string, string>[];
  tableName: string;
}) {
  return <Table tableName={tableName} rows={tables} CustomCell={CustomCell} />;
}

function CustomCell({ value }: { value: string | number | null }) {
  return (
    <Link href={`/table/${value}`} className="hover:underline">
      {value}
    </Link>
  );
}
