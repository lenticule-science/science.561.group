/**
 * Immutable sorted triple segment.
 *
 * A segment is a sorted run of triples, stored as a content-addressed
 * blob in the existing `blobs/` store. The segment's content hash IS
 * its identity. Two segments with the same triples in the same order
 * produce the same hash; the blob store deduplicates.
 *
 * Sort order is external to the segment: the caller decides whether
 * a segment is sorted by EAVT, AEVT, or AVET, and the manifest that
 * references the segment carries the order tag plus the key range
 * (first/last key) so readers know what to expect without opening
 * the blob.
 *
 * The on-disk format is framed JSONL:
 *
 *   line 0: JSON header — { v: 1, kind: "triples", order: "eavt",
 *                           count: N, first: [..], last: [..] }
 *   lines 1..N: one triple per line — JSON array [sid, pid, oid, value]
 *
 * JSONL was chosen over a more compact format because (a) debuggability
 * matters at this layer — humans will look inside segments during
 * incident response — and (b) line-oriented chunking gives streaming
 * reads without a full parser state machine. A compact binary format
 * is a v2 concern that the manifest can carry as an encoding tag.
 *
 * Streaming reads: `*streamTriples(segmentText)` yields triples one
 * at a time without materializing the whole array. Used by queries
 * that scan a segment partially (e.g., binary-search to a key, then
 * iterate forward until the key no longer matches).
 */

const SEGMENT_VERSION = 1;

// Order keys. Each value is the field-indexing order: which field to
// compare first, then second, then third. The fourth (bilattice value)
// is never the primary key; it's value data, not identity.
const ORDER_EAVT = "eavt"; // (sid, pid, oid)
const ORDER_AEVT = "aevt"; // (pid, sid, oid)
const ORDER_AVET = "avet"; // (pid, oid, sid)

const ORDER_FIELDS = {
  [ORDER_EAVT]: ["sid", "pid", "oid"],
  [ORDER_AEVT]: ["pid", "sid", "oid"],
  [ORDER_AVET]: ["pid", "oid", "sid"],
};

// A triple in storage form is a 4-tuple [sid, pid, oid, value]. We
// normalize to/from the object shape `{sid, pid, oid, value}` used by
// the rest of the engine at the segment boundary.

function tripleToTuple(t) {
  return [t.sid, t.pid, t.oid, t.value];
}

function tupleToTriple(u) {
  return { sid: u[0], pid: u[1], oid: u[2], value: u[3] };
}

// Comparator on stored tuples for a given order. Returns -1, 0, +1
// by the order's field sequence. Values of identical key are a tie —
// readers treating a segment as sorted by key must handle multiple
// entries at the same key themselves.
function compareKey(order, a, b) {
  const fields = ORDER_FIELDS[order];
  if (!fields) throw new TypeError(`unknown order: ${order}`);
  for (const f of fields) {
    const ia = f === "sid" ? 0 : f === "pid" ? 1 : 2;
    const av = a[ia]; const bv = b[ia];
    if (av < bv) return -1;
    if (av > bv) return 1;
  }
  return 0;
}

function sortTuplesInPlace(tuples, order) {
  tuples.sort((a, b) => compareKey(order, a, b));
  return tuples;
}

// Extract the key portion of a tuple for the given order — a 3-integer
// array (since all three are intern-table ids) suitable for storing
// in the manifest's first/last slots.
function keyOf(order, tuple) {
  const fields = ORDER_FIELDS[order];
  return fields.map((f) => tuple[f === "sid" ? 0 : f === "pid" ? 1 : 2]);
}

// Build segment text from a sorted tuple array. Writer does NOT sort —
// caller must provide sorted input. (Sorting lives separately so bulk
// builds can sort once across many segments rather than per-segment.)
function buildSegmentText(tuples, order) {
  if (tuples.length === 0) {
    throw new TypeError("buildSegmentText: refusing to build empty segment");
  }
  const header = {
    v: SEGMENT_VERSION,
    kind: "triples",
    order,
    count: tuples.length,
    first: keyOf(order, tuples[0]),
    last: keyOf(order, tuples[tuples.length - 1]),
  };
  const lines = [JSON.stringify(header)];
  for (const t of tuples) lines.push(JSON.stringify(t));
  return lines.join("\n") + "\n";
}

// Parse a segment's header without parsing any triples. Cheap — reads
// the first line only. Returns {v, kind, order, count, first, last}.
function readHeader(segmentText) {
  const nl = segmentText.indexOf("\n");
  if (nl === -1) throw new Error("segment: missing newline after header");
  const headerLine = segmentText.slice(0, nl);
  let header;
  try { header = JSON.parse(headerLine); }
  catch (err) { throw new Error(`segment: invalid header: ${err.message}`); }
  if (header.v !== SEGMENT_VERSION) {
    throw new Error(`segment: unsupported version ${header.v}`);
  }
  if (header.kind !== "triples") {
    throw new Error(`segment: unexpected kind ${header.kind}`);
  }
  if (!ORDER_FIELDS[header.order]) {
    throw new Error(`segment: unknown order ${header.order}`);
  }
  return header;
}

// Parse a whole segment into { header, tuples }. Uses a single large
// JSON allocation per line but each line's parsed object is small and
// can be GC'd after iteration if the caller iterates rather than
// materializing an array.
function readSegment(segmentText) {
  const header = readHeader(segmentText);
  const tuples = new Array(header.count);
  const firstNl = segmentText.indexOf("\n");
  let start = firstNl + 1;
  let idx = 0;
  while (start < segmentText.length) {
    const nl = segmentText.indexOf("\n", start);
    const end = nl === -1 ? segmentText.length : nl;
    const line = segmentText.slice(start, end);
    start = end + 1;
    if (!line) continue;
    tuples[idx++] = JSON.parse(line);
  }
  if (idx !== header.count) {
    throw new Error(`segment: expected ${header.count} tuples, got ${idx}`);
  }
  return { header, tuples };
}

// Stream tuples one at a time. Generator-based; each tuple is parsed
// on demand and can be discarded after yield. Useful for scans that
// don't need the whole segment in memory at once.
function* streamTuples(segmentText) {
  const firstNl = segmentText.indexOf("\n");
  if (firstNl === -1) return;
  let start = firstNl + 1;
  while (start < segmentText.length) {
    const nl = segmentText.indexOf("\n", start);
    const end = nl === -1 ? segmentText.length : nl;
    const line = segmentText.slice(start, end);
    start = end + 1;
    if (!line) continue;
    yield JSON.parse(line);
  }
}

// Binary search for the first tuple index i such that
// compareKey(order, tuples[i], target) >= 0. Returns tuples.length if
// no such index exists. `target` is a 3-integer key (or partial — any
// missing trailing fields count as 0 for the lower bound).
function lowerBound(tuples, order, targetKey) {
  const padded = [
    targetKey[0] == null ? -Infinity : targetKey[0],
    targetKey[1] == null ? -Infinity : targetKey[1],
    targetKey[2] == null ? -Infinity : targetKey[2],
  ];
  const fields = ORDER_FIELDS[order];
  let lo = 0; let hi = tuples.length;
  while (lo < hi) {
    const mid = (lo + hi) >>> 1;
    const t = tuples[mid];
    let cmp = 0;
    for (let i = 0; i < 3; i++) {
      const f = fields[i];
      const ix = f === "sid" ? 0 : f === "pid" ? 1 : 2;
      const tv = t[ix]; const pv = padded[i];
      if (pv === -Infinity) { cmp = 0; continue; }
      if (tv < pv) { cmp = -1; break; }
      if (tv > pv) { cmp = 1; break; }
      cmp = 0;
    }
    if (cmp < 0) lo = mid + 1;
    else hi = mid;
  }
  return lo;
}

// Merge two sorted tuple streams into one, deduplicating by (order
// key) and keeping the LATEST value on duplicates. Latest is defined
// by caller: the `right` stream's tuples win over `left` on key tie.
//
// Used by transaction commit: `left` is existing sorted data, `right`
// is the new transaction's sorted additions. The commit produces the
// post-transaction sorted run.
function* mergeStreams(leftIter, rightIter, order) {
  let L = leftIter.next();
  let R = rightIter.next();
  while (!L.done && !R.done) {
    const cmp = compareKey(order, L.value, R.value);
    if (cmp < 0) { yield L.value; L = leftIter.next(); }
    else if (cmp > 0) { yield R.value; R = rightIter.next(); }
    else { yield R.value; L = leftIter.next(); R = rightIter.next(); } // tie: right wins
  }
  while (!L.done) { yield L.value; L = leftIter.next(); }
  while (!R.done) { yield R.value; R = rightIter.next(); }
}

export {
  SEGMENT_VERSION,
  ORDER_EAVT,
  ORDER_AEVT,
  ORDER_AVET,
  ORDER_FIELDS,
  tripleToTuple,
  tupleToTriple,
  compareKey,
  sortTuplesInPlace,
  keyOf,
  buildSegmentText,
  readHeader,
  readSegment,
  streamTuples,
  lowerBound,
  mergeStreams,
};
