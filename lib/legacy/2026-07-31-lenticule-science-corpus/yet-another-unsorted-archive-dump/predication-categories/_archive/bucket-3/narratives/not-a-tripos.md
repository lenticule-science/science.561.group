---
kind: narrative
discusses: [predication-hyperdoctrine, predication-fiber-algebra, temporal-2-category, dual-predication-hyperdoctrine]
---

# The predication hyperdoctrine is not a tripos

Triposes ([@hyland-johnstone-pitts1980], [@pitts1981]/2002) are Heyting-valued hyperdoctrines with a generic predicate that yield toposes via the tripos-to-topos construction. The [predication hyperdoctrine](../objects/predication-hyperdoctrine.md) is *not* a tripos, for four reasons that are worth flagging early to head off reader confusion.

1. **Fiber structure.** Tripos fibers are Heyting algebras. knowledge presheaf fibers are distributive bilattices with [residuated $\odot \dashv \Rightarrow$](../objects/predication-fiber-algebra.md) — not Heyting.

2. **Preorder truncation.** Triposes require preorder fibers. The knowledge presheaf setting needs genuine 2-categorical fiber structure to carry the KZ diamond of the [temporal 2-category](../objects/temporal-2-category.md); collapsing to preorders would discard the 2-cells where the non-Scott-continuous regimes live.

3. **No generic predicate.** Triposes postulate a universal predicate-classifier $\Sigma$. The predication hyperdoctrine has no such object.

4. **Base category.** Triposes live over 1-categorical bases. The full predication-hyperdoctrine structure is 2-categorical.

Consequently the tripos-to-topos construction does not directly apply here. The [@pitts2002] §4 notion of a comprehension property weaker than Lawvere's that still supports topos construction has a bilattice analogue: Belnap-designated comprehension over $\{\mathbf{t}, \top\}$ — see [Belnap-designated comprehension](../questions/belnap-designated-comprehension.md).

The honest reading is structural: the [Priestley-dualization route](priestley-route-significance.md) carries the cohomology this work points at, *because* the primal side is not a topos and primal sheaf cohomology is therefore not the natural target. The dual paired Priestley space, with its dual settling algebra, is.
