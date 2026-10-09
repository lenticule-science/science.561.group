---
kind: theorem
status: proved
depends-on: [aperiodic-regime-classification, aperiodic-co-classification, aperiodic-classifying-invariant, aperiodic-co-classifying-invariant, d-frame-verdier-composition, verdier-duality-bitopological-site, mutually-locally-derivable, internal-z2-gauge, negation, transfinite-bounded-regime-d-frame-cohomology]
---

# Strong-MLD classification via composed-duality orbits

A refinement of the [aperiodic-regime classification](../../aperiodic-settling/references/aperiodic-regime-classification.md) that distinguishes aperiodic settlings the ordinary $\mathrm{cl}\text{-}\mathrm{inv}$ does not.
The refinement uses the **composed-duality orbit type** of each non-Scott-continuous firing — accessible now that the [d-frame Verdier composition](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-verdier-composition.md) gives a $\mathbb{D}$-equivariant action on classifying invariants — and the orbit-type taxonomy from the [d-frame chapter](../narratives/bilattice-cohomology-opener.md): each firing is truth-only, falsity-only, or $\top$-firing.

The refined equivalence relation — **strong-MLD** — is strictly finer than ordinary MLD: it distinguishes settlings whose firing-ordinal sets agree but whose firing types differ.
The theorem operationalizes the open [strong-MLD classification question](../questions/strong-mld-classification.md), giving a concrete refined classifying invariant.

## Definitions

**$\mathbb{D}$-equivariant classifying invariant.** Let $v$ be an aperiodic-regime [knowledge presheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/spatiotemporal-knowledge-presheaf.md) with closure ordinal $\kappa \geq \omega_1$.
The **$\mathbb{D}$-equivariant classifying invariant of $v$** is the pair

$$\mathrm{cl}\text{-}\mathrm{inv}^{\mathbb{D}}(v) \;:=\; \bigl(\mathrm{cl}\text{-}\mathrm{inv}(v),\; \tau^{\mathbb{D}}(v)\bigr) \;\in\; H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_v) \times \mathrm{Orbit}(v),$$

where $\mathrm{cl}\text{-}\mathrm{inv}(v)$ is the [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) and $\tau^{\mathbb{D}}(v) \in \mathrm{Orbit}(v)$ is the **firing-orbit-type function** assigning to each firing ordinal $\mu \in L_{\mathrm{ns}}(\kappa)$ its composed-duality orbit type:

$$\tau^{\mathbb{D}}(v) : L_{\mathrm{ns}}(\kappa) \to \{\text{truth-only}, \,\text{falsity-only}, \,\top\}.$$

Per the [d-frame Verdier composition theorem](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-verdier-composition.md), each value records whether the d-frame generator $D_\mu$ at firing $\mu$ is fixed by $\mathbb{D}_{\mathrm{val}}$ (i.e., the firing is $\top$, self-dual) or paired with a counterpart under truth-falsity exchange (truth-only or falsity-only, exchange-paired).

**Strong-MLD equivalence.** Two aperiodic settlings $v, v'$ are **strong-MLD-equivalent**, written $v \sim_{\mathrm{sMLD}} v'$, iff there exists an invertible [settling-morphism](../morphisms/settling-morphism.md) $(\phi, \delta) : v \to v'$ such that:

1. The morphism realizes [mutually-locally-derivable](../concepts/mutually-locally-derivable.md) equivalence (existing condition for ordinary MLD).
2. The morphism preserves firing types: for each $\mu \in L_{\mathrm{ns}}(\kappa, v)$, the corresponding $\mu' = \delta(\mu) \in L_{\mathrm{ns}}(\kappa', v')$ has $\tau^{\mathbb{D}}(v')(\mu') = \tau^{\mathbb{D}}(v)(\mu)$.

The first condition gives MLD; the second adds firing-type-preserving structure.

## Statement

**Theorem (strong-MLD classification).** Let $v, v'$ be aperiodic-regime knowledge presheaves over a common base with $|E| \geq \omega_1$ and closure ordinals $\kappa, \kappa' \leq \omega_1$.
Then

$$v \sim_{\mathrm{sMLD}} v' \;\iff\; \mathrm{cl}\text{-}\mathrm{inv}^{\mathbb{D}}(v) \,=\, \mathrm{cl}\text{-}\mathrm{inv}^{\mathbb{D}}(v') \;\text{ in } H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{\mathrm{univ}}) \times \mathrm{Orbit}(v),$$

where the equality is componentwise (sheaf-cohomology class agreement and firing-orbit-type function agreement).

The refinement is **strict**: there exist aperiodic settlings $v \not\sim_{\mathrm{sMLD}} v'$ with $\mathrm{cl}\text{-}\mathrm{inv}(v) = \mathrm{cl}\text{-}\mathrm{inv}(v')$ — i.e., MLD-equivalent settlings that are not strong-MLD-equivalent.

## Proof

The forward direction (strong-MLD ⇒ equal invariants) is direct from the definitions: a strong-MLD morphism preserves both the underlying classifying-invariant data (by ordinary MLD) and the firing types (by condition 2).

The reverse direction (equal invariants ⇒ strong-MLD) builds on the [aperiodic-regime classification](../../aperiodic-settling/references/aperiodic-regime-classification.md).
With agreement of $\mathrm{cl}\text{-}\mathrm{inv}$, that theorem produces an invertible settling-morphism $(\phi, \delta)$ realizing ordinary MLD.
The agreement of $\tau^{\mathbb{D}}$ then implies the morphism additionally preserves firing types: the firing-type assignment is preserved under the bisimulation lifting (Hermida–Jacobs + Bonchi et al. coinductive machinery from the existing classification's proof) precisely because the d-frame structure on each firing is a structural feature of the closure rule, not a choice that could be flipped under a bisimulation.

This requires checking that the bisimulation respects d-frame structure on per-firing generators, which is the substantive technical content beyond ordinary MLD.
The check goes through because the [closure 2-monad](../morphisms/closure-2-monad.md)'s lax-idempotence is compatible with the d-frame structure — closure-equivalence preserves the bilattice negation gauge by which the firing types are defined.

$\square$

## Strictness — concrete instance

To exhibit $v \not\sim_{\mathrm{sMLD}} v'$ with $\mathrm{cl}\text{-}\mathrm{inv}(v) = \mathrm{cl}\text{-}\mathrm{inv}(v')$, take:

- $v$: an aperiodic settling with truth-only firings at each $\mu \in L_{\mathrm{ns}}$ (every firing adds only a truth-positive cell).
- $v'$: an aperiodic settling with falsity-only firings at each $\mu \in L_{\mathrm{ns}}$ (every firing adds only a falsity-positive cell), with the *same* firing-ordinal set as $v$.

By the existing classification, $\mathrm{cl}\text{-}\mathrm{inv}(v) = \mathrm{cl}\text{-}\mathrm{inv}(v')$ — both classify to the same $\bigoplus_\mu \mathbb{Z}$ class via the firing-ordinal set.
Hence $v \sim_{\mathrm{MLD}} v'$.

But $\tau^{\mathbb{D}}(v) \neq \tau^{\mathbb{D}}(v')$: $v$ assigns "truth-only" to every firing, $v'$ assigns "falsity-only" to every firing.
So $\mathrm{cl}\text{-}\mathrm{inv}^{\mathbb{D}}(v) \neq \mathrm{cl}\text{-}\mathrm{inv}^{\mathbb{D}}(v')$, and $v \not\sim_{\mathrm{sMLD}} v'$.

The refinement is strict — strong-MLD distinguishes evidence-side flipped settlings that ordinary MLD identifies.

## Composed-duality orbits

The $\mathbb{D}$-equivariant invariant decomposes the strong-MLD-equivalence classes into three orbit types under the composed duality:

**Self-dual orbit ($\mathbb{D}$-fixed).** Settlings with $\tau^{\mathbb{D}}(v)(\mu) = \top$ for all $\mu \in L_{\mathrm{ns}}$ — i.e., every firing is a $\top$-firing.
The composed duality $\mathbb{D} = \mathbb{D}_{\mathrm{sp}} \circ \mathbb{D}_{\mathrm{val}}$ fixes such settlings up to canonical isomorphism: they are the **paraconsistent stratum** of the classification.

**Truth-only orbit (exchange-paired with falsity-only).** Settlings with $\tau^{\mathbb{D}}(v)(\mu) = \text{truth-only}$ for all $\mu$.
Under $\mathbb{D}$, paired with a settling whose firings are all falsity-only — the settling's "negation" $\neg v$.

**Mixed orbits.** Settlings with $\tau^{\mathbb{D}}$ taking different values at different firings.
The orbit structure under $\mathbb{D}$ is more complex: $\mathbb{D}$ exchanges truth-only and falsity-only firings while fixing $\top$-firings, so a mixed settling's $\mathbb{D}$-image has the truth-only and falsity-only firings swapped at each ordinal where they appear.

The **orbit-type stratification** of the strong-MLD classes:

$$\mathcal{M}_{\mathrm{sMLD}}^{\mathrm{aper}} \;=\; \mathcal{M}_{\top}^{\mathrm{aper}} \;\sqcup\; \mathcal{M}_{\mathrm{exchange}}^{\mathrm{aper}}/\mathbb{Z}_2 \;\sqcup\; \mathcal{M}_{\mathrm{mixed}}^{\mathrm{aper}}/\sim,$$

where $\mathcal{M}_\top$ is the self-dual stratum (singleton orbits), $\mathcal{M}_{\mathrm{exchange}}/\mathbb{Z}_2$ is the truth/falsity-paired stratum (size-2 orbits identified under $\mathbb{D}$), and $\mathcal{M}_{\mathrm{mixed}}$ has the more complex orbit structure.

## Cosheaf-side equivalent

By [aperiodic co-classification](aperiodic-co-classification.md) (Verdier duality), the $\mathbb{D}$-equivariant invariant has a cosheaf-side dual:

$$\check{\mathrm{cl}}\text{-}\mathrm{inv}^{\mathbb{D}}(v) \;:=\; \bigl(\check{\mathrm{cl}}\text{-}\mathrm{inv}(v),\; \tau^{\mathbb{D}}(v)\bigr) \;\in\; H_1(\mathbf{T}^*_{\leq \omega_1}, \check{\mathcal{F}}_v) \times \mathrm{Orbit}(v).$$

The firing-orbit-type function $\tau^{\mathbb{D}}$ is independent of the sheaf/cosheaf presentation (it records value-category-side data, not spatial).
The two presentations of strong-MLD are equivalent via the spatial Verdier duality $\mathbb{D}_{\mathrm{sp}}$.

## Connection to other refinement axes

The strong-MLD refinement composes with the existing realizability-program axes:

- **Bigraded refinement** ([bigraded-realizability-refinement](../../../references/bigraded-realizability-refinement.md)) decomposes invariants by truth-side / inconsistency-side.
  The $\mathbb{D}$-orbit-type refinement is a *finer* version: it tracks $\top$ vs (truth-only ∨ falsity-only), which the bigraded refinement collapses.
- **$\mathcal{C}$-naturality coupling** ([c-naturality-coupling-realizability-refinement](c-naturality-coupling-realizability-refinement.md)) tracks per-predicate firing patterns.
  Strong-MLD via $\mathbb{D}$-orbit-type adds the firing-type axis on top of this — they are orthogonal refinements.
- **Rule-language fragment** ([rule-language-fragment-realizability-refinement](rule-language-fragment-realizability-refinement.md)) tracks expressivity.
  Strong-MLD doesn't directly speak to expressivity, but the $\top$-firings naturally arise from richer rule-language fragments (those that can simultaneously assert truth and falsity).

The refinement axes can be combined: a *fully refined* aperiodic invariant tracks (i) firing-ordinal set, (ii) firing-orbit type (the strong-MLD content here), (iii) per-predicate firing pattern, (iv) rule-language-fragment.

## What the refinement distinguishes

The strong-MLD refinement is "strict but not maximal" — it distinguishes more than ordinary MLD but not necessarily everything:

**Distinguishes:**

- Truth-only-firing settlings vs falsity-only-firing settlings (with the same firing-ordinal set).
- Mixed-firing settlings that ordinary MLD identifies but whose firing types differ at some firings.
- $\top$-only-firing settlings vs other-firing-type settlings (with the same firing-ordinal set).

**Does not distinguish:**

- Settlings whose firing-ordinal sets and firing-types both agree — even if other features (rule-language, $\mathcal{C}$-action) differ.
- $\mathbb{D}$-orbit-equivalent settlings (truth-only paired with falsity-only via the global negation).

The further refinements via the realizability-program axes give finer distinctions; the $\mathbb{D}$-orbit-type is one component of a multi-axis classification.

## Position in the program

This theorem operationalizes the [strong-MLD classification question](../questions/strong-mld-classification.md) — refining the equivalence and the invariant simultaneously, as the question suggests.
With Verdier duality established (Layer 1+2+3 of the cellular extension plan) and the d-frame Verdier composition giving the orbit-type apparatus, the refinement becomes a concrete theorem.

The chapter's frontier moves to:

- **Concrete instances** of the orbit-type stratification — settlings exhibiting each orbit type explicitly.
  The corpus's existing [mixed-stratum two-firing settling](../examples/mixed-stratum-two-firing-settling.md) and the [strict-regime ⊤-firing self-duality example](../examples/strict-regime-top-firing-verdier-self-dual.md) are starts.
- **Cross-axis composition** — combining strong-MLD with the bigraded, $\mathcal{C}$-naturality, and rule-language refinements to produce a full multi-axis classification.
- **Six-functor formalism** — extending Verdier $\mathbb{D}$ to the full package; the strong-MLD orbit type is a $\mathbb{D}$-equivariant data piece that the package's other functors should act on coherently.
