---
type: reference
class: foundational
status: active
authors: ["Scott Garrabrant", "Tsvi Benson-Tilsen", "Andrew Critch", "Nate Soares", "Jessica Taylor"]
year: 2016
venue: "MIRI Technical Report"
title: "Logical Induction"
---

# Garrabrant et al. 2016 — Logical Induction

Garrabrant, S., Benson-Tilsen, T., Critch, A., Soares, N., & Taylor, J.
(2016). *Logical Induction*.
MIRI Technical Report.

The construction of a uniformly computable sequence of probability distributions over the sentences of a formal theory that satisfies the *Garrabrant criterion* — no polynomial-time-computable trader can earn unbounded profit trading sentence-shares against the sequence's prices.

The paper proves that any such *logical inductor* satisfies a remarkable list of properties: calibration in the limit, convergence of probabilities, self-knowledge (calibrated beliefs about its own future beliefs), inductive generalization across sentence schemata, and limit-consistency with the underlying axiom system.
The construction proceeds by enumerating polynomial-time traders and adjusting prices to neutralize each.
Computationally infeasible in practice; conceptually foundational.

Logical induction is the most-developed contemporary attempt to provide a substrate for self-referential and logical uncertainty in [embedded-agency](teaching/explanations/embedded-agency.md).

Cited by: [logical-induction](teaching/explanations/logical-induction.md), [logical-inductor](../objects/logical-inductor.md), [logical-induction-criterion](../theorems/logical-induction-criterion.md).
