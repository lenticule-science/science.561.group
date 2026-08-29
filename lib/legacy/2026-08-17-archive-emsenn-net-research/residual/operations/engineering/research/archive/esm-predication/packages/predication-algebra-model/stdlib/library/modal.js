/**
 * Modal axiom systems as PAM data.
 *
 * Belief, necessity, and possibility are encoded as predicate naming
 * conventions (`belief§<agent>§<predicate>`, `□<predicate>`,
 * `◇<predicate>`) plus structural morphism declarations the kernel
 * interprets at settlement.
 *
 * The functions here take user-supplied agent and predicate names
 * and return claim arrays implementing the standard modal axiom
 * systems. Each axiom system is more than a single morphism
 * declaration — they bundle together the relationships that define
 * the system as a whole.
 */

function beliefPred(agent, predicate) {
  return `belief§${agent}§${predicate}`;
}

function necessarilyPred(predicate) {
  return `□${predicate}`;
}

function possiblyPred(predicate) {
  return `◇${predicate}`;
}

/**
 * T axiom: belief implies fact for a single (agent, predicate) pair.
 *
 *     belief(agent, P) → P
 *
 * One specialization declaration with a constructed belief predicate
 * name. Returned as a claim array for composition into a runtime
 * model.
 */
function tAxiom(agent, predicate) {
  return [
    { subject: beliefPred(agent, predicate), predicate: "specialization", object: predicate },
  ];
}

/**
 * 4 axiom (positive introspection): if the agent believes P, the
 * agent believes that they believe P.
 *
 *     belief(agent, P) → belief(agent, belief(agent, P))
 *
 * One specialization declaration with two layers of belief naming.
 */
function fourAxiom(agent, predicate) {
  const inner = beliefPred(agent, predicate);
  return [
    { subject: inner, predicate: "specialization", object: beliefPred(agent, inner) },
  ];
}

/**
 * S4 closure: T + 4 for an agent over a list of predicates. For
 * each predicate, declare both axioms.
 */
function s4Closure(agent, predicates) {
  const claims = [];
  for (const p of predicates) {
    claims.push(...tAxiom(agent, p));
    claims.push(...fourAxiom(agent, p));
  }
  return claims;
}

/**
 * Trust-conditional sharing: agent A's belief in P, fused with A's
 * belief that A trusts B, yields B's belief in P.
 *
 *     belief(A, P) ⊙ belief(A, trusts(B)) → belief(B, P)
 *
 * One fusion declaration with three constructed belief predicates.
 */
function trustShare(fromAgent, toAgent, trustPredicate, predicate) {
  const declId = `trust-share§${fromAgent}§${toAgent}§${predicate}`;
  return [
    { subject: declId, predicate: "fusion-left",   object: beliefPred(fromAgent, predicate) },
    { subject: declId, predicate: "fusion-right",  object: beliefPred(fromAgent, trustPredicate) },
    { subject: declId, predicate: "fusion-target", object: beliefPred(toAgent,   predicate) },
  ];
}

/**
 * Necessity implies actuality: □P → P.
 */
function necessityImpliesActuality(predicate) {
  return [
    { subject: necessarilyPred(predicate), predicate: "specialization", object: predicate },
  ];
}

/**
 * Actuality implies possibility: P → ◇P.
 */
function actualityImpliesPossibility(predicate) {
  return [
    { subject: predicate, predicate: "specialization", object: possiblyPred(predicate) },
  ];
}

/**
 * Necessity implies possibility: □P → ◇P. Composition of the two
 * above; provided as a separate helper because it appears as its own
 * named axiom in many modal systems.
 */
function necessityImpliesPossibility(predicate) {
  return [
    { subject: necessarilyPred(predicate), predicate: "specialization", object: possiblyPred(predicate) },
  ];
}

/**
 * Modal closure for a list of alethic predicates: instantiates all
 * three of the necessity/possibility/actuality relationships above.
 */
function alethicClosure(predicates) {
  const claims = [];
  for (const p of predicates) {
    claims.push(...necessityImpliesActuality(p));
    claims.push(...actualityImpliesPossibility(p));
    claims.push(...necessityImpliesPossibility(p));
  }
  return claims;
}

export {
  beliefPred,
  necessarilyPred,
  possiblyPred,
  tAxiom,
  fourAxiom,
  s4Closure,
  trustShare,
  necessityImpliesActuality,
  actualityImpliesPossibility,
  necessityImpliesPossibility,
  alethicClosure,
};
