---
type: reference
class: critical-paper
status: active
cites:
  - teaching/explanations/scalability-premise.md
  - ../theorems/llm-swarms-fail-classical-conditions.md
  - teaching/explanations/from-classical-to-llm-swarms.md
---

# Doan et al. (2025) — LLM-Powered Swarms: A New Frontier or a Conceptual Stretch?

**Full citation:** "LLM-Powered Swarms: A New Frontier or a Conceptual Stretch?" arXiv:2506.14496, June 2025.

## Summary

The foundational critique of "LLM swarm" framings in the contemporary multi-agent LLM literature.
The paper argues that LLM-based agent collectives, despite frequently being described in swarm-intelligence vocabulary, do not satisfy the structural conditions of classical swarm intelligence and do not inherit its convergence guarantees.

The paper's central arguments:

- **The scalability premise is violated by many orders of magnitude.** Per-agent prompt-processing cost in LLM swarms is many orders of magnitude greater than the simple update rules of classical swarm-intelligence agents (PSO, ACO, FWA).
  The asymptotic-population regimes that gave classical swarm theory its convergence guarantees are computationally inaccessible.
- **Natural-language coordination loses analytical handles.** Classical swarm algorithms have precise update rules that admit closed-form analysis.
  Natural-language coordination buys flexibility but loses the algebraic structure that proved convergence.
- **Emerging principled glue is empirically suggestive but lacks limit theorems.** Confidence-weighted Bayesian aggregation, information- theoretic coordination via KL divergence, multi-agent debate protocols — these are useful engineering techniques but do not yield the kind of clean limit theorems that mean-field theory gave the simple-agent case.

The paper does not deny that LLM-agent collectives can be useful; it denies that they are swarms in the technical sense the classical literature established.

## Contribution to the swarm-intelligence theory

This is the primary citation for the [llm-swarms-fail-classical-conditions](../theorems/llm-swarms-fail-classical-conditions.md) theorem.
The theorem makes precise within the present theory the critique Doan et al. articulate.

The theory's [from-classical-to-llm-swarms](teaching/explanations/from-classical-to-llm-swarms.md) narrative recapitulates the historical context the paper appeals to: the classical swarm-intelligence tradition, its structural commitments, and the way contemporary LLM-agent practice has appropriated its vocabulary without inheriting its substance.

## Position in the literature

The paper is part of a broader 2025–2026 turn toward critical analysis of LLM-agent multi-agent systems.
Companion work:

- The MASFT study (arXiv 2503.13657, March 2025): empirical evidence for orchestrated-multi-agent-system overhead and saturation.
- The [survey-of-agentic-swarm-math](../../../../../humanities/theories/math/texts/survey-of-agentic-swarm-math.md) in this corpus's math branch: the mathematical-frontier survey.
- The MIT AI Agent Index (arXiv 2502.01635, February 2025): empirical characterization of deployed agentic systems.

Together these constitute a critical literature establishing what multi-agent LLM systems are and are not.
Doan et al.'s contribution is the specific argument for why they are not swarms.

## Open questions raised

The paper's critique is largely structural and does not propose a positive program for LLM-swarm research.
The [when-do-llm-agents-form-a-swarm](questions/when-do-llm-agents-form-a-swarm.md) research question in this theory asks under what restrictions on the LLM-agent's behavior the classical conditions could recover; this is the natural follow-up question the paper opens.

## Citation note

The paper is an arXiv preprint; no peer-reviewed publication has appeared as of mid-2026.
The paper is widely cited in the LLM-agent research community despite this, in part because no comparable critique has appeared elsewhere.
Citing the arXiv version is standard practice in the field.
