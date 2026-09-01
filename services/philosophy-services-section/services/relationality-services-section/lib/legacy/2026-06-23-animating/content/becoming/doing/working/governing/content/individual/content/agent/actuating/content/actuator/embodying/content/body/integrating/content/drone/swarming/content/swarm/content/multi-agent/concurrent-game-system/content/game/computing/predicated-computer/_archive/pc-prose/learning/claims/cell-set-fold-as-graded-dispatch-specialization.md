---
type: theorem
class: engineering-claim
status: proved
depends-on: [graded-dispatch-via-q-enriched-fusion, twist-product-fusion, quantale-graded-composition-uniformity, predication-fiber-algebra, paraconsistency-as-substrate-discipline, cost-composition-via-lawvere-quantale, closure-rule-system-realizes-closure-2-monad]
see-also: [cache-coherence-via-functorial-projection, federation-path-metrics-multiplicative]
---

# Cell-set fold is graded-dispatch specialization

**Claim.** For any admissibility cell-set $\{(\sigma_i, p, o_i) = v_i\}_{i \in I}$ in a [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) $A_p$ enriched over a commutative unital quantale $\mathsf{Q}$, the substrate's local *fold*

$$\mathrm{fold}_\odot \{v_i\}_{i \in I} \;:=\; \bigodot_{i \in I} v_i \;\in\; A_p$$

is the iterated-binary case of [graded-dispatch-via-q-enriched-fusion](graded-dispatch-via-q-enriched-fusion.md): the bilattice tag composes per [twist-product-fusion](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md), the quantale grade composes multiplicatively per [quantale-graded-composition-uniformity](quantale-graded-composition-uniformity.md), and tied-on-tag instances produce a $\top$-tagged fold-result cell retained per [paraconsistency-as-substrate-discipline](paraconsistency-as-substrate-discipline.md).

Three engineering surfaces — voting-tally, progress-rollup, tier-routing — are three instantiations of this fold differing only in the choice of quantale $\mathsf{Q}$ and the choice of meet axis ($\wedge_t$ for truth-aggregating, $\wedge_k$ for knowledge-aggregating, mixed for cost-with-admissibility):

- **Voting:** $\mathsf{Q} = $ trivial one-element quantale (grade is identity); meet axis $\wedge_t$. The fold reduces to plain $\odot$-fold of bilattice tags, with $\top$-retention for tied-truth ballots.
- **Progress rollup:** $\mathsf{Q} = ([0,1], \min, 1)$ for AND-rollup of completion fractions, or $([0,1], \max, 0)$ for OR-rollup of any-blocked; meet axis $\wedge_k$. Cross-fiber rollup additionally cites [predication-fiber-functor](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md) for substitution along the goal $\to$ milestone projection.
- **Tier-routing:** $\mathsf{Q} = $ the substrate's cost quantale per [cost-composition-via-lawvere-quantale](cost-composition-via-lawvere-quantale.md) (default $([0,\infty], +, \min)$); the bilattice tag carries the admissibility decision; tied-on-cost tiers produce a $\top$-tagged routing-decision cell that the office's policy resolves.

## Why this holds

Per [graded-dispatch-via-q-enriched-fusion](graded-dispatch-via-q-enriched-fusion.md), the binary $\odot$ on a $\mathsf{Q}$-enriched fiber decomposes into a bilattice-tag component composing per [twist-product](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/twist-product.md) and a quantale-grade component composing multiplicatively. Per the quantale's distributivity over arbitrary suprema, the iterated-binary $\bigodot_{i \in I}$ is well-defined for any indexing set $I$ and equals the supremum-of-finite-prefixes when $I$ is countable (the substrate's case).

The three properties of the fold follow:

1. **Bilattice tag composition.** Per [twist-product-fusion](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md), the tag of $\bigodot_i v_i$ is the iterated $\odot$-composition of the input tags. The tag's lattice operations $(\wedge_t, \vee_t, \wedge_k, \vee_k)$ each have unit and absorbing elements per the four-bilattice $\mathbf{L}^\bowtie$ structure; the substrate's choice of meet axis selects which composition the fold uses.
2. **Quantale grade composition.** Per [quantale-graded-composition-uniformity](quantale-graded-composition-uniformity.md), the grade of $\bigodot_i v_i$ is the iterated $\cdot$-product of the input grades, distributed over the bilattice's join structure per the quantale axioms.
3. **Tied-instance $\top$-retention.** When two cells $v_i, v_j$ have tags whose $\odot$-composition produces $\top$ (the bilattice's both-true-and-false witness), the fold result retains the $\top$-tag rather than collapsing to $\mathbf{f}$. Per [paraconsistency-as-substrate-discipline](paraconsistency-as-substrate-discipline.md), $\top$ is a first-class cell value that the substrate preserves; the office (or captain) resolves the contradiction at the application surface, not the substrate at the algebra surface.

The fold is a *closure step* per [closure-rule-system-realizes-closure-2-monad](closure-rule-system-realizes-closure-2-monad.md): given a cell-set and a closure rule "the fold of these cells lives at this fold-result cell," one application of the substrate's closure 2-monad produces the fold-result cell. The fold is therefore not a new substrate primitive — it is the existing closure step applied to a fold-rule.

## Engineering consequence

- **No new fold operator needed.** A v0.7 (or any version) productivity-stack implementing voting, progress-rollup, or tier-routing uses the substrate's existing $\odot$ via a closure rule expressing the fold; no new bytecode, no new substrate verb, no new event-log entry kind.
- **Single surface across three engineering features.** Voting tally, progress rollup, and tier routing — three application surfaces the dev docs treat as separate — are one operator with three quantale choices. The substrate's correctness arguments cover all three at once.
- **Tied outcomes are first-class.** A tied vote, a contradictory progress signal, a tied-cost tier — each produces a $\top$-tagged fold-result cell that downstream policy (office decision, captain review) resolves. The substrate does not silently break ties.
- **Cross-fiber rollup is functorial.** When progress-rollup combines goals across milestones, the cross-fiber substitution is the [predication-fiber-functor](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md) acting on the milestone $\to$ goal predicate-category morphism; the rollup commutes with re-fibration.

## What the theorem rules out

- **Fold-as-new-substrate-primitive.** A productivity-stack design that introduces a `fold` verb distinct from the substrate's $\odot$ is duplicating existing structure. Per the theorem, fold *is* iterated $\odot$ specialised to the relevant quantale.
- **Tie-collapse to $\mathbf{f}$ at the substrate surface.** A fold implementation that resolves $\top$ to $\mathbf{f}$ (or to $\bot$) at the substrate level discards content per [paraconsistency-as-substrate-discipline](paraconsistency-as-substrate-discipline.md). Tie resolution belongs to the office's policy at the application surface.
- **Non-quantale grade composition.** A rollup that adds progress-percentages where the application semantics are AND (min) is not implementing a fold — it is implementing arithmetic. The choice of $\mathsf{Q}$ must match the application's intended composition law.

## What the theorem requires

- The fiber-algebra is enriched over a commutative unital quantale $\mathsf{Q}$ (per [quantale-enriched-sheaf](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/quantale-enriched-sheaf.md)).
- The fold's $\odot$ uses the quantale's $\cdot$ for grade composition (per [graded-dispatch-via-q-enriched-fusion](graded-dispatch-via-q-enriched-fusion.md)).
- The bilattice tag composes per [twist-product](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/twist-product.md) rules.
- The substrate retains $\top$-tagged fold-result cells per [paraconsistency-as-substrate-discipline](paraconsistency-as-substrate-discipline.md).

## Position

This theorem is the substrate-side specialization of [graded-dispatch-via-q-enriched-fusion](graded-dispatch-via-q-enriched-fusion.md) for non-dispatch fold surfaces. It discharges the productivity-stack's "fold primitive" question: the operator the dev docs call `vote-as-bilattice-fold` or `progress-rollup-as-fiber-fold` is graded-dispatch-fusion with the appropriate quantale, no new mathematics. Together with [cache-coherence-via-functorial-projection](cache-coherence-via-functorial-projection.md) (for memoised fold results) and [federation-path-metrics-multiplicative](federation-path-metrics-multiplicative.md) (for cross-substrate fold), the fold's full engineering profile is structural in existing theory.
