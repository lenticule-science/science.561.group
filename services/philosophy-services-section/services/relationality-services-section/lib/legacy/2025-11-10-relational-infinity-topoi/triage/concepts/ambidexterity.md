---
name: ambidexterity
type: concept
class: limit-colimit-property
symbol: "\\mathrm{Amb}"
depends-on:
  - constructibility
  - cohesive-infinity-topos
  - "../../../../../relational-calculus/triage/concepts/stratifying.md"
---

An $\infty$-categorical diagram $F : \mathcal{I} \to \mathcal{H}$ is **ambidextrous** when its homotopy colimit $\mathrm{colim}\, F$ and homotopy limit $\mathrm{lim}\, F$ canonically agree — there is a comparison map $\mathrm{Nm}_F : \mathrm{colim}\, F \to \mathrm{lim}\, F$ (the **norm map**) that is an equivalence.

## In the relational setting

In this subtheory the relevant case is $\mathcal{I}$ the indexing $\infty$-category of a [stratified directed ∞-site](../objects/stratified-directed-infinity-site.md) and $F$ an [SD-constructible](constructibility.md) diagram. The forward (degree-raising) arrows assemble $F$ via *latching* — its colimit-side data — and the backward (degree-lowering) arrows assemble $F$ via *matching* — its limit-side data. The [latching functor](../morphisms/latching-functor.md) and [matching functor](../morphisms/matching-functor.md) compute these two assemblies.

**SD-ambidexterity** is the assertion that for SD-constructible $F$, the comparison $\mathrm{colim}\, F \to \mathrm{lim}\, F$ — equivalently, the [ambidexterity comparison](../morphisms/ambidexterity-comparison.md) of latching against matching — is an equivalence. This is the diagrammatic content of the [SD-ambidexterity theorem](../theorems/sd-ambidexterity.md).

## Reading

Diagrammatic statement of *existence-observation duality*: $F$ built bottom-up (homotopy colimit) and checked top-down (homotopy limit) yields the same object after stabilization. Geometric face of the [stratifying](../../../../../relational-calculus/triage/concepts/stratifying.md) "Ambidexterity" theorem.

## Caveat — scope of ambidexterity

The three source drafts disagree on the scope of ambidexterity: draft 1 proves it for SD-constructible diagrams on the SD ∞-site; draft 2 states it for the full [field of existence](../objects/field-of-existence.md). These are not equivalent claims. See [ambidexterity-scope](../questions/ambidexterity-scope.md).

## Lineage

The pattern goes back to [Hopkins–Lurie](../references/lurie-htt-2009.md)'s ambidexterity in stable $\infty$-categories and is recast for stratified spaces in [Ayala–Francis–Rozenblyum 2015](../references/ayala-francis-rozenblyum-2015.md). The relational use here imports their framework wholesale.
