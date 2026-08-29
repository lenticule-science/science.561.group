/**
 * Wavefront cascade for Model-backed runtime.
 *
 * The cascade is the engine's inference primitive: when a new claim
 * arrives, insert it into the pending transaction, then propagate
 * morphism derivations until no new claims change any cell's ≤_k
 * value. Termination is guaranteed because each cell can only rise
 * in the 3-value post-closure order (⊥ → t/f → ⊤), so at most
 * 3 × |cells| changes can occur.
 *
 * The wavefront has two steps per insertion:
 *
 *   1. Declaration registration. If the new claim's predicate is a
 *      morphism's TRIGGER_PREDICATE, ask the morphism to parse a
 *      (possibly newly-completed) declaration. For each newly-
 *      registered declaration, apply it globally against the current
 *      source-fiber claims (via Model.match), recursively asserting
 *      each contribution.
 *
 *   2. Per-claim dispatch. For each active declaration whose source
 *      predicate matches the new claim's predicate, call the module's
 *      applyForClaim to derive contributions, recursively asserting
 *      each one.
 *
 * The redundancy check lives in Transaction.assert: on a duplicate
 * (sid,pid,oid) the tx knowledge-joins with the current value (from
 * buffer or store), and returns changed=false when the join is a
 * no-op. The wavefront stops recursing at the first no-op on any
 * path.
 */

import {
  parseDeclarationsForClaim,
  dispatchClaim,
  applyDeclarationGlobally,
  ensureMorphismIndex,
} from "./dispatch.js";

/**
 * Insert one claim into the model and propagate morphism derivations
 * to fixpoint along this arm of the wavefront. Returns the list of
 * derived claims (for logging / provenance), NOT including the input
 * claim.
 *
 * `model` is the Model handle. The claim is inserted into model's
 * pending transaction (created lazily). No commit happens here; the
 * caller (pam.assert, pam.messageBatch) decides when to commit.
 *
 * `scope` is the closureScope controlling dispatch. Falls back to
 * model.closureScope when omitted.
 */
function cascade(model, claim, scope, derivedLog) {
  if (!derivedLog) derivedLog = [];
  const effectiveScope = scope || model.closureScope;
  ensureMorphismIndex(model);

  // Insert with knowledge-join-on-duplicate. If the cell doesn't
  // strictly increase in ≤_k, the wavefront stops here.
  const tx = model._ensureTx();
  const result = tx.assert(claim);
  if (!result.changed) return derivedLog;

  // Observability: non-replay mode records the insertion in
  // model.inferenceLog.
  if (!effectiveScope || !effectiveScope.replay) {
    model.inferenceLog.push({
      subject: model.strings.value(claim.sid),
      predicate: model.strings.value(claim.pid),
      object: model.strings.value(claim.oid),
      value: result.newValue,
    });
  }

  // Step 1: declaration registration. When structural claims arrive
  // they may complete a morphism declaration; applying that new
  // declaration globally produces contributions from every existing
  // source claim.
  const newlyAdded = parseDeclarationsForClaim(model, claim);
  for (const entry of newlyAdded) {
    const contributions = applyDeclarationGlobally(model, entry);
    for (const contribution of contributions) {
      recordProvenance(model, contribution, [claim]);
      derivedLog.push(contribution);
      cascade(model, contribution, effectiveScope, derivedLog);
    }
  }

  // Step 2: per-claim dispatch. Morphisms whose source includes this
  // claim's predicate derive contributions from this single new claim.
  const perClaimContribs = dispatchClaim(model, claim);
  for (const contribution of perClaimContribs) {
    recordProvenance(model, contribution, [claim]);
    derivedLog.push(contribution);
    cascade(model, contribution, effectiveScope, derivedLog);
  }

  return derivedLog;
}

// Record a derivation in model.provenance. Picks a morphism name from
// the contribution's _ancestry Set (entries are "<morphismName>\u0000...").
function recordProvenance(model, contribution, sources) {
  const dk = `${contribution.sid},${contribution.pid},${contribution.oid}`;
  let morphismName = null;
  if (contribution._ancestry) {
    for (const k of contribution._ancestry) {
      const idx = k.indexOf("\u0000");
      if (idx > 0) { morphismName = k.slice(0, idx); break; }
    }
  }
  model.provenance[dk] = {
    mode: "derived",
    morphism: morphismName,
    sources: sources.map((c) => `${c.sid},${c.pid},${c.oid}`),
  };
}

export {
  cascade,
};
