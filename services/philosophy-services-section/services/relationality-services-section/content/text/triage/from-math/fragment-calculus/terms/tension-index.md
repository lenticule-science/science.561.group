---
title: "Tension Index"
date-created: 2026-03-02T00:00:00
type: term
keywords:
  - FragmentCalculus
defines:
  - "Tension Index"
date-updated: 2026-03-09
part-of: mathematics/concepts/fragment-calculus/terms
---

A tension index is a heuristic measure estimating how difficult it is to merge two fragments.

In fragment calculus, each reasoning context is a fragment with its own assumptions, claims, and derivation rules. When two fragments need to be combined — because a project requires results from both — the tension index estimates the cost before performing the full Delta computation.

The index accounts for three factors: contradictions between the fragments' claims, overlap in their supporting assumptions, and the risk of closure explosion (where importing one fragment's rules into another derives far more claims than intended, potentially including unwanted ones).

A tension index is not a truth measure. It does not determine whether one fragment is correct and the other wrong. It is a steering function: a high tension index suggests that merging the fragments will require substantial work (resolving contradictions, restricting imported rules, adjusting assumptions), while a low index suggests the merge is straightforward.

This makes tension indices practical tools for managing multi-domain projects. Rather than attempting to unify all reasoning contexts into a single consistent whole — which risks [illicit globalism](./illicit-globalism.md) — the tension index helps decide when unification is worth the cost and when maintaining separate fragments with explicit deltas is more honest.

See the full treatment in [Fragment Calculus](../texts/fragment-calculus.md).
