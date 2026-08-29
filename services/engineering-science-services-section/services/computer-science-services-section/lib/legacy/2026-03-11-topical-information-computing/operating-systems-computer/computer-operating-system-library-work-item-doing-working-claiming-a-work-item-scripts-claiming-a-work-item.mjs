#!/usr/bin/env node
import { spawnSync } from "node:child_process";
import { readFileSync, writeFileSync, appendFileSync } from "node:fs";
import { resolve, dirname, basename } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = process.cwd();
const TWI = resolve(REPO_ROOT, "library/object/library/thing/library/system/library/operating-system/library/computer-operating-system/library/work-item/doing/working/transitioning-a-work-items-state/scripts/transitioning-a-work-items-state.mjs");
const WI_JSONL = resolve(REPO_ROOT, "library/object/library/thing/library/system/library/operating-system/library/computer-operating-system/library/work-item/work-item.jsonl");

const args = Object.fromEntries(process.argv.slice(2).map(a => a.match(/^--([a-z-]+)=(.*)$/)?.slice(1)).filter(Boolean));
if (!args.target || !args.actor) { console.log(JSON.stringify({status:"rejected",reason:"missing-args",details:"--target and --actor required"},null,2)); process.exit(1); }

let md = readFileSync(args.target, "utf-8");
if (md.match(/^claimed-by:/m)) {
  md = md.replace(/^(claimed-by:\s*).*$/m, "$1" + args.actor);
} else {
  md = md.replace(/^(---\n[\s\S]*?)\n---/, "$1\nclaimed-by: " + args.actor + "\n---");
}
writeFileSync(args.target, md);
appendFileSync(WI_JSONL, JSON.stringify({e:basename(args.target,".md"),a:"claiming-a-work-item",v:{claimed_by:args.actor},t:new Date().toISOString()}) + "\n");

const status_match = md.match(/^has-status:\s*(.+)$/m);
const current = status_match?.[1]?.trim();
if (current === "open") {
  const r = spawnSync("node", [TWI, "--target=" + args.target, "--from=open", "--to=in-progress"], { encoding: "utf-8" });
  process.stdout.write(r.stdout);
} else {
  console.log(JSON.stringify({status:"claimed",target:args.target,actor:args.actor,note:"current state " + current + " — no auto-transition"},null,2));
}
