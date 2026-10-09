---
kind: example
status: verified
depends-on: [meta-moduli-prestack, meta-moduli-stack-theorem, meta-stratification-by-regime, meta-realizability-map, strict-regime-d-frame-computation, strict-regime-verdier-dual, strict-regime-top-firing-verdier-self-dual, four-bilattice, trivial-settling, single-entity-moduli]
instantiates: [meta-moduli-stack-theorem, meta-stratification-by-regime, meta-realizability-map]
lineage: 1
title: Trivial-base meta-classification
description: A worked example computing the meta-moduli stack on the trivial base $B = (\mathbf{2}, \mathbf{1}\mathcal{C}, \{a\}, 2)$ — single predicate $P$ on a singleton entity set, with settling bound $\lambda = 2$.
---

# Trivial-base meta-classification

A worked example computing the [meta-moduli stack](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/meta-moduli-stack-theorem.md) on the trivial base $B = (\mathbf{2}, \mathbf{1}_\mathcal{C}, \{a\}, 2)$ — single predicate $P$ on a singleton entity set, with settling bound $\lambda = 2$. This is the same base as the [strict-regime d-frame computation](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/examples/strict-regime-d-frame-computation.md) and the [strict-regime Verdier-dual examples](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/examples/strict-regime-verdier-dual.md), now classified at the meta level: which closure-rule systems exist, how they form $\mathscr{M}^{\mathrm{meta}}(B)$, and what their realizability-map image is.

This grounds the abstract meta-classifier construction on the smallest non-trivial case where the meta-moduli's structure is computable explicitly.

## Setup

- **Residuated lattice:** $\mathbf{L} = \mathbf{2} = \{0 \leq 1\}$.
- **Predicate category:** $\mathcal{C} = \mathbf{1}$ (single object $P$, identity morphism only).
- **Entity set:** $E = \{a\}$.
- **Settling bound:** $\lambda = 2$ (stages $\tau = 0, 1$).

The [predication fiber algebra](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/objects/predication-fiber-algebra.md) is

$$A_P = \mathbf{2}^{\bowtie\, E \times E} = \mathbf{FOUR}^{\{(a, a)\}} = \mathbf{FOUR}$$

— a single cell with values in [$\mathbf{FOUR} = \{\bot, \mathbf{t}, \mathbf{f}, \top\}$](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/objects/four-bilattice.md).

A closure-rule system on this base is a (finite) set of closure rules over the single cell $(a, a)$.

## The rule space

For this trivial base, the rule space is *finite and very small*. A closure rule has:

- An **antecedent**: a predicate over the prior stages of $v$, expressed in the [closure-rule language](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/concepts/closure-rule-language.md). Since the only relevant data is $v(P)(a, a) \in \mathbf{FOUR}$, antecedents are predicates on this single bilattice value.
- A **consequent**: a $\geq_k$-floor on $v(P)(a, a)$ at the firing stage.

Possible distinct closure rules (up to logical equivalence):

| Rule | Antecedent | Consequent |
|---|---|---|
| (trivial) | true | $v(P)(a, a) \geq_k \bot$ |
| $r_\mathbf{t}$ | $v(P)(a, a) \geq_k \mathbf{t}$ | $v(P)(a, a) \geq_k \mathbf{t}$ |
| $r_\mathbf{f}$ | $v(P)(a, a) \geq_k \mathbf{f}$ | $v(P)(a, a) \geq_k \mathbf{f}$ |
| $r_\top$ | $v(P)(a, a) \geq_k \mathbf{t}$ AND $v(P)(a, a) \geq_k \mathbf{f}$ | $v(P)(a, a) \geq_k \top$ |
| $r_{\mathbf{t} \to \top}$ | $v(P)(a, a) \geq_k \mathbf{t}$ | $v(P)(a, a) \geq_k \top$ |
| $r_{\mathbf{f} \to \top}$ | $v(P)(a, a) \geq_k \mathbf{f}$ | $v(P)(a, a) \geq_k \top$ |

The rules $r_\mathbf{t}, r_\mathbf{f}, r_\top$ are *idempotent* — they don't change anything when applied. The non-trivial rules are $r_{\mathbf{t} \to \top}$ and $r_{\mathbf{f} \to \top}$, which force inconsistency given truth-content or falsity-content respectively.

## Closure-equivalence classes

Closure-rule systems are sets of these rules. Two systems are closure-equivalent iff they generate the same closure operator. For this trivial base:

- The trivial system $\mathcal{S}_\emptyset = \emptyset$ generates the identity closure operator.
- $\{r_\mathbf{t}\}$, $\{r_\mathbf{f}\}$, $\{r_\top\}$, or any subset of idempotent rules: also generate the identity closure operator. **All closure-equivalent to $\mathcal{S}_\emptyset$.**
- $\{r_{\mathbf{t} \to \top}\}$ generates the closure operator that maps $(a, a) \in [\mathbf{t}, \top]$ to $\top$. Non-trivial.
- $\{r_{\mathbf{f} \to \top}\}$ generates the closure operator that maps $(a, a) \in [\mathbf{f}, \top]$ to $\top$. Non-trivial, distinct from the previous.
- $\{r_{\mathbf{t} \to \top}, r_{\mathbf{f} \to \top}\}$ generates a closure operator that maps both $\mathbf{t}$-content and $\mathbf{f}$-content to $\top$. Distinct from either single rule.

Closure-equivalence classes:

$$\mathscr{M}^{\mathrm{meta}}(B) \;=\; \bigl\{\,[\mathcal{S}_\emptyset],\; [\mathcal{S}_{\mathbf{t}}],\; [\mathcal{S}_\mathbf{f}],\; [\mathcal{S}_{\mathbf{t}\mathbf{f}}]\,\bigr\}$$

where:
- $[\mathcal{S}_\emptyset]$: all idempotent / trivial rule systems.
- $[\mathcal{S}_\mathbf{t}]$: systems containing $r_{\mathbf{t} \to \top}$ but not $r_{\mathbf{f} \to \top}$.
- $[\mathcal{S}_\mathbf{f}]$: systems containing $r_{\mathbf{f} \to \top}$ but not $r_{\mathbf{t} \to \top}$.
- $[\mathcal{S}_{\mathbf{t}\mathbf{f}}]$: systems containing both.

**The trivial-base meta-moduli has exactly 4 points.**

## Meta-stratification

Per the [meta-stratification by regime theorem](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/meta-stratification-by-regime.md), each meta-point is in exactly one meta-stratum.

For all four points:

- The closure operators are *finite-iterable* — closure converges in at most one step (the rule fires at most once).
- Hence every settling $v_\mathcal{S}^U$ has $\kappa \leq 1 < \omega$ — strict regime.

**All four meta-points are in $\mathscr{M}^{\mathrm{meta}}_{\mathrm{strict}}(B)$** — the meta-strict stratum. The other meta-strata (meta-Scott-continuous, meta-transfinite-bounded, meta-aperiodic) are *empty* on this trivial base.

This matches expectations: the trivial base has too little structure to support non-strict-regime closure dynamics. To get into higher meta-strata, the base needs richer structure (countably-many entities, $\Pi_1$ rule formulas, etc.).

## The realizability map's image on this base

The [meta-realizability map](../../../../glossary/concepts/meta-realizability-map.md) $\pi^{\mathrm{real}} : \mathscr{M}^{\mathrm{SKH}}(B) \to \mathscr{M}^{\mathrm{meta}}(B)$ sends each settling $[v]$ to its closure-rule class.

For the trivial base:

- The settling moduli $\mathscr{M}^{\mathrm{SKH}}(B)$ contains settlings parameterized by:
  - increment sequence $u_1 \in \{\bot, \mathbf{t}, \mathbf{f}, \top\}$ (the only non-trivial increment is at $\tau = 1$);
  - up to MLD-equivalence (which is trivial here — no settling-shift symmetry on a 2-stage settling).
- Distinct settlings: $v_\bot$ (told $\bot$), $v_\mathbf{t}$ (told $\mathbf{t}$), $v_\mathbf{f}$ (told $\mathbf{f}$), $v_\top$ (told $\top$). Four settlings.

The realizability map sends each settling to its closure-rule class:

- $\pi^{\mathrm{real}}([v_\bot]) = [\mathcal{S}_\emptyset]$ — no closure activity, trivial rule system.
- $\pi^{\mathrm{real}}([v_\mathbf{t}]) = [\mathcal{S}_\emptyset]$ — same; the $\mathbf{t}$-content was added by the increment, not by closure. The rule system is trivial.
- $\pi^{\mathrm{real}}([v_\mathbf{f}]) = [\mathcal{S}_\emptyset]$ — same.
- $\pi^{\mathrm{real}}([v_\top]) = [\mathcal{S}_\emptyset]$ — same. The $\top$-content was told, not derived from closure.

**All four settlings map to the trivial meta-class $[\mathcal{S}_\emptyset]$.** The image of $\pi^{\mathrm{real}}$ is a single point.

## What this exhibits

Three structural observations:

**1. The realizability map can have small image.** The trivial base has 4-element meta-moduli but the realizability map's image is only 1 element. The other 3 meta-points ($[\mathcal{S}_\mathbf{t}]$, $[\mathcal{S}_\mathbf{f}]$, $[\mathcal{S}_{\mathbf{t}\mathbf{f}}]$) are *not realized by any settling in $\mathrm{KP}^{\mathrm{vis}}(B)$* — they exist as closure-rule structures but no actual settling carries their closure operator.

This is because: the non-trivial rules $r_{\mathbf{t} \to \top}$ and $r_{\mathbf{f} \to \top}$ require a settling to have $\mathbf{t}$- or $\mathbf{f}$-content as antecedent. On the trivial base, settlings have $\mathbf{t}$- or $\mathbf{f}$-content only via the *increment*, not by closure-derivation. The closure rules $r_{\mathbf{t} \to \top}$ would fire if $v_1(a, a) \geq_k \mathbf{t}$, taking it to $\top$ — but since this is a *single-step closure*, the resulting settling has $v_1(a, a) = \top$, which is the same settling as $v_\top$ above. Hence $\pi^{\mathrm{real}}([v_\top]) = [\mathcal{S}_\emptyset]$, not $[\mathcal{S}_\mathbf{t}]$.

The non-trivial meta-points are *unrealizable on this base* — they parameterize closure operators that don't arise from any concrete settling on this base. To realize them, the base needs richer structure (e.g., $|E| \geq 2$ so cells can interact via closure).

**2. Meta-classification is finer than settling-classification.** The settling moduli has 4 settlings; the meta-moduli has 4 meta-classes. The realizability map collapses the settling moduli to 1 meta-class, leaving 3 meta-classes "unrealized." This reflects that closure-rule structures carry *more information* than the settlings they happen to generate — they encode *potential* closure dynamics that may or may not be exercised on a specific base.

**3. Trivial-base meta-classification is essentially trivial.** All four meta-classes are meta-strict; the realizability map is a constant map; the meta-moduli has 4 points. To exhibit substantive meta-classification structure, the base needs to support non-strict-regime settlings — meaning $|E| \geq \omega$ and / or $\Pi_1$ rules.

## Position in the program

This is the smallest non-trivial worked example of the meta-classifier construction. It validates:

- The meta-moduli is a coherent categorical object (4 distinct points on this base).
- The meta-stratification operates correctly (all 4 in meta-strict).
- The realizability map is well-defined as a stack morphism (constant map onto $[\mathcal{S}_\emptyset]$).
- The meta-classifier can have *unrealized* meta-points (3 of 4 here).

Larger examples (with $|E| \geq 2$ or $\Pi_1$ rules) would exhibit:

- Non-trivial meta-stratification (some meta-points in higher meta-strata).
- Substantial realizability-image structure.
- Closure-rule system equivalence classes that are *more* than just operator-collapse.

The corpus's existing transfinite-bounded and aperiodic worked settling examples (the [mixed-stratum two-firing settling](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/examples/mixed-stratum-two-firing-settling.md), the [paraconsistent transfinite settling](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/examples/paraconsistent-transfinite-settling.md)) would be natural sites for richer meta-classification examples — each lives over a larger base where the meta-moduli has substantive structure.

This trivial-base example is the *bare grounding*: it shows the meta-classifier construction works as intended, without relying on richer structure to make the construction non-trivial.
