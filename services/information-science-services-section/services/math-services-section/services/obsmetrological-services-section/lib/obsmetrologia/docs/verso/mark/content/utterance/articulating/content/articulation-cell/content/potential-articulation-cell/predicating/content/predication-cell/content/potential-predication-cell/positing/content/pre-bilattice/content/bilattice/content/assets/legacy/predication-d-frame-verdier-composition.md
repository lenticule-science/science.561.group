---
type: theorem
status: proved
depends-on: [verdier-duality-bitopological-site, q-enriched-curry-grothendieck-site, quantale-enriched-cosheaf, d-frame-valued-sheaf, internal-z2-gauge, negation, bilattice-negation-on-d-frame-valued-sheaves, transfinite-bounded-regime-d-frame-cohomology, aperiodic-regime-d-frame-cohomology, paraconsistent-settling-associated-sheaf, negative-paraconsistent-settling-sheaf]
---

# d-frame Verdier composition: spatial × value-category dualities

The d-frame setting carries two *independent* dualities that compose:

1. **Spatial Verdier duality** $\mathbb D_{\mathrm{sp}} : \mathrm{Sh}_{\mathbf{dFrm}}(\mathbf T^*) \to \mathrm{coSh}_{\mathbf{dFrm}}(\mathbf T^*)$. Established at draft level (sketch) for all four regimes via the [Q-enriched Curry equivalence on Grothendieck sites](q-enriched-curry-grothendieck-site.md), in q-fuzzy form. Inherits sketch status from the underlying spatial Verdier theorem.

2. **Value-category swap** $\mathbb D_{\mathrm{val}} : \mathrm{Sh}_{\mathbf{dFrm}} \to \mathrm{Sh}_{\mathbf{dFrm}}$ (and likewise on cosheaves), induced by bilattice [negation](../morphisms/negation.md) acting pointwise on each d-frame stalk. **Established as a strict, unconditional, involutive endofunctor in [bilattice negation on d-frame-valued sheaves](bilattice-negation-on-d-frame-valued-sheaves.md) (status: proved).** It does not depend on any spatial duality, any sheaf-cosheaf equivalence, or any cover-cardinality condition. It applies uniformly in all four regimes.

The composed duality $\mathbb D := \mathbb D_{\mathrm{sp}} \circ \mathbb D_{\mathrm{val}} = \mathbb D_{\mathrm{val}} \circ \mathbb D_{\mathrm{sp}}$ has a richer structure than either alone, and exposes a classification of d-frame-valued sheaves into self-dual vs exchange-orbit components.

The composed duality is **q-fuzzy** in all regimes (inheriting the spatial side's quantale-graded error) and **unconditionally strict on its value-category factor**. The value-category-only sub-result — classification of sheaves into negation-self-dual vs negation-exchange-paired — is unconditional on the spatial duality and applies in all regimes; that result lives in the [bilattice negation theorem](bilattice-negation-on-d-frame-valued-sheaves.md) (proved). The composed-duality content here adds the spatial-side composition.

## Commutativity of the two dualities

**Claim.** $\mathbb D_{\mathrm{sp}}$ and $\mathbb D_{\mathrm{val}}$ commute.

**Reasoning.** $\mathbb D_{\mathrm{sp}}$ acts on the *spatial structure* of the sheaf — its assignment of stalks to objects of the site, its restriction maps along site morphisms — without touching the value-category structure of each stalk. $\mathbb D_{\mathrm{val}}$ acts on the *value-category structure* of each stalk independently — applying $L_+ \leftrightarrow L_-$ swap pointwise — without touching the spatial structure.

Formally: the two dualities operate on independent factors of the data $\mathrm{Sh}_{\mathbf{dFrm}}(\mathbf T^*) = \mathrm{Func}(\mathbf T^{*,\mathrm{op}}, \mathbf{dFrm})$ — the spatial side ($\mathbf T^*$) and the value side ($\mathbf{dFrm}$). Functors of categories commute with their factor-wise dualities; hence $\mathbb D_{\mathrm{sp}}$ and $\mathbb D_{\mathrm{val}}$ commute as endofunctors / dualities on the sheaf category.

**Status:** the commutativity argument is structurally complete; it depends only on the factorization of the sheaf-functor's data into spatial × value sides. Inherits sketch status only from the underlying $\mathbb D_{\mathrm{sp}}$.

## The composed duality $\mathbb D$

The composition $\mathbb D : \mathrm{Sh}_{\mathbf{dFrm}}(\mathbf T^*) \to \mathrm{coSh}_{\mathbf{dFrm}}(\mathbf T^*)$ sends a d-frame-valued sheaf $F$ to a d-frame-valued cosheaf $\check F^\sigma$ where:

- The spatial structure is the Verdier dual cosheaf structure (per the [Verdier duality theorem](verdier-duality-bitopological-site.md)).
- The value-category structure has $L_+$ and $L_-$ swapped at each stalk (per the [bilattice negation theorem](bilattice-negation-on-d-frame-valued-sheaves.md)).

**Order-2 property (q-fuzzy form).** Applying $\mathbb D$ twice gives back the original sheaf up to fuzzy equivalence:

- $\mathbb D_{\mathrm{sp}}^2 \simeq_{q^{\mathrm{glob}}} \mathrm{id}$ — q-fuzzy involution. The spatial Verdier round-trip in the [Q-enriched Curry on Grothendieck sites](q-enriched-curry-grothendieck-site.md) is identity-up-to-$q^{\mathrm{glob}}$-fuzzy. In the strict-adjunction limit ($q^{\mathrm{glob}} = 1$), it is a strict involution; in general it carries the global Curry fuzziness.
- $\mathbb D_{\mathrm{val}}^2 = \mathrm{id}$ — strict involution, **unconditionally** (per [bilattice negation theorem](bilattice-negation-on-d-frame-valued-sheaves.md)).

Hence $\mathbb D^2 = (\mathbb D_{\mathrm{sp}} \circ \mathbb D_{\mathrm{val}})^2 = \mathbb D_{\mathrm{sp}}^2 \circ \mathbb D_{\mathrm{val}}^2 \simeq_{q^{\mathrm{glob}}} \mathrm{id}$. The composed-duality involution inherits exactly the spatial side's fuzziness; the value-category factor adds nothing.

## Self-dual sheaves and firings

**Definition.** A d-frame-valued sheaf $F$ is **q-fuzzy self-dual under $\mathbb D$** iff $\mathbb D(F) \simeq_q F$ — where $F$ is reinterpreted as a cosheaf via the spatial Verdier $\mathbb D_{\mathrm{sp}}$, with q-fuzzy error inherited from the spatial side, and the comparison on the value-category factor is strict.

In the strict-adjunction limit ($q = 1$), this is strict isomorphism. In general — including all Scott-continuous regime cases — self-duality is q-fuzzy with quantale-graded error matching $q^{\mathrm{glob}}$.

For the [d-frame-valued settling sheaves](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/d-frame-valued-sheaf/d-frame-valued-sheaf.md) $\mathbb F_v$, self-duality has a concrete characterization in terms of **firing pattern**:

**Theorem (firing-pattern characterization of $\mathbb D$-self-duality).** *A settling $v$ in any regime has a q-fuzzy self-dual d-frame Verdier under $\mathbb D$ iff every firing of $v$ is a $\top$-firing.*

**Proof.** The negation-self-dual case (i.e., $\mathbb D_{\mathrm{val}}$-fixed) is characterized in the [bilattice negation theorem](bilattice-negation-on-d-frame-valued-sheaves.md) Proposition: $\mathbb F_v$ is negation-self-dual iff every cell is co-witnessed on both sides simultaneously — equivalently, every firing of $v$ is a $\top$-firing.

The composed-duality self-duality $\mathbb D(\mathbb F_v) \simeq_q \mathbb F_v$ requires both negation-self-duality (the value-category-side condition, characterized above) and spatial-Verdier-self-duality (the spatial-side condition, sketch-status via the Verdier duality theorem). The spatial Verdier acts on the firing-ordinal indexing and the assembly structure across firings, but does not differentiate firings by their evidence side — so the spatial side does not impose additional constraints on the firing pattern beyond what the value-category side already imposes.

Hence the firing-pattern characterization of $\mathbb D$-self-duality reduces to the value-category-side characterization, plus inheritance of the spatial-side's q-fuzzy status. $\square$

## Exchange orbits and the truth/falsity asymmetry

For non-self-dual sheaves, the orbit of $F$ under $\mathbb D$ has size 2: $\{F, \mathbb D(F)\}$. The exchange orbits classify d-frame-valued sheaves up to the composed duality:

- *$\top$-only orbit (size 1, self-dual)*: settlings whose firings are all $\top$. Pure paraconsistent settlings.
- *Truth/falsity-paired orbit (size 2)*: a settling with truth-only firings exchanges with its negation (a settling with falsity-only firings). Both presentations encode the same underlying settling structure.

This classification gives the chapter's distinctive contribution: **a structural classification of settlings into self-dual (paraconsistent) vs exchange (asymmetric in evidence direction)**. The classification is invisible to the bigraded refinement (which sees truth-side and inconsistency-side without distinguishing them by exchange orbit) and to the standard $\mathbf{Ab}$-valued Verdier duality (which has only the spatial component).

The value-category-side orbit classification — assigning each firing to $\{\text{truth-only}, \text{falsity-only}, \top\}$ and tracking $\mathbb D_{\mathrm{val}}$-orbits — is unconditionally proved via the [bilattice negation theorem](bilattice-negation-on-d-frame-valued-sheaves.md). What this composed-duality theorem adds is the spatial-side action on these orbits, which inherits sketch status from $\mathbb D_{\mathrm{sp}}$.

## Connection to predication categories' existing structure

- **Bigraded aperiodic-regime trichotomy.** The [bigraded aperiodic-regime trichotomy](../../../../../../valuation/content/knowledge-least-valuation/settling/references/bigraded-aperiodic-regime-trichotomy.md) classifies aperiodic settlings by whether their classifying invariant is consistent (truth-only), paraconsistent ($\top$-only), or mixed. Under the composed duality $\mathbb D$:
  - *Pure consistent* settlings (truth-only firings) are in exchange orbits with *pure dual-consistent* settlings (falsity-only firings).
  - *Pure paraconsistent* settlings ($\top$-only firings) are self-dual under $\mathbb D$ — they are the *fixed points* of the composed duality, and the bigraded trichotomy's paraconsistent sub-stratum is exactly the self-dual orbit.
  - *Mixed* settlings have a complicated orbit structure — partial self-duality on their $\top$-firings, exchange on their truth-only and falsity-only firings.

- **Inconsistency sheaf $\mathcal F^{(\top)}$.** The [inconsistency sheaf](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/inconsistency-sheaf/inconsistency-sheaf.md) tracks $\top$-cells specifically. Under the $\mathbb D_{\mathrm{val}}$ swap, $\mathcal F^{(\top)}$ is fixed (since $\top$-cells are negation-invariant). This provides an alternative characterization of the self-dual orbit: a settling is self-dual under $\mathbb D$ iff its full d-frame structure is concentrated on the inconsistency sheaf.

## What remains sketch

The composed-duality theorem inherits sketch status only from the spatial-Verdier side. Concretely:

- The commutativity $\mathbb D_{\mathrm{sp}} \circ \mathbb D_{\mathrm{val}} = \mathbb D_{\mathrm{val}} \circ \mathbb D_{\mathrm{sp}}$: structurally clear; sketch only because $\mathbb D_{\mathrm{sp}}$ itself is sketch.
- The order-2 property $\mathbb D^2 \simeq_{q^{\mathrm{glob}}} \mathrm{id}$: depends on $\mathbb D_{\mathrm{sp}}^2 \simeq_{q^{\mathrm{glob}}} \mathrm{id}$, which is the round-trip property of spatial Verdier (inherits sketch).
- The firing-pattern characterization of $\mathbb D$-self-duality: the value-category factor is proved (per [bilattice negation theorem](bilattice-negation-on-d-frame-valued-sheaves.md)); the spatial-side check that no additional constraints are imposed is structural but inherits the spatial Verdier's sketch status.

When the spatial Verdier duality firms (Layer 2/3 of the cellular extension plan), all of these inherited-sketch claims firm with it.
