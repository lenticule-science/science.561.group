---
name: kz-comonad-vs-closure-2-monad
type: question
class: structural-comparison
status: open
explores: [kz-comonad-G, closure-2-monad, heyting-closure-shadow]
depends-on:
  - "../../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md"
  - kz-comonad-G
  - heyting-closure-shadow
---

This subtheory's [KZ comonad $G = \Box_r \Diamond_l$](../morphisms/kz-comonad-G.md) on a [cohesive ∞-topos](../teaching/explanations/cohesive-infinity-topos.md) and predication categories' [closure 2-monad](../../../../theories/predication-categories/morphisms/closure-2-monad.md) on $\mathbf{PrFib}(\mathcal{C})$ are both KZ structures with the same Kelly–Lack K1 lax-idempotence axiom, but they live on different 2-categories and have different (co)variances.

Is there a *comparison morphism* between them?

## The shape of a comparison

A comparison would be a 2-functor

$$\Phi \;:\; \mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E) \;\to\; \mathcal{H}$$

(or its dual) sending the closure 2-monad's $\mathrm{Cl}$ to the cohesive KZ comonad's $G$ — at least up to canonical equivalence. The natural candidate is "take a predication fibration to its $\mathbf{B}$-valued sheaf on the corresponding cohesive ∞-site." The closure 2-monad acts on the predication-fibration side; the cohesive KZ comonad acts on the sheaf side; the comparison would say these actions are intertwined by the sheaf-correspondence.

## What this would buy

If a comparison exists:

1. The [Heyting-closure shadow theorem](../theorems/heyting-closure-shadow.md) becomes a *consequence* of the comparison — the algebraic shadow is just the comparison restricted to subobjects.
2. Predication categories' Lean proofs of K1 lax-idempotence transport directly to this subtheory's KZ axiom.
3. The 1-categorical / ∞-categorical interface between predication categories and this subtheory becomes clean rather than ad-hoc.

## What this would require

A 2-functorial comparison requires a sheaf-correspondence between bilattice-valued predication fibrations and bilattice-valued sheaves on a cohesive ∞-site — itself a non-trivial construction. The right setting is probably a derived / ∞-categorical sheaf $\infty$-topos rather than a 1-categorical one, which means the comparison's source has to also be ∞-categorical (so first lift the closure 2-monad to closure (∞, 2)-comonad on $\mathbf{PrFib}^\infty$).

## Resolution

Pursue this jointly with the sketched ∞-categorical lift of predication categories' [Lurie 2009 / Lurie HA references](../../../../theories/predication-categories/references/lurie2009.md). Until done, the two operators are kept formally distinct, with the [`heyting-closure-shadow`](../theorems/heyting-closure-shadow.md) theorem serving as the scalar witness of the relationship.
