---
type: question
class: internal
status: partial
explores: [predication-settling, predication-cell, predication-fiber-algebra, predicate-generator-exhaustiveness, predicate-category]
---

# Higher-order predication settlings

> **Progress (sub-question 1, the arity lift).** The [n-ary predication object](../objects/n-ary-predication.md) generalizes the cell space from $E \times E$ to $E^n$ for any $n$. The [higher-arity cohomological rank theorem](../theorems/higher-arity-cohomological-rank.md) gives the arity-collapse vs. arity-amplification dichotomy on $H^1$ rank: projection-only closures don't gain rank from arity; genuine $n$-ary joins amplify rank up to $k^n$. The [3-ary causal-triple benchmark](../examples/benchmarks/benchmark-causal-triples-3-ary.md) verifies both regimes empirically. The "what lifts cleanly / what breaks" question is now substantially answered: the regime dichotomy and closure-2-monad lift; cohomological rank scales (or doesn't) per the dichotomy. **Still open**: predicate-generator exhaustiveness on $n$-ary cells (the $\mathcal{O}(n^2)$-generator structure described below), the $S_n$-equivariance argument's lift, and **sub-question 2 entirely** — predicates-over-predicates, the genuinely higher-order direction. The arity lift is done; the order lift isn't.

The corpus's [predication settling](../objects/predication-settling.md) is first-order in two distinct ways, often conflated:

1. **Arity.** Predicates are binary — fiber algebras live on $E \times E$, the cell index of subject-object pairs.
2. **Order.** Predicates range over entities, not over predicates themselves; there is no quantification over predicates within the language.

Both can be lifted independently, and the resulting frameworks are different. Open: develop both, identify which structural results lift cleanly and which require new arguments.

## Sub-question 1: Arbitrary-arity predicates

Replace binary cells $(s, o) \in E \times E$ with $n$-ary cells $(e_1, \ldots, e_n) \in E^n$, with [predication fiber algebras](../objects/predication-fiber-algebra.md) on $E^n$ rather than $E \times E$. The fiber algebra is then $\mathbf{L}^{\bowtie\, E^n}$ — the same twist-product construction, just over a larger index.

What lifts cleanly:

- The [predication fiber functor](../theorems/predication-fiber-functor.md) and pure algebra of fiber-algebra structure.
- The settling dynamics ([predication settling](../objects/predication-settling.md), settling monotonicity, four-regime dichotomy) — these are stated cell-wise and don't depend on cell arity.
- The bilattice and twist-product apparatus ($\mathbf{L}^\bowtie$ extends to any index set).

What breaks:

- **[Predicate-generator exhaustiveness](/predication-categories/library/predication-cell-complex-site/content/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md)** is *binary-specific*: the four generator classes (specialization, converse, subject-projection, object-projection) are derived from the $S_2$-action on the two coordinates. On $n$-ary cells, the equivariance group is $S_n$, with $n!$ permutations and $2^n - 2$ non-trivial projections. The four-generator-class structure becomes a $\binom{n}{2} + n + (n+1) + 1 = \mathcal{O}(n^2)$-generator structure. Whether *exhaustiveness* holds — whether all natural bilattice homomorphisms decompose into these — is a separate proof on $n$-ary cells.
- The [predicate category](../objects/predicate-category.md) on $n$-ary cells is structurally richer: more generators, more relations, different composition patterns. The corpus's $\mathcal{C}$-naturality apparatus needs the $n$-ary refinement.

## Sub-question 2: Predicates-over-predicates

Quantify over predicates: a predicate of order 2 takes other predicates as arguments. Fiber algebras now live over $\mathcal{C}^k \times E^n$ for an order-$k$, $n$-ary predicate.

This is a substantially different undertaking — closer to higher-order logic / type theory than to the present first-order setting. The key structural change:

- The [predication hyperdoctrine](../objects/predication-hyperdoctrine.md) becomes a *higher-order* hyperdoctrine — quantification over $\mathcal{E}_p$ in addition to over $E$. The classical apparatus of higher-order hyperdoctrines (Pitts, Jacobs) is the natural template.
- The four-regime dichotomy may not survive: closure on higher-order data has different finiteness properties.
- The CRDT story may not extend: higher-order merge isn't obviously cellwise.

Higher-order is enough of a departure that it may be a *separate framework* rather than an extension — the relationship would be that the present framework is the first-order fragment.

## Specific sub-questions

- Does predicate-generator exhaustiveness lift to ternary predicates? This is the smallest non-trivial test of the equivariance argument's $n$-arity dependence.
- Is the closure 2-monad's lax-idempotence stable under arity lift, or does it become a higher-categorical structure on $n$-ary cells?
- For the higher-order direction: does the existing higher-order hyperdoctrine literature (Pitts, Jacobs) plug in directly when the value type is bilattice rather than two-valued?

## Why the question matters

The corpus's first-order restriction is a structural commitment — the moduli classification, the cohomology vanishing, the realizability program all use it. A higher-order framework would *re-derive* these results in a richer setting and identify which are first-order phenomena and which lift. The corpus's [predication-cell](teaching/explanations/predication-cell.md) concept, currently loose (no characterizing theorems), would acquire its load via the higher-arity refinement — the abstraction from binary to $n$-ary is what makes the cell concept meaningful as a separate notion from "subject-object pair."
