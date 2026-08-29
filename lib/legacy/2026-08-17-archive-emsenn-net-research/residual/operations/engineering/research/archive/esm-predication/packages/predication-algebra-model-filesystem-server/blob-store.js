/**
 * Content-addressed blob store.
 *
 * File bodies (and any other arbitrary-size content referenced by
 * events) live here, keyed by SHA-256 of their bytes. Layout on disk
 * follows git's loose-object pattern: the first two hex digits form
 * a subdirectory, the rest form the filename. Two blobs with
 * identical content share one file; there is no directory scan,
 * lookup is O(1) via the address.
 *
 * The store is immutable: putBlob is idempotent (writing the same
 * content twice is a no-op), and blobs are never modified once
 * written. Concurrent writes to the same blob path are safe because
 * identical content produces identical bytes.
 *
 * Garbage collection is a future tool. A blob is reachable if any
 * event in any channel references its hash; unreachable blobs can
 * be swept.
 *
 * Location on disk: <root>/.fars-store/blobs/<xx>/<rest>
 */

import fs from "node:fs";
import path from "node:path";
import crypto from "node:crypto";

const BLOBS_DIRNAME = "blobs";

function blobsRoot(root) {
  return path.join(root, ".fars-store", BLOBS_DIRNAME);
}

function hashOf(content) {
  const bytes = Buffer.isBuffer(content) ? content : Buffer.from(content, "utf8");
  return crypto.createHash("sha256").update(bytes).digest("hex");
}

function pathFor(root, hash) {
  if (typeof hash !== "string" || hash.length < 3) {
    throw new TypeError("invalid blob hash");
  }
  return path.join(blobsRoot(root), hash.slice(0, 2), hash.slice(2));
}

/**
 * Put a blob into the store. Returns the SHA-256 hash. Idempotent:
 * writing the same content twice is a no-op.
 */
function putBlob(root, content) {
  const hash = hashOf(content);
  const filePath = pathFor(root, hash);
  if (fs.existsSync(filePath)) return hash;
  const dir = path.dirname(filePath);
  fs.mkdirSync(dir, { recursive: true });
  const bytes = Buffer.isBuffer(content) ? content : Buffer.from(content, "utf8");
  fs.writeFileSync(filePath, bytes);
  return hash;
}

/**
 * Fetch a blob by hash. Returns a Buffer of the bytes, or null if
 * the blob isn't in the store. Callers who expect text should
 * `.toString("utf8")` the result.
 */
function getBlob(root, hash) {
  const filePath = pathFor(root, hash);
  if (!fs.existsSync(filePath)) return null;
  return fs.readFileSync(filePath);
}

function getBlobText(root, hash) {
  const buf = getBlob(root, hash);
  return buf == null ? null : buf.toString("utf8");
}

/**
 * Probe the store without fetching.
 */
function hasBlob(root, hash) {
  return fs.existsSync(pathFor(root, hash));
}

/**
 * Compute a blob's hash without writing it. Useful for diffing
 * against the store before deciding to put.
 */
function addressOf(content) {
  return hashOf(content);
}

export {
  BLOBS_DIRNAME,
  blobsRoot,
  pathFor,
  putBlob,
  getBlob,
  getBlobText,
  hasBlob,
  addressOf,
  hashOf,
};
