// withdrawing-recognition-of-an-agent-holding-office — positing-regime stance withdrawal.
// Regime: scott-continuous-posit-category; κ = ω.
// Substrate-monotone via the bilattice (a new row records the withdrawal; the
// prior recognition row is preserved in the trace).

export default function withdrawingRecognitionOfAnAgentHoldingOffice(agent, office, recognizer, at = null) {
  if (!agent?.slug) throw new Error("withdrawing-recognition: agent must have slug");
  if (!office?.slug) throw new Error("withdrawing-recognition: office must have slug");
  if (!recognizer?.slug) throw new Error("withdrawing-recognition: recognizer must have slug");
  return {
    fromAgent: recognizer.slug,
    predicate: "withdraws-recognition-of-holding",
    toAgent: agent.slug,
    office: office.slug,
    value: "true",
    regime: "scott-continuous-posit-category",
    operationKind: "mutation",
    at: at ?? new Date().toISOString()
  };
}
