#!/usr/bin/env node

// panini read "<text>" --lang=<fiber> [--json]
// panini annotate --file <path> --lang=<fiber> [--json]
// Prints the engine's receipt (tags, arcs, obstructions, judgment) for each
// sentence; --json prints the full reading. Refusals are typed JSON on exit 1.

import { readFileSync } from "node:fs";
import { load, read, receipt, render } from "../src/index.mjs";

const HELP = `Usage:
  panini read "<text>" --lang=<fiber> [--json]
  panini annotate --file <path> --lang=<fiber> [--json]

fibers: english (default), lakota, latin, mandarin, tokipona, or a package name
`;

function parseArgs(argv) {
  const out = { command: argv[0], positional: [], lang: "english", json: false, file: null };
  for (const a of argv.slice(1)) {
    if (a.startsWith("--lang=")) out.lang = a.slice(7);
    else if (a === "--json") out.json = true;
    else if (a === "--file") out.file = "__next__";
    else if (out.file === "__next__") out.file = a;
    else out.positional.push(a);
  }
  return out;
}

async function main() {
  const args = parseArgs(process.argv.slice(2));
  if (!args.command || args.command === "--help" || args.command === "-h") {
    process.stdout.write(HELP);
    return;
  }
  const bundle = await load(args.lang);
  let texts;
  if (args.command === "read") texts = [args.positional.join(" ")];
  else if (args.command === "annotate") {
    if (!args.file) throw Object.assign(new Error("annotate requires --file <path>"), { code: "malformed-input" });
    texts = readFileSync(args.file, "utf8").split(/\r?\n/).map((l) => l.trim()).filter(Boolean);
  } else throw Object.assign(new Error(`unknown command ${args.command}`), { code: "malformed-input" });
  const results = texts.map((t) => read(t, bundle));
  if (args.json) process.stdout.write(`${JSON.stringify({ ok: true, fiber: args.lang, readings: results })}\n`);
  else {
    for (const r of results) process.stdout.write(`${JSON.stringify({ ok: true, fiber: args.lang, receipt: receipt(r) })}\n${render(r)}\n`);
  }
}

main().catch((error) => {
  process.stdout.write(`${JSON.stringify({ ok: false, refusal: { code: error.code ?? "read-error", message: error instanceof Error ? error.message : String(error) } })}\n`);
  process.exitCode = 1;
});
