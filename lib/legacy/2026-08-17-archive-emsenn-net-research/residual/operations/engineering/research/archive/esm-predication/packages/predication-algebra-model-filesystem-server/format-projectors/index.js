/**
 * Format projectors — lawful retraction pairs between file bytes and claims.
 *
 * Each format (markdown, yaml, json, jsonl, javascript) is a pure
 * adjoint pair (extract, create):
 *
 *   extract : Bytes → Claims    (the per-format `claimsFor`)
 *   create  : Claims → Bytes    (round-trips via the counit law)
 *
 * The counit law — `extract ∘ create = id_Claims` — is verified by the
 * `*.create: counit law` tests. The pair is idempotent on the claim
 * image: `extract ∘ create ∘ extract = extract`. This is the precise
 * sense in which these modules are *projectors* between the arbitrary
 * byte-space of a file and the claim-subspace that the inference model
 * sees. Bytes not in the projector's image (e.g. formatting whitespace,
 * comments, keys the vocabulary doesn't recognize) are projected away;
 * what remains round-trips exactly.
 *
 * Each format projector also declares its vocabulary — the predicates
 * it uses for its claims — via `vocabulary` and `vocabularyClaims`. The
 * vocabulary names the image of the projector inside the claim algebra.
 *
 * This module is pure: no I/O, no model mutation, no event emission.
 * The compound projector that composes these atomics with the blob
 * store, filesystem, and event log lives one level up in
 * ../format-projection.js.
 *
 * Public API:
 *
 *   markdown, yaml, json, jsonl, javascript
 *     The individual format projectors. Each exports `vocabulary`,
 *     `vocabularyClaims`, `parse(text)`, `claimsFor(subject, text)`
 *     (the extract direction), and a `projector` field exposing the
 *     full retraction pair with create/section write-back operations.
 *
 *   claimsFor(subject, contentText, extension)
 *     Pure dispatch by extension. Markdown files with YAML frontmatter
 *     compose two projectors; standalone YAML uses the yaml projector;
 *     unknown extensions project to [].
 *
 *   vocabularyClaims
 *     The union of every format projector's vocabulary claims.
 *
 *   HANDLED_EXTENSIONS
 *     The set of extensions with an atomic projector.
 *
 *   PROJECTORS, projectorFor(extension)
 *     Registry of per-extension retraction pairs, for callers that
 *     want the full atomic projector (e.g. the compound create
 *     direction that projects model state back to source files).
 */

import * as markdown from "./markdown.js";
import * as yaml from "./yaml.js";
import * as json from "./json.js";
import * as jsonl from "./jsonl.js";
import * as javascript from "./javascript.js";

const vocabularyClaims = [
  ...markdown.vocabularyClaims,
  ...yaml.vocabularyClaims,
  ...json.vocabularyClaims,
  ...jsonl.vocabularyClaims,
  ...javascript.vocabularyClaims,
];

const HANDLED_EXTENSIONS = new Set([
  "md", "markdown",
  "yaml", "yml",
  "json",
  "jsonl", "ndjson",
  "js", "cjs", "mjs",
]);

function claimsFor(subject, contentText, extension) {
  if (typeof contentText !== "string") return [];
  const ext = (extension || "").toLowerCase();
  const claims = [];

  if (ext === "md" || ext === "markdown") {
    const parsed = markdown.parse(contentText);
    if (parsed.hasFrontmatter) {
      // Use markdown.frontmatterClaims (not yaml.claimsFor) so nested
      // mappings get interpreted as nested-subject claims rather than
      // dot-notation predicates flattened against the file subject.
      claims.push(...markdown.frontmatterClaims(subject, parsed.frontmatter));
    }
  } else if (ext === "yaml" || ext === "yml") {
    claims.push(...yaml.claimsFor(subject, contentText));
  } else if (ext === "json") {
    claims.push(...json.claimsFor(subject, contentText));
  } else if (ext === "jsonl" || ext === "ndjson") {
    claims.push(...jsonl.claimsFor(subject, contentText));
  } else if (ext === "js" || ext === "cjs" || ext === "mjs") {
    claims.push(...javascript.claimsFor(subject, contentText));
  }

  return claims;
}

const PROJECTORS = {
  md:        markdown.projector,
  markdown:  markdown.projector,
  yaml:      yaml.projector,
  yml:       yaml.projector,
  json:      json.projector,
  jsonl:     jsonl.projector,
  ndjson:    jsonl.projector,
  js:        javascript.projector,
  cjs:       javascript.projector,
  mjs:       javascript.projector,
};

function projectorFor(extension) {
  return PROJECTORS[(extension || "").toLowerCase()] || null;
}

export {
  markdown,
  yaml,
  json,
  jsonl,
  javascript,
  claimsFor,
  vocabularyClaims,
  HANDLED_EXTENSIONS,
  PROJECTORS,
  projectorFor,
};
