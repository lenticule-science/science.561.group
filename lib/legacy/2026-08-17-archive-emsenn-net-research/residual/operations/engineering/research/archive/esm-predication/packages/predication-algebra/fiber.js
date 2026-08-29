/**
 * Fibers — bilattice-valued maps from (subject, object) pairs to
 * values, indexed by predicate (paper §3.1).
 *
 * Two layers live in this file:
 *
 *   1. Geometry-side fiber records (createFiberRecord, settleGeometry,
 *      settleNode, fiberOf, updateEvidence). These build the indexed
 *      view that `infer()` walks during fixpoint settlement: each
 *      claim address is hashed into per-predicate, per-subject,
 *      per-object, and joint indexes; per-fiber valuations track
 *      raw and post-closed values.
 *
 *   2. Lightweight standalone fibers (createFiber, fiberFuse,
 *      fiberRestrict, fiberNeg, fiberInvert, fiberCompose, …). Plain
 *      objects with an `entries` map keyed by (subject, object).
 *      Functional operations return new fibers. Used by rule and
 *      tool code that wants to manipulate a single predicate fiber
 *      without going through a full PAM model.
 */

import {
  NONE, POST_CLOSURE_VALUES, postClose, closedValueOf,
  knowledgeJoin, knowledgeMeet,
  fuse as fuseValue, restrict as restrictValue,
  negate,
  nelsonImply as nelsonImplyValue, nelsonFuse as nelsonFuseValue
} from "./bilattice.js";
import { addressOf } from "./content-address.js";

// Two-level Map lookup for compound fiber indexes. No size cap — works
// for any number of interned values. Returns the inner array or undefined.
function compoundGet(index, a, b) {
  const inner = index.get(a);
  return inner ? inner.get(b) : undefined;
}

// Two-level Map insert for compound fiber indexes.
function compoundInsert(index, a, b, cid) {
  let inner = index.get(a);
  if (!inner) { inner = new Map(); index.set(a, inner); }
  let arr = inner.get(b);
  if (!arr) { arr = []; inner.set(b, arr); }
  arr.push(cid);
}

function createFiberRecord(claim) {
  return {
    pid: claim.pid,
    claims: [],
  };
}

function insertIndex(index, key, cid) {
  let arr = index.get(key);
  if (!arr) { arr = []; index.set(key, arr); }
  arr.push(cid);
}

function settleGeometry(geometry, scope) {
  // Settle from triples if available, otherwise from legacy claims{}.
  const sourceTriples = geometry.triples && geometry.triples.length > 0
    ? geometry.triples.filter(Boolean)
    : Object.values(geometry.claims || {});
  const claims = sourceTriples.sort((a, b) => {
    // Deterministic ordering by (sid, pid, oid) or address fallback.
    if (a.sid != null && b.sid != null) {
      return (a.sid - b.sid) || (a.pid - b.pid) || (a.oid - b.oid);
    }
    return (a.address || "").localeCompare(b.address || "");
  });

  const byPredicate = new Map();
  const predicateIndex = new Map();
  const bySubject = new Map();
  const byObject = new Map();
  const bySubjectPredicate = new Map();
  const byPredicateObject = new Map();
  const bySubjectObject = new Map();

  // Rebuild the claims list (integer-indexed for compact fiber references).
  const claimsList = [];

  for (const claim of claims) {
    const cid = claimsList.length;
    claimsList.push(claim);

    const closedValue = closedValueOf(claim.value, scope);

    insertIndex(bySubject, claim.sid, cid);
    insertIndex(predicateIndex, claim.pid, cid);
    insertIndex(byObject, claim.oid, cid);
    compoundInsert(bySubjectPredicate, claim.sid, claim.pid, cid);
    compoundInsert(byPredicateObject, claim.pid, claim.oid, cid);
    compoundInsert(bySubjectObject, claim.sid, claim.oid, cid);

    if (!byPredicate.has(claim.pid)) {
      byPredicate.set(claim.pid, createFiberRecord(claim));
    }

    const fiber = byPredicate.get(claim.pid);
    fiber.claims.push(cid);
  }

  for (const fiber of byPredicate.values()) {
    fiber.claims.sort((a, b) => a - b);
  }

  geometry.triples = claimsList;
  // Rebuild the dedup index from the settled triples.
  geometry.dedupIndex = new Map();
  for (let i = 0; i < claimsList.length; i++) {
    const t = claimsList[i];
    if (t) geometry.dedupIndex.set(`${t.sid},${t.pid},${t.oid}`, i);
  }
  geometry.fibers = {
    byPredicate,
    predicateIndex,
    bySubject,
    byObject,
    bySubjectPredicate,
    byPredicateObject,
    bySubjectObject
  };

  return geometry;
}

function fiberOf(model, predicate) {
  const pid = model.strings ? model.strings.intern(predicate) : addressOf(predicate);
  const fiber = model.fibers && model.fibers.byPredicate && model.fibers.byPredicate.get(pid);
  if (!fiber) return null;
  // Compute derived arrays on demand from the triples store.
  const triples = model.triples;
  fiber.closedValues = fiber.claims.map((cid) => {
    const t = triples[cid];
    return t ? postClose(t.value) : "none";
  });
  fiber.rawValues = fiber.claims.map((cid) => {
    const t = triples[cid];
    return t ? t.value : "none";
  });
  fiber.closed = fiber.closedValues.every((v) => POST_CLOSURE_VALUES.includes(v));
  return fiber;
}

function updateEvidence(geometry, claim) {
  if (claim.sid == null && geometry.strings) {
    claim.sid = geometry.strings.intern(claim.subject);
    claim.pid = geometry.strings.intern(claim.predicate);
    claim.oid = geometry.strings.intern(claim.object);
  }
  const dedupKey = claim.dedupKey || `${claim.sid},${claim.pid},${claim.oid}`;
  const existingIdx = geometry.dedupIndex ? geometry.dedupIndex.get(dedupKey) : undefined;
  const existing = existingIdx != null ? geometry.triples[existingIdx] : undefined;

  if (existing) {
    geometry.triples[existingIdx] = {
      sid: existing.sid, pid: existing.pid, oid: existing.oid,
      value: knowledgeJoin(existing.value, claim.value),
    };
  } else {
    const cid = geometry.triples.length;
    claim._cid = cid;
    geometry.triples.push(claim);
    if (geometry.dedupIndex) geometry.dedupIndex.set(dedupKey, cid);
  }

  return geometry;
}

// Initialize the fibers/nodes/contradictions sub-structures on a fresh
// or empty geometry so the incremental insertion path can index into
// them directly. settleGeometry produces these on a full rebuild;
// ensureFibers produces them lazily so assertOne can run on a model
// that has never been settled.
function ensureFibers(geometry) {
  if (!geometry.triples) geometry.triples = [];
  if (!geometry.dedupIndex) geometry.dedupIndex = new Map();
  if (!Array.isArray(geometry.inferenceLog)) geometry.inferenceLog = [];
  if (!geometry.fibers || !geometry.fibers.byPredicate) {
    geometry.fibers = {
      byPredicate: new Map(),
      predicateIndex: new Map(),
      bySubject: new Map(),
      byObject: new Map(),
      bySubjectPredicate: new Map(),
      byPredicateObject: new Map(),
      bySubjectObject: new Map()
    };
  }
  if (!geometry.contradictions) {
    geometry.contradictions = {
      concentrations: [],
      aggregates: [],
      counts: { total: 0, aggregates: 0, byPredicate: {}, bySubject: {}, byObject: {} },
      propagated: [],
      amplified: []
    };
  }
}

// Incrementally add or strengthen one claim in the geometry. Returns
// { changed, oldValue, newValue } where `changed` is true iff the cell
// at (claim.subject, claim.predicate, claim.object) strictly increased
// in the knowledge order ≤_k. The geometry is mutated in place: the
// claim is recorded, the node is computed, all six fiber indexes are
// updated, the affected fiber's valuation entries are refreshed, and
// the contradictions table is updated if a new ⊤ cell appeared.
//
// This is the primitive the wavefront procedure recurses on. It does
// NOT run morphism dispatch — that lives in functor.js. assertOne is
// purely the local data-structure update for one claim.
//
// The redundancy check (returning changed:false when the existing
// value already dominates the new value in ≤_k) is what bounds
// wavefront recursion to a finite depth: each cell can transition
// at most three times (⊥ → t/f → ⊤) before further assertions are
// no-ops, and the wavefront stops at the first no-op along any path.
function assertOne(geometry, claim, scope) {
  ensureFibers(geometry);

  const dedupKey = claim.dedupKey || `${claim.sid},${claim.pid},${claim.oid}`;
  const existingIdx = geometry.dedupIndex.get(dedupKey);
  const existingClaim = existingIdx != null ? geometry.triples[existingIdx] : undefined;

  let mergedValue;
  let cid;
  if (existingClaim) {
    mergedValue = knowledgeJoin(existingClaim.value, claim.value);
    if (mergedValue === existingClaim.value) {
      return { changed: false, oldValue: existingClaim.value, newValue: existingClaim.value };
    }
    cid = existingIdx;
    // The algebra: only the value changes. The triple identity (sid,pid,oid)
    // is immutable.
    geometry.triples[cid] = { sid: existingClaim.sid, pid: existingClaim.pid, oid: existingClaim.oid, value: mergedValue };
  } else {
    cid = geometry.triples.length;
    // Store only the algebra fields.
    geometry.triples.push({ sid: claim.sid, pid: claim.pid, oid: claim.oid, value: claim.value });
    geometry.dedupIndex.set(dedupKey, cid);
    mergedValue = claim.value;
  }

  const updatedClaim = geometry.triples[cid];
  const oldClosedValue = existingClaim
    ? closedValueOf(existingClaim.value, scope)
    : null;
  const newClosedValue = closedValueOf(mergedValue, scope);

  if (!existingClaim) {
    insertIndex(geometry.fibers.bySubject, claim.sid, cid);
    insertIndex(geometry.fibers.predicateIndex, claim.pid, cid);
    insertIndex(geometry.fibers.byObject, claim.oid, cid);
    compoundInsert(geometry.fibers.bySubjectPredicate, claim.sid, claim.pid, cid);
    compoundInsert(geometry.fibers.byPredicateObject, claim.pid, claim.oid, cid);
    compoundInsert(geometry.fibers.bySubjectObject, claim.sid, claim.oid, cid);

    if (!geometry.fibers.byPredicate.has(claim.pid)) {
      geometry.fibers.byPredicate.set(claim.pid, createFiberRecord(claim));
    }
    const fiber = geometry.fibers.byPredicate.get(claim.pid);
    fiber.claims.push(cid);
  }

  // Maintain the contradictions table incrementally. By monotonicity
  // of ≤_k under joining, a cell that became "both" stays "both" until
  // explicitly retracted, so we only need to handle the upward
  // transition: oldClosedValue !== "both" → newClosedValue === "both".
  if (newClosedValue === "both" && oldClosedValue !== "both") {
    const tab = geometry.contradictions;
    const s = geometry.strings;
    const subj = s.value(updatedClaim.sid);
    const pred = s.value(updatedClaim.pid);
    const obj = s.value(updatedClaim.oid);
    tab.concentrations.push({
      tripleIdx: cid,
      subject: subj,
      predicate: pred,
      object: obj,
      rawValue: mergedValue,
      closedValue: newClosedValue
    });
    tab.counts.total += 1;
    tab.counts.byPredicate[pred] = (tab.counts.byPredicate[pred] || 0) + 1;
    tab.counts.bySubject[subj] = (tab.counts.bySubject[subj] || 0) + 1;
    tab.counts.byObject[obj] = (tab.counts.byObject[obj] || 0) + 1;
  }

  return {
    changed: true,
    oldValue: existingClaim ? existingClaim.value : null,
    newValue: mergedValue
  };
}

// === Standalone fiber algebra ===
//
// A fiber is a (subject, object) → bilattice value map for a fixed
// predicate, kept as a plain object so it serializes trivially. The
// operations below are the standalone analogues of the geometry-side
// settlement layer above: they let callers compose, invert, and
// negate fibers without constructing a full PAM model.

function createFiber(predicate, entries) {
  return { predicate, entries: entries || {} };
}

function emptyFiber(predicate) {
  return createFiber(predicate, {});
}

function fiberKey(subject, object) {
  return `${subject}\0${object}`;
}

function parseFiberKey(key) {
  const i = key.indexOf("\0");
  return { subject: key.slice(0, i), object: key.slice(i + 1) };
}

function fiberGet(fiber, subject, object) {
  return fiber.entries[fiberKey(subject, object)] || "none";
}

function fiberSet(fiber, subject, object, value) {
  const entries = { ...fiber.entries };
  entries[fiberKey(subject, object)] = value;
  return createFiber(fiber.predicate, entries);
}

function fiberAssert(fiber, subject, object, value) {
  const key = fiberKey(subject, object);
  const existing = fiber.entries[key] || "none";
  const merged = knowledgeJoin(existing, value);
  const entries = { ...fiber.entries };
  entries[key] = merged;
  return createFiber(fiber.predicate, entries);
}

function fiberRelabel(fiber, newPredicate) {
  return createFiber(newPredicate, { ...fiber.entries });
}

function fiberClaims(fiber) {
  const result = [];
  for (const [key, value] of Object.entries(fiber.entries)) {
    const { subject, object } = parseFiberKey(key);
    result.push({ subject, predicate: fiber.predicate, object, value });
  }
  return result;
}

function fiberSize(fiber) {
  return Object.keys(fiber.entries).length;
}

function fiberEq(a, b) {
  const keysA = Object.keys(a.entries).sort();
  const keysB = Object.keys(b.entries).sort();
  if (keysA.length !== keysB.length) return false;
  for (let i = 0; i < keysA.length; i++) {
    if (keysA[i] !== keysB[i]) return false;
    if (a.entries[keysA[i]] !== b.entries[keysB[i]]) return false;
  }
  return true;
}

function fiberPointwise(a, b, op) {
  const entries = {};
  const allKeys = new Set([...Object.keys(a.entries), ...Object.keys(b.entries)]);
  for (const key of allKeys) {
    const va = a.entries[key] || "none";
    const vb = b.entries[key] || "none";
    entries[key] = op(va, vb);
  }
  return createFiber(a.predicate, entries);
}

function fiberFuse(a, b) {
  return fiberPointwise(a, b, fuseValue);
}

function fiberRestrict(a, b) {
  return fiberPointwise(a, b, restrictValue);
}

function fiberNeg(fiber) {
  const entries = {};
  for (const [key, value] of Object.entries(fiber.entries)) {
    entries[key] = negate(value);
  }
  return createFiber(fiber.predicate, entries);
}

function fiberInvert(fiber, newPredicate) {
  const entries = {};
  for (const [key, value] of Object.entries(fiber.entries)) {
    const { subject, object } = parseFiberKey(key);
    entries[fiberKey(object, subject)] = negate(value);
  }
  return createFiber(newPredicate || fiber.predicate, entries);
}

function fiberNelsonImply(a, b) {
  return fiberPointwise(a, b, nelsonImplyValue);
}

function fiberNelsonFuse(a, b) {
  return fiberPointwise(a, b, nelsonFuseValue);
}

function fiberCompose(a, b, newPredicate) {
  const entries = {};
  const aClaims = fiberClaims(a);
  for (const ac of aClaims) {
    if (ac.value === "none") continue;
    const bClaims = fiberClaims(b);
    for (const bc of bClaims) {
      if (bc.value === "none") continue;
      if (ac.object !== bc.subject) continue;
      const key = fiberKey(ac.subject, bc.object);
      const combined = knowledgeMeet(ac.value, bc.value);
      const existing = entries[key];
      entries[key] = existing ? knowledgeJoin(existing, combined) : combined;
    }
  }
  return createFiber(newPredicate || a.predicate, entries);
}

/**
 * Extract a standalone fiber for one predicate from a settled
 * geometry. Bridges the geometry-side and standalone layers when a
 * caller has a full PAM model but wants the lightweight fiber shape.
 */
function fiberFromGeometry(model, predicate) {
  const geoFiber = fiberOf(model, predicate);
  if (!geoFiber) return null;
  const entries = {};
  const s = model.strings;
  for (const cid of geoFiber.claims) {
    const t = model.triples ? model.triples[cid] : null;
    if (t) {
      entries[fiberKey(s.value(t.sid), s.value(t.oid))] = postClose(t.value);
    }
  }
  return createFiber(predicate, entries);
}

export {
  createFiberRecord, insertIndex,
  settleGeometry, fiberOf, updateEvidence,
  ensureFibers, assertOne,
  createFiber, emptyFiber, fiberKey, parseFiberKey,
  fiberGet, fiberSet, fiberAssert, fiberRelabel,
  fiberClaims, fiberSize, fiberEq,
  fiberFuse, fiberRestrict, fiberNelsonImply, fiberNelsonFuse,
  fiberNeg, fiberInvert, fiberCompose,
  fiberFromGeometry,
  compoundGet, compoundInsert
};
