#!/usr/bin/env node

import { basename, dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import { materializeTracedNodeRuntime } from "@red-cup-engineering/node-runtime-release-materialization-service";

const base = resolve(dirname(fileURLToPath(import.meta.url)), "..");
// The generic materializer refuses source/output overlap. Keep its generated
// runtime beside the source tree, or let an operator choose an admitted release
// location explicitly.
const output = resolve(process.env.L_SPACE_MCP_RUNTIME_ROOT ?? resolve(base, "..", `${basename(base)}-mcp-runtime`));

const receipt = await materializeTracedNodeRuntime({
  base,
  output,
  entrypoints: ["scripts/serve-mcp.mjs"],
});
process.stdout.write(`${JSON.stringify(receipt, null, 2)}\n`);
