---
name: stratified-directed-infinity-site
type: object
class: site
symbol: "\\mathcal{S}"
realizes: [stratifying, exit-infinity-category]
depends-on:
  - exit-infinity-category
  - cohesive-infinity-topos
  - "../../../../../relational-calculus/triage/concepts/stratifying.md"
---

A **stratified directed ∞-site** ("SD ∞-site") is an indexing $\infty$-category $\mathcal{S}$ equipped with:

1. A degree function $\deg : \mathrm{Obj}(\mathcal{S}) \to \mathbb{N}$ (or any well-founded poset).
2. A factorization of every morphism into a *forward* part (strictly raising degree) and a *backward* part (strictly lowering degree).
3. Finite [latching](../teaching/explanations/latching-matching.md) (forward) and matching (backward) neighborhoods at every position.
4. A *stratify dynamic* $\mathrm{Strat} : \mathrm{Diag}(\mathcal{S}, \mathcal{H}) \to \mathrm{Diag}(\mathcal{S}, \mathcal{H})$ that propagates along forward arrows and reconciles along backward arrows, equipped with a $\mathrm{PreservesCore}$ condition that the [modalities $\Box, \Diamond$](../teaching/explanations/modality.md) commute with $\mathrm{Strat}$.

## The indexing $\infty$-category

The most structured class of examples uses the [exit ∞-category](../teaching/explanations/exit-infinity-category.md) of a stratified topological space: $\mathcal{S} := \mathrm{Exit}(X)$ for $X \to P$ a stratification. The forward arrows are exit-paths (degree-raising); the backward arrows are entry-paths (degree-lowering); the latching at $i$ is the homotopy colimit over exit-paths into $i$ from lower strata; the matching at $i$ is the homotopy limit over exit-paths out of $i$ to higher strata. This is the construction of [Ayala–Francis–Rozenblyum 2015](../references/ayala-francis-rozenblyum-2015.md).

## In a relational ∞-topos

Inside a [relational ∞-topos](relational-infinity-topos.md) $(\mathcal{H}, \mathbf{B}, \mathcal{S})$, the SD ∞-site $\mathcal{S}$ is the chosen indexing structure for [recursive realization](../teaching/explanations/recursive-realization.md). The combination $(\mathcal{H}, \mathcal{S})$ is what the source drafts mean by "stratified directed cohesive ∞-topos."

## Used by

- [`objects/sd-constructible-stack.md`](sd-constructible-stack.md) — the moduli stack of SD-constructible diagrams on $\mathcal{S}$.
- [`morphisms/latching-functor.md`](../morphisms/latching-functor.md), [`morphisms/matching-functor.md`](../morphisms/matching-functor.md).
- [`theorems/sd-ambidexterity.md`](../theorems/sd-ambidexterity.md), [`theorems/recursive-realization-theorem.md`](../theorems/recursive-realization-theorem.md).
