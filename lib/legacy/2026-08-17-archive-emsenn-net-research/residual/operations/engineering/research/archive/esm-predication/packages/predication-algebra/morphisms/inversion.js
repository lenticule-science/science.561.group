// inversion — Theorem 2 of the paper, second morphism class.
//
// "Inversion applies negation ∼ pointwise, which is a bilattice
//  homomorphism (Fitting 1991)."
//
// Declaration shape: a single SPO claim with predicate "inversion":
//
//   (sourcePredicate, inversion, targetPredicate)
//
// Read: "the targetPredicate fiber is the negation of the sourcePredicate
// fiber, with subject and object swapped." Inversion both swaps the
// argument positions and negates the value.
//
// Example:
//   (parent-of, inversion, child-of)
//   (alice, parent-of, bob)            value: true
// Derives:
//   (bob, child-of, alice)             value: false

import { negate, postClose } from "../bilattice.js";
import { encodeDerivedClaim } from "../claim.js";

const NAME = "inversion";

function declarations(model) {
  const decls = [];
  const namePid = model.strings.intern(NAME);
  for (const claim of model.match({ pid: namePid })) {
    const closedValue = postClose(claim.value);
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

// Per-claim derivation. Sound because A_q(s, o) := ~A_p(o, s): the
// new claim at (c.s, c.o) in A_p contributes exactly one update at
// (c.o, c.s) in A_q with negated value.
function applyForClaim(declaration, model, claim) {
  if (model.strings.value(claim.pid) !== declaration.source) return [];
  if (claim._ancestry && claim._ancestry.has(declaration.key)) {
    return [];
  }
  return [deriveInversionClaim(declaration, claim, model, postClose(claim.value))];
}

function deriveInversionClaim(declaration, sourceClaim, model, closedValue) {
  const negated = negate(closedValue);
  const srcSubject = model.strings.value(sourceClaim.sid);
  const srcPredicate = model.strings.value(sourceClaim.pid);
  const srcObject = model.strings.value(sourceClaim.oid);
  const contribution = encodeDerivedClaim({
    subject: srcObject, // swap
    predicate: declaration.target,
    object: {
      subject: srcSubject,
      predicate: srcPredicate,
      object: srcObject,
    },
    value: negated,
  }, model.strings);
  contribution._ancestry = new Set([...(sourceClaim._ancestry || []), declaration.key]);
  return contribution;
}

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

function sourcePredicates(declaration) {
  return [declaration.source];
}

const TRIGGER_PREDICATES = [NAME];

export {
  NAME as name,
  declarations,
  applyForClaim,
  parseDeclaration,
  sourcePredicates,
  TRIGGER_PREDICATES,
};
