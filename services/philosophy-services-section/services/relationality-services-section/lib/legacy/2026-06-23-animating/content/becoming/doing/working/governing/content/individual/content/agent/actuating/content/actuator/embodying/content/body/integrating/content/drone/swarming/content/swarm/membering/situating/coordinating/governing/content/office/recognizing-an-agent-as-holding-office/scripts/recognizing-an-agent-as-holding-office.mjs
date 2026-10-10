// recognizing-an-agent-as-holding-office — positing-regime stance commitment.
// Regime: scott-continuous-posit-category; κ = ω.
// Act-class: positing (committing-a-stance). Substrate-effect operation-kind:
// mutation. Per lab agentic-systems/.../recognizing-a-character-as-leader-of-a-swarm.
// Variance: extension. Monotone — recognition only adds.

export default function recognizingAnAgentAsHoldingOffice(agent, office, recognizer, at = null) {
  if (!agent?.slug) throw new Error("recognizing: agent must have slug");
  if (!office?.slug) throw new Error("recognizing: office must have slug");
  if (!recognizer?.slug) throw new Error("recognizing: recognizer must have slug");
  return {
    fromAgent: recognizer.slug,
    predicate: "recognizes-as-holding",
    toAgent: agent.slug,
    office: office.slug,
    value: "true",
    regime: "scott-continuous-posit-category",
    operationKind: "mutation",
    at: at ?? new Date().toISOString()
  };
}
