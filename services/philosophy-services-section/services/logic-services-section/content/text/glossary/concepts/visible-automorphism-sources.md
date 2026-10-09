---
kind: theorem
status: proved
depends-on: [visible-automorphism-quotient, invisible-automorphism-subgroup, settling-associated-sheaf, internal-z2-gauge, predicate-generator-exhaustiveness, equivariant-settling-cohomology]
title: Visible automorphism sources
description: "Under the naturality hypothesis (predicate generator exhaustiveness), an automorphism source $X$ of a settling $v$ contributes to the natural visible automorphism quotient $\\mathrm{Aut}^{\\mathrm{vis}}{\\mathrm{nat}}(v)$ iff:"
---

# Visible automorphism sources

Under the naturality hypothesis ([predicate generator exhaustiveness](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/predication-fibration/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md)), an automorphism source $X$ of a settling $v$ contributes to the natural [visible automorphism quotient](../../../../../relationality-services-section/services/agency-services-section/content/text/glossary/concepts/visible-automorphism-quotient.md) $\mathrm{Aut}^{\mathrm{vis}}_{\mathrm{nat}}(v)$ iff:

- (a) a non-identity element of $X$ stabilizes $v$ (lies in $\mathrm{Aut}^\simeq_{\mathrm{nat}}(v)$); *and*
- (b) that element acts non-trivially on the [settling-associated sheaf](../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agent-organization-engine/lib/relating/docs/settling-associated-sheaf.md) — equivalently, permutes newly-designated cells non-trivially.

## Source-by-source analysis

**Bilattice negation gauge** ([internal $\mathbb{Z}/2$-gauge](../../documents/articles/notes/undated/internal-z2-gauge.md)). Condition (b) *always* fails. The negation $\sim$ fixes cell positions and acts only on values at each cell; its induced cellwise reindexing is the identity on $E \times E$; hence $\mathcal{F}_U$ — which tracks cell positions, not values — is fixed by gauge. Gauge therefore *never contributes* to $\mathrm{Aut}^{\mathrm{vis}}$ for the basic $\mathcal{F}_U$ sheaves.

This is the *intrinsic* gauge action on a single settling: the question "does $\sim$ stabilize $v$ and act non-trivially on $\mathcal{F}_U$." When it stabilizes, it sits in $N(v)$ and contributes nothing to $\mathrm{Aut}^{\mathrm{vis}}(v)$. The distinct *external* action on the global classifying invariant — sign-flipping the $\mathbf{t}$-summand of $H^1$ — is the [classifying morphism $\mathbb{Z}/2$-equivariance](classifying-morphism-z2-equivariance.md): that action is on the cohomology target, not on a single settling's automorphism group, and is always non-trivial on the $\mathbf{t}$-side. The two are consistent: gauge fixes cell positions (intrinsic, here) while permuting the value labels assigned to those positions (external, in the cohomological action). The [equivariant settling cohomology](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/equivariant-settling-cohomology.md) is the refinement that *does* see the external action.

**Fiber swap** $(s, o) \mapsto (o, s)$. Condition (a) requires the settling to be swap-symmetric: $v_\tau(q)(s, o) = v_\tau(q)(o, s)$. Condition (b) then requires swap to permute newly-designated cells non-trivially — false if the newly-designated-cell set is contained in the diagonal (swap fixes the diagonal pointwise), true if it includes off-diagonal $\mathbb{Z}/2$-symmetric pairs $\{(s, o), (o, s)\}$ with $s \neq o$.

**Entity-permutation $\mathrm{Sym}(E)$-stabilizer.** Condition (a) is the stabilizer of $v$ under the $(s, o) \mapsto (e(s), e(o))$ action. Condition (b) is that the stabilizer permutes newly-designated cells non-trivially.

**Predicate-automorphism stabilizer.** Condition (a) is the stabilizer under the action of generator-class-preserving endofunctors of $\mathcal{C}$. Condition (b) is again non-trivial cell permutation. For one-object $\mathcal{C}$ (e.g., the [transfinite-induction settling](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/examples/transfinite-induction-settling.md)), this source is trivially trivial.

## Proof

The two-part criterion is the definition of $\mathrm{Aut}^{\mathrm{vis}} = \mathrm{Aut}^\simeq / N$: an element $g \in X$ contributes iff $g$ is an automorphism of $v$ (condition (a)) and $g \notin N$ (condition (b)).

For gauge: cellwise reindexing is the identity, so gauge automatically lies in $N$ whenever it lies in $\mathrm{Aut}^\simeq$.

For fiber-swap, entity-permutation, predicate-automorphism: cellwise reindexing is the corresponding index-set permutation, which may or may not be identity on newly-designated cells depending on the settling. $\square$

## Reading

The proposition reframes the four sources of settling-automorphisms by filtering for visibility. Gauge is eliminated entirely for basic $\mathcal{F}_U$ sheaves. The other three contribute only when the settling has appropriate cell-symmetry structure — depending on the specific settling's newly-designated-cell pattern, not just the base parameters.

This is what makes some moduli points [rigid](../../../../../relationality-services-section/services/agency-services-section/content/text/glossary/concepts/rigid-moduli-point.md) (no source contributes; trivial visible auto) and others [orbifold](../../../../../relationality-services-section/services/agency-services-section/content/text/glossary/concepts/orbifold-moduli-point.md) (some source contributes; non-trivial visible auto). The substratification of the moduli by rigid vs orbifold is therefore indexed by the symmetry structure of newly-designated cells, not by base parameters alone.
