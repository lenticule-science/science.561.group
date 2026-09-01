---
name: relational-infinity-topos
type: object
class: topos
symbol: "(\\mathcal{H}, \\mathbf{B}, \\mathcal{S})"
realizes: [cohesive-infinity-topos, knowledge-order, truth-order]
depends-on:
  - "../../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice.md"
  - "../../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md"
  - cohesive-infinity-topos
  - stratified-directed-infinity-site
---

A **relational ∞-topos** is a triple $(\mathcal{H}, \mathbf{B}, \mathcal{S})$ in which:

1. $\mathcal{H}$ is a [cohesive ∞-topos](../teaching/explanations/cohesive-infinity-topos.md) over $\infty\text{-Grpd}$, equipped with its [cohesive quadruple](../morphisms/cohesive-quadruple.md) $\Pi^{\to} \dashv \Box_r \dashv \Diamond_l \dashv \nabla^{\leftarrow}$.
2. $\mathbf{B}$ is a [bilattice](../../../../theories/predication-categories/objects/bilattice.md) of valuations, with [knowledge order](../../../../theories/predication-categories/concepts/knowledge-order.md) $\leq_k$ and [truth order](../../../../theories/predication-categories/concepts/truth-order.md) $\leq_t$, and a chosen $\mathbf{B}$-valued predication-fibration structure on $\mathcal{H}$ — equivalently, a fibered [predicate category](../../../../theories/predication-categories/objects/predicate-category.md) inside $\mathcal{H}$ valued in [predication fiber algebras](../../../../theories/predication-categories/objects/predication-fiber-algebra.md).
3. $\mathcal{S}$ is a [stratified directed ∞-site](stratified-directed-infinity-site.md) in $\mathcal{H}$ — a chosen indexing $\infty$-category with degree function and latching/matching neighborhoods.

The triple is what the source drafts variously call "the relational ∞-topos." This typed object packages all three layers into a single typed object whose `depends-on:` list terminates in the bilattice (predication-categories), the predicate category (predication-categories), and the cohesive ∞-topos / SD site (this subtheory).

## Equipped morphisms

The relational ∞-topos comes equipped with:

- The cohesive quadruple, repackaged as the modality [RITM](ritm.md).
- The [KZ comonad $G$](../morphisms/kz-comonad-G.md) on $\mathcal{H}$, computing flow.
- The [latching](../morphisms/latching-functor.md) and [matching](../morphisms/matching-functor.md) functors on the indexing $\infty$-category $\mathcal{S}$.
- The [Verdier-duality functor](../morphisms/verdier-duality-functor.md) on $\mathbf{B}$-valued sheaves over $\mathcal{S}$.

Each is typed separately under `morphisms/`.

## Theorem coverage

Theorems about relational ∞-topoi: [RITM existence](../theorems/ritm-existence.md), [SD-ambidexterity](../theorems/sd-ambidexterity.md), [recursive realization](../theorems/recursive-realization-theorem.md), [Verdier duality on the SD site](../theorems/verdier-duality-on-sd-site.md), [Heyting-closure shadow](../theorems/heyting-closure-shadow.md), [RT self-stabilization](../theorems/rt-self-stabilization.md), [filter-induced restriction of RITM](../theorems/filter-induced-restriction-of-ritm.md).
