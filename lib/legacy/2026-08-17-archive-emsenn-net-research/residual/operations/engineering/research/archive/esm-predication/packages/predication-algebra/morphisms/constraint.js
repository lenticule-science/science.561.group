// constraint — derive constraint-violation claims when declared
// patterns are matched and violated.
//
// This is a morphism, not a rejection mechanism — every claim is still
// accepted per the architecture. Violations are information.
//
// Declaration shape: a reified entity with three role-claims:
//
//   (constraintId, constraint-pattern,   patternPredicate)
//   (constraintId, constraint-type,      "both" | "mutual-exclusive" | "functional")
//   (constraintId, constraint-violation, violationPredicate)
//
// Semantics:
//   "both"             — cell at (s,p,o) has value BOTH -> derive violation
//   "mutual-exclusive" — two objects at same subject both have positive
//                        evidence -> derive violation
//   "functional"       — more than one distinct object with positive
//                        evidence at same subject -> derive violation

import { postClose } from "../bilattice.js";
import { encodeDerivedClaim } from "../claim.js";
import { lookupRolesAtSubject } from "./_pair-dispatch.js";

const NAME = "constraint";
const PATTERN_PRED = "constraint-pattern";
const TYPE_PRED = "constraint-type";
const VIOLATION_PRED = "constraint-violation";
const VALID_TYPES = ["both", "mutual-exclusive", "functional"];
const ROLES = [PATTERN_PRED, TYPE_PRED, VIOLATION_PRED];

function declarations(model) {
  const patPid = model.strings.intern(PATTERN_PRED);
  const typePid = model.strings.intern(TYPE_PRED);
  const violPid = model.strings.intern(VIOLATION_PRED);

  const bySubject = new Map();
  for (const pid of [patPid, typePid, violPid]) {
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
    if (!roles[PATTERN_PRED] || !roles[TYPE_PRED] || !roles[VIOLATION_PRED]) continue;
    if (!VALID_TYPES.includes(roles[TYPE_PRED].value)) continue;
    decls.push({
      declId,
      key: `${NAME}\u0000${declId}`,
      pattern: roles[PATTERN_PRED].value,
      constraintType: roles[TYPE_PRED].value,
      violation: roles[VIOLATION_PRED].value,
      morphismClaimAddresses: [
        roles[PATTERN_PRED].claimAddress,
        roles[TYPE_PRED].claimAddress,
        roles[VIOLATION_PRED].claimAddress,
      ].sort(),
    });
  }
  return decls;
}

function applyForClaim(declaration, model, claim) {
  const claimPred = model.strings.value(claim.pid);
  if (claimPred !== declaration.pattern) return [];
  if (claimPred === declaration.violation) return [];
  if (isFromDeclaration(claim, declaration)) return [];

  const closedValue = postClose(claim.value);
  const claimAddr = `${claim.sid},${claim.pid},${claim.oid}`;

  const derived = [];

  if (declaration.constraintType === "both") {
    if (closedValue === "both") {
      derived.push(makeViolation(declaration, claim, model, "both-value", [claimAddr]));
    }
  } else if (declaration.constraintType === "mutual-exclusive") {
    const patternPid = model.strings.intern(declaration.pattern);
    for (const other of model.match({ sid: claim.sid, pid: patternPid })) {
      if (other.sid === claim.sid && other.pid === claim.pid && other.oid === claim.oid) continue;
      const otherClosedValue = postClose(other.value);
      if (hasPositive(closedValue) && hasPositive(otherClosedValue)) {
        derived.push(makeViolation(declaration, claim, model, "mutual-exclusive", [
          claimAddr,
          `${other.sid},${other.pid},${other.oid}`,
        ]));
      }
    }
  } else if (declaration.constraintType === "functional") {
    const patternPid = model.strings.intern(declaration.pattern);
    let positiveCount = 0;
    const sources = [];
    for (const c of model.match({ sid: claim.sid, pid: patternPid })) {
      if (hasPositive(postClose(c.value))) {
        positiveCount++;
        sources.push(`${c.sid},${c.pid},${c.oid}`);
      }
    }
    if (positiveCount > 1) {
      derived.push(makeViolation(declaration, claim, model, "functional", sources));
    }
  }

  return derived;
}

function hasPositive(value) {
  return value === "true" || value === "both";
}

function isFromDeclaration(claim, declaration) {
  return claim._ancestry ? claim._ancestry.has(declaration.key) : false;
}

function makeViolation(declaration, triggeringClaim, model, reason, sourceAddresses) {
  const trigSubject = model.strings.value(triggeringClaim.sid);
  const contribution = encodeDerivedClaim({
    subject: trigSubject,
    predicate: declaration.violation,
    object: {
      constraintId: declaration.declId,
      constraintType: declaration.constraintType,
      reason,
      subject: trigSubject,
    },
    value: "true",
  }, model.strings);
  contribution._ancestry = new Set([...(triggeringClaim._ancestry || []), declaration.key]);
  return contribution;
}

function parseDeclaration(claim, model) {
  const predStr = model.strings.value(claim.pid);
  if (!ROLES.includes(predStr)) return [];
  const closedValue = postClose(claim.value);
  if (closedValue !== "true" && closedValue !== "both") return [];

  const declId = model.strings.value(claim.sid);
  const roles = lookupRolesAtSubject(model, claim.sid, ROLES);
  if (!roles[PATTERN_PRED] || !roles[TYPE_PRED] || !roles[VIOLATION_PRED]) return [];
  for (const rp of ROLES) {
    const cv = postClose(roles[rp].rawValue);
    if (cv !== "true" && cv !== "both") return [];
  }
  if (!VALID_TYPES.includes(roles[TYPE_PRED].value)) return [];

  return [{
    declId,
    key: `${NAME}\u0000${declId}`,
    pattern: roles[PATTERN_PRED].value,
    constraintType: roles[TYPE_PRED].value,
    violation: roles[VIOLATION_PRED].value,
    morphismClaimAddresses: [
      roles[PATTERN_PRED].claimAddress,
      roles[TYPE_PRED].claimAddress,
      roles[VIOLATION_PRED].claimAddress,
    ].sort(),
  }];
}

function sourcePredicates(declaration) {
  return [declaration.pattern];
}

const TRIGGER_PREDICATES = ROLES;

export {
  NAME as name,
  declarations,
  applyForClaim,
  parseDeclaration,
  sourcePredicates,
  TRIGGER_PREDICATES,
  PATTERN_PRED,
  TYPE_PRED,
  VIOLATION_PRED,
};
