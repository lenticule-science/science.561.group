---
name: exit-infinity-category-object
type: object
class: indexing-category
symbol: "\\mathrm{Exit}(X)"
realizes: [exit-infinity-category]
depends-on:
  - exit-infinity-category
  - "../../../../../relational-calculus/triage/concepts/stratifying.md"
---

For a stratified topological space $X \to P$ over a poset $P$, the **exit ∞-category** $\mathrm{Exit}(X)$ is the $\infty$-category whose objects are points $x \in X$ and whose 1-morphisms are exit paths: continuous maps $\gamma : [0,1] \to X$ such that the composite $[0,1] \to X \to P$ is *non-decreasing* in the poset order on $P$. Higher cells are exit-path homotopies, themselves required to be non-decreasing on the poset coordinate.

This is the typed-object packaging of the [exit-∞-category concept](../teaching/explanations/exit-infinity-category.md): the concept names the role, this object names the construction.

## Functoriality

The construction $X \mapsto \mathrm{Exit}(X)$ is functorial: a stratified map $f : X \to Y$ over a poset map $P_X \to P_Y$ induces $\mathrm{Exit}(f) : \mathrm{Exit}(X) \to \mathrm{Exit}(Y)$. By [Ayala–Francis–Rozenblyum 2015](../references/ayala-francis-rozenblyum-2015.md), this lifts to an equivalence between the $\infty$-category of conically smooth stratified spaces and a full sub-$\infty$-category of $\mathrm{Cat}_{\infty}$.

## Use in this subtheory

Used as the indexing $\infty$-category $\mathcal{S}$ of a [stratified directed ∞-site](stratified-directed-infinity-site.md), with the degree function induced by the poset $P$ and the forward / backward arrows being the exit paths and their reverses respectively.

## Worked example

The [exit category of a 2-stratum interval](../examples/exit-category-of-stratified-space.md) is the walking arrow $\{0 \to 1\}$ — the same indexing category that appears as the base of the [minimal presheaf cell](../examples/minimal-presheaf-cell.md). This coincidence is what makes $\mathrm{PSh}(\{0 \to 1\})$ the minimal stratified-directed cohesive model.
