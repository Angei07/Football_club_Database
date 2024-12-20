"use client";

import { createTables } from "@/app/_actions/query1-6/create";
import { deleteTables } from "@/app/_actions/query1-6/delete";
import { getTables } from "@/app/_actions/query1-6/display";
import { editTables } from "@/app/_actions/query1-6/edit";
import ErrorMessage from "@/app/_components/ErrorMessage";
import { useEffect, useReducer, useState } from "react";
import DisplayTables from "./DisplayTables";

type TableData = Awaited<ReturnType<typeof getTables>>;

export default function CRUD({
  initialTableData,
}: {
  initialTableData: TableData | null;
}) {
  const [key, rerender] = useReducer((x) => x + 1, 0);
  const [tableData, setTableData] = useState(initialTableData);

  const [isLoading, setIsLoading] = useState(false);
  const [errorMessage, setErrorMessage] = useState<string | null>(null);

  const displayTables = async () => {
    setIsLoading(true);
    const data = await getTables();
    setIsLoading(false);
    setTableData(data);
    rerender();
  };

  useEffect(() => {
    displayTables();
  }, []);

  return (
    <div className="flex flex-col items-center gap-4">
      CRUD
      <div className="relative flex items-center gap-4 [&>button:hover]:bg-verdigris/70 [&>button]:h-12 [&>button]:w-16 [&>button]:rounded-lg [&>button]:bg-verdigris/50 [&>button]:text-white [&>button]:transition-all">
        <button
          onClick={async () => {
            setIsLoading(true);
            const { status, message } = await createTables();

            if (!status) {
              setErrorMessage(message);
            } else {
              setErrorMessage(null);
              displayTables();
            }
          }}
        >
          Create
        </button>
        <button
          onClick={async () => {
            setIsLoading(true);
            const { status, message } = await editTables();

            if (!status) {
              setErrorMessage(message);
            } else {
              setErrorMessage(null);
              displayTables();
            }
          }}
        >
          Edit
        </button>
        <button
          onClick={async () => {
            setIsLoading(true);
            const { status, message } = await deleteTables();

            if (!status) {
              setErrorMessage(message);
            } else {
              setErrorMessage(null);
              displayTables();
            }
          }}
        >
          Delete
        </button>
        <button onClick={displayTables}>Display</button>
        {isLoading && (
          <div className="absolute bottom-0 left-full top-0 flex items-center justify-center pl-4">
            <div className="h-8 w-8 animate-spin rounded-full border-b-2 border-t-2 border-verdigris/75" />
          </div>
        )}
      </div>
      {errorMessage && (
        <ErrorMessage
          message={errorMessage}
          onClose={() => setErrorMessage(null)}
        />
      )}
      {tableData && <DisplayTables key={key} tableData={tableData} />}
    </div>
  );
}
