/**
 * Triple-store manifest.
 *
 * A manifest is a content-addressed description of a point-in-time
 * view of the substrate's triples. It lists the segments that cover
 * each of the three index orderings (EAVT, AEVT, AVET), plus the
 * strings-segment that hydrates the intern table, plus metadata
 * (tripleCount, cutoffTimestamp).
 *
 * The manifest is itself a blob: JSON, content-addressed via
 * blob-store.putBlob. `kernel/checkpoint` events in the event log
 * carry a manifest's hash and nothing else — the manifest is the
 * durable, discoverable root.
 *
 * Structural sharing is why this works at scale: a transaction that
 * touches one predicate's fiber produces a new AEVT segment for that
 * predicate but leaves every other segment hash unchanged. The new
 * manifest is mostly-identical-hashes to the previous one. Old
 * manifests remain valid (their blobs still resolve) until a GC pass
 * removes unreachable segments.
 *
 * Format:
 *
 *   {
 *     v: 1,
 *     cutoffTimestamp: "2026-04-13T22:11:33.456Z",
 *     tripleCount: 263482,
 *     strings:  "<hash of the strings blob>",
 *     indexes: {
 *       eavt: [ { hash, count, first, last }, ... ],
 *       aevt: [ ... ],
 *       avet: [ ... ]
 *     },
 *     revision: 0,
 *     closureScope: { ... }
 *   }
 *
 * Each per-index `segments` array is sorted by the index's ordering
 * so binary search across segments is a lookup by [first, last] range.
 * For segment-count N and an index-wide query, the search is
 * O(log N) segments visited + O(log K) within each segment where K
 * is segment length.
 */

const MANIFEST_VERSION = 1;

function buildManifest({
  cutoffTimestamp,
  tripleCount,
  stringsHash,
  eavtSegments,
  aevtSegments,
  avetSegments,
  revision = 0,
  closureScope = {},
}) {
  return {
    v: MANIFEST_VERSION,
    cutoffTimestamp,
    tripleCount,
    strings: stringsHash,
    indexes: {
      eavt: eavtSegments,
      aevt: aevtSegments,
      avet: avetSegments,
    },
    revision,
    closureScope,
  };
}

function parseManifest(jsonText) {
  let m;
  try { m = JSON.parse(jsonText); }
  catch (err) { throw new Error(`manifest: invalid JSON: ${err.message}`); }
  if (m.v !== MANIFEST_VERSION) {
    throw new Error(`manifest: unsupported version ${m.v}`);
  }
  if (!m.indexes || !Array.isArray(m.indexes.eavt) ||
      !Array.isArray(m.indexes.aevt) || !Array.isArray(m.indexes.avet)) {
    throw new Error("manifest: missing index segment lists");
  }
  if (typeof m.strings !== "string") {
    throw new Error("manifest: missing strings hash");
  }
  return m;
}

// Locate the segment(s) within an index that could contain a key
// (or a key range). Returns an array of segment descriptors whose
// [first, last] range overlaps the query range. The segment list is
// assumed sorted by [first, last] (a property maintained by the
// transaction commit path).
//
// Bounds carry the sentinels -Infinity and +Infinity for "no bound"
// on a coordinate. keyCompare uses numeric comparison which handles
// Infinity natively.
//
// For a point query (s, p, o) on EAVT, pass the same key for both
// bounds. For a prefix scan (e.g. all claims with subject S), pass
// [S, -Infinity, -Infinity] and [S, +Infinity, +Infinity].
function segmentsOverlapping(segmentList, lowerKey, upperKey) {
  const result = [];
  for (const seg of segmentList) {
    if (keyCompare(seg.last, lowerKey) < 0) continue; // entirely below
    if (keyCompare(seg.first, upperKey) > 0) break;   // list is sorted; rest is above
    result.push(seg);
  }
  return result;
}

// Compare two 3-element keys lexicographically. Each element must be
// a number (integer, -Infinity, or +Infinity — NOT null/undefined).
function keyCompare(a, b) {
  for (let i = 0; i < 3; i++) {
    const av = a[i]; const bv = b[i];
    if (av === bv) continue;
    return av < bv ? -1 : 1;
  }
  return 0;
}

// Every blob hash this manifest references. Used by checkpoint-event
// validation (do all segments resolve?) and by GC (mark reachable).
function allHashes(manifest) {
  const hashes = [manifest.strings];
  for (const seg of manifest.indexes.eavt) hashes.push(seg.hash);
  for (const seg of manifest.indexes.aevt) hashes.push(seg.hash);
  for (const seg of manifest.indexes.avet) hashes.push(seg.hash);
  return hashes;
}

export {
  MANIFEST_VERSION,
  buildManifest,
  parseManifest,
  segmentsOverlapping,
  keyCompare,
  allHashes,
};
