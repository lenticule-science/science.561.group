// vocabulary-schema — validates this package's live exported sample values
// against the authored data/records/schema vocabulary (utterance, token,
// claim, articulating). Additive only: no src changes, no new dependency —
// a small self-contained JSON-Schema-subset validator (type, required,
// properties, const, enum, prefixItems/items, allOf, oneOf, $ref with
// relative file+pointer resolution), enough for these plain-JSON schemas.
//
// The authored schemas state the RULED vocabulary (owner-ruled 2026-08-31),
// not a mirror of the package's local inline literals. Three divergences are
// real and expected, not bugs in this test:
//   1. This package's local Mark literal (utterance.mts `MarkSchema`) uses
//      kind "utterance.mark"; the canonical mark schema the authored
//      mark-profile thinly wraps (obsmetrologia's mark.schema.json) requires
//      kind "mark". The two loci have not been unified.
//   2. The ruled `utterance.schema.json` is the ordered pair (Token, Claim)
//      as a two-element tuple (prefixItems, token first); the live
//      `UtteranceCarrier` (utterance.mts `utteranceSchema`/`utterance()`) is
//      object-shaped ({kind, token, claim}), not a tuple.
//   3. `articulating.schema.json` adds the ruled regime-pair const fields
//      (structuralRegime/dynamicalRegime); live `Articulating` carriers
//      (utterance.mts `articulatingUtter`/`articulatingPair`) do not carry
//      them.
// All three are recorded as findings in the authoring session's report, not
// resolved here by changing src. This test asserts the exact, current shape
// of that gap so it stays visible rather than silently drifting.
import { readFileSync } from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";
import assert from "node:assert/strict";
import { test } from "node:test";
import { mark, token, claim, utterance, articulatingUtter } from "../lib/articulating/utterance.mts";

const here = path.dirname(fileURLToPath(import.meta.url));
const schemaDir = path.resolve(here, "../data/records/schema");

const cache = new Map();
function loadSchema(absPath) {
  if (!cache.has(absPath)) cache.set(absPath, JSON.parse(readFileSync(absPath, "utf8")));
  return cache.get(absPath);
}

function pointerGet(doc, pointer) {
  if (!pointer) return doc;
  const parts = pointer.replace(/^\//, "").split("/").map((s) => s.replace(/~1/g, "/").replace(/~0/g, "~"));
  let cur = doc;
  for (const part of parts) {
    if (cur == null || !(part in cur)) return undefined;
    cur = cur[part];
  }
  return cur;
}

function resolveRef(ref, baseFile) {
  if (ref.startsWith("#")) return { doc: loadSchema(baseFile), file: baseFile, pointer: ref.slice(1) };
  const [filePart, ptr = ""] = ref.split("#");
  const targetFile = path.resolve(path.dirname(baseFile), filePart);
  return { doc: loadSchema(targetFile), file: targetFile, pointer: ptr };
}

// Minimal validator over the schema subset these authored files use.
// Returns a flat array of JSON-pointer-style error paths.
function validate(schema, value, baseFile, at = "") {
  const errors = [];

  if (schema.$ref) {
    const { doc, file, pointer } = resolveRef(schema.$ref, baseFile);
    const target = pointerGet(doc, pointer);
    return validate(target, value, file, at);
  }
  if (schema.allOf) {
    for (const sub of schema.allOf) errors.push(...validate(sub, value, baseFile, at));
  }
  if (schema.oneOf) {
    const branchResults = schema.oneOf.map((sub) => validate(sub, value, baseFile, at));
    const matching = branchResults.filter((errs) => errs.length === 0);
    if (matching.length !== 1) {
      errors.push(`${at || "/"}: oneOf matched ${matching.length} branches (want 1); branch errors: ${JSON.stringify(branchResults)}`);
    }
  }
  if (schema.const !== undefined) {
    if (value !== schema.const) errors.push(`${at || "/"}: expected const ${JSON.stringify(schema.const)}, got ${JSON.stringify(value)}`);
  }
  if (schema.enum !== undefined) {
    if (!schema.enum.includes(value)) errors.push(`${at || "/"}: expected one of ${JSON.stringify(schema.enum)}, got ${JSON.stringify(value)}`);
  }
  if (schema.type === "object") {
    if (typeof value !== "object" || value === null || Array.isArray(value)) {
      errors.push(`${at || "/"}: expected object`);
    } else {
      for (const key of schema.required ?? []) {
        if (!(key in value)) errors.push(`${at}/${key}: missing required property`);
      }
      for (const [key, subSchema] of Object.entries(schema.properties ?? {})) {
        if (key in value) errors.push(...validate(subSchema, value[key], baseFile, `${at}/${key}`));
      }
    }
  }
  if (schema.type === "array") {
    if (!Array.isArray(value)) {
      errors.push(`${at || "/"}: expected array`);
    } else {
      if (schema.prefixItems) {
        schema.prefixItems.forEach((sub, i) => errors.push(...validate(sub, value[i], baseFile, `${at}/${i}`)));
        if (schema.items === false && value.length > schema.prefixItems.length) {
          errors.push(`${at || "/"}: extra items beyond prefixItems`);
        }
      } else if (schema.items && schema.items !== false) {
        value.forEach((item, i) => errors.push(...validate(schema.items, item, baseFile, `${at}/${i}`)));
      }
    }
  }
  return errors;
}

test("token.schema.json validates a live token except the local Mark's kind literal", () => {
  const schemaFile = path.join(schemaDir, "token.schema.json");
  const errors = validate(loadSchema(schemaFile), token(mark("s")), schemaFile);
  assert.deepEqual(errors, ["/mark/kind: expected const \"mark\", got \"utterance.mark\""]);
});

test("claim.schema.json validates a live claim except the local Mark's kind literal", () => {
  const schemaFile = path.join(schemaDir, "claim.schema.json");
  const errors = validate(loadSchema(schemaFile), claim(mark("o")), schemaFile);
  assert.deepEqual(errors, ["/mark/kind: expected const \"mark\", got \"utterance.mark\""]);
});

test("utterance.schema.json validates a live utterance's token-then-claim order, mark kind aside", () => {
  const schemaFile = path.join(schemaDir, "utterance.schema.json");
  const carrier = utterance(mark("s"), mark("o"));
  const errors = validate(loadSchema(schemaFile), [carrier.token, carrier.claim], schemaFile);
  assert.deepEqual(errors, [
    "/0/mark/kind: expected const \"mark\", got \"utterance.mark\"",
    "/1/mark/kind: expected const \"mark\", got \"utterance.mark\"",
  ]);
});

test("articulating.schema.json's ArticulatingUtter branch selects a live ArticulatingUtter by kind, modulo the ruled utterance tuple and regime pair", () => {
  const schemaFile = path.join(schemaDir, "articulating.schema.json");
  const carrier = utterance(mark("s"), mark("o"));
  const live = articulatingUtter(carrier);
  const articulatingSchema = loadSchema(schemaFile);
  const utterBranch = articulatingSchema.oneOf.find((branch) => branch.title === "ArticulatingUtter");
  const errors = validate(utterBranch, live, schemaFile);
  assert.deepEqual(errors, [
    "/structuralRegime: missing required property",
    "/dynamicalRegime: missing required property",
    "/utterance: expected array",
  ]);
});
