---
type: reference
class: foundational
status: published
year: 1968
authors: ["Hart, Peter E.", "Nilsson, Nils J.", "Raphael, Bertram"]
---

# Hart, Nilsson & Raphael 1968

**A Formal Basis for the Heuristic Determination of Minimum Cost Paths.** IEEE Transactions on Systems Science and Cybernetics, SSC-4(2), pp.
100–107.

## What the paper does

Introduces the A* algorithm and proves its optimality and optimal efficiency under admissibility.
The paper formalizes the concepts of admissible heuristic, consistent (monotone) heuristic, and heuristic dominance, and establishes the relationships between them.

## Key contributions

1. **The A* algorithm.** Best-first search with evaluation function $f(n) = g(n) + h(n)$; with an admissible $h$, the search is guaranteed to return an optimal solution.
2. **Admissibility.** The condition $h(s) \leq h^*(s)$ as the sufficient condition for A* optimality.
3. **Consistency.** The condition $h(s) \leq c(a) + h(s')$ for every applicable transition; consistency implies admissibility and ensures no closed-list re-opening.
4. **Optimal efficiency.** A* is optimal among algorithms using the same heuristic information: no algorithm can expand fewer nodes without sacrificing optimality.

## Why this paper matters

A* is the most widely-used heuristic-search algorithm in computer science.
It underlies most modern classical planners (in some heuristic-search variant), most route planning (GPS, web mapping), much robotics motion planning, and the search structure of many adversarial-game players.

The paper's structural insight — *correctness through admissibility, efficiency through tighter bounds* — defines the entire research program of heuristic search: design heuristics that are tight enough to make search fast, while admissible enough to keep it optimal.
This dialectic continues to govern the field.

## Cited where

- [a-star-optimality](../theorems/a-star-optimality.md) — the foundational theorem.
- [heuristic-search](teaching/explanations/heuristic-search.md) — for A* as the canonical algorithm.
- [heuristic-function](../objects/heuristic-function.md) — for the admissibility / consistency framework.
- [from-strips-to-llm-planning](teaching/explanations/from-strips-to-llm-planning.md) — for the historical role.
