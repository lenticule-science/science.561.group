#!/usr/bin/env node
/**
 * Effect: run one relate query -- a conjunction of --attribute/--value
 * pairs -- against the admitted theorem-facts trace and print the
 * matching theorem names. Worked example: --attribute regime-mode
 * --value hypothesized --attribute module --value KineticTheory.
 * @module relate-set-of-theorem-facts
 */
import { projectFileUrlFilepath } from "@red-cup-engineering/project-file-url-filepath-service";
import { readEavtFile, relate } from "@red-cup-engineering/eavt";
import { isMain } from "@red-cup-engineering/javascript-file-main-guard-service";
import { nameOfEntity } from "../src/census-admission.mjs";

const DEFAULT_TRACE_PATH = projectFileUrlFilepath(
  new URL("../data/state/2026-09-04-obsmetrologia-theorem-facts.eavt", import.meta.url).href,
);

/**
 * Parse argv into repeatable --attribute/--value pairs plus an optional --trace override.
 * Each value is JSON-parsed when possible (so "3" and "true" become number/boolean),
 * falling back to the raw string (so "hypothesized" stays a string).
 * @param {string[]} argv - `process.argv.slice(2)`.
 * @returns {{tracePath: string|undefined, pairs: Array<{attribute: string, value: *}>}}
 * @throws {Error} If an --attribute is missing its paired --value, or vice versa.
 */
export function parseArgv(argv) {
  let tracePath;
  const pairs = [];
  let pendingAttribute;
  for (let index = 0; index < argv.length; index += 1) {
    const token = argv[index];
    if (token === "--trace") {
      tracePath = argv[index + 1];
      index += 1;
    } else if (token === "--attribute") {
      if (pendingAttribute !== undefined) throw new Error(`relate-set-of-theorem-facts: --attribute "${pendingAttribute}" missing its --value`);
      pendingAttribute = argv[index + 1];
      index += 1;
    } else if (token === "--value") {
      if (pendingAttribute === undefined) throw new Error('relate-set-of-theorem-facts: --value given with no preceding --attribute');
      const raw = argv[index + 1];
      index += 1;
      let value;
      try {
        value = JSON.parse(raw);
      } catch {
        value = raw;
      }
      pairs.push({ attribute: pendingAttribute, value });
      pendingAttribute = undefined;
    }
  }
  if (pendingAttribute !== undefined) throw new Error(`relate-set-of-theorem-facts: --attribute "${pendingAttribute}" missing its --value`);
  return { tracePath, pairs };
}

/**
 * The theorem entity addresses matching every {attribute,value} pair (AND), via eavt's relate.
 * @param {object[]} rows
 * @param {Array<{attribute: string, value: *}>} pairs
 * @returns {string[]} Matching entity addresses, sorted.
 * @throws {Error} If `pairs` is empty.
 */
export function relateConjunction(rows, pairs) {
  if (pairs.length === 0) throw new Error("relate-set-of-theorem-facts: at least one --attribute/--value pair is required");
  let matches = new Set(relate(rows, pairs[0].attribute, pairs[0].value));
  for (const { attribute, value } of pairs.slice(1)) {
    const next = new Set(relate(rows, attribute, value));
    matches = new Set([...matches].filter((address) => next.has(address)));
  }
  return [...matches].sort();
}

function main() {
  const { tracePath: argvTracePath, pairs } = parseArgv(process.argv.slice(2));
  const tracePath = argvTracePath ?? DEFAULT_TRACE_PATH;
  const rows = readEavtFile(tracePath);
  const addresses = relateConjunction(rows, pairs);
  const theorems = addresses.map((address) => nameOfEntity(rows, address)).sort();
  process.stdout.write(`${JSON.stringify({ pairs, count: theorems.length, theorems }, null, 2)}\n`);
  process.exit(0);
}

if (isMain(import.meta.url)) {
  main();
}
