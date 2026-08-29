// Shared pair-by-subject dispatch for the 3-claim fiber-functor
// morphisms (composition, fusion, implication).
//
// The second-order semantics: a derived 3-claim contribution at
// subject s in the target fiber is the *pair* of source claims at s.
// Pair shape:
//
//   { subject: leftSPO, predicate: morphismName, object: rightSPO }
//
// For symmetric morphisms (composition, fusion) the pair is sorted
// canonically by claim address so that (c1, c2) and (c2, c1) reduce to
// the same address. For asymmetric implication, antecedent is on the
// subject side and consequent on the object side — order matters.
//
// Pair-by-subject dispatch is unified across left===right and
// left!==right because the natural generalization of point-local
// matching under second-order objects is "find all partners at the
// same subject in the partner fiber". Point-local (s,o) lookups
// no longer work in general because partner fibers carry their own
// structured objects that won't share o with the new claim.
//
// Recursion bound: when a derived contribution lands back in a fiber
// that is also a source for the same declaration (i.e., the morphism
// is self-referential through its target), pair-by-subject would
// otherwise loop indefinitely creating ever-deeper nested objects.
// We bound it by skipping any candidate (the new claim or its
// partners) whose _ancestry already contains this declaration's key.
// Each pair is processed exactly once across the wavefront.

function spoOf(model, triple) {
  return {
    subject: model.strings.value(triple.sid),
    predicate: model.strings.value(triple.pid),
    object: model.strings.value(triple.oid),
  };
}

function isFromDeclaration(claim, declaration) {
  return claim._ancestry ? claim._ancestry.has(declaration.key) : false;
}

// Find all partner claims at the same subject in the named partner
// fiber, excluding the new claim itself and any candidate that was
// already derived through this declaration (to bound recursion).
//
// The query is a range scan on EAVT — O(log segments + matching keys)
// regardless of total substrate size.
function findPartnersAtSubject(model, claim, partnerPredicate, declaration) {
  const partnerPid = model.strings.intern(partnerPredicate);
  const partners = [];
  for (const partner of model.match({ sid: claim.sid, pid: partnerPid })) {
    if (partner.sid === claim.sid &&
        partner.pid === claim.pid &&
        partner.oid === claim.oid) continue;
    if (isFromDeclaration(partner, declaration)) continue;
    partners.push(partner);
  }
  return partners;
}

// Build the structured-pair object for a 3-claim derived contribution.
// Symmetric morphisms sort the two source SPOs by claim address so
// pair{c1,c2} and pair{c2,c1} canonicalize to the same content.
function claimSortKey(claim) {
  return `${claim.sid},${claim.pid},${claim.oid}`;
}

function buildPairObject(model, leftClaim, rightClaim, morphismName, symmetric) {
  if (symmetric && claimSortKey(rightClaim) < claimSortKey(leftClaim)) {
    const tmp = leftClaim;
    leftClaim = rightClaim;
    rightClaim = tmp;
  }
  return {
    subject: spoOf(model, leftClaim),
    predicate: morphismName,
    object: spoOf(model, rightClaim),
  };
}

// Look up a reified-declaration entity's role claims at a single
// subject. Used by 3-claim morphisms' parseDeclaration when a new
// role-claim arrives — gather the other two roles to see if a complete
// declaration has materialized.
function lookupRolesAtSubject(model, sid, rolePredicates) {
  const roles = {};
  for (const claim of model.match({ sid })) {
    const predStr = model.strings.value(claim.pid);
    if (!rolePredicates.includes(predStr)) continue;
    roles[predStr] = {
      value: model.strings.value(claim.oid),
      rawValue: claim.value,
      claimAddress: `${claim.sid},${claim.pid},${claim.oid}`,
    };
  }
  return roles;
}

export {
  spoOf,
  claimSortKey,
  isFromDeclaration,
  findPartnersAtSubject,
  buildPairObject,
  lookupRolesAtSubject
};
