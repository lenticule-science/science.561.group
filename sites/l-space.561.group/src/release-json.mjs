import { readFileSync } from "node:fs";

/** Read a release carrier as JSON while preserving its operation-specific error label. */
export function json(path, label) {
  try { return JSON.parse(readFileSync(path, "utf8")); }
  catch (error) { throw new Error(`cannot read ${label} at ${path}: ${error instanceof Error ? error.message : String(error)}`); }
}
