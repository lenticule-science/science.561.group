// specialization — Theorem 2 of the paper, first morphism class.
//
// "Specialization induces restriction of valuations, which preserves
//  pointwise bilattice operations."
//
// Declaration shape: a single SPO claim with predicate "specialization":
//
//   (sourcePredicate, specialization, targetPredicate)
//
// Read: "anything claimed under sourcePredicate is also claimed under
// targetPredicate." Or in fiber terms: the sourcePredicate fiber's
// valuations restrict (transport pointwise via knowledge join) to the
// targetPredicate fiber.
//
// Example:
//   (human, specialization, animal)
//   (socrates, human, true)
// Derives:
//   (socrates, animal, true)

import { postClose } from "../bilattice.js";
import { encodeDerivedClaim } from "../claim.js";

const NAME = "specialization";

// Find every active declaration in the model. Walks the AEVT index
// for claims whose predicate is `specialization` — cheap range scan,
// no full-substrate materialization.
function declarations(model) {
  const decls = [];
  const namePid = model.strings.intern(NAME);
  for (const claim of model.match({ pid: namePid })) {
    const closedValue = postClose(claim.value);
    // Only fire when the morphism declaration itself has positive evidence.
    if (closedValue !== "true" && closedValue !== "both") continue;
    const claimAddr = `${claim.sid},${claim.pid},${claim.oid}`;
    decls.push({
      key: `${NAME}\u0000${claimAddr}`,
      source: model.strings.value(claim.sid),
      target: model.strings.value(claim.oid),
      morphismClaimAddress: claimAddr,
    });
  }
  return decls;
}

// Per-claim derivation. Sound because A_q(s, o) := A_p(s, o) at the
// same point: the new claim at (c.s, c.o) in A_p contributes exactly
// one update at (c.s, c.o) in A_q with the same value.
function applyForClaim(declaration, model, claim) {
  if (model.strings.value(claim.pid) !== declaration.source) return [];
  // Recursion bound: under second-order semantics, a cycle through this
  // declaration would create ever-deeper nested objects since each
  // derivation lands at a new fiber point (new object, new cell). Skip
  // claims already derived through this declaration via _ancestry check.
  if (claim._ancestry && claim._ancestry.has(declaration.key)) {
    return [];
  }
  return [deriveSpecializationClaim(declaration, claim, model, postClose(claim.value))];
}

function deriveSpecializationClaim(declaration, sourceClaim, model, closedValue) {
  const srcSubject = model.strings.value(sourceClaim.sid);
  const srcPredicate = model.strings.value(sourceClaim.pid);
  const srcObject = model.strings.value(sourceClaim.oid);
  const contribution = encodeDerivedClaim({
    subject: srcSubject,
    predicate: declaration.target,
    object: {
      subject: srcSubject,
      predicate: srcPredicate,
      object: srcObject,
    },
    value: closedValue,
  }, model.strings);
  contribution._ancestry = new Set([...(sourceClaim._ancestry || []), declaration.key]);
  return contribution;
}

// Per-claim declaration parsing: given a structural-predicate claim
// that was just inserted, return any new declaration this single claim
// contributes. For specialization, the morphism is 1-claim — every
// (source, "specialization", target) claim with positive value is a
// declaration in its own right.
function parseDeclaration(claim, model) {
  if (model.strings.value(claim.pid) !== NAME) return [];
  const closedValue = postClose(claim.value);
  if (closedValue !== "true" && closedValue !== "both") return [];
  const claimAddr = `${claim.sid},${claim.pid},${claim.oid}`;
  return [{
    key: `${NAME}\u0000${claimAddr}`,
    source: model.strings.value(claim.sid),
    target: model.strings.value(claim.oid),
    morphismClaimAddress: claimAddr,
  }];
}

// Source predicates of a declaration: when claims arrive in any of
// these fibers, applyForClaim should be invoked.
function sourcePredicates(declaration) {
  return [declaration.source];
}

// Static set of predicates whose claims could be (or could complete)
// a declaration of this morphism. For 1-claim morphisms this is just
// the morphism name itself.
const TRIGGER_PREDICATES = [NAME];

export {
  NAME as name,
  declarations,
  applyForClaim,
  parseDeclaration,
  sourcePredicates,
  TRIGGER_PREDICATES,
};
