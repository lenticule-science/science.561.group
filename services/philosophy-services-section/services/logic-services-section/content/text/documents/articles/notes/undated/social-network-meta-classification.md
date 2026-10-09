---
kind: example
status: verified
depends-on: [meta-moduli-prestack, meta-moduli-stack-theorem, meta-stratification-by-regime, meta-realizability-map, social-network-strong-mld-orbits, two-entity-moduli, relational-database-settling]
instantiates: [meta-moduli-stack-theorem, meta-stratification-by-regime, meta-realizability-map]
lineage: 2
title: Meta-classification of social-network closure-rule systems
description: The L2 instance of the meta-moduli stack.
---

# Meta-classification of social-network closure-rule systems

The L2 instance of the [meta-moduli stack](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/meta-moduli-stack-theorem.md). **Lineage 2** instance, more substantive than the [trivial-base meta-classification](examples-trivial-base-meta-classification.md): the multi-entity setup gives a richer rule space and a more non-trivial meta-realizability map.

## Setup

L2 base: $E = \{a, b\}$, single predicate $P$, $\lambda = 2$. The closure-rule space is finite but larger than the trivial-base case.

## Closure-rule space

A closure rule on this base has antecedent and consequent in the closure-rule language over a single binary predicate on a 2-entity set. Possible distinct rule schemas (up to logical equivalence):

- **Self-rules** at a cell — like the L1 rules but per cell:
  - $r_{(a, b), \mathbf{t}}$: "if $v(P)(a, b) \geq_k \mathbf{t}$ then $v(P)(a, b) \geq_k \mathbf{t}$" — vacuous.
  - $r_{(a, b), \mathbf{t} \to \top}$: "if $v(P)(a, b) \geq_k \mathbf{t}$ then $v(P)(a, b) \geq_k \top$" — adds inconsistency to truth.
  - Similarly for $(a, a), (b, a), (b, b)$ and for $\mathbf{f}, \top$ variants.
- **Cross-cell rules** — coupling between cells:
  - $r_{\text{symmetric}}$: "if $v(P)(a, b) \geq_k \mathbf{t}$ then $v(P)(b, a) \geq_k \mathbf{t}$" — like-symmetry.
  - $r_{\text{antisymmetric}}$: "if $v(P)(a, b) \geq_k \mathbf{t}$ then $v(P)(b, a) \geq_k \mathbf{f}$" — like-antisymmetry.
  - $r_{\text{reflexive}}$: "if $v(P)(a, b) \geq_k \mathbf{t}$ then $v(P)(a, a) \geq_k \mathbf{t}$" — like-reflexivity.

Closure-equivalence partitions these into equivalence classes by their generated closure operator.

## Meta-points (representative)

Some structurally distinct closure-equivalence classes:

- $[\mathcal{S}_\emptyset]$: trivial rule system, identity closure. **Largest equivalence class** — many vacuous rules collapse here.
- $[\mathcal{S}_{\text{symm}}]$: the symmetric-likes rule. Forces $v(P)(a, b) = v(P)(b, a)$ on truth-side.
- $[\mathcal{S}_{\text{antisymm}}]$: forces $v(P)(b, a) = \mathbf{f}$ when $v(P)(a, b) = \mathbf{t}$. Antisymmetric likes.
- $[\mathcal{S}_{\text{refl}}]$: forces $v(P)(a, a) = \mathbf{t}$ when Alice likes anyone. Self-regard from external regard.
- $[\mathcal{S}_{\text{top-on-disagree}}]$: $r_{\text{symmetric}}$ + $r_{\text{antisymmetric}}$ together force $v(P)(b, a) = \top$ when $v(P)(a, b) = \mathbf{t}$. Self-contradictory rule.

Many more meta-points exist; the meta-moduli has on the order of dozens of points (rough count: combinations of cell-rules and cross-cell rules, modulo closure-equivalence).

## Meta-stratification

All meta-points are in the **meta-strict** stratum: every settling under any of these rules has finite closure ordinal (the rule space is $\Pi_0$-fragment, no quantification, and each rule fires at most once per cell). $\mathscr{M}^{\mathrm{meta}}_{\mathrm{SC}}$ and higher meta-strata are empty over this base.

## Meta-realizability map

The realizability map $\pi^{\mathrm{real}} : \mathscr{M}^{\mathrm{SKH}}(B) \to \mathscr{M}^{\mathrm{meta}}(B)$ on this base:

- The settling moduli $\mathscr{M}^{\mathrm{SKH}}(B)$ has 160 points (per [two-entity-moduli](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/examples/two-entity-moduli.md)).
- The realizability map sends each settling to its closure-rule equivalence class.
- For settlings with no closure activity (e.g., a settling realized by direct increment), $\pi^{\mathrm{real}}([v]) = [\mathcal{S}_\emptyset]$.
- For settlings whose closure operator forces specific cell relations (e.g., a settling where $v(P)(a, b) = v(P)(b, a)$ is forced), $\pi^{\mathrm{real}}([v]) \in [\mathcal{S}_{\text{symm}}]$.

The image of $\pi^{\mathrm{real}}$ is *substantially smaller* than the meta-moduli — most meta-points are unrealized by any settling on this base, just as in the trivial-base case but at a larger scale.

## What this exhibits

Three observations:

**1. The L2 meta-moduli has substantively non-trivial structure.** Multiple equivalence classes, non-trivial cross-cell rules (symmetric, antisymmetric, reflexive — all natural social-network closure rules), and a realizability map with small image.

**2. Closure rules encode social-network properties.** Symmetry of likes, antisymmetry, reflexivity — these are real sociological properties, and they appear as specific points in the meta-moduli with their own structural content.

**3. The meta-classifier still resides in the meta-strict stratum.** No closure rule on this finite base forces $\Pi_1$ or higher quantification. Higher meta-strata require richer bases (countable entities, transfinite settling bounds).

## Position in Lineage 2

The L2 instance for the meta-classifier chapter. Compared with the [trivial-base meta-classification](examples-trivial-base-meta-classification.md): more meta-points, social-network-flavored rule meanings, but same meta-strict containment. The progression from L1 (4-point meta) to L2 (dozens of points) exhibits the meta-classifier's *cardinality* growth with base richness.
