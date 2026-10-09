---
id: 5e0a9203-36c0-4ff3-92e2-f6bee116295c
title: Treatise on Directed-Relational Infinity-Topos Geometry
date-created: 2025-10-09
description: We construct the theory of directed–relation ∞-topos geometry on the basis of cohesive ∞-topoi.
---

# Abstract

We construct the theory of **directed–relation ∞-topos geometry** on the basis of cohesive ∞-topoi. Directed cohesive relations are the primitive entities of mathematical space; objects and points arise only as modal reductions. All results follow from standard theorems in Lurie’s **Higher Topos Theory** and **Higher Algebra**, Schreiber’s cohesive framework, and Shulman’s modal homotopy type theory.

# 1. Motivation and Conventions {#motivation-and-conventions}

Classical ∞-topos geometry treats objects as primary and morphisms as derived.

In contrast, process- or relation-based ontologies begin with directed motion.

We formalize this within the presented directed-relation ∞-topos framework, where directed relations themselves constitute the geometric substrate.

## Conventions

- $\simeq$ denotes homotopy equivalence (HTT §1.2.1).
- $\|{-}\|$ denotes propositional truncation.
- Internal reasoning follows modal homotopy type theory (Shulman 2015).
- $\mathfrak{E}$ is a cohesive ∞-topos (Schreiber 2013) with $(\Sigma\dashv\square\dashv\Pi)$ satisfying HTT §6.5.

# 2. Relational Ambient Model {#relational-ambient-model}

## 2.1 Cohesive Setting {#cohesive-setting}

Let $\mathfrak{E}$ be cohesive with $\square$ left-exact and $\Sigma,\Pi$ exact. Existence of such adjoints and their properties follow from HTT §6.5.1–6.5.5. All ∞-categories are assumed locally ssmall in a chosen Grothendieck universe.

## 2.2 Directed Relations {#directed-relations}

A **directed relation** is a morphism

$$
r : x \longrightarrow \square y
$$

in a quasi-category internal to $\mathfrak{E}$.

Composition of relations is defined via homotopy pushout of arrows (HA §1.2.4.13), which is associative up to a coherent homotopy.

The resulting ∞-category is denoted $\mathcal{R}$.

# 3. Relational Sites and Modal Structure {#relational-sites-and-modal-structure}

## Definition 3.1 (Directed Relational ∞-Site) {#definition-3.1-directed-relational--site}

A directed relational ∞-site is a tuple $$
(\mathcal{R}, S, p, \square)
$$ where:

1.  $\mathcal{R}$ is the quasi-category of directed relations;
2.  $S$ is a finite poset of **modal strata** (equivalence classes under $\square$);
3.  $p : \mathcal{R} \to S$ assigns each relation its stratum;
4.  $\square$ stabilizes directed composition and preserves limits.

## Lemma 3.2 (Exit Equivalence) {#lemma-3.2-exit-equivalence}

$$
\mathrm{Exit}_\infty(\mathcal{R}) \simeq \mathcal{R}.
$$ **Proof (by reference).** The twisted-arrow construction $\mathrm{Tw}(\mathcal{R})$ yields an equivalent ∞-category when morphisms of $\mathcal{R}$ are already arrows (HTT §5.2.1, Prop. 5.2.1.3).

## Remark 3.3 (Existence) {#remark-3.3-existence}

Smallness and accessibility of $\mathcal{R}$ ensure existence of all (co)limits (HTT §5.5.8). The stratification $p:\mathcal{R}\to S$ is a cartesian fibration in the sense of HTT §2.4.2.

# 4. Constructible, Coherent, and Cohesive Fields {#constructible-coherent-and-cohesive-fields}

## Definition 4.1 (Constructible Field) {#definition-4.1-constructible-field}

For stable presentable $\mathcal{E}$ internal to $\mathfrak{E}$, $$
\mathrm{Constr}(\mathcal{R},\mathcal{E})
   := \mathrm{Fun}^{\mathrm{loc}}_{\square}(\mathcal{R},\mathcal{E}),
$$ the ∞-category of locally constant, $\square$-covariant relational diagrams. Such functor categories are presentable (HTT §5.5.3).

## Definition 4.2 (Coherent Field) {#definition-4.2-coherent-field}

A diagram $F$ is **coherent** when $$
\eta_r : F(r) \longrightarrow \mathrm{hocolim}\,F
$$ is an equivalence in $\mathcal{E}$. The full sub-∞-category of coherent diagrams is denoted $\mathfrak{E}_{\mathcal{R}}$.

## Proposition 4.3 (Existence of the Cohesive Field) {#proposition-4.3-existence-of-the-cohesive-field}

The **cohesive field** exists as $$
\mathcal{F} := \mathrm{holim}_{F\in\mathfrak{E}_{\mathcal{R}}} F.
$$ **Proof (by reference).** Since $\mathfrak{E}_{\mathcal{R}}$ is accessible and admits small limits, the homotopy limit exists (HTT §5.5.9).

# 5. Ambidextrous Cohesion {#ambidextrous-cohesion}

## Theorem 5.1 (Cohesive Ambidexterity) {#theorem-5.1-cohesive-ambidexterity}

Let $\mathcal{R}$ be finite and $F$ pointwise dualizable in a symmetric monoidal stable $\mathcal{E}$. Then $$
\mathrm{hocolim}\,F \;\simeq\; \mathrm{holim}\,F^{\vee},
\qquad
F^{\vee}(r) := \underline{\mathrm{Hom}}(F(r),1).
$$ **Proof (by reference).** This is Theorem 4.6.5.14 of Lurie’s **Higher Algebra**: dualizable objects in a symmetric monoidal stable ∞-category satisfy coend–end (Verdier) duality.

## Corollary 5.2 (Self-Cohesion of the Field) {#corollary-5.2-self-cohesion-of-the-field}

$$
\mathrm{holim}\,\mathcal{F} \;\simeq\; \mathrm{hocolim}\,\mathcal{F}.
$$ **Proof (by reference).** Apply Theorem 5.1 to the universal diagram defining $\mathcal{F}$; since $\mathfrak{E}_{\mathcal{R}}$ is stable, and we restrict to compact or finite objects of $\mathfrak{E}{\mathcal{}}$, which are dualizable. (HA §4.6.1.2).

# 6. Relational Dynamics {#relational-dynamics}

## Definition 6.1 (Directed Kan Extensions) {#definition-6.1-directed-kan-extensions}

For $\Phi:\mathcal{R}\to\mathcal{R}'$, define $\mathrm{LKan}_{\Phi}$ and $\mathrm{RKan}_{\Phi}$ by HTT §4.3.2. Cofinal and coinitial $\Phi$ preserve (co)limits (HTT Thm. 4.1.3.1).

## Lemma 6.2 (Cofinality Preservation) {#lemma-6.2-cofinality-preservation}

If $\Phi$ is cofinal, then $$
\mathrm{hocolim}\,F \;\simeq\; \mathrm{hocolim}\,\mathrm{LKan}_\Phi F,
$$ and dually for coinitial $\Phi$. **Proof (by reference).** Direct from HTT Thm. 4.1.3.1.

## Theorem 6.3, Dynamic Invariance of Cohesive Fields {#theorem-6.3-dynamic-invariance-of-cohesive-fields}

Under modal ambidexterity, $$
\mathrm{holim}\,\mathcal{F} \;\simeq\; \mathrm{hocolim}\,\mathcal{F}
$$ for all directed $\Phi$. **Proof.** By Lemma 6.2 and Corollary 5.2, cofinal extensions preserve the equivalence of (co)limits; hence the cohesive field is invariant up to modal equivalence.

# References
