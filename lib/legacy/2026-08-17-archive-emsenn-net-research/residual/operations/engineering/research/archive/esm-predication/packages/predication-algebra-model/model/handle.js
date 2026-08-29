/**
 * Model — the runtime handle over the persistent TripleStore.
 *
 * A Model is content-addressed state plus the transient scratch the
 * morphism cascade needs while it runs. State is immutable at rest
 * (a commit produces a new Model); during an operation the Model
 * carries a pending Transaction where assertions accumulate.
 *
 * Field list, reasoned:
 *
 *   store: TripleStore           durable content-addressed state
 *   tx:    Transaction | null    pending writes; null when at rest
 *   strings: InternTable         string ↔ integer-id lookup (shared
 *                                with the store — triples encode
 *                                interned ids, callers work in strings)
 *   morphismIndex                cache of active morphism
 *                                declarations keyed by declaration
 *                                key + by source predicate. Rebuilt
 *                                lazily or on explicit rebuild.
 *   closureScope                 runtime dispatch controls
 *                                (activeChannels, activePredicates,
 *                                maxDepth, postClosePhase)
 *   revision                     monotonic commit counter
 *   inferenceLog                 observability: derivations this
 *                                session (NOT persisted — ephemeral)
 *   provenance                   observability: per-claim ancestry
 *                                (NOT persisted — ephemeral)
 *
 * Notable absence compared to the prior geometry object: no
 * `triples` array, no `fibers`, no `dedupIndex`, no `contradictions`.
 * Reads go through `match()` which queries the store + tx. Dedup is
 * the transaction's responsibility (buffer map keyed by
 * sid,pid,oid). Contradictions are computed on demand from match
 * queries (analyzeContradictions is a view over live state, not a
 * cached table).
 */

import { InternTable } from "../intern-table.js";

const DEFAULT_CLOSURE_SCOPE = Object.freeze({
  activePredicates: null,
  activeChannels: null,
  maxDepth: null,
  postClosePhase: "eager",
});

function normalizeScope(scope) {
  if (!scope) scope = {};
  return {
    activePredicates: Array.isArray(scope.activePredicates)
      ? [...new Set(scope.activePredicates)]
      : null,
    activeChannels: Array.isArray(scope.activeChannels)
      ? [...new Set(scope.activeChannels)]
      : null,
    maxDepth: Number.isInteger(scope.maxDepth) && scope.maxDepth > 0
      ? scope.maxDepth
      : null,
    postClosePhase:
      scope.postClosePhase === "final" || scope.postClosePhase === "deferred"
        ? scope.postClosePhase
        : "eager",
    replay: scope.replay === true,
  };
}

class Model {
  constructor({
    store,
    tx = null,
    strings,
    morphismIndex = null,
    closureScope = null,
    revision = 0,
  }) {
    if (!store) throw new TypeError("Model: store is required");
    if (!strings) throw new TypeError("Model: strings (InternTable) is required");
    this.store = store;
    this.tx = tx;
    this.strings = strings;
    this.morphismIndex = morphismIndex || makeEmptyMorphismIndex();
    this.closureScope = normalizeScope(closureScope);
    this.revision = revision;
    // Ephemeral observability. Not persisted across commits — each
    // new Model starts with empty log/provenance. Callers wanting
    // persistent audit should go through the events log.
    this.inferenceLog = [];
    this.provenance = {};
  }

  /**
   * Ensure a pending transaction exists. Called by mutation paths
   * before adding claims. Returns the transaction.
   */
  _ensureTx() {
    if (!this.tx) this.tx = this.store.beginTransaction();
    return this.tx;
  }

  /**
   * Is there uncommitted state?
   */
  get dirty() {
    return this.tx != null && this.tx.size > 0;
  }

  get tripleCount() {
    return this.store.tripleCount + (this.tx ? this.tx.size : 0);
  }

  /**
   * Back-compat materialization of the full triples list. The old
   * geometry exposed `.triples` as an array; legacy callers and
   * several tests still expect it. This getter walks every segment
   * + tx buffer.
   *
   * Prefer `match(pattern)` for targeted reads — it uses the sorted
   * indexes. Only call `.triples` when you actually need every claim.
   */
  get triples() {
    const out = [];
    for (const c of this.match({})) out.push(c);
    return out;
  }

  /**
   * Pattern match against committed segments + in-flight tx buffer.
   * Pattern fields (sid, pid, oid) are either integer ids (from the
   * intern table) or null/undefined for wildcard. Returns a generator.
   */
  *match(pattern) {
    if (this.tx) {
      yield* this.tx.match(pattern);
      return;
    }
    yield* this.store.match(pattern);
  }

  /**
   * Materialize a match into an array. Use match() directly for
   * streaming; use matchAll() when the caller needs a sized result.
   */
  matchAll(pattern) {
    const out = [];
    for (const c of this.match(pattern)) out.push(c);
    return out;
  }

  /**
   * Add a single claim to the pending transaction. Does NOT run
   * cascade — callers go through model/assert.js (or pam.assert) for
   * cascade semantics. This is the raw put, used by the cascade itself
   * internally after it has decided to insert.
   *
   * The claim must already carry interned (integer) sid/pid/oid — the
   * cascade does the interning at its boundary.
   */
  putClaim(claim) {
    this._ensureTx().assert(claim);
  }

  /**
   * Commit the pending transaction and return a new Model pointing at
   * the new store. The morphism index and intern table carry over
   * (both are derived/stable and don't need rebuilding per commit).
   *
   * If there's no pending tx, returns a new Model with an unchanged
   * store but an incremented revision — useful for recording that
   * a logical transaction boundary passed even when no new claims
   * landed.
   */
  commit({ cutoffTimestamp } = {}) {
    if (this.tx) {
      this.store = this.tx.commit({ cutoffTimestamp });
      this.tx = null;
    }
    this.revision += 1;
    return this;
  }

  /**
   * Abandon any pending transaction without committing. Mutates in place.
   */
  abort() {
    this.tx = null;
    return this;
  }
}

function makeEmptyMorphismIndex() {
  return { declarations: new Map(), bySource: new Map() };
}

export {
  Model,
  DEFAULT_CLOSURE_SCOPE,
  normalizeScope,
  makeEmptyMorphismIndex,
};
