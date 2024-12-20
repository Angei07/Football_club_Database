import { $ } from "bun";

console.log("start.ts");

for await (const line of $`tail -f test.txt`.lines()) {
  console.log("line!!!", line);
}
