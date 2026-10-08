---
type: theorem
class: foundational
status: established
depends-on:
  - teaching/explanations/causal-reasoning.md
  - teaching/explanations/intervention.md
  - teaching/explanations/counterfactual.md
see-also: []
references:
  - references/pearl-causality2009.md
  - references/bareinboim-causalai2020.md
title: Causal hierarchy theorem
description: "Pearl's causal hierarchy (also: ladder of causation) distinguishes three rungs of causal queries:"
---

# Causal hierarchy theorem

## Statement

Pearl's *causal hierarchy* (also: ladder of causation)
distinguishes three rungs of causal queries:

1. **Associational.** $P(Y | X)$.
2. **Interventional.** $P(Y | \mathrm{do}(X))$.
3. **Counterfactual.** $P(Y_x | X = x', Y = y')$.

The **causal hierarchy theorem** (Bareinboim et al.
2020): for almost all SCMs, rung-$k$ questions
*cannot* in general be answered from rung-$(k-1)$
data alone. The hierarchy is *strictly* layered.

## Formal content

For randomly-drawn SCMs:

- Two SCMs can agree on rung-1 (observational
  distribution) but disagree on rung-2 (intervention
  distributions).
- Two SCMs can agree on rungs 1 and 2 but disagree on
  rung-3 (counterfactuals).

Therefore data from one rung does not determine
quantities at higher rungs without additional
structural assumptions.

## Why it matters

This formalizes the intuition that:

- "Correlation isn't causation" — rung-1 data doesn't
  determine rung-2.
- "Intervention isn't enough for counterfactual
  reasoning" — rung-2 doesn't determine rung-3.

It also clarifies what's needed to climb the ladder:

- Rung-1 → Rung-2: causal structure (graph) +
  identifiability.
- Rung-2 → Rung-3: structural equations (functional
  form) + noise distribution.

## Implications for AI

- **Pure observational ML** is fundamentally limited
  to rung-1 questions. Cannot answer interventional
  questions without causal assumptions.
- **Foundation models trained on observational text**
  may struggle with rung-2 and rung-3 questions even
  if they appear to answer rung-1 well.
- **Climbing the ladder requires structure.**
  Either explicit (graph + equations) or implicit
  (assumed by training procedure).

## Refinements

- **Identifiable special cases.** Some interventional
  and counterfactual queries *are* identifiable from
  observational data — those are exactly the cases
  the hierarchy theorem doesn't preclude.
- **Functional restrictions** can collapse parts of
  the hierarchy: linear models with non-Gaussian
  noise enable rung-1 → rung-2 identification beyond
  the generic case.
- **Approximate climbing.** Sometimes upper-rung
  quantities can be *bounded* from lower-rung data
  even when not identified.

## Status

Foundational result clarifying the structure of causal
inference. Standard pedagogical content. Provides
motivation for the entire causal-inference enterprise:
why we need more than statistics.
