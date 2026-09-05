---
type: reference
class: foundational
status: active
authors: ["Sham Kakade", "John Langford"]
year: 2002
venue: "ICML"
title: "Approximately Optimal Approximate Reinforcement Learning"
---

# Kakade & Langford 2002 — Approximately optimal approximate RL

Kakade, S., & Langford, J. (2002). Approximately Optimal
Approximate Reinforcement Learning. *Proceedings of the 19th
International Conference on Machine Learning (ICML)*.

The standard reference for the *simulation lemma*: the
performance gap between two MDPs that differ only in their
transition functions is bounded above by the per-state-action
TV-distance discrepancy times a horizon-dependent factor
($H^2$ in finite horizon, $1/(1-\gamma)^2$ in discounted
infinite horizon). This is the formal substrate for both
[model-error-compounds](../theorems/model-error-compounds.md)
and [sim-to-real-gap-bound](../theorems/sim-to-real-gap-bound.md).

Cited by:
[model-error-compounds](../theorems/model-error-compounds.md),
[sim-to-real-gap-bound](../theorems/sim-to-real-gap-bound.md).
