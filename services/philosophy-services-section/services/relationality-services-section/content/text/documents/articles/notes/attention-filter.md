---
title: "Attention Filter"
id: attention-filter
role: operator
status: deprecated
inputs: []
outputs: []
transformation: []
proof_refs: []
description: "Unimplemented historical proposal. No predicate or mathematical relation to canonical ATT was supplied; it cannot restrict an epistemic profile lawfully."
---

# Attention Filter — invalid historical proposal

**Deprecated claim:** "Restrict an epistemic profile to states currently attended to." The prior entry used "attention focus" and "attended recognition" without specifying a predicate, recipient, FOUR cover, `ACK`, `ATT` or finite reconciliation budget. It had no formal input and no proof. It cannot be used as a mathematical operator or as the meaning of ATT.

A qualified replacement is a **different**, still-to-be-defined selection map
`F_{B,S} : EpistemicProfile → EpistemicProfile`, where `B : ℕ`
is a finite budget, `S` a list of costed obstructions, and
`Feasible(B,S) := totalCost(S) ≤ B`. The
[actual allocation theorem](https://github.com/lenticule-science/science-services-section/blob/main/services/social-science-services-section/services/economics-and-business-science-services-section/services/economics-science-services-section/lib/obsmetrologia-economics/ObsmetrologiaEconomics/AttentionAllocation.lean)
proves only the budget/benefit properties *in its stated domain*. It does **not** define `F_{B,S}`, prove that an epistemic profile has a restriction induced by `S`, or prove the old monotonicity and intersection claims.

Canonical [ATT](https://github.com/lenticule-science/science-services-section/blob/main/services/social-science-services-section/services/economics-and-business-science-services-section/services/monetary-economics-science-services-section/content/text/glossary/terms/att.md)
is the budget/allocation term, with WIT-of-ACK as its border-act reading; `F_{B,S}` is **not an alias** for either one. Keep this source as historical evidence of the faulty loose usage, not a generation exemplar or an executable operator.
