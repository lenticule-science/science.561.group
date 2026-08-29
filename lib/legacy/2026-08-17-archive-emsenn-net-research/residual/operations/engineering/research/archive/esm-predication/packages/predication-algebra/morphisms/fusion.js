// fusion — Corollary 1 of the paper, extending side of the residuated pair.
//
// "The adjunction ⊙ ⊣ ⇒ lifts to fibers: for each predicate p, extending
//  and restricting on A_p are adjoint fiber-wise."
//
// And per Corollary 3 (Jakl 2025): ⊙ on fibers is the ⊗ (multiplicative
// tensor) of linear logic. Fusion is the resource-combining operation.
//
// Declaration shape: a reified entity with three role-claims:
//
//   (declId, fusion-left,   leftPredicate)
//   (declId, fusion-right,  rightPredicate)
//   (declId, fusion-target, targetPredicate)
//
// Semantics: at every (s, o) point present in either source fiber,
// compute ⊙(left_value, right_value) per Theorem 1's formula and join
// into target via knowledge join. ⊙ is commutative (left/right are
// interchangeable) but not idempotent on ⊥: ⊙(⊥, ⊥) = f.

import { fuse, postClose } from "../bilattice.js";
import { encodeDerivedClaim } from "../claim.js";
import {
  claimSortKey,
  isFromDeclaration,
  findPartnersAtSubject,
  buildPairObject,
  lookupRolesAtSubject,
} from "./_pair-dispatch.js";

const NAME = "fusion";
const SYMMETRIC = true;
const LEFT_PRED = "fusion-left";
const RIGHT_PRED = "fusion-right";
const TARGET_PRED = "fusion-target";
const ROLES = [LEFT_PRED, RIGHT_PRED, TARGET_PRED];

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

  if (isFromDeclaration(claim, declaration)) return [];

  const partnerPredicate = isLeft ? declaration.right : declaration.left;
  const partners = findPartnersAtSubject(model, claim, partnerPredicate, declaration);

  const derived = [];
  for (const partner of partners) {
    const partnerClosedValue = postClose(partner.value);

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

    const fused = fuse(leftValue, rightValue);
    if (fused === "none") continue;

    const contribution = encodeDerivedClaim({
      subject: model.strings.value(leftClaim.sid),
      predicate: declaration.target,
      object: buildPairObject(model, leftClaim, rightClaim, NAME, SYMMETRIC),
      value: fused,
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
