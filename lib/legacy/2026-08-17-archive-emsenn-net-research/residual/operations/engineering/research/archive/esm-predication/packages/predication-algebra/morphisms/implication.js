// implication — Corollary 1 of the paper, restricting side of the
// residuated pair.
//
// "The adjunction ⊙ ⊣ ⇒ lifts to fibers: for each predicate p, extending
//  and restricting on A_p are adjoint fiber-wise."
//
// And per Corollary 3 (Jakl 2025): ⇒ on fibers is the ⊸ (linear
// implication, "lollipop") of linear logic. Implication is the
// residual of fusion.
//
// Declaration shape: a reified entity with three role-claims. Implication
// is asymmetric — antecedent and consequent matter:
//
//   (declId, implication-antecedent, antecedentPredicate)
//   (declId, implication-consequent, consequentPredicate)
//   (declId, implication-target,     targetPredicate)

import { restrict, postClose } from "../bilattice.js";
import { encodeDerivedClaim } from "../claim.js";
import {
  isFromDeclaration,
  findPartnersAtSubject,
  buildPairObject,
  lookupRolesAtSubject,
} from "./_pair-dispatch.js";

const NAME = "implication";
const SYMMETRIC = false;
const ANTECEDENT_PRED = "implication-antecedent";
const CONSEQUENT_PRED = "implication-consequent";
const TARGET_PRED = "implication-target";
const ROLES = [ANTECEDENT_PRED, CONSEQUENT_PRED, TARGET_PRED];

function declarations(model) {
  const antPid = model.strings.intern(ANTECEDENT_PRED);
  const consPid = model.strings.intern(CONSEQUENT_PRED);
  const targetPid = model.strings.intern(TARGET_PRED);

  const bySubject = new Map();
  for (const pid of [antPid, consPid, targetPid]) {
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
    if (!roles[ANTECEDENT_PRED] || !roles[CONSEQUENT_PRED] || !roles[TARGET_PRED]) continue;
    decls.push({
      declId,
      key: `${NAME}\u0000${declId}`,
      antecedent: roles[ANTECEDENT_PRED].value,
      consequent: roles[CONSEQUENT_PRED].value,
      target: roles[TARGET_PRED].value,
      morphismClaimAddresses: [
        roles[ANTECEDENT_PRED].claimAddress,
        roles[CONSEQUENT_PRED].claimAddress,
        roles[TARGET_PRED].claimAddress,
      ].sort(),
    });
  }
  return decls;
}

function applyForClaim(declaration, model, claim) {
  const claimPred = model.strings.value(claim.pid);
  const isAnt = claimPred === declaration.antecedent;
  const isCons = claimPred === declaration.consequent;
  if (!isAnt && !isCons) return [];

  if (isFromDeclaration(claim, declaration)) return [];

  const partnerPredicate = isAnt ? declaration.consequent : declaration.antecedent;
  const partners = findPartnersAtSubject(model, claim, partnerPredicate, declaration);

  const derived = [];
  for (const partner of partners) {
    let antClaim, antValue, consClaim, consValue;
    if (isAnt) {
      antClaim = claim; antValue = postClose(claim.value);
      consClaim = partner; consValue = postClose(partner.value);
    } else {
      antClaim = partner; antValue = postClose(partner.value);
      consClaim = claim; consValue = postClose(claim.value);
    }

    const implied = restrict(antValue, consValue);
    if (implied === "none") continue;

    const contribution = encodeDerivedClaim({
      subject: model.strings.value(antClaim.sid),
      predicate: declaration.target,
      object: buildPairObject(model, antClaim, consClaim, NAME, SYMMETRIC),
      value: implied,
    }, model.strings);
    contribution._ancestry = new Set([
      ...(antClaim._ancestry || []),
      ...(consClaim._ancestry || []),
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
  if (!roles[ANTECEDENT_PRED] || !roles[CONSEQUENT_PRED] || !roles[TARGET_PRED]) return [];
  for (const rp of ROLES) {
    const cv = postClose(roles[rp].rawValue);
    if (cv !== "true" && cv !== "both") return [];
  }

  return [{
    declId,
    key: `${NAME}\u0000${declId}`,
    antecedent: roles[ANTECEDENT_PRED].value,
    consequent: roles[CONSEQUENT_PRED].value,
    target: roles[TARGET_PRED].value,
    morphismClaimAddresses: [
      roles[ANTECEDENT_PRED].claimAddress,
      roles[CONSEQUENT_PRED].claimAddress,
      roles[TARGET_PRED].claimAddress,
    ].sort(),
  }];
}

function sourcePredicates(declaration) {
  return [declaration.antecedent, declaration.consequent];
}

const TRIGGER_PREDICATES = ROLES;

export {
  NAME as name,
  declarations,
  applyForClaim,
  parseDeclaration,
  sourcePredicates,
  TRIGGER_PREDICATES,
  ANTECEDENT_PRED,
  CONSEQUENT_PRED,
  TARGET_PRED,
};
