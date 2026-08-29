/**
 * Content addressing for PAM values.
 *
 * Every PAM value (claim, term, fiber, fiber-point) has a canonical
 * address derived from its content via SHA-256 over a canonical
 * serialization. The address is the value's identity: two values with
 * identical content always have the same address; two values with the
 * same address always have identical content.
 *
 * `addressOf(value, kind)` is the canonical entry point. The kind tag
 * prefixes the digest so addresses from different categories cannot
 * collide even if their canonical content happens to match.
 *
 * Conventions used elsewhere in PAM:
 *
 *   claims:           addressOf({subject, predicate, object}, "claim")
 *   claim provenance: addressOf({subject, predicate, object}, "claim")
 *                     (same key as claims)
 *   predicate fibers: addressOf(predicate, "predicate-fiber")
 *   fiber points:     addressOf([subjectAddr, objectAddr], "fiber-point")
 *
 * The canonicalize function below is the only thing that determines
 * what "same content" means: it sorts object keys, recursively
 * canonicalizes arrays element-wise, and stringifies primitives via
 * JSON.stringify. Two objects that differ only in key order produce
 * the same canonical form and therefore the same address.
 */

import { createHash } from "node:crypto";

// Address cache. During replay + enrichment the same values are
// addressed thousands of times (e.g. predicate "is-a" hashed once
// per file × 28k files). The cache turns ~1M crypto calls into
// ~100k distinct computations. Keyed on the pre-hash input string
// (`${kind}:${canonical}`), valued at the full address result.
const _cache = new Map();

function canonicalize(value) {
  if (value === null || typeof value !== "object") {
    return JSON.stringify(value);
  }
  if (Array.isArray(value)) {
    return `[${value.map(canonicalize).join(",")}]`;
  }
  const keys = Object.keys(value).sort();
  return `{${keys.map((k) => `${JSON.stringify(k)}:${canonicalize(value[k])}`).join(",")}}`;
}

function addressOf(value, kind) {
  if (!kind) kind = "atom";
  const input = `${kind}:${canonicalize(value)}`;
  let result = _cache.get(input);
  if (result !== undefined) return result;
  const digest = createHash("sha256").update(input).digest("hex");
  result = `${kind}:${digest}`;
  _cache.set(input, result);
  return result;
}

function clearAddressCache() {
  _cache.clear();
}

export { addressOf, clearAddressCache, canonicalize };
