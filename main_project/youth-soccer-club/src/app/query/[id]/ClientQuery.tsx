"use client";

import { runSingleQuery } from "@/app/_actions/singleQuery";
import ErrorMessage from "@/app/_components/ErrorMessage";
import Table from "@/app/_components/Table";
import { useEffect, useReducer, useRef, useState } from "react";
import SQLCode from "./SQLCode";

export default function ClientQuery({
  queryId,
  query,
  fieldNamesToReplace,
}: {
  queryId: string;
  query: string;
  fieldNamesToReplace: string[];
}) {
  const [key, rerender] = useReducer((x) => x + 1, 0);
  const [result, setResult] = useState<
    Awaited<ReturnType<typeof runSingleQuery>> | undefined
  >();

  const formRef = useRef<HTMLFormElement>(null!);

  const runQuery = async () => {
    const formData = new FormData(formRef.current);
    const values = [...formData.values()] as string[];
    // formRef.current.reset();
    const result = await runSingleQuery(query, values);
    setResult(result);
    rerender();
  };

  useEffect(() => {
    const enterKeyHandler = (event: KeyboardEvent) => {
      if (event.key === "Enter") {
        runQuery();
      }
    };
    document.addEventListener("keydown", enterKeyHandler);
    return () => {
      document.removeEventListener("keydown", enterKeyHandler);
    };
  }, []);

  return (
    <div className="flex flex-col items-center justify-center gap-6">
      <h3 className="text-3xl font-bold text-white">Query {queryId}</h3>
      <SQLCode query={query} />
      {result ? (
        !result.status ? (
          <ErrorMessage message={result.message} />
        ) : (
          <Table
            key={key}
            rows={result.rows}
            tableName={result.tableName}
          ></Table>
        )
      ) : null}
      <form ref={formRef} className="flex flex-col items-center gap-2">
        {fieldNamesToReplace.map((fieldName, index) => (
          <label key={index} className="flex items-center gap-2">
            {fieldName}
            <input
              type="text"
              name={fieldName}
              className="rounded-lg bg-verdigris/15 p-4 text-white outline-none"
              placeholder="?"
            />
          </label>
        ))}
      </form>
      <button
        className="h-12 w-24 rounded-lg bg-verdigris/15 text-white transition-all hover:bg-verdigris/30"
        onClick={async (e) => {
          e.preventDefault();
          e.stopPropagation();
          await runQuery();
        }}
      >
        Run
      </button>
    </div>
  );
}
