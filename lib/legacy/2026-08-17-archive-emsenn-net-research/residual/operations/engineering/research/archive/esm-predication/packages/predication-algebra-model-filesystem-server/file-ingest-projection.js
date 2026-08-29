/**
 * Inline projection at file-ingest time.
 *
 * The file-event reducer translates a single filesystem event into
 * substrate claims. With the blob bytes available via the content
 * hash, we run the format projector inline and emit one combined
 * message that carries:
 *
 *   - the unix-layer claims (is-a, extension, content-hash)
 *   - declares-subject when the projector coins a non-file subject
 *     (markdown/yaml basename convention)
 *   - the projector's content claims, attributed to the coined subject
 *
 * Everything in one reified message means everything has the same
 * provenance chain: each derived claim is reachable from the same
 * (messageId, asserts-claim, claimAddress) record. There is no
 * separate "enrich pass" walking the model later — that walk was
 * exactly the out-of-bounds query the architecture forbids.
 *
 * The reducer is a translator: it reads its own event payload (and
 * the blob bytes the payload points at), produces claims, and hands
 * them to messageBatch. It never reads the geometry.
 */

import path from "node:path";
import * as formatProjectors from "./format-projectors/index.js";

const BASENAME_SUBJECT_EXTENSIONS = new Set(["md", "markdown", "yaml", "yml"]);

function coinSubject(filePath, ext) {
  if (!BASENAME_SUBJECT_EXTENSIONS.has(ext)) return filePath;
  const slash = filePath.lastIndexOf("/");
  const base = slash >= 0 ? filePath.slice(slash + 1) : filePath;
  const dot = base.lastIndexOf(".");
  return dot > 0 ? base.slice(0, dot) : base;
}

function unixClaims(absPath, contentHash) {
  const ext = path.extname(absPath).replace(/^\./, "");
  return [
    { subject: absPath, predicate: "is-a",         object: "regular-file" },
    { subject: absPath, predicate: "extension",    object: ext },
    { subject: absPath, predicate: "content-hash", object: "sha256:" + contentHash },
  ];
}

/**
 * Build the full set of claims for a file ingest. Returns the merged
 * list (unix layer + projector output). Returns [] if the blob is
 * missing — same defensive behavior the reducer had before, but
 * keyed only on the event's own payload.
 */
function claimsForIngest(absPath, contentHash, context) {
  if (!context || !context.blobs) {
    throw new TypeError("file-ingest-projection requires context.blobs");
  }
  if (!context.blobs.hasBlob(context.root, contentHash)) return [];

  const claims = unixClaims(absPath, contentHash);
  const ext = (path.extname(absPath).replace(/^\./, "") || "").toLowerCase();

  if (!formatProjectors.HANDLED_EXTENSIONS.has(ext)) return claims;

  const text = context.blobs.getBlobText(context.root, contentHash);
  if (text == null) return claims;

  const subject = coinSubject(absPath, ext);
  if (subject !== absPath) {
    claims.push({ subject: absPath, predicate: "declares-subject", object: subject });
  }
  for (const c of formatProjectors.claimsFor(subject, text, ext)) {
    claims.push(c);
  }
  return claims;
}

export {
  claimsForIngest,
  coinSubject,
  unixClaims,
  BASENAME_SUBJECT_EXTENSIONS,
};
