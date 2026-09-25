---
title: "Spatiotemporal Knowledge System (Lean) — status"
date-created: 2026-09-10
tags: []
description: "Recovered from lib/legacy/2026-09-01-cold-red-gate-lean-archive/spatiotemporal-knowledge-system/ (the campaign's information-loss law: preserved because it is real, non-trivial category-theoretic Lean content — predicate categories, fiber…"
---

Recovered from `lib/legacy/2026-09-01-cold-red-gate-lean-archive/spatiotemporal-knowledge-system/` (the campaign's information-loss law: preserved because it is real, non-trivial category-theoretic Lean content — predicate categories, fiber algebras, residuated lattices, projection adjoints/Frobenius laws, quantifier adjoints — with no prose counterpart anywhere in this section's live corpus, unlike the semiotic-universe formalization at `../lean/`).

**This project does not build as committed.** `SpatiotemporalKnowledgeSystem/Categorical/*.lean` import a `SpatiotemporalKnowledgeSystem.Homebrew.Algebra.{Bilattice, BilatticeHom, FOUR, FOURTheorems, TwistProduct, TwistProductCompleteLattice, TwistProductResiduated}` base layer, and `Homebrew.Examples.Belnap` / `Homebrew.Settling.PredicationSettling`, that are not present in this directory. A build attempt fails immediately on the missing `TwistProduct.lean`.

These missing files were searched for across the rest of this section's `lib/legacy/` queue (specifically the other Lean archives still pending at the time of recovery) and were not found there either — they appear to be genuinely lost, not merely misfiled elsewhere in this repository. Two sibling Lean subtrees in the same source archive (`from-predicate-category/`, `predication-hyperdoctrine/`) were confirmed to be exact re-namespacings of this project's `Categorical/` files with no additional content, and were deleted rather than kept as parallel copies of the same gap.

Do not present this as verified, checked, or sorry-free work — it has not been built, and several of its own files reference a base layer that no longer exists. Preserve as source pending either recovery of the missing `Homebrew` files from an as-yet-unfound copy, or a decision to rewrite that base layer against current Mathlib.
