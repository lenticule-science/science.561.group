#!/usr/bin/env node
/**
 * communicate-serve - HTTP/OpenAPI/MCP/web-UX transport over Arabic communicating actions.
 */
import { fileURLToPath } from "node:url";
import { induceBins, serve } from "@emsenn/relating";
import { actions } from "../actions.mjs";

function main(): void {
  const port = Number(process.env["PORT"] ?? 16868);
  const dataRoot = process.env["COMMUNICATING_DATA"];
  const induced = induceBins(actions, { packageName: "@emsenn/communicating-in-arabic" });
  const server = serve(actions, {
    induced,
    title: "@emsenn/communicating-in-arabic",
    ...(dataRoot === undefined ? {} : { dataRoot }),
    namespace: "@emsenn/communicating-in-arabic",
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
