---
type: reference
class: foundational
status: published
year: 1994
authors: ["Erol, Kutluhan", "Hendler, James", "Nau, Dana S."]
title: Erol, Hendler & Nau 1994
description: "UMCP: A Sound and Complete Procedure for Hierarchical Task-Network Planning."
---

# Erol, Hendler & Nau 1994

**UMCP: A Sound and Complete Procedure for Hierarchical Task-Network Planning.** In: Proceedings of the Second International Conference on Artificial Intelligence Planning Systems (AIPS), pp.
249–254.

(Companion paper: Erol, Hendler, Nau 1995, *Complexity Results for HTN Planning*, in Annals of Mathematics and Artificial Intelligence 18(1), pp.
69–93 — the formal complexity analysis.)

## What the paper does

Introduces UMCP (Universal Method-Composition Planner), the first provably sound and complete HTN planner.
Establishes the formal semantics of HTN planning, the soundness and completeness theorems for the algorithm, and (in the companion paper) the complexity classification of HTN planning by method-library expressivity.

## Key contributions

1. **Formal HTN semantics.** Compound tasks, methods, decomposition
   networks, partial-order constraints — all rigorously defined for
   the first time. Prior HTN systems (NOAH, NONLIN, SIPE) were
   implementations without a formal specification.
2. **UMCP algorithm.** Sound and complete with respect to the
   method library: returns a plan iff one exists derivable from the
   initial task network via the methods.
3. **Complexity classification** (companion paper):
   - Unrestricted HTN: undecidable (encodes counter-machine halting).
   - Totally-ordered HTN: EXPSPACE-complete.
   - Acyclic HTN (no recursion): NEXPTIME-complete (decidable but
     hard).
   - Restricted HTN reducing to STRIPS: PSPACE-complete (same as
     classical).
4. **The library-relativity insight.** HTN planning is sound and
   complete *relative to the method library*; classical-plan
   existence does not imply HTN-plan existence under a given library.

## Why this paper matters

These papers are the formal foundation of HTN planning.
They established that HTN is not just an engineering trick (a way to inject domain knowledge) but a substantively different planning paradigm with its own correctness theory and complexity profile.
The library-relativity result is fundamental: it explains both why HTN planners are tractable in domains where classical planners struggle (the library prunes the search space) and why they can fail in surprising ways (the library may not capture the optimal plan).

The papers are widely cited as the canonical reference for any formal claim about HTN planning, including the [hierarchical-decomposition-soundness](../notes/undated/hierarchical-decomposition-soundness.md) theorem.

## Cited where

- [hierarchical-planning](../../../glossary/concepts/hierarchical-planning.md) — primary reference for HTN.
- [abstraction-hierarchy](../notes/undated/abstraction-hierarchy.md) — for the method-library framework.
- [plan-decomposition](../notes/undated/plan-decomposition.md) — for the decomposition operation.
- [hierarchical-decomposition-soundness](../notes/undated/hierarchical-decomposition-soundness.md) — for the soundness and completeness theorems.
