"use client";

import { deleteRow, editRow, insertRow } from "@/app/_actions/tableOps";
import React, { useReducer, useRef, useState } from "react";
import ErrorMessage from "../ErrorMessage";

type FieldData = string | number | Date | null;
type Row = Record<string, FieldData>;

export default function Table({
  tableName,
  rows: _rows,
  editable,
  CustomCell,
}: {
  tableName: string;
  rows: Row[];
  editable?: boolean;
  CustomCell?: (props: { value: string | number | null }) => React.ReactNode;
}) {
  const [rows, setRows] = useState(_rows);

  const formRef = useRef<HTMLFormElement>(null);

  const [rowIsEditingIdx, _setRowIsEditingIdx] = useState<number | null>(null);
  const setRowIsEditingIdx = (idx: number | null) => {
    _setRowIsEditingIdx(idx);
    if (idx !== null) {
      if (rowIsDeletingIdx !== null) {
        _setRowIsDeletingIdx(null);
      }
      if (isInserting) {
        _setIsInserting(false);
      }
    }
  };
  const [rowIsDeletingIdx, _setRowIsDeletingIdx] = useState<number | null>(
    null
  );
  const setRowIsDeletingIdx = (idx: number | null) => {
    _setRowIsDeletingIdx(idx);
    if (idx !== null) {
      if (rowIsEditingIdx !== null) {
        _setRowIsEditingIdx(null);
      }
      if (isInserting) {
        _setIsInserting(false);
      }
    }
  };
  const [isInserting, _setIsInserting] = useState(false);
  const setIsInserting = (val: boolean) => {
    _setIsInserting(val);
    if (val) {
      _setRowIsEditingIdx(null);
      _setRowIsDeletingIdx(null);
    }
  };

  const [resetFormKey, resetForm] = useReducer((x) => x + 1, 0);

  const [errorMessage, setErrorMessage] = useState<string | null>(null);

  if (rows.length === 0) {
    return (
      <div className="flex flex-col items-center gap-4">
        <table className="min-w-full overflow-hidden rounded-md border border-gray-300 border-x-gray-300/20 bg-verdigris/15 shadow-md shadow-verdigris/50">
          <tbody>
            <tr>
              <td className="p-4">No rows found for {tableName}</td>
            </tr>
          </tbody>
        </table>
      </div>
    );
  }

  return (
    <div className="flex flex-col items-center gap-4 [font-size:75%]">
      {tableName && (
        <h2 className="text-2xl font-bold text-white">{tableName}</h2>
      )}
      {errorMessage && (
        <ErrorMessage
          message={errorMessage}
          onClose={() => setErrorMessage(null)}
        />
      )}
      <form ref={formRef} className="relative">
        <table className="min-w-full overflow-hidden rounded-md border border-gray-300 border-x-gray-300/20 bg-verdigris/15 shadow-md shadow-verdigris/50">
          <thead>
            <tr>
              {Object.keys(rows[0]).map((key) => (
                <th className="border px-4 py-2" key={key}>
                  {camelToTitleCase(key)}
                </th>
              ))}
              {editable && <th className="border px-4 py-2">Actions</th>}
            </tr>
          </thead>
          <tbody>
            {rows.map((row, index) => {
              const isEditing = rowIsEditingIdx === index;
              const isOtherRowEditing = rowIsEditingIdx !== null && !isEditing;

              const isDeleting = rowIsDeletingIdx === index;

              return (
                <tr
                  key={index}
                  className={
                    isOtherRowEditing ? "bg-black/20 text-gray-500" : ""
                  }
                >
                  {Object.entries(row).map(([key, value], index) => {
                    const convertedValue =
                      value instanceof Date
                        ? value.toISOString().substring(0, 10)
                        : value != null
                          ? value.toString()
                          : "";
                    return (
                      <td
                        key={index}
                        className="border border-gray-300 border-x-gray-300/20 px-4 py-2"
                      >
                        {CustomCell ? (
                          <CustomCell value={convertedValue} />
                        ) : (
                          <textarea
                            key={resetFormKey}
                            defaultValue={convertedValue ?? undefined}
                            name={isEditing ? key : undefined}
                            readOnly={!isEditing}
                            className="w-full resize-none appearance-none text-nowrap break-all bg-transparent outline-none [-webkit-appearance:none] [field-sizing:content]"
                          />
                        )}
                      </td>
                    );
                  })}

                  {editable && (
                    <td className="border border-gray-300 border-x-gray-300/20 px-4 py-2">
                      <span className="flex grow select-none items-center justify-center gap-2 font-mono font-bold">
                        {isEditing || isDeleting ? (
                          <>
                            <button
                              className="uppercase text-green-600"
                              onClick={async (e) => {
                                e.preventDefault();
                                e.stopPropagation();

                                if (isDeleting) {
                                  const cleanRow = removeFalsyValues(row);
                                  const res = await deleteRow(
                                    tableName,
                                    removeFalsyValues(cleanRow)
                                  );
                                  if (!res.status) {
                                    resetForm();
                                    setErrorMessage(
                                      `An error occured:\n${res.message}`
                                    );
                                  }
                                  setRows(
                                    rows.filter((_, idx) => idx !== index)
                                  );
                                  setRowIsDeletingIdx(null);
                                } else {
                                  const formData = new FormData(
                                    formRef.current!
                                  );
                                  const newRow = Object.fromEntries(
                                    formData.entries()
                                  ) as Record<string, string>;
                                  const cleanNewRow = removeFalsyValues(newRow);
                                  const res = await editRow(
                                    tableName,
                                    row,
                                    cleanNewRow
                                  );
                                  if (!res.status) {
                                    resetForm();
                                    setErrorMessage(
                                      `An error occured:\n${res.message}`
                                    );
                                  }
                                  setRowIsEditingIdx(null);
                                }
                              }}
                            >
                              Confirm
                            </button>
                            <button
                              className="uppercase text-red-500"
                              onClick={(e) => {
                                e.preventDefault();
                                e.stopPropagation();

                                resetForm();
                                setRowIsEditingIdx(null);
                                setRowIsDeletingIdx(null);
                              }}
                            >
                              Cancel
                            </button>
                          </>
                        ) : (
                          <>
                            <button
                              className="uppercase text-blue-600"
                              onClick={(e) => {
                                e.preventDefault();
                                e.stopPropagation();

                                setRowIsEditingIdx(index);
                              }}
                            >
                              &nbsp;&nbsp;&nbsp;Edit
                            </button>
                            <button
                              className="uppercase text-red-500"
                              onClick={async (e) => {
                                e.preventDefault();
                                e.stopPropagation();

                                setRowIsDeletingIdx(index);
                              }}
                            >
                              Delete
                            </button>
                          </>
                        )}
                      </span>
                    </td>
                  )}
                </tr>
              );
            })}
            {isInserting && (
              <tr>
                {Object.keys(rows[0]).map((key, index) => {
                  return (
                    <td
                      key={index}
                      className="border border-gray-300 border-x-gray-300/20 px-4 py-2"
                    >
                      <textarea
                        key={resetFormKey}
                        defaultValue={""}
                        placeholder={key}
                        name={key}
                        className="w-full resize-none appearance-none text-nowrap break-all bg-transparent outline-none [-webkit-appearance:none] [field-sizing:content] placeholder:text-gray-500/50"
                      />
                    </td>
                  );
                })}

                {editable && (
                  <td className="border border-gray-300 border-x-gray-300/20 px-4 py-2">
                    <span className="flex grow select-none items-center justify-center gap-2 font-mono font-bold">
                      <button
                        className="uppercase text-green-600"
                        onClick={async (e) => {
                          e.preventDefault();
                          e.stopPropagation();

                          const formData = new FormData(formRef.current!);
                          const newRow = Object.fromEntries(
                            formData.entries()
                          ) as Record<string, string>;
                          const cleanNewRow = removeFalsyValues(newRow);

                          const res = await insertRow(tableName, cleanNewRow);
                          if (!res.status) {
                            resetForm();
                            setErrorMessage(
                              `An error occured:\n${res.message}`
                            );
                          } else if (res.data) {
                            setRows([...rows, res.data[0]]);
                          }

                          setIsInserting(false);
                        }}
                      >
                        Confirm
                      </button>
                      <button
                        className="uppercase text-red-500"
                        onClick={(e) => {
                          e.preventDefault();
                          e.stopPropagation();

                          setIsInserting(false);
                        }}
                      >
                        Cancel
                      </button>
                    </span>
                  </td>
                )}
              </tr>
            )}
          </tbody>
        </table>
        {editable && !isInserting && (
          <button
            className="absolute right-0 top-full mt-2 flex h-10 w-12 items-center justify-center rounded-lg bg-verdigris/50 text-3xl font-extrabold leading-[3] transition-all hover:bg-verdigris/75"
            onClick={() => setIsInserting(true)}
          >
            <span className="-translate-y-0.5">+</span>
          </button>
        )}
      </form>
      {/* spacer for the absolutely positioned + button above */}
      {editable && !isInserting && <div className="h-12"></div>}
    </div>
  );
}

function camelToTitleCase(str: string) {
  return str
    .replace(/([A-Z])/g, " $1")
    .trim()
    .replace(/^./, str[0].toUpperCase());
}

function removeFalsyValues<T extends Record<string, any>>(obj: T): T {
  const result: Record<string, any> = {};

  for (const key in obj) {
    if (obj[key]) {
      result[key] = obj[key];
    }
  }

  return result as T;
}
