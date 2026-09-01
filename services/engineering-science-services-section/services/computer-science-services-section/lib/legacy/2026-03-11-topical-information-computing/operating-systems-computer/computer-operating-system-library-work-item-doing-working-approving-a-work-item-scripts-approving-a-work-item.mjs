#!/usr/bin/env node
import { spawnSync } from "node:child_process";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const TWI = resolve(__dirname, "../../transitioning-a-work-items-state/scripts/transitioning-a-work-items-state.mjs");

function arg(name) {
  for (const a of process.argv.slice(2)) {
    const m = a.match(new RegExp("^--" + name + "=(.*)$"));
    if (m) return m[1];
  }
  return null;
}

function fire(from, to, reason) {
  const args = ["--target=" + arg("target"), "--from=" + from, "--to=" + to];
  if (reason) args.push("--reason=" + reason);
  const r = spawnSync("node", [TWI, ...args], { encoding: "utf-8" });
  process.stdout.write(r.stdout);
  process.stderr.write(r.stderr);
  process.exit(r.status ?? 1);
}
fire("review", "done");
