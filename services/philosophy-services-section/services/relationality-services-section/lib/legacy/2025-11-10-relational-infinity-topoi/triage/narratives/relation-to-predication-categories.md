---
name: relation-to-predication-categories
type: narrative
class: cross-vault-relationship
discusses: [relational-infinity-topos, ritm, kz-comonad-G, heyting-algebra-shadow]
depends-on:
  - "../../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/_index.md"
  - relational-infinity-topos
  - kz-comonad-G
  - heyting-algebra-shadow
---

This subtheory is the **geometric layer** above [predication categories](../../../../theories/predication-categories/_index.md). Three relationships hold the two together; understanding all three is what makes this subtheory compose with the rest of the program.

**1. Bilattice valuations.** Every [relational ∞-topos](../objects/relational-infinity-topos.md) carries a chosen [bilattice](../../../../theories/predication-categories/objects/bilattice.md) of valuations, with the [knowledge order](../../../../theories/predication-categories/concepts/knowledge-order.md) and [truth order](../../../../theories/predication-categories/concepts/truth-order.md) imported wholesale from predication categories. The relational ∞-topos is *not* defined over a Boolean base; the bilattice is structural. This is what the source drafts often call "the four-valued relational infinity-topos." All references to "valuation," "knowledge," and "truth" in this subtheory route to the predication-categories slugs.

**2. KZ-laxity is the same axiom.** Predication categories' [closure 2-monad](../../../../theories/predication-categories/morphisms/closure-2-monad.md) is, in its 2-categorical formulation, a KZ-monad on the 2-category $\mathbf{PrFib}$ of predication fibrations. This subtheory's [KZ comonad $G$](../morphisms/kz-comonad-G.md) is a KZ-comonad on a cohesive ∞-topos. The two operators live on different 2-categories and have different (co)variances, but the lax-idempotence axiom — the Kelly–Lack K1 condition — is the same in both. The Heyting-closure shadow theorem and the [kz-comonad-vs-closure-2-monad question](../questions/kz-comonad-vs-closure-2-monad.md) explore whether there is a comparison morphism.

**3. Modal operators downstream.** Predication categories' [modal necessity operator](../../../../theories/predication-categories/morphisms/modal-necessity-operator.md) and modal possibility operator are the *fiberwise shadows* of this subtheory's [flat comonad](../morphisms/flat-comonad.md) and [sharp monad](../morphisms/sharp-monad.md): pick a $\mathbf{B}$-valued sheaf on $\mathcal{H}$, restrict the cohesive functor to the world-indexed [predication fiber algebra](../../../../theories/predication-categories/objects/predication-fiber-algebra.md), and what remains is the bilattice-Kripke modal operator predication categories already names.

The shape of this relationship — geometric ∞-categorical layer above 1-categorical bilattice-fibration layer — is the same as the relationship the [Lurie 2009](../../../../theories/predication-categories/references/lurie2009.md) and [Lurie–HA](../../../../theories/predication-categories/references/lurie-ha.md) references in predication categories anticipate. This subtheory is one concrete realization of that anticipated lift, focused on the cohesive-quadruple / SD-constructibility content rather than on the six-functor / active-∞-categorical algebra content.

What this subtheory does *not* import from predication categories: the [predication settling](../../../../theories/predication-categories/objects/predication-settling.md) — that is the 1-categorical settling-on-a-bitopological-site, replaced here by the ∞-categorical [recursive realization](../teaching/explanations/recursive-realization.md) on a stratified directed ∞-site. The two are structurally analogous but live on different bases. They will eventually be linked by a comparison-of-bases theorem (not in scope here).
