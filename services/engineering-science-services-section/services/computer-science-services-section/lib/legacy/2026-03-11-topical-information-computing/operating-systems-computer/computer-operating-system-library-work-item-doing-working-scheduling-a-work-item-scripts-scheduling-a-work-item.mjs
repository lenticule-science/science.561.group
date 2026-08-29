#!/usr/bin/env node
import { readFileSync, writeFileSync, appendFileSync } from "node:fs";
import { resolve, dirname, basename } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = process.cwd();
const WI_JSONL = resolve(REPO_ROOT, "library/object/library/thing/library/system/library/operating-system/library/computer-operating-system/library/work-item/work-item.jsonl");

const args = Object.fromEntries(process.argv.slice(2).map(a => a.match(/^--([a-z-]+)=(.*)$/)?.slice(1)).filter(Boolean));
if (!args.target || !args.deadline) { console.log(JSON.stringify({status:"rejected",reason:"missing-args",details:"--target and --deadline (ISO date) required"},null,2)); process.exit(1); }

let md = readFileSync(args.target, "utf-8");
if (md.match(/^has-deadline:/m)) {
  md = md.replace(/^(has-deadline:\s*).*$/m, "$1" + args.deadline);
} else {
  md = md.replace(/^(---\n[\s\S]*?)\n---/, "$1\nhas-deadline: " + args.deadline + "\n---");
}
writeFileSync(args.target, md);
appendFileSync(WI_JSONL, JSON.stringify({e:basename(args.target,".md"),a:"scheduling-a-work-item",v:{deadline:args.deadline},t:new Date().toISOString()}) + "\n");
console.log(JSON.stringify({status:"scheduled",target:args.target,deadline:args.deadline},null,2));
