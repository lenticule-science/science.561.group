#!/usr/bin/env node
import { fileURLToPath } from "node:url";
import { induceBins, serve } from "@emsenn/relating";

import { actions } from "../actions.mjs";

function main(): void {
  const port = Number(process.env["PORT"] ?? 16869);
  const dataRoot = process.env["COMMUNICATING_DATA"];
  const induced = induceBins(actions, { packageName: "@emsenn/communicating-in-relation-conlang" });
  const server = serve(actions, {
    induced,
    title: "@emsenn/communicating-in-relation-conlang",
    ...(dataRoot === undefined ? {} : { dataRoot }),
    namespace: "@emsenn/communicating-in-relation-conlang",
    caller: { transport: "http" },
    program: "communicate",
  });
  server.listen(port, () => {
    process.stdout.write(`communicate-serve: ${induced.actions.length} operations on http://localhost:${port}/\n`);
  });
}

if (process.argv[1] !== undefined && fileURLToPath(import.meta.url) === process.argv[1]) {
  main();
}
