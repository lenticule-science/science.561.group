---
type: narrative
status: current
introduces: [closure-rule, closure-rule-language, closure-rule-system, strict-regime-realizability, scott-continuous-regime-realizability, transfinite-bounded-regime-realizability, aperiodic-regime-realizability, bigraded-realizability-refinement, c-naturality-coupling-realizability-refinement, rule-language-fragment-realizability-refinement, realizability-cardinality-bound]
discusses: [moduli-classifying-function, combined-cohomology-classifying-morphism]
---

# The realizability program

The [moduli classifying function](../morphisms/moduli-classifying-function.md) $\mathcal{I}_B$ is injective on each [regime stratum](../theorems/regime-decomposition.md) — distinct MLD-classes have distinct sheaf-iso classes. The complementary question — which sheaf-iso classes are actually *realized* by some MLD-class over a given base — is the subject of the realizability program.

Realizability does not admit a single closed-form characterization. It decomposes structurally along two layers, each of which contributes its own theorem-set to the program.

## The first layer: regime decomposition

The four regimes of the [four-regime dichotomy](../theorems/four-regime-dichotomy.md) cut realizability along structurally different lines.

**Strict and Scott-continuous regimes.** $H^1 = 0$ on these regimes ([settling cohomology vanishes above degree 1](../theorems/settling-cohomology-vanishes-above-degree-1.md) plus regime-specific vanishing); the moduli classifying function lands purely in $H^0$. Realizability is essentially trivial: any $\mathcal{C}$-natural eventually-designated cell configuration is realizable, by setting it directly via increments and using a vacuous closure-rule system. [Strict-regime realizability](../theorems/strict-regime-realizability.md) and [Scott-continuous-regime realizability](../theorems/scott-continuous-regime-realizability.md) state this — the moduli classifying function is a *bijection* on these strata.

**Transfinite-bounded and aperiodic regimes.** $H^1 \neq 0$; the firing-ordinal structure produces non-trivial cohomology. Realizability is substantive: only specific subsets of countable limit ordinals arise as the firing-ordinal sets of admissible closure-rule systems. [Transfinite-bounded-regime realizability](../theorems/transfinite-bounded-regime-realizability.md) and [aperiodic-regime realizability](../theorems/aperiodic-regime-realizability.md) characterize the realizable family in the bare $\Pi_1$+$<$ rule language: the realizable $L_{\mathrm{ns}}$-subsets are exactly the *initial segments* of countable limit ordinals (with the regime-specific bound $\omega_1$ or below).

The four per-regime theorems together close the first layer of the program. The strict and Scott-continuous theorems are decidability statements; the transfinite-bounded and aperiodic theorems are the substantive cohomological characterizations. All four are necessary; none subsume the others.

## The second layer: axes within transfinite-bounded and aperiodic

Within the two regimes with non-trivial $H^1$, three orthogonal structural axes refine the per-regime realizability question.

**Bigraded value-type axis.** A settling can produce $\mathbf{t}$-cells (truth-side) or $\top$-cells (inconsistency-side); the [bigraded classifying invariant](../objects/bigraded-settling-cohomology.md) splits the classifying invariant into separate components. On a *discrete* predicate category, the two components are independently realizable — [bigraded realizability refinement](../theorems/bigraded-realizability-refinement.md) shows that the realizable bigraded family is a 2-parameter family of pairs of initial segments. The [bigraded aperiodic-regime trichotomy](../theorems/bigraded-aperiodic-regime-trichotomy.md)'s consistent / paraconsistent / mixed sub-strata are populated accordingly. Witness: [mixed-stratum two-firing settling](../examples/mixed-stratum-two-firing-settling.md).

**$\mathcal{C}$-naturality coupling axis.** When the [predicate category](../objects/predicate-category.md) $\mathcal{C}$ has non-trivial morphisms, the closure operator's [$\mathcal{C}$-naturality](../concepts/predicate-category-naturality.md) couples per-predicate firing patterns. Each of the four predicate-generator classes — [specialization](../morphisms/predicate-specialization.md), [converse](../morphisms/predicate-converse.md), [subject-projection](../morphisms/predicate-subject-projection.md), [object-projection](../morphisms/predicate-object-projection.md) — imposes its own coupling. [$\mathcal{C}$-naturality coupling refinement](../theorems/c-naturality-coupling-realizability-refinement.md) addresses the coupling structure per-generator. Witnesses: [coupled-predicate transfinite settling](../examples/coupled-predicate-transfinite-settling.md) (specialization) and [converse-coupling transfinite settling](../examples/converse-coupling-transfinite-settling.md) (converse).

**Rule-language fragment axis.** The [closure-rule language](../concepts/closure-rule.md) committed to is positive $\Pi_1$-schemas with atoms over the inherited $\{<\}$-signature on $E$. Richer fragments — named-ordinal entity-equality literals, ordinal-arithmetic primitives ($+, \cdot$), $\Pi_2$-rule schemas, second-order quantifiers — extend the realizable family with their own characterizations. [Rule-language fragment refinement](../theorems/rule-language-fragment-realizability-refinement.md) walks this hierarchy; each enrichment is its own sub-theorem.

The three axes are *orthogonal*: each modulates the realizable family independently of the others, at least in the worked-through cases. Cross-axis interactions — especially how $\mathcal{C}$-naturality coupling interacts with the bigraded structure on non-discrete $\mathcal{C}$ — remain open.

## What's coarse and what's tight

The [realizability cardinality bound](../theorems/realizability-cardinality-bound.md) gives a coarse upper bound: at most $2^{\aleph_0}$ subsets are realizable, regardless of regime, axis, or fragment. The bound is loose by orders of magnitude — the per-regime theorems show the actual realizable family is far smaller. The cardinality bound's role in the program is structural: it establishes that the realizability question is non-trivial at all (not every subset of $\omega_1$ is realizable, by Cantor) and bounds what enrichments could possibly achieve.

The per-regime theorems and per-axis refinements give the tight characterizations within their scope. All four per-regime theorems and the bigraded and $\mathcal{C}$-naturality axis refinements are *proved* from within predication categories' structures. The rule-language fragment refinement is *proved* at the bare $\Pi_1$+$<$ and named-ordinal entity-equality levels; higher fragments (ordinal arithmetic, $\Pi_2$, second-order) are sketched but not formalized in detail.

## What this lets us say about the moduli

Once realizability is fully characterized, the moduli classifying function $\mathcal{I}_B$ becomes an isomorphism onto its (now-explicit) image. The moduli stack's structure on each regime stratum is determined by:

1. The regime (which fixes the cohomological infrastructure: $H^1 = 0$ vs $H^1 \cong \bigoplus_{L_{\mathrm{ns}}} \mathbb{Z}$).
2. The bigraded value-type assignment (consistent / paraconsistent / mixed).
3. The $\mathcal{C}$-naturality coupling structure of the predicate category.
4. The rule-language fragment used.

Together these determine the realizable family, hence the image of $\mathcal{I}_B$, hence the moduli stack on the stratum. The realizability program therefore completes the moduli classification: from "$\mathcal{I}_B$ is injective" (existing classification theorems) to "$\mathcal{I}_B$ is bijective onto a structurally explicit image" (after realizability).

## Connection points

The program connects outward to:

- [Realizability as inductive definability](realizability-as-inductive-definability.md): the bare-language theorems are the bilattice-2-monadic refinement of classical positive-monotone-$\Pi_1$ inductive definability (Moschovakis, Aczel). The connection is methodological texture — predication categories' proofs are within-theory, but the parallel illuminates the rule-language fragment hierarchy and suggests proof techniques transferable from the classical framework.
- The [representation-theory question](../questions/representation-theory-skh.md): which cohomology classes are accessible from finite-rule presentations vs richer rule systems is a representation-theoretic question about the predication hyperdoctrine. The rule-language fragment axis is essentially this question made precise.
- The [Sadun substitution-tiling template](../narratives/aperiodic-dynamics-template.md): the realizability question parallels the question of which Čech cohomology classes are realized by substitution tilings — a worked-out research direction in the tiling literature whose patterns may transfer.
- The [strong-MLD classification question](../questions/strong-mld-classification.md): a finer equivalence than MLD might be classified by a strict refinement of the cohomological invariants, with its own realizability question.

## Open work

The realizability program's open frontier is the higher fragments of the rule-language axis — ordinal-arithmetic primitives, $\Pi_2$-rule schemas, second-order quantifiers — and the cross-axis interactions among the three refinements. Each higher fragment has a constructive lower-bound direction accessible by explicit encoding; the upper-bound directions require detailed complexity-class analysis of the rule language's expressive power, in the spirit of [realizability as inductive definability](realizability-as-inductive-definability.md).
