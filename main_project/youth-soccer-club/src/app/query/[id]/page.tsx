import "server-only";

import { getTables } from "@/app/_actions/query1-6/display";
import { runSingleQuery } from "@/app/_actions/singleQuery";
import ErrorMessage from "@/app/_components/ErrorMessage";
import Table from "@/app/_components/Table";
import fs from "fs";
import path from "path";
import ClientQuery from "./ClientQuery";
import CRUD from "./CRUD";
import "./query-syntax-highlighting.css";
import SQLCode from "./SQLCode";

const directoryPath = "./sql/queries";

let queryFilesContents: { [key: `query${string}`]: string } | null = null;
function loadQueryFiles() {
  const queryFilesContents: { [key: `query${string}`]: string } = {};
  try {
    const files = fs.readdirSync(directoryPath);

    for (const file of files) {
      if (file.startsWith("query") && path.extname(file) === ".sql") {
        const filePath = path.join(directoryPath, file);
        const fileContents = fs.readFileSync(filePath, "utf8");
        queryFilesContents[file.replace(".sql", "") as `query${string}`] =
          fileContents;
      }
    }
  } catch (err) {
    console.error("Error reading directory or file:", err);
  }

  return queryFilesContents;
}

export default async function Query({ params }: { params: { id: string } }) {
  if (Number(params.id) >= 1 && Number(params.id) <= 6) {
    return <CRUD initialTableData={await getTables()} />;
  }

  const querySelection = `query${params.id}` as const;

  if (!queryFilesContents) {
    queryFilesContents = loadQueryFiles();
  }
  const query = queryFilesContents[querySelection];

  if (!query) {
    return <div>Query not found.</div>;
  }

  const fieldNamesToReplace =
    query.match(/\s*(?<fieldName>[\.\w]+)\s*(?=([\=<>]|<>)\s*\?)/gm) || [];
  const questionMarkCount = fieldNamesToReplace.length;

  if (questionMarkCount > 0) {
    return (
      <ClientQuery
        queryId={params.id}
        query={query}
        fieldNamesToReplace={fieldNamesToReplace}
      />
    );
  }

  const result = await runSingleQuery(query);

  return (
    <div className="flex flex-col items-center justify-center gap-6">
      <h3 className="text-3xl font-bold text-white">Query {params.id}</h3>
      <SQLCode query={query} />
      {!result.status ? (
        <ErrorMessage message={result.message} />
      ) : (
        <Table rows={result.rows} tableName={result.tableName}></Table>
      )}
    </div>
  );
}
