// composition — Theorem 2 of the paper, third morphism class.
//
// "Composition applies ∧_k pointwise, preserving bilattice structure
//  by Proposition 7."
//
// This is the 3-place primitive: take two source fibers, take their
// pointwise knowledge meet at every (subject, object) point, knowledge-join
// the result into a target fiber. It's not category-theoretic morphism
// composition (the chaining of generators) — it's a fiber-level operation
// declared by reified morphism entities.
//
// Declaration shape: a single entity with three role-claims:
//
//   (declId, composition-left,   leftPredicate)
//   (declId, composition-right,  rightPredicate)
//   (declId, composition-target, targetPredicate)
//
// The entity itself can be any subject — it's an opaque identifier for
// the morphism declaration, not for any subject in the data.

import { knowledgeMeet, postClose } from "../bilattice.js";
import { encodeDerivedClaim } from "../claim.js";
import {
  claimSortKey,
  isFromDeclaration,
  findPartnersAtSubject,
  buildPairObject,
  lookupRolesAtSubject,
} from "./_pair-dispatch.js";

const NAME = "composition";
const SYMMETRIC = true;
const LEFT_PRED = "composition-left";
const RIGHT_PRED = "composition-right";
const TARGET_PRED = "composition-target";
const ROLES = [LEFT_PRED, RIGHT_PRED, TARGET_PRED];

// Find every entity with a complete left/right/target triple of
// role-claims at positive evidence. Range scans the three role
// predicates' AEVT slices and groups by subject.
function declarations(model) {
  const leftPid = model.strings.intern(LEFT_PRED);
  const rightPid = model.strings.intern(RIGHT_PRED);
  const targetPid = model.strings.intern(TARGET_PRED);

  const bySubject = new Map();
  for (const pid of [leftPid, rightPid, targetPid]) {
    for (const claim of model.match({ pid })) {
      const closedValue = postClose(claim.value);
      if (closedValue !== "true" && closedValue !== "both") continue;
      const subjectStr = model.strings.value(claim.sid);
      const predStr = model.strings.value(claim.pid);
      if (!bySubject.has(subjectStr)) bySubject.set(subjectStr, {});
      bySubject.get(subjectStr)[predStr] = {
        value: model.strings.value(claim.oid),
        claimAddress: `${claim.sid},${claim.pid},${claim.oid}`,
      };
    }
  }

  const decls = [];
  for (const [declId, roles] of bySubject) {
    if (!roles[LEFT_PRED] || !roles[RIGHT_PRED] || !roles[TARGET_PRED]) continue;
    decls.push({
      declId,
      key: `${NAME}\u0000${declId}`,
      left: roles[LEFT_PRED].value,
      right: roles[RIGHT_PRED].value,
      target: roles[TARGET_PRED].value,
      morphismClaimAddresses: [
        roles[LEFT_PRED].claimAddress,
        roles[RIGHT_PRED].claimAddress,
        roles[TARGET_PRED].claimAddress,
      ].sort(),
    });
  }
  return decls;
}

function applyForClaim(declaration, model, claim) {
  const claimPred = model.strings.value(claim.pid);
  const isLeft = claimPred === declaration.left;
  const isRight = claimPred === declaration.right;
  if (!isLeft && !isRight) return [];

  const closedValue = postClose(claim.value);
  if (closedValue === "none") return [];

  if (isFromDeclaration(claim, declaration)) return [];

  const partnerPredicate = isLeft ? declaration.right : declaration.left;
  const partners = findPartnersAtSubject(model, claim, partnerPredicate, declaration);

  const derived = [];
  for (const partner of partners) {
    const partnerClosedValue = postClose(partner.value);
    if (partnerClosedValue === "none") continue;

    let leftClaim, leftValue, rightClaim, rightValue;
    if (isLeft && isRight) {
      if (claimSortKey(claim) <= claimSortKey(partner)) {
        leftClaim = claim; leftValue = closedValue;
        rightClaim = partner; rightValue = partnerClosedValue;
      } else {
        leftClaim = partner; leftValue = partnerClosedValue;
        rightClaim = claim; rightValue = closedValue;
      }
    } else if (isLeft) {
      leftClaim = claim; leftValue = closedValue;
      rightClaim = partner; rightValue = partnerClosedValue;
    } else {
      leftClaim = partner; leftValue = partnerClosedValue;
      rightClaim = claim; rightValue = closedValue;
    }

    const composed = knowledgeMeet(leftValue, rightValue);
    if (composed === "none") continue;

    const contribution = encodeDerivedClaim({
      subject: model.strings.value(leftClaim.sid),
      predicate: declaration.target,
      object: buildPairObject(model, leftClaim, rightClaim, NAME, SYMMETRIC),
      value: composed,
    }, model.strings);
    contribution._ancestry = new Set([
      ...(leftClaim._ancestry || []),
      ...(rightClaim._ancestry || []),
      declaration.key,
    ]);
    derived.push(contribution);
  }
  return derived;
}

function parseDeclaration(claim, model) {
  const predStr = model.strings.value(claim.pid);
  if (!ROLES.includes(predStr)) return [];
  const closedValue = postClose(claim.value);
  if (closedValue !== "true" && closedValue !== "both") return [];

  const declId = model.strings.value(claim.sid);
  const roles = lookupRolesAtSubject(model, claim.sid, ROLES);
  if (!roles[LEFT_PRED] || !roles[RIGHT_PRED] || !roles[TARGET_PRED]) return [];
  // Each role claim must be positively valued for the declaration to fire.
  for (const rp of ROLES) {
    const cv = postClose(roles[rp].rawValue);
    if (cv !== "true" && cv !== "both") return [];
  }

  return [{
    declId,
    key: `${NAME}\u0000${declId}`,
    left: roles[LEFT_PRED].value,
    right: roles[RIGHT_PRED].value,
    target: roles[TARGET_PRED].value,
    morphismClaimAddresses: [
      roles[LEFT_PRED].claimAddress,
      roles[RIGHT_PRED].claimAddress,
      roles[TARGET_PRED].claimAddress,
    ].sort(),
  }];
}

function sourcePredicates(declaration) {
  return [declaration.left, declaration.right];
}

const TRIGGER_PREDICATES = ROLES;

export {
  NAME as name,
  declarations,
  applyForClaim,
  parseDeclaration,
  sourcePredicates,
  TRIGGER_PREDICATES,
  LEFT_PRED,
  RIGHT_PRED,
  TARGET_PRED,
};
