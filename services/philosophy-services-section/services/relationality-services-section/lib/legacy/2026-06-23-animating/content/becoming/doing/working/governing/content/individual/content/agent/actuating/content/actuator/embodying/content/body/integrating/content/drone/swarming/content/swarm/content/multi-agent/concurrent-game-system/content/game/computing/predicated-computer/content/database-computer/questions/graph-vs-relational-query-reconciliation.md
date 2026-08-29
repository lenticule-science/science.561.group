---
type: question
status: open
explores: [query-planning, oltp-vs-olap, predication-graph-store, materialized-view]
---

# How does the substrate reconcile graph-traversal queries with relational-projection queries?

The parent's [predication-graph store](../../../objects/predication-graph-store.md) is structurally a graph database — predication cells are subject-predicate-object triples and traversal is the primary query primitive. Database-platform inherits that. But database-typical OLAP workloads expect SQL-style relational projections with cost-based planning under statistics, where the planner reasons about row counts, selectivity, join orders, and index choice on flat tabular data.

The two query shapes are not the same and not obviously interchangeable:

- **Graph traversal.** Start at one or more entities, walk edges (predicates), accumulate matching neighborhoods. Cost dominated by neighborhood-cardinality and traversal depth. Optimization moves: index-on-predicate, neighborhood-cap, breadth-vs-depth-first ordering.
- **Relational projection.** Start with a relation (predicate, conceptually), apply selection, project columns, join with other relations on shared attributes. Cost dominated by join-order, hash-vs-merge-vs-nested-loop, table-scan-vs-index. Optimization moves: cardinality estimation from histograms, join-reorder under associativity, predicate pushdown.

## Concrete cases that would resolve the question

1. **Same store, two query languages.** A user issues a graph-traversal query (`?person -[:works_at]-> ?company` style) and a relational query (`SELECT person, company FROM employments WHERE start_date > '2020-01-01'`). Both target the same predication cells. What is the canonical planner discipline that produces the same answer set, and how does the substrate record the planning choice as a witness?

2. **Materialized view over traversal.** [materialized-view](teaching/explanations/materialized-view.md) caches a pre-computed query result. For a graph-traversal query (e.g., "all-three-hop neighbors of entity X"), the materialized form is a list of paths or an adjacency-projection. For a relational query, the materialized form is a relation. Are these the same kind of materialized-view, or two distinct disciplines? The current [materialized-view-record](../objects/materialized-view-record.md) is silent.

3. **Statistics-driven planning over predication cells.** Relational planners maintain histograms over column values. The substrate's analog would be predicate-fiber histograms — distributions over $(p, v)$ pairs at each predicate. [predicate-pushdown-via-frobenius](../../../theorems/predicate-pushdown-via-frobenius.md) gives one optimization principle from the math parent; what is the planner discipline for using fiber histograms in cost estimation?

## Why the question matters

If the answer is "two discipline-stacks coexist on one store, planner chooses per query," the subtheory needs explicit objects for plan-stack-selection and a discipline for when to use which. If the answer is "graph-traversal subsumes relational projection (relations are predicates over entity tuples)," the subtheory's [query-planning](teaching/explanations/query-planning.md) and [plan-query](../morphisms/plan-query.md) need to articulate the subsumption operationally. If the answer is "relational projection is a derived view over the graph store, computed by a fixed reduction," the subtheory needs a morphism specifying the reduction.

Without the answer, [query-plan-record](../objects/query-plan-record.md) is silent on which discipline its plans belong to, and the subtheory cannot make a definite claim about what database-platform's [plan-query](../morphisms/plan-query.md) optimizes against.
