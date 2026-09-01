import { readFileSync, existsSync, appendFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { dirname, resolve } from "node:path";
import Ajv2020 from "ajv/dist/2020.js";
import addFormats from "ajv-formats";

const __dirname = dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = resolve(__dirname, "../../../../..");

const answeringSchema = JSON.parse(
  readFileSync(
    resolve(REPO_ROOT, "library/predication-cell-set/learning/answering/answering.schema.json"),
    "utf8",
  ),
);
const cellRecordSchema = JSON.parse(
  readFileSync(
    resolve(REPO_ROOT, "library/predication-cell-set/library/predication-cell/library/cell-record/cell-record.schema.json"),
    "utf8",
  ),
);
const predicationCellSchema = JSON.parse(
  readFileSync(
    resolve(REPO_ROOT, "library/predication-cell-set/library/predication-cell/predication-cell.schema.json"),
    "utf8",
  ),
);
const bilatticeValueSchema = JSON.parse(
  readFileSync(
    resolve(REPO_ROOT, "library/lattice/library/twist-product/library/bilattice-value/bilattice-value.schema.json"),
    "utf8",
  ),
);
const bilatticeSchema = JSON.parse(
  readFileSync(
    resolve(REPO_ROOT, "library/object/library/thing/library/category/library/variety/library/bilattice/bilattice.schema.json"),
    "utf8",
  ),
);
const cellIdSchema = JSON.parse(
  readFileSync(
    resolve(REPO_ROOT, "library/predication-cell-set/library/predication-cell/library/cell-record/library/cell-id/cell-id.schema.json"),
    "utf8",
  ),
);

const ajv = new Ajv2020({ allErrors: true, strict: false });
addFormats.default(ajv);
ajv.addSchema(cellRecordSchema, cellRecordSchema.$id);
ajv.addSchema(predicationCellSchema, predicationCellSchema.$id);
ajv.addSchema(bilatticeValueSchema, bilatticeValueSchema.$id);
ajv.addSchema(bilatticeSchema, bilatticeSchema.$id);
ajv.addSchema(cellIdSchema, cellIdSchema.$id);
ajv.addSchema(answeringSchema, answeringSchema.$id);
const validateResult = ajv.compile(answeringSchema);
const validateCellRecord = ajv.compile(cellRecordSchema);

/**
 * Posit a cell-record INTO the predication-cell-set.
 *
 * Categorically the universal-property pairing: given (subject, predicate, object)
 * in (E, Π, E) plus a bilattice-value, produce the unique cell-record (cell, value, t)
 * and admit it into $\Phi$'s on-disk realization.
 *
 * Engineering subsumption: this single action covers "appending to the event log",
 * "asserting a new fact", "positing a witness", "emitting an observation cell" —
 * the differences are which stratum the cell-record carries (asserted/saturated/settled)
 * and which predicate-class the cell's predicate belongs to.
 *
 * @param {{
 *   subject: string,                  // entity-slug
 *   predicate: string,                // predicate-slug
 *   object: string | number | boolean | object | null,
 *   value: object,                    // bilattice-value
 *   t?: string,                       // ISO-8601 transaction-id (defaults to now)
 *   stratum?: string,                 // asserted | saturated | settled (default asserted)
 *   "derived-from"?: string[],        // cell-ids of premises (when not asserted)
 *   "derived-via"?: string,           // rule-slug (when not asserted)
 *   appendToPath?: string,            // filesystem path; if present, persists the record
 * }} input
 * @returns {{
 *   "cell-record": object,
 *   "appended-to"?: string,
 *   "append-index"?: number,
 * }}
 */
export default function answering(input) {
  if (input === null || typeof input !== "object" || Array.isArray(input)) {
    throw new TypeError("answering: input must be an object");
  }
  if (typeof input.subject !== "string") {
    throw new TypeError("answering: subject (entity-slug) is required");
  }
  if (typeof input.predicate !== "string") {
    throw new TypeError("answering: predicate (predicate-slug) is required");
  }
  if (input.object === undefined) {
    throw new TypeError("answering: object is required");
  }
  if (input.value === undefined) {
    throw new TypeError("answering: value (bilattice-value) is required");
  }

  const cell = {
    subject: input.subject,
    predicate: input.predicate,
    object: input.object,
  };
  const record = {
    cell,
    value: input.value,
    t: input.t ?? new Date().toISOString(),
    stratum: input.stratum ?? "asserted",
  };
  if (input["derived-from"] !== undefined) record["derived-from"] = input["derived-from"];
  if (input["derived-via"] !== undefined) record["derived-via"] = input["derived-via"];

  if (!validateCellRecord(record)) {
    throw new TypeError(
      `answering: cell-record schema violation: ${ajv.errorsText(validateCellRecord.errors)}`,
    );
  }

  const result = { "cell-record": record };

  if (typeof input.appendToPath === "string") {
    let appendIndex = 0;
    if (existsSync(input.appendToPath)) {
      const lines = readFileSync(input.appendToPath, "utf8")
        .split("\n")
        .filter(l => l.trim().length > 0);
      if (lines.length > 0) {
        try {
          const last = JSON.parse(lines[lines.length - 1]);
          if (last.t && Date.parse(record.t) < Date.parse(last.t)) {
            throw new RangeError(
              `answering: append-only violation: new t ${record.t} < last t ${last.t}`,
            );
          }
        } catch (e) {
          if (e instanceof RangeError) throw e;
        }
        appendIndex = lines.length;
      }
    }
    appendFileSync(input.appendToPath, JSON.stringify(record) + "\n");
    result["appended-to"] = input.appendToPath;
    result["append-index"] = appendIndex;
  }

  if (!validateResult(result)) {
    throw new TypeError(
      `answering: result schema violation: ${ajv.errorsText(validateResult.errors)}`,
    );
  }
  return result;
}
