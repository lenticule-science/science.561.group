---
type: reference
class: foundational
status: published
year: 1971
authors: ["Fikes, Richard E.", "Nilsson, Nils J."]
---

# Fikes & Nilsson 1971

**STRIPS: A New Approach to the Application of Theorem Proving to Problem Solving.** Artificial Intelligence, 2(3-4), pp.
189–208.

## What the paper does

Introduces the STRIPS (Stanford Research Institute Problem Solver) planning system and the STRIPS representation.
The system was implemented to control the SHAKEY robot at SRI; the planning representation became the canonical form for classical planning for the next two decades and the conceptual basis for PDDL through to the present.

## Key contributions

1. **The STRIPS representation**.
  States as sets of ground atoms (a closed-world database); operators as triples (precondition, add-list, delete-list); plans as sequences of ground operators.
2. **The closed-world assumption** as a tractability lever: atoms not in the database are assumed false, eliminating the need to enumerate all false propositions.
3. **The frame problem**'s pragmatic resolution: the add-list and delete-list specify exactly what changes; everything else persists by default.
4. **Backward planning** (means-ends analysis) as the search algorithm: regress from goal toward initial state by selecting actions that establish open conditions.

## Why this paper matters

STRIPS is the foundational artifact of automated planning.
The representation is essentially unchanged in PDDL (the modern standardized planning input language) modulo syntax: atoms, preconditions, effects, costs, goals.

The closed-world assumption and the frame-problem resolution are both criticized in the subsequent literature (the closed-world assumption is a strong epistemic claim; the frame problem has deeper logical content than the add/delete-list pragmatic answer acknowledges) but both have proven decisive for *making planning tractable*.
Modern planning systems still rely on these simplifications.

## Cited where

- [classical-planning](teaching/explanations/classical-planning.md) — for the STRIPS formalism.
- [planning-problem](../objects/planning-problem.md) — for the factored representation.
- [backward-search](../morphisms/backward-search.md) — STRIPS was the first major backward planner.
- [from-strips-to-llm-planning](teaching/explanations/from-strips-to-llm-planning.md) — for the historical arc.
