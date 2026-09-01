---
name: filter-induced-restriction-of-ritm
type: theorem
class: restriction
status: sketch
lean: RelationalInfinityTopoi.filter_induced_restriction_of_ritm
depends-on:
  - ritm
  - relational-infinity-topos
  - "../../../../../relational-calculus/triage/theorems/filter-induced-reflexive-reconstruction.md"
---

For a [relational ∞-topos](../objects/relational-infinity-topos.md) $(\mathcal{H}, \mathbf{B}, \mathcal{S})$ and a Filter $F : \mathcal{H} \to \mathcal{H}$ — an idempotent endofunctor commuting with each functor of the [cohesive quadruple](../morphisms/cohesive-quadruple.md) — the fixed-point full sub-$\infty$-category $\mathrm{Fix}(F) \subseteq \mathcal{H}$ inherits the entire [RITM](../objects/ritm.md) structure by restriction.

That is: $\mathrm{Fix}(F)$ is itself a cohesive ∞-topos with its own cohesive quadruple obtained by restriction of $(\Pi^{\to}, \Box_r, \Diamond_l, \nabla^{\leftarrow})$ to fixed-point objects.

## Statement

Let $F$ be a Filter as above. Then:

1. The restrictions of the four cohesive functors to $\mathrm{Fix}(F)$ are well-defined and remain adjoint in the same chain.
2. The restricted quadruple is itself a cohesive quadruple — i.e. $\mathrm{Fix}(F)$ is a sub-cohesive-∞-topos of $\mathcal{H}$.
3. The KZ-laxity axioms for $\Box_r|_{\mathrm{Fix}(F)}$ and $\Diamond_l|_{\mathrm{Fix}(F)}$ follow from the ambient axioms.
4. Every theorem of this subtheory restricts to $\mathrm{Fix}(F)$ — there is no "view from nowhere" required; every Filter-perspective on the relational ∞-topos reproduces the entire calculus internally.

## Proof sketch

Each cohesive functor commutes with $F$ by hypothesis (this is the *defining* property of a Filter). Functors that commute with $F$ preserve $\mathrm{Fix}(F)$, hence restrict. Adjointness, idempotence, and KZ-laxity are all preserved by restriction to a sub-$\infty$-category fixed by the Filter. $\square$

## Status

Sketch. The argument is direct from the relational-calculus pilot's [filter-induced reflexive reconstruction](../../../../../relational-calculus/triage/theorems/filter-induced-reflexive-reconstruction.md), which is itself at `sketch` status. Promote together.
