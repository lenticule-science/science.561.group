---
type: theorem
status: proved
depends-on: [d-frame-valued-sheaf, internal-z2-gauge, negation, d-frame, bitopological-settling-site]
---

# Bilattice negation acts strictly involutively on d-frame-valued sheaves

The **value-category factor** of the [d-frame Verdier composition](../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-verdier-composition.md). An unconditionally strict involution on the category of d-frame-valued sheaves over the bitopological settling site, induced pointwise by bilattice [negation](../morphisms/negation.md) on each d-frame stalk. This theorem isolates the value-category-side content from the spatial Verdier duality (which inherits open structural questions); the negation action established here is independent of any spatial duality and applies in *all four regimes*.

## Setup

Let $\mathbb F : (\mathbf T^*)^{\mathrm{op}} \to \mathbf{dFrm}$ be a d-frame-valued sheaf on the [bitopological settling site](../../../../bitopological-settling-site/bitopological-settling-site.md). At each object $\sigma \in \mathbf T^*$, the stalk $\mathbb F(\sigma) = (L_+(\sigma), L_-(\sigma), \mathrm{con}_\sigma, \mathrm{tot}_\sigma)$ is a d-frame.

Bilattice [negation](../morphisms/negation.md) $\neg : \mathbf{FOUR} \to \mathbf{FOUR}$ swaps $\mathbf t \leftrightarrow \mathbf f$ and is involutive ($\neg \circ \neg = \mathrm{id}$). At the d-frame level, negation induces the **value-category swap**

$$\mathbb D_{\mathrm{val}}(\mathbb F)(\sigma) \;:=\; (L_-(\sigma),\, L_+(\sigma),\, \mathrm{con}_\sigma^\sigma,\, \mathrm{tot}_\sigma^\sigma)$$

where $(-)^\sigma$ denotes the relation with arguments swapped (since $\mathrm{con}, \mathrm{tot} \subseteq L_+ \times L_-$, swapping $L_\pm$ requires swapping the relation's arguments).

## The theorem

**Theorem (negation gauge on d-frame-valued sheaves).** *The value-category swap $\mathbb D_{\mathrm{val}} : \mathrm{Sh}_{\mathbf{dFrm}}(\mathbf T^*) \to \mathrm{Sh}_{\mathbf{dFrm}}(\mathbf T^*)$ is a strict, unconditional, involutive endofunctor on the category of d-frame-valued sheaves over the bitopological settling site. In particular:*

1. **Functoriality.** *$\mathbb D_{\mathrm{val}}$ acts on morphisms of d-frame-valued sheaves: a sheaf morphism $\phi : \mathbb F \to \mathbb G$ corresponds to a sheaf morphism $\mathbb D_{\mathrm{val}}(\phi) : \mathbb D_{\mathrm{val}}(\mathbb F) \to \mathbb D_{\mathrm{val}}(\mathbb G)$ defined componentwise as $(L_+, L_-)$-swap on each stalk-level d-frame morphism.*

2. **Strict involution.** *$\mathbb D_{\mathrm{val}}^2 = \mathrm{id}_{\mathrm{Sh}_{\mathbf{dFrm}}}$, holding strictly on the nose, not up to fuzzy equivalence.*

3. **Independence of spatial duality.** *The action depends only on the value-category structure $\mathbf{dFrm}$ (specifically, on bilattice negation as an involutive structural feature). It does not depend on any spatial duality, any sheaf-cosheaf equivalence, or any cover-cardinality condition. It applies uniformly in all four regimes: strict, Scott-continuous, transfinite-bounded, aperiodic.*

## Proof

**(1) Functoriality.** A morphism of d-frame-valued sheaves $\phi : \mathbb F \to \mathbb G$ is, at each $\sigma$, a [d-frame morphism](../morphisms/d-frame-morphism.md) $\phi_\sigma = (\phi_\sigma^+, \phi_\sigma^-) : \mathbb F(\sigma) \to \mathbb G(\sigma)$, with $\phi_\sigma^\pm$ frame morphisms preserving the consistency and totality relations.

Define $\mathbb D_{\mathrm{val}}(\phi)_\sigma := (\phi_\sigma^-, \phi_\sigma^+)$ — the *swap* of the two frame morphisms. This is a d-frame morphism $\mathbb D_{\mathrm{val}}(\mathbb F)(\sigma) \to \mathbb D_{\mathrm{val}}(\mathbb G)(\sigma)$ because:

- $\phi_\sigma^-$ is a frame morphism $L_-(\mathbb F(\sigma)) \to L_-(\mathbb G(\sigma))$, which is now the $L_+$-side of the swapped d-frames.
- Similarly $\phi_\sigma^+$ becomes the $L_-$-side morphism in the swapped setting.
- The consistency / totality relation preservation transfers: if $\phi_\sigma$ preserves $\mathrm{con}_\sigma$ at $\mathbb F(\sigma)$, then $(\phi_\sigma^-, \phi_\sigma^+)$ preserves $\mathrm{con}_\sigma^\sigma$ (the swapped relation) at $\mathbb D_{\mathrm{val}}(\mathbb F)(\sigma)$ — because the swap simultaneously transposes both the stalk's relations and the morphism's components.

Naturality of $\mathbb D_{\mathrm{val}}$ in $\sigma$: the d-frame restrictions $\mathbb F(\tau) \to \mathbb F(\sigma)$ along site morphisms are themselves d-frame morphisms; the same swap operation applies and commutes with the restriction action. $\square$

**(2) Strict involution.** Computing $\mathbb D_{\mathrm{val}}^2$ at a stalk $\mathbb F(\sigma) = (L_+, L_-, \mathrm{con}, \mathrm{tot})$:

- After one swap: $\mathbb D_{\mathrm{val}}(\mathbb F)(\sigma) = (L_-, L_+, \mathrm{con}^\sigma, \mathrm{tot}^\sigma)$.
- After two swaps: $\mathbb D_{\mathrm{val}}^2(\mathbb F)(\sigma) = (L_+, L_-, (\mathrm{con}^\sigma)^\sigma, (\mathrm{tot}^\sigma)^\sigma) = (L_+, L_-, \mathrm{con}, \mathrm{tot}) = \mathbb F(\sigma)$.

The relation-argument swap $(-)^\sigma$ is itself involutive: swapping the arguments of $\mathrm{con} \subseteq L_+ \times L_-$ twice returns to the original. Hence $\mathbb D_{\mathrm{val}}^2 = \mathrm{id}$ stalk-wise, hence as a functor on sheaves. $\square$

**(3) Independence of spatial duality.** $\mathbb D_{\mathrm{val}}$'s definition uses only:

- The d-frame structure on each stalk (provided by $\mathbb F$'s value category being $\mathbf{dFrm}$).
- Bilattice negation $\neg$, an involutive structural feature of any distributive bilattice.

It does *not* use:

- The Q-enriched Curry equivalence / Verdier duality on the bitopological site (whose Layer 2/3 status is open).
- Any cover-cardinality condition on the site.
- Any cosheaf or sheaf-cosheaf relationship.

The value-category swap is a strict structural feature of the category $\mathrm{Sh}_{\mathbf{dFrm}}(\mathbf T^*)$, valid in all four regimes. $\square$

## Self-dual sheaves under the value-category swap

A d-frame-valued sheaf $\mathbb F$ is **negation-self-dual** iff $\mathbb D_{\mathrm{val}}(\mathbb F) \cong \mathbb F$ canonically. By the construction:

$$\mathbb D_{\mathrm{val}}(\mathbb F) \cong \mathbb F \quad\iff\quad L_+(\sigma) \cong L_-(\sigma) \text{ and the relations are symmetric, at every } \sigma.$$

For the [d-frame-valued settling sheaves](../../d-frame-valued-sheaf/d-frame-valued-sheaf.md) $\mathbb F_v$ specifically, negation-self-duality has the following firing-pattern characterization:

**Proposition (negation-self-dual settling-sheaves).** *$\mathbb F_v$ is negation-self-dual iff every cell is co-witnessed simultaneously on both evidence sides (i.e., every settled cell is a $\top$-cell) — equivalently, every firing of $v$ is a $\top$-firing.*

**Proof.** $\mathbb F_v(\sigma)$'s $L_+$ component is the powerset frame on truth-positive cells at $\sigma$; the $L_-$ component is the powerset frame on falsity-positive cells. Negation-self-duality requires $L_+(\sigma) = L_-(\sigma)$ as frames, which holds iff the truth-positive and falsity-positive cell-sets coincide at $\sigma$. The latter holds iff every settled cell at $\sigma$ has both a truth-component and a falsity-component — i.e., is a $\top$-cell.

For settlings, the non-trivial firings are exactly the cell-additions; if every firing is a $\top$-firing, every newly-added cell is $\top$, so the truth-positive and falsity-positive cell-sets agree at every $\sigma$ in the settling. Hence $\mathbb F_v$ is negation-self-dual. Conversely, if some firing $\mu$ is truth-only or falsity-only, the truth-positive and falsity-positive cell-sets differ at $\sigma = \mu$, breaking negation-self-duality. $\square$
