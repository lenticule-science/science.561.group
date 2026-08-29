/**
 * messageBatch — the lawful batch input primitive.
 *
 * Per principle 3, every claim that enters the substrate arrives
 * inside a reified message: a sender, a content-addressed message id,
 * identity claims, message-record claims, and asserts-claim/claim-*
 * introspection claims that make each user assertion's SPO recoverable
 * from the geometry alone. `pam.reify` builds the reified shape;
 * `messageBatch` is what asserts it.
 *
 * messageBatch asserts all claims into a single Transaction on the
 * provided Model, runs the morphism cascade on each, then commits
 * once at the end. Returns a new Model alongside the bookkeeping
 * output (accepted claims, newly-introduced contradictions, derived
 * addresses).
 *
 * Insertion order:
 *
 *   1. identityClaims  (sender identifying pairs — fresh content-
 *                       addressed subject, cannot conflict)
 *   2. messageClaims   (message record + asserts-claim/claim-*
 *                       introspection — fresh subjects, cannot
 *                       conflict)
 *   3. assertedClaims  (user payload — these can conflict, and any
 *                       new contradictions are diffed and reported)
 *
 * Returns:
 *
 *   {
 *     model             the post-assertion Model (new handle; caller
 *                       should replace any reference to the input one)
 *     senderId          echoed from reified
 *     messageId         echoed from reified
 *     accepted          [{ claim }] for each assertedClaim
 *     newConcentrations cell-level ⊤ that wasn't there before
 *     newAggregates     aggregate (s, p) ⊤ that wasn't there before
 *     derived           addresses of every claim the cascade added
 *                       beyond the inputs
 *   }
 *
 * Options:
 *
 *   skipContradictionDiff   skip the before/after contradictions
 *                           snapshot. File ingest uses this —
 *                           file-derived claims are non-conflicting
 *                           by construction and the snapshot is
 *                           O(claims). MCP path keeps the diff.
 */

import { assertNoCommit, contradictions as pamContradictions, rebuildMorphismIndex } from "./model/index.js";

function messageBatch(model, reified, options = {}) {
  if (!model) {
    throw new TypeError("messageBatch requires a model");
  }
  if (!reified || typeof reified !== "object") {
    throw new TypeError("messageBatch requires a reified message (call pam.reify first)");
  }

  const skipDiff = Boolean(options.skipContradictionDiff);

  let beforeConcentrations = null;
  let beforeAggregates = null;
  if (!skipDiff) {
    const before = pamContradictions(model);
    beforeConcentrations = new Set(before.concentrations.map(concentrationKey));
    beforeAggregates = new Set(before.aggregates.map(aggregateKey));
  }

  const derived = [];

  // Bookkeeping first — these subjects are fresh content-addressed
  // ids so the cascade cannot find a prior cell to conflict with.
  for (const claim of reified.identityClaims || []) {
    const r = assertNoCommit(model, claim);
    pushDerived(derived, r);
  }
  for (const claim of reified.messageClaims || []) {
    const r = assertNoCommit(model, claim);
    pushDerived(derived, r);
  }

  // Payload — the only claims that can produce a new contradiction.
  const accepted = [];
  for (const claim of reified.assertedClaims || []) {
    const r = assertNoCommit(model, claim);
    accepted.push({ claim });
    pushDerived(derived, r);
  }

  // Commit the whole batch as one transaction → one new manifest.
  const committedModel = model.commit();
  rebuildMorphismIndex(committedModel);

  let newConcentrations = [];
  let newAggregates = [];
  if (!skipDiff) {
    const after = pamContradictions(committedModel);
    newConcentrations = after.concentrations.filter(
      (c) => !beforeConcentrations.has(concentrationKey(c))
    );
    newAggregates = after.aggregates.filter(
      (a) => !beforeAggregates.has(aggregateKey(a))
    );
  }

  return {
    model: committedModel,
    senderId: reified.senderId,
    messageId: reified.messageId,
    accepted,
    newConcentrations,
    newAggregates,
    derived,
  };
}

function pushDerived(out, assertResult) {
  if (!assertResult || !Array.isArray(assertResult.derived)) return;
  for (const d of assertResult.derived) out.push(d);
}

function concentrationKey(c) {
  return `${c.subject}\u0001${c.predicate}\u0001${c.object}`;
}

function aggregateKey(a) {
  return `${a.subject}\u0000${a.predicate}`;
}

export {
  messageBatch,
  concentrationKey,
  aggregateKey,
};
