---
title: "Illicit Globalism"
date-created: 2026-03-02T00:00:00
type: term
keywords:
  - FragmentCalculus
defines:
  - "Illicit Globalism"
date-updated: 2026-03-09
part-of: mathematics/concepts/fragment-calculus/terms
---

Illicit globalism is the uncontrolled transfer of a claim from one reasoning context to another, where the assumptions change but the claim travels without adjustment.

Every reasoning context constitutes a fragment F with its own assumptions A, claims K, derivation rules R, and provenance map Π. A claim that holds under fragment F_M (with proof rules and formal definitions) may not hold under F_A (with design constraints and versioning stability) or F_I (with language constraints, resource bounds, and testability). Illicit globalism is what happens when the claim crosses these boundaries without anyone checking whether it survives.

The problem is not that claims should never cross fragments — they often must. The problem is that the crossing happens silently. A theorem proven in a mathematical fragment becomes a design invariant in an architectural fragment, then a test oracle in an implementation fragment, with each transition smuggling in new assumptions while appearing to carry the same justified claim.

Fragment calculus addresses this by replacing the question "is claim c true?" with "in which fragments does c survive closure, and what is the cost of making it survive elsewhere?" The Delta operator Δ(F → G) computes the smallest set of assumption and claim changes needed for compatibility. The [tension index](./tension-index.md) estimates the cost before the computation is performed.

See the full treatment in [Fragment Calculus](../texts/fragment-calculus.md).
