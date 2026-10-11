---
type: concept
class: data-access-discipline
depends-on: [index, predication-graph-store, traversal, predication-hyperdoctrine, lawvere-comprehension, query-logic-choice, two-internal-logics]
see-also: [full-text-search, query-planning, predicate-pushdown-via-frobenius, join-reordering-via-beck-chevalley]
---

# Query language

A *substrate-recorded language for expressing data lookups*. Where [traversal](../morphisms/traversal.md) is the substrate's primitive read operation, a query language composes traversals into expressive lookups: filters, joins, aggregations, projections.

In the substrate, the query language is not arbitrary syntax — it is the surface presentation of the [predication hyperdoctrine](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-hyperdoctrine.md)'s internal logic. Per [lawvere-comprehension](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/lawvere-comprehension.md), every query is a *comprehension term* of one of the hyperdoctrine's two internal logics. Per [query-logic-choice](query-logic-choice.md), the query author picks which.

## Hyperdoctrinal structure of a query

Every query decomposes into hyperdoctrine primitives:

- **Cell-atoms** — primitive predicates over cells (predicate-equals-X, value-in-range-Y). These are the fiber's atomic propositions.
- **Connectives** — $\wedge$, $\vee$, $\neg$ in the chosen logic. Per [two-internal-logics](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/two-internal-logics.md), the substrate distinguishes $\wedge_k$ (knowledge-meet, paraconsistent), $\wedge_t$ (truth-meet, classical), and $\odot$ (twist-product fusion, dispatch-style).
- **Substitution** — $f^*$ along a predicate-category morphism: rebind a query against a different cell-shape (e.g., relabel "user" to "agent").
- **Quantifiers** — $\exists_f$, $\forall_f$ along a generator $f$: existential / universal closure over a join axis. Per [predicate-generator-exhaustiveness](/predication-categories/library/predication-cell-complex-site/content/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md), all queries reduce to quantification along the four generator classes.
- **Comprehension** — $\{p : \psi\}$ extracts the subobject of cells satisfying $\psi$. The subscript indicates the logic: $\{p : \psi\}_\mathbf{t}$ for $T_t$, $\{p : \psi\}_\top$ for $T_k$ (per [classical-equality](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/classical-equality.md) / [paraconsistent-equality](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/paraconsistent-equality.md)).

A surface-syntax query (`SELECT ... WHERE ...`, GraphQL field selection, SPARQL pattern, substrate-native s-expression) compiles into this hyperdoctrine expression. The compiler's correctness theorem: the surface query and the hyperdoctrine expression denote the same comprehension subobject.

## What surface syntaxes substrates may present

- **SPARQL-style** — graph patterns map to existential conjunctions of cell-atoms; `OPTIONAL` corresponds to $\bot$-tolerant left-join (and so requires $T_k$).
- **GraphQL-style** — schema-typed hierarchical projection; per-field selection compiles to nested comprehensions with substitution along the schema.
- **SQL-like** — `SELECT` is comprehension, `WHERE` is meet of cell-atoms, `JOIN` is existential along a relation morphism, `GROUP BY` is aggregation along a generator.
- **Substrate-native** — query expressions are substrate predications, queryable themselves (per [self-representation](self-representation.md)).

The substrate's discipline does not require any one surface syntax — it requires that the surface compile into the hyperdoctrine expression and carry an explicit logic-choice tag.

## Engineering consequences of the hyperdoctrinal grounding

- **Optimization is rewriting.** Per [query-planning](theories/database-platform/concepts/query-planning.md), the optimizer applies Frobenius (per [predicate-pushdown-via-frobenius](../theorems/predicate-pushdown-via-frobenius.md)) and Beck-Chevalley (per [join-reordering-via-beck-chevalley](../theorems/join-reordering-via-beck-chevalley.md)) — both are *equivalences* in the hyperdoctrine, so rewrites preserve semantics by construction.
- **Logic choice is explicit.** Per [query-logic-choice](query-logic-choice.md), each query carries its $T_t$ / $T_k$ tag. A $T_t$ query against a $\bot$-cell behaves differently from a $T_k$ query against the same cell; the substrate refuses to guess.
- **Dispatch queries are distinct.** Queries involving $\odot$ (per [dispatch-composes-authorization](theories/agential-orchestration-platform/theorems/dispatch-composes-authorization.md)) compile to different primitives and follow different optimization rules — Frobenius for $\odot$ fails on three of four generator classes.
- **Replay is exact.** Per [settlement-determinism](../theorems/settlement-determinism.md), a recorded query expression replays to the same comprehension result given the same substrate state.

## What the substrate records about a query

Per [self-representation](self-representation.md), queries are substrate content: stored, parameterized, replayed. Per [witness](../objects/witness.md), each query execution produces a witness recording:

- the query expression (in compiled hyperdoctrine form, not just surface syntax)
- the chosen logic ($T_t$ or $T_k$)
- the chosen plan (per [query-planning](theories/database-platform/concepts/query-planning.md))
- the result-cardinality and (per substrate policy) the result-set hash

Per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), queries are reads — they don't change substrate state and don't bill against settlement fuel. Their cost is computation, scaling with index quality per [index](index.md).
