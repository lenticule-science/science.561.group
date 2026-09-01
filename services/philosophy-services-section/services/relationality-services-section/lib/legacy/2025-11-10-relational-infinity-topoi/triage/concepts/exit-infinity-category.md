---
name: exit-infinity-category
type: concept
class: indexing-infinity-category
symbol: "\\mathrm{Exit}"
depends-on:
  - "../../../../../relational-calculus/triage/concepts/stratifying.md"
---

For a stratified topological space $X \to P$ over a poset $P$, the **exit ∞-category** $\mathrm{Exit}(X)$ is the $\infty$-category whose objects are points of $X$ and whose morphisms are *exit paths* — paths that, at each instant, either remain in their current stratum or move to a strictly higher stratum (never re-enter a lower stratum).

The 1-categorical version goes back to the work on stratified spaces in the 1970s; the $\infty$-categorical version is [Ayala–Francis–Rozenblyum 2015](../references/ayala-francis-rozenblyum-2015.md), where it is shown to be the natural indexing $\infty$-category for *constructible sheaves* on $X$.

## In this subtheory

The exit ∞-category is the indexing $\infty$-category $\mathcal{I}$ over which [SD-constructible](constructibility.md) diagrams are defined. The [stratified directed ∞-site](../objects/stratified-directed-infinity-site.md) packages $\mathrm{Exit}(X)$ together with the degree function and the latching/matching neighborhoods.

The typed object [`exit-infinity-category-object`](../objects/exit-infinity-category-object.md) is the typed version of the construction $X \mapsto \mathrm{Exit}(X)$.
