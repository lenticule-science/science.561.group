---
kind: theorem
status: sketch
depends-on: [verdier-duality-bitopological-site, q-enriched-curry-grothendieck-site, quantale-enriched-cosheaf, d-frame-valued-sheaf, internal-z2-gauge, negation, transfinite-bounded-regime-d-frame-cohomology, aperiodic-regime-d-frame-cohomology, paraconsistent-settling-associated-sheaf, negative-paraconsistent-settling-sheaf]
---

# d-frame Verdier composition: spatial × value-category dualities

The d-frame setting carries two *independent* dualities that compose:

1. **Spatial Verdier duality** $\mathbb{D}_{\mathrm{sp}}$: $\mathrm{Sh}_{\mathbf{dFrm}}(\mathbf{T}^*) \to \mathrm{coSh}_{\mathbf{dFrm}}(\mathbf{T}^*)$. Established at draft level for the strict and Scott-continuous regimes via the [Q-enriched Curry equivalence on Grothendieck sites](q-enriched-curry-grothendieck-site.md), in q-fuzzy form (with quantale-graded error tracked by the Curry theorem's global fuzziness profile $q^{\mathrm{glob}}$). Open in the transfinite-bounded and aperiodic regimes pending Layer 3.
2. **Value-category swap** $\mathbb{D}_{\mathrm{val}}$: $\mathrm{Sh}_{\mathbf{dFrm}} \to \mathrm{Sh}_{\mathbf{dFrm}}$ (and likewise on cosheaves), induced by bilattice [negation](../morphisms/negation.md) acting on each d-frame stalk: $(L_+, L_-, \mathrm{con}, \mathrm{tot}) \mapsto (L_-, L_+, \mathrm{con}^\sigma, \mathrm{tot}^\sigma)$ where $\sigma$ swaps the relations' arguments. **This duality is unconditional and strict** — it depends only on the d-frame value category's intrinsic structure (bilattice negation), not on any spatial duality.

The composed duality $\mathbb{D} := \mathbb{D}_{\mathrm{sp}} \circ \mathbb{D}_{\mathrm{val}} = \mathbb{D}_{\mathrm{val}} \circ \mathbb{D}_{\mathrm{sp}}$ has a richer structure than either alone, and exposes a classification of d-frame-valued sheaves into self-dual vs exchange-orbit components.

The composed duality is **q-fuzzy** in the strict and Scott-continuous regimes (inheriting the spatial side's quantale-graded error) and **unconditionally strict on its value-category factor** (the negation gauge is strict regardless of regime). The value-category-only sub-result — classification of sheaves into negation-self-dual vs negation-exchange-paired — is unconditional on the spatial duality and applies in all regimes.

## Commutativity of the two dualities

**Claim.** $\mathbb{D}_{\mathrm{sp}}$ and $\mathbb{D}_{\mathrm{val}}$ commute.

**Reasoning.** $\mathbb{D}_{\mathrm{sp}}$ acts on the *spatial structure* of the sheaf — its assignment of stalks to objects of the site, its restriction maps along site morphisms — without touching the value-category structure of each stalk. $\mathbb{D}_{\mathrm{val}}$ acts on the *value-category structure* of each stalk independently — applying $L_+ \leftrightarrow L_-$ swap pointwise — without touching the spatial structure.

Formally: the two dualities operate on independent factors of the data $\mathrm{Sh}_{\mathbf{dFrm}}(\mathbf{T}^*) = \mathrm{Func}(\mathbf{T}^{*,\mathrm{op}}, \mathbf{dFrm})$ — the spatial side ($\mathbf{T}^*$) and the value side ($\mathbf{dFrm}$). Functors of categories commute with their factor-wise dualities; hence $\mathbb{D}_{\mathrm{sp}}$ and $\mathbb{D}_{\mathrm{val}}$ commute as endofunctors / dualities on the sheaf category.

## The composed duality $\mathbb{D}$

The composition $\mathbb{D} : \mathrm{Sh}_{\mathbf{dFrm}}(\mathbf{T}^*) \to \mathrm{coSh}_{\mathbf{dFrm}}(\mathbf{T}^*)$ sends a d-frame-valued sheaf $F$ to a d-frame-valued cosheaf $\check{F}^\sigma$ where:

- The spatial structure is the Verdier dual cosheaf structure (per the [Verdier duality theorem](verdier-duality-bitopological-site.md)).
- The value-category structure has $L_+$ and $L_-$ swapped at each stalk.

**Order-2 property (q-fuzzy form).** Applying $\mathbb{D}$ twice gives back the original sheaf up to fuzzy equivalence:

- $\mathbb{D}_{\mathrm{sp}}^2 \simeq_{q^{\mathrm{glob}}} \mathrm{id}$ — q-fuzzy involution. The spatial Verdier round-trip in the [Q-enriched Curry on Grothendieck sites](q-enriched-curry-grothendieck-site.md) is identity-up-to-$q^{\mathrm{glob}}$-fuzzy. In the strict-adjunction limit ($q^{\mathrm{glob}} = 1$), it is a strict involution; in general it carries the global Curry fuzziness.
- $\mathbb{D}_{\mathrm{val}}^2 = \mathrm{id}$ — strict involution. Negation is involutive: $\neg \circ \neg = \mathrm{id}$ in any bilattice.

Hence $\mathbb{D}^2 = (\mathbb{D}_{\mathrm{sp}} \circ \mathbb{D}_{\mathrm{val}})^2 = \mathbb{D}_{\mathrm{sp}}^2 \circ \mathbb{D}_{\mathrm{val}}^2 \simeq_{q^{\mathrm{glob}}} \mathrm{id}$. The composed-duality involution inherits exactly the spatial side's fuzziness; the value-category factor adds nothing.

## Self-dual sheaves and firings

**Definition.** A d-frame-valued sheaf $F$ is **q-fuzzy self-dual under $\mathbb{D}$** iff $\mathbb{D}(F) \simeq_q F$ — where $F$ is reinterpreted as a cosheaf via the spatial Verdier $\mathbb{D}_{\mathrm{sp}}$, with q-fuzzy error inherited from the spatial side, and the comparison on the value-category factor is strict.

In the strict-adjunction limit ($q = 1$, the strict regime with strict-adjoint sheaf restrictions), this is strict isomorphism. In general — including all Scott-continuous regime cases — self-duality is q-fuzzy with quantale-graded error matching $q^{\mathrm{glob}}$.

For the [d-frame-valued settling sheaves](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/d-frame-valued-sheaf/d-frame-valued-sheaf.md) $\mathbb{F}_v$, self-duality has a concrete characterization in terms of **firing pattern**:

**Theorem (firing-pattern characterization of self-duality).** A settling $v$ in the strict or Scott-continuous regime has a q-fuzzy self-dual d-frame Verdier under $\mathbb{D}$ iff every firing of $v$ is a **$\top$-firing** — i.e., both the truth-component and the falsity-component of the newly-added cell first appear at the firing ordinal simultaneously. *(In the transfinite-bounded and aperiodic regimes the same characterization holds modulo the spatial Verdier results in those regimes; see [transfinite-bounded-regime d-frame cohomology](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/transfinite-bounded-regime-d-frame-cohomology.md) and [aperiodic-regime d-frame cohomology](../../../../../../valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-regime-d-frame-cohomology.md), both at draft status.)*

## Proof of the firing-pattern characterization

By the [transfinite-bounded-regime d-frame cohomology theorem](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/transfinite-bounded-regime-d-frame-cohomology.md), the d-frame $H^1$-generator $D_\mu$ at each firing $\mu$ has component structure determined by the firing's evidence side:

- *Truth-only firing*: $D_\mu = (\mathbb{Z}, 0, \text{trivial}, \text{trivial})$.
- *Falsity-only firing*: $D_\mu = (0, \mathbb{Z}, \text{trivial}, \text{trivial})$.
- *$\top$-firing*: $D_\mu = (\mathbb{Z}, \mathbb{Z}, \text{con-fails-on-singleton}, \text{trivial})$ — both components rank-1, with consistency relation explicitly recording the inconsistency.

Under $\mathbb{D}_{\mathrm{val}}$ (component swap):

- *Truth-only* $(\mathbb{Z}, 0, ...) \mapsto (0, \mathbb{Z}, ...) = $ *falsity-only* $D_\mu$.
- *Falsity-only* $\mapsto$ *truth-only*.
- *$\top$-firing* $(\mathbb{Z}, \mathbb{Z}, \text{con-fails-on-singleton}, ...) \mapsto (\mathbb{Z}, \mathbb{Z}, \text{con-fails-on-swapped-singleton}, ...) \cong (\mathbb{Z}, \mathbb{Z}, \text{con-fails-on-singleton}, ...)$ — fixed up to relation-argument swap, which is canonical.

So under $\mathbb{D}_{\mathrm{val}}$, truth-only and falsity-only firings exchange; $\top$-firings are fixed.

The spatial duality $\mathbb{D}_{\mathrm{sp}}$ acts on the firing-ordinal indexing and the assembly structure across firings, but does not differentiate firings by their evidence side (which is value-category content). For a settling $v$ to be globally self-dual under the full $\mathbb{D}$, the value-category exchange (truth-only $\leftrightarrow$ falsity-only) must be a *self*-action on the firing pattern — which happens iff there are no truth-only or falsity-only firings, i.e., every firing is $\top$.

The aperiodic-regime case generalises this via the direct-limit structure of the [aperiodic-regime d-frame cohomology theorem](../../../../../../valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-regime-d-frame-cohomology.md). $\square$

## Exchange orbits and the truth/falsity asymmetry

For non-self-dual sheaves, the orbit of $F$ under $\mathbb{D}$ has size 2: $\{F, \mathbb{D}(F)\}$. The exchange orbits classify d-frame-valued sheaves up to the composed duality:

- *$\top$-only orbit (size 1, self-dual)*: settlings whose firings are all $\top$. Pure paraconsistent settlings.
- *Truth/falsity-paired orbit (size 2)*: a settling with truth-only firings exchanges with its negation (a settling with falsity-only firings). Both presentations encode the same underlying settling structure.

This classification gives the chapter's distinctive contribution: **a structural classification of settlings into self-dual (paraconsistent) vs exchange (asymmetric in evidence direction)**. The classification is invisible to the bigraded refinement (which sees truth-side and inconsistency-side without distinguishing them by exchange orbit) and to the standard $\mathbf{Ab}$-valued Verdier duality (which has only the spatial component).

## Connection to the corpus's existing structure

- **Bigraded aperiodic-regime trichotomy.** The [bigraded aperiodic-regime trichotomy](../../../../../../valuation/content/knowledge-least-valuation/settling/references/bigraded-aperiodic-regime-trichotomy.md) classifies aperiodic settlings by whether their classifying invariant is consistent (truth-only), paraconsistent ($\top$-only), or mixed. Under the composed duality $\mathbb{D}$:
  - *Pure consistent* settlings (truth-only firings) are in exchange orbits with *pure dual-consistent* settlings (falsity-only firings) — but the corpus's existing trichotomy doesn't list "falsity-only" as a sub-stratum; the negation symmetry is implicit. The d-frame Verdier composition makes it explicit.
  - *Pure paraconsistent* settlings ($\top$-only firings) are self-dual under $\mathbb{D}$ — they are the *fixed points* of the composed duality, and the bigraded trichotomy's paraconsistent sub-stratum is exactly the self-dual orbit.
  - *Mixed* settlings have a complicated orbit structure — partial self-duality on their $\top$-firings, exchange on their truth-only and falsity-only firings.

- **Inconsistency sheaf $\mathcal{F}^{(\top)}$.** The [inconsistency sheaf](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/inconsistency-sheaf/inconsistency-sheaf.md) tracks $\top$-cells specifically. Under the $\mathbb{D}_{\mathrm{val}}$ swap, $\mathcal{F}^{(\top)}$ is fixed (since $\top$-cells are negation-invariant). This provides an alternative characterization of the self-dual orbit: a settling is self-dual under $\mathbb{D}$ iff its full d-frame structure is concentrated on the inconsistency sheaf.

## Position in the program

This theorem is the **chapter's distinctive contribution** beyond Curry's existing cellular Verdier duality. The two-dualities-composing structure is unique to the bilattice-flavored / d-frame setting (the $\mathbf{Ab}$-valued setting has no value-category swap of this kind). It refines the bigraded refinement's trichotomy with an explicit duality structure: paraconsistent settlings are duality-fixed, consistent and dual-consistent settlings are duality-paired, mixed settlings have intermediate orbit structure.

Three downstream consequences:

1. **Strong-MLD classification refinement.** Two settlings being d-frame-MLD-equivalent ([strong-MLD classification](../questions/strong-mld-classification.md)) and being in the same composed-duality orbit are *different* equivalence relations. The composed-duality orbit is finer in some cases.

2. **Aperiodic co-classification.** The [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) admits a $\mathbb{D}$-equivariant version that records the orbit type (self-dual, truth-paired, falsity-paired, mixed). This is a finer classifying invariant than the existing $H^1$ class.

3. **Six-functor formalism.** The composed duality is a *symmetry* of the d-frame six-functor package — once developed, the package's symmetries should be tracked under $\mathbb{D}$ explicitly.

A first concrete instance of the duality composition is worked through in [Verdier dual of the single-cell strict-regime settling](../examples/strict-regime-verdier-dual.md) — a small finite settling with a truth-only firing, demonstrating that its Verdier dual is the cosheaf for the negation-settling (with a falsity-only firing), making the truth/falsity exchange orbit visible.
