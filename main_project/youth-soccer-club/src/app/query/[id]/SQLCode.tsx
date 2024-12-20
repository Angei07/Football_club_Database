import { highlight } from "sql-highlight";

export default function SQLCode({ query }: { query: string }) {
  return (
    <code
      className="whitespace-pre-wrap rounded-lg bg-verdigris/15 p-4 text-white"
      dangerouslySetInnerHTML={{
        __html: highlight(query, {
          html: true,
        }),
      }}
    ></code>
  );
}
