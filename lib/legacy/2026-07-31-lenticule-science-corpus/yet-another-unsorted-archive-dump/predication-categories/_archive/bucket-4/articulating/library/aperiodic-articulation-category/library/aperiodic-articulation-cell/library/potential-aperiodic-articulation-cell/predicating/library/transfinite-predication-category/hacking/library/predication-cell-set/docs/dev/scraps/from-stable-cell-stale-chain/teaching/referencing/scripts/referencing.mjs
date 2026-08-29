import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { dirname, resolve } from "node:path";
import Ajv2020 from "ajv/dist/2020.js";
import addFormats from "ajv-formats";

const __dirname = dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = resolve(__dirname, "../../../../..");

const referencingSchema = JSON.parse(
  readFileSync(
    resolve(REPO_ROOT, "library/predication-cell-set/teaching/referencing/referencing.schema.json"),
    "utf8",
  ),
);
const predicationCellSchema = JSON.parse(
  readFileSync(
    resolve(REPO_ROOT, "library/predication-cell-set/library/predication-cell/predication-cell.schema.json"),
    "utf8",
  ),
);

const ajv = new Ajv2020({ allErrors: true, strict: false });
addFormats.default(ajv);
ajv.addSchema(predicationCellSchema, predicationCellSchema.$id);
ajv.addSchema(referencingSchema, referencingSchema.$id);
const validateResult = ajv.compile(referencingSchema);

const VALID_KINDS = new Set([
  "subject-projection",
  "predicate-projection",
  "object-projection",
  "coordinate-swap",
  "identity",
]);

/**
 * Reference the predication-cell-set: apply one of the five canonical
 * morphisms from $\Phi = E \times \Pi \times E$ to produce renderable output.
 *
 * Morphisms (universal property of the cartesian product plus the involution
 * on the twin E-coordinates):
 *   - subject-projection:   $\pi_E^{(1)}: (s, p, o) \mapsto s$
 *   - predicate-projection: $\pi_\Pi:     (s, p, o) \mapsto p$
 *   - object-projection:    $\pi_E^{(2)}: (s, p, o) \mapsto o$
 *   - coordinate-swap:      $\sigma:      (s, p, o) \mapsto (o, p, s)$, involutive
 *   - identity:             $\mathrm{id}: (s, p, o) \mapsto (s, p, o)$
 *
 * The engineering idioms "replaying the event log", "reading the witness chain",
 * "auditing the substrate state" all reduce to applying one of these morphisms
 * to a slice of $\Phi$ (typically the slice over a time window or a particular
 * subject/predicate fiber).
 *
 * @param {{
 *   cells: object[],         // input cells: each conforms to predication-cell.schema.json
 *   projectionKind: string,  // one of the five morphism names above
 *   deduplicate?: boolean,   // whether to collapse duplicate results
 * }} input
 * @returns {{
 *   "projection-kind": string,
 *   "result": (string[] | object[]),
 *   "source-cardinality": number,
 *   "result-cardinality": number,
 *   "deduplicated": boolean,
 * }}
 */
export default function referencing(input) {
  if (input === null || typeof input !== "object" || Array.isArray(input)) {
    throw new TypeError("referencing: input must be an object");
  }
  if (!Array.isArray(input.cells)) {
    throw new TypeError("referencing: cells must be an array");
  }
  if (!VALID_KINDS.has(input.projectionKind)) {
    throw new TypeError(
      `referencing: projectionKind must be one of ${[...VALID_KINDS].join(", ")}; got ${input.projectionKind}`,
    );
  }

  let projected;
  switch (input.projectionKind) {
    case "subject-projection":
      projected = input.cells.map(c => c.subject);
      break;
    case "predicate-projection":
      projected = input.cells.map(c => c.predicate);
      break;
    case "object-projection":
      projected = input.cells.map(c => c.object);
      break;
    case "coordinate-swap":
      projected = input.cells.map(c => ({
        subject: c.object,
        predicate: c.predicate,
        object: c.subject,
      }));
      break;
    case "identity":
      projected = input.cells.map(c => ({
        subject: c.subject,
        predicate: c.predicate,
        object: c.object,
      }));
      break;
  }

  const deduplicate = input.deduplicate === true;
  if (deduplicate) {
    const seen = new Set();
    projected = projected.filter(item => {
      const key = typeof item === "string" ? item : JSON.stringify(item);
      if (seen.has(key)) return false;
      seen.add(key);
      return true;
    });
  }

  const result = {
    "projection-kind": input.projectionKind,
    "result": projected,
    "source-cardinality": input.cells.length,
    "result-cardinality": projected.length,
    "deduplicated": deduplicate,
  };

  if (!validateResult(result)) {
    throw new TypeError(
      `referencing: result schema violation: ${ajv.errorsText(validateResult.errors)}`,
    );
  }
  return result;
}
