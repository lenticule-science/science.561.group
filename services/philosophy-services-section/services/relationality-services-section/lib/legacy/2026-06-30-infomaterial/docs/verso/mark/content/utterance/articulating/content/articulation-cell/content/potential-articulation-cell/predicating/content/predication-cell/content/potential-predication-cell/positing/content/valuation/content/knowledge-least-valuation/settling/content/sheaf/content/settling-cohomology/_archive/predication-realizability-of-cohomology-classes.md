---
type: question
class: internal
status: partial
explores: [moduli-classifying-function, combined-cohomology-classifying-morphism, aperiodic-regime-moduli-classification, transfinite-bounded-regime-moduli-classification, stabilizing-regimes-combinatorial-classification, non-scott-continuous-firing-ordinal, aperiodic-classifying-invariant, bigraded-aperiodic-regime-trichotomy, predicate-category-naturality, closure-rule, strict-regime-realizability, scott-continuous-regime-realizability, transfinite-bounded-regime-realizability, aperiodic-regime-realizability, bigraded-realizability-refinement, c-naturality-coupling-realizability-refinement, rule-language-fragment-realizability-refinement]
---

# Realizability of cohomology classes

The [moduli classifying function](../morphisms/moduli-classifying-function.md) $\mathcal{I}_B$ is injective on each regime stratum. The realizability question characterizes its *image* — which cohomology classes are realized by some MLD-class of settlings over $B$.

The question decomposes structurally rather than admitting a single unified answer. Two layers of decomposition apply:

## Decomposition by regime

The four regimes of the [four-regime dichotomy](../theorems/four-regime-dichotomy.md) each have their own realizability question, with regime-specific structural character:

- **Strict regime** ($\kappa < \omega$). $H^1 = 0$ ([settling cohomology vanishes above degree 1](../theorems/settling-cohomology-vanishes-above-degree-1.md) plus regime-finiteness). Realizability is purely $H^0$-pattern: which finite eventually-designated cell patterns are reachable from finite increment + closure-rule systems on finite bases. Combinatorial and decidable.

- **Scott-continuous regime** ($\kappa = \omega$). $H^1 = 0$. Realizability is the countable analogue: which countable cell patterns are reachable under [Scott-continuous closure](teaching/explanations/scott-continuous-closure.md). Still combinatorial.

- **Transfinite-bounded regime** ($\omega < \kappa < \omega_1$). $H^1 \cong \bigoplus_{L_{\mathrm{ns}}(\kappa)} \mathbb{Z}$ by [transfinite-bounded-regime $H^1$-generators](../theorems/transfinite-bounded-regime-h1-generators.md). Realizability has both an $H^0$-pattern component and an $H^1$-firing-ordinal-set component. The substantive content is in the firing-ordinal-set characterization.

- **Aperiodic regime** ($\kappa \geq \omega_1$). Same structure as transfinite-bounded but at the $\omega_1$-scale; $H^1$ a free abelian group of rank up to $\aleph_1$.

The [combined cohomology classifying morphism](../morphisms/combined-cohomology-classifying-morphism.md) $\mathrm{cl}\text{-}\mathrm{inv}^{(0,1)}$ unifies $H^0$ and $H^1$ across regimes, but the realizability question is regime-specific: each stratum's image is characterized separately.

## Decomposition by axis (within transfinite-bounded and aperiodic)

Within the two regimes with non-trivial $H^1$, three orthogonal structural axes refine the per-regime realizability question:

- **Bigraded value-type axis.** The bigraded classifying invariant $\mathrm{cl}\text{-}\mathrm{inv}^{(k,t)}(v) = (\mathrm{cl}\text{-}\mathrm{inv}^{(t)}(v), \mathrm{cl}\text{-}\mathrm{inv}^{(\top)}(v))$ splits the realizable family into the consistent / paraconsistent / mixed sub-strata of the [bigraded aperiodic-regime trichotomy](../theorems/bigraded-aperiodic-regime-trichotomy.md). Per-regime realizability further decomposes into independent realizability of each component.

- **$\mathcal{C}$-naturality coupling axis.** When the [predicate category](../objects/predicate-category.md) $\mathcal{C}$ is non-discrete, the closure operator's [predicate-category naturality](teaching/explanations/predicate-category-naturality.md) couples per-predicate firing patterns. Each of the four predicate-category generator classes — [specialization](../morphisms/predicate-specialization.md), [converse](../morphisms/predicate-converse.md), [subject-projection](../morphisms/predicate-subject-projection.md), [object-projection](../morphisms/predicate-object-projection.md) — imposes a specific coupling on the realizable family across coupled predicates.

- **Rule-language fragment axis.** The [closure-rule language](teaching/explanations/closure-rule.md) committed to is positive $\Pi_1$-schemas with atoms over the inherited signature on $(\mathbf{L}, \mathcal{C}, E)$. Richer fragments — named-ordinal entity-equality literals, ordinal arithmetic primitives, $\Pi_2$-rules — extend the realizable family with their own realizability sub-questions.

The full per-regime realizable family is a coupled product of per-axis realizability constraints. There is no expectation of a single closed-form characterization across all dimensions; the program is to map the contribution of each dimension and how they couple.

## What is established

**Coarse upper bound.** [Realizability cardinality bound](../theorems/realizability-cardinality-bound.md): at most $2^{\aleph_0}$ subsets of countable limit ordinals are realizable. This bound is regime-, axis-, and rule-language-agnostic and is loose by an enormous gap relative to the per-regime characterizations below.

**Per-regime realizability theorems.** Each of the four regimes has its own realizability theorem:

- [Strict-regime realizability](../theorems/strict-regime-realizability.md): the moduli classifying function is a *bijection* on the strict stratum; every $\mathcal{C}$-natural finite cell configuration is realized. ($H^1 = 0$ leaves only $H^0$-pattern combinatorics.)
- [Scott-continuous-regime realizability](../theorems/scott-continuous-regime-realizability.md): same bijection statement at the countable scale.
- [Transfinite-bounded-regime realizability](../theorems/transfinite-bounded-regime-realizability.md): in the bare $\Pi_1$+$<$ rule language, realizable $L_{\mathrm{ns}}$-subsets are exactly initial segments of countable limit ordinals (status: sketch — converse direction has a structural-induction gap).
- [Aperiodic-regime realizability](../theorems/aperiodic-regime-realizability.md): the same statement at the $\omega_1$-scale (status: sketch — same gap, lifted via direct-limit argument).

**Per-axis refinements (within transfinite-bounded and aperiodic).**

- [Bigraded realizability refinement](../theorems/bigraded-realizability-refinement.md): on discrete $\mathcal{C}$, the bigraded classifying invariant's two components $(c_t, c_\top)$ are independently realizable as initial-segment indicator functions — a 2-parameter family. Status: sketch (lower bound proved constructively; upper bound inherits the gap of the per-regime theorems).
- [$\mathcal{C}$-naturality coupling refinement](../theorems/c-naturality-coupling-realizability-refinement.md): on non-discrete $\mathcal{C}$, each of the four predicate-category generators imposes its own coupling on per-predicate firing patterns. Specialization forces restriction; converse forces swap; subject- and object-projection force diagonal collapses. Status: draft.
- [Rule-language fragment refinement](../theorems/rule-language-fragment-realizability-refinement.md): bare $\Pi_1$+$<$ realizes initial segments; named-ordinal entity-equality literals extend to initial-segment-modulo-finite; ordinal-arithmetic primitives extend to arithmetic-definable; higher fragments to projective hierarchy. Status: draft (only the bare-language base case is established; enrichments are sketched).

**Lower-bound witnesses.** Concrete examples realizing specific classes:

- *Truth-side single-predicate consistent base-shift family*: [quantifier-induced transfinite settling](../examples/quantifier-induced-transfinite-settling.md), [two-firing transfinite settling](../examples/two-firing-transfinite-settling.md), [countably-many-firings transfinite settling](../examples/countably-many-firings-transfinite-settling.md), [transfinite-induction settling](../examples/transfinite-induction-settling.md).
- *Bigraded mixed stratum on discrete $\mathcal{C}$*: [mixed-stratum two-firing settling](../examples/mixed-stratum-two-firing-settling.md).
- *$\mathcal{C}$-naturality coupling*: [coupled-predicate transfinite settling](../examples/coupled-predicate-transfinite-settling.md) (specialization), [converse-coupling transfinite settling](../examples/converse-coupling-transfinite-settling.md) (converse).

## What remains open

The substantive open work is in completing the converse directions of the per-regime realizability theorems (currently `sketch` for transfinite-bounded and aperiodic, with explicit structural-induction gaps), and formalizing the per-axis refinement theorems beyond their `draft` status. Cross-axis interactions (e.g., bigraded independence on non-discrete $\mathcal{C}$) are the next frontier once the per-axis pieces are firmer.

## Why the question matters

Realizability separates the moduli-theoretically-natural-target ("$H^1$") from the *actual image* the moduli cuts out. Without it, $\mathcal{I}_B$ is only a tool for distinguishing MLD-classes by their image; it does not say which images are inhabited. Once realizability is characterized regime-by-regime and axis-by-axis, the moduli classifying function becomes a genuine isomorphism onto its (now-explicit) image, and the moduli stack's structure is fully described by structural data about the rule language and the base.

The question connects to the [representation-theory question](representation-theory-skh.md) at the moduli layer — which cohomology classes are accessible from finite-rule presentations vs richer rule systems is a representation-theoretic question about the predication hyperdoctrine.
