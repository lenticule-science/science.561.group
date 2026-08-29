#!/usr/bin/env node
// Block-propagation closure rule: walks depends-on graph and derives
// blocked status. (a depends-on b) ∧ (b has-status blocked) ⇒ (a has-status blocked).

import { readFileSync, readdirSync, statSync, appendFileSync, existsSync, writeFileSync } from "node:fs";
import { resolve, dirname, basename, join } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));

function findRepoRoot(start) {
  let d = start;
  while (d !== "/") {
    if (existsSync(resolve(d, ".git"))) return d;
    d = dirname(d);
  }
  return process.cwd();
}

const REPO_ROOT = findRepoRoot(__dirname);
const WI_JSONL = resolve(REPO_ROOT, "library/object/library/thing/library/system/library/operating-system/library/computer-operating-system/library/work-item/work-item.jsonl");

function parseFrontmatter(md) {
  const m = md.match(/^---\n([\s\S]*?)\n---/);
  if (!m) return {};
  const fm = {};
  for (const line of m[1].split("\n")) {
    const kv = line.match(/^([a-z][a-z0-9-]*):\s*(.*)$/);
    if (kv) {
      let v = kv[2].trim();
      const list = v.match(/^\[(.*)\]$/);
      if (list) v = list[1].split(",").map(s => s.trim()).filter(Boolean);
      fm[kv[1]] = v;
    }
  }
  return fm;
}

function walkWorkItems(dir, out = []) {
  if (!existsSync(dir)) return out;
  for (const entry of readdirSync(dir)) {
    const p = join(dir, entry);
    const s = statSync(p);
    if (s.isDirectory()) walkWorkItems(p, out);
    else if (entry.endsWith(".md")) {
      try {
        const md = readFileSync(p, "utf-8");
        const fm = parseFrontmatter(md);
        if (fm["has-kind"]) out.push({ path: p, slug: basename(p, ".md"), fm });
      } catch {}
    }
  }
  return out;
}

const planning = resolve(REPO_ROOT, "doing/planning");
const items = walkWorkItems(planning);
const bySlug = new Map(items.map(i => [i.slug, i]));

const newlyBlocked = [];
let changed = true;
while (changed) {
  changed = false;
  for (const item of items) {
    if (item.fm["has-status"] === "blocked") continue;
    const deps = Array.isArray(item.fm["depends-on"]) ? item.fm["depends-on"] : (item.fm["depends-on"] ? [item.fm["depends-on"]] : []);
    for (const dep of deps) {
      const depItem = bySlug.get(dep);
      if (depItem && depItem.fm["has-status"] === "blocked") {
        item.fm["has-status"] = "blocked";
        item.fm["blocked-by"] = `transitive-via-${dep}`;
        let md = readFileSync(item.path, "utf-8");
        md = md.replace(/^(has-status:\s*).*$/m, `$1blocked`);
        if (md.match(/^blocked-by:/m)) {
          md = md.replace(/^(blocked-by:\s*).*$/m, `$1transitive-via-${dep}`);
        } else {
          md = md.replace(/^(has-status:.*)$/m, `$1\nblocked-by: transitive-via-${dep}`);
        }
        writeFileSync(item.path, md);
        newlyBlocked.push({ slug: item.slug, blockedVia: dep });
        appendFileSync(WI_JSONL, JSON.stringify({
          e: item.slug,
          a: "propagating-blocks",
          v: { derived: "has-status=blocked", "blocked-by": `transitive-via-${dep}` },
          t: new Date().toISOString(),
        }) + "\n");
        changed = true;
        break;
      }
    }
  }
}

console.log(JSON.stringify({
  status: newlyBlocked.length ? "fired" : "nothing-to-propagate",
  newlyBlocked,
  scanned: items.length,
}, null, 2));
