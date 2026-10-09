---
type: definition
class: substrate-entity
realizes: [query-planning]
depends-on:
  - query-planning
  - query-language
  - index-record
  - witness
  - predication-fibration
  - predication-fiber-algebra
  - predicate-category
  - beck-chevalley-commutation-on-predication-bilattices
  - predicate-pushdown-via-frobenius
  - join-reordering-via-beck-chevalley
  - twist-product-fusion
see-also:
  - materialized-view-record
  - query-planning-via-beck-chevalley
  - secondary-index-as-alexandrov-cover
  - graded-dispatch-via-q-enriched-fusion
---

# Query plan record

A **query plan record** is the substrate-entity formal definition of a [query plan](teaching/explanations/query-planning.md): the predication-graph entity declaring how a particular query is executed.

Per [query-planning-via-beck-chevalley](../theorems/query-planning-via-beck-chevalley.md), a query plan is not a bespoke optimizer artifact: it is a chain of [predicate-category](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) morphisms (specialization $f$, converse, projections) and [twist-product fusions](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md) on the substrate's [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md). This record is the substrate-content surface of that chain, with cost recorded as a quantale grade.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary.
- **`source-query`** — reference to or inline embedding of the query expression; structurally, the input morphism of which the plan-tree is a Beck–Chevalley-equivalent rewrite.
- **`plan-tree`** — the execution plan: hierarchical tree of operations (scans, joins, filters, sorts, aggregations). Structurally, a chain of reindexing functors $f^*$ and intra-fiber operations $\wedge_t, \wedge_k, \odot$ in the [predication fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md).
- **`indexes-used`** — references to [index-records](../../../objects/index-record.md) the plan reads; structurally, the [Alexandrov-cover](../theorems/secondary-index-as-alexandrov-cover.md) elements through which the plan accesses the fiber algebra.
- **`estimated-cost`** — total cost estimate per the planner's cost model. Per the math grounding below, structurally a quantale grade per [graded-dispatch-via-q-enriched-fusion](../../../theorems/graded-dispatch-via-q-enriched-fusion.md): cost lives in the Lawvere-quantale enrichment of the fusion, not in the value-axis; rewriting between Beck–Chevalley-equivalent plans changes the grade but not the value.
- **`statistics-used`** — references to substrate statistics (cardinality estimates, distributions) the planner consulted; substrate-content witnesses of the inputs to the cost-model that produced the recorded grade.
- **`alternative-plans`** — for explainable optimization, references to other plans considered. Per the math grounding, these are members of the same Beck–Chevalley equivalence class as `plan-tree` (i.e., they compute the same fiber-algebra value), differing only in their quantale grade; the optimizer's choice is grade-minimization within the equivalence class.
- **`rewrite-trace`** — *optional* the sequence of Beck–Chevalley squares applied to derive `plan-tree` from `source-query`. Each entry cites the licensing theorem (e.g., predicate-pushdown-via-frobenius for a pushdown step, join-reordering-via-beck-chevalley for a reorder). Per [conformance-via-fiber-algebra-functor](../../../theorems/conformance-via-fiber-algebra-functor.md), the rewrite-trace is what makes the planner's conformance decidable.
- **`closure-kind`** — `query-plan`.

## Invariants

- **Substrate-recorded.** Per [self-representation](../../teaching/explanations/self-representation.md), the plan-tree, cost, and rewrite-trace are queryable.
- **Result-equivalent.** Different plans for the same query produce the same result. Per [query-planning-via-beck-chevalley](../theorems/query-planning-via-beck-chevalley.md), this is structural, not protocol-dependent: two plans that are connected by a chain of Beck–Chevalley squares have naturally-isomorphic composite functors on the fiber algebra, hence return the same value on every substrate state. Per [conformance-implies-substrate-properties](../../../theorems/conformance-implies-substrate-properties.md), this is conformance-testable.
- **Rewrite-trace is Beck–Chevalley-licensed.** Every step in `rewrite-trace` is a Beck–Chevalley square; rewrites without a licensing square are forbidden per the cited theorem. The substrate refuses to install plans whose trace contains an unlicensed step.
- **Plan-tree respects the fibration's index discipline.** Reindexings $f^*$ in `plan-tree` correspond to morphisms in the [parameter-base category](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/parameter-base-category.md) $\mathbf{B}$ (not state-dependent runtime branching); intra-fiber operations $\wedge_t, \wedge_k, \odot$ respect the bilattice structure pointwise per [predication fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) axiom A3.

## Math grounding

The query plan record's structural fields each have a fixed predication-category role:

- **`source-query` and `plan-tree` ↔ Beck–Chevalley-equivalent morphism chains.** Per [query-planning-via-beck-chevalley](../theorems/query-planning-via-beck-chevalley.md), the planner's soundness is the iff: a rewrite is value-preserving exactly when it corresponds to a Beck–Chevalley square in the predication fibration. The plan-tree is the post-rewrite morphism chain; the source-query is the pre-rewrite chain; the equivalence is structural.

- **`indexes-used` ↔ Alexandrov-cover access paths.** Per [secondary-index-as-alexandrov-cover](../theorems/secondary-index-as-alexandrov-cover.md), each secondary index is an Alexandrov-open of the predicate-category Alexandrov topology; index-driven access is the substrate-content surface of restricting the plan's reindexing functors to the cover's open sets. The indexes-used field records which Alexandrov opens the plan's access paths factor through.

- **`estimated-cost` ↔ quantale grade.** Per [graded-dispatch-via-q-enriched-fusion](../../../theorems/graded-dispatch-via-q-enriched-fusion.md), cost is structurally a Lawvere-quantale grade on the fusion; the value-axis is preserved across Beck–Chevalley-equivalent rewrites and only the grade-axis changes. The optimizer's job is grade-minimization within the value-equivalence class — *not* a search over inequivalent plans, since inequivalent plans return different values per the iff.

- **`alternative-plans` ↔ equivalence-class membership.** The recorded alternatives are members of the same Beck–Chevalley equivalence class as `plan-tree`, with different quantale grades. Their substrate-content presence makes the optimizer's choice explainable: an auditor reads the rewrite-traces of `plan-tree` and the alternatives and sees the licensed transformations and their grades.

- **`rewrite-trace` ↔ chain of Beck–Chevalley squares with cited licenses.** Each step in the trace is one of: a pushdown licensed by [predicate-pushdown-via-frobenius](../../../theorems/predicate-pushdown-via-frobenius.md); a reorder licensed by [join-reordering-via-beck-chevalley](../../../theorems/join-reordering-via-beck-chevalley.md); a projection elimination licensed by an iso unit/counit of the projection adjunction; an index substitution licensed by [secondary-index-as-alexandrov-cover](../theorems/secondary-index-as-alexandrov-cover.md). Per [conformance-via-fiber-algebra-functor](../../../theorems/conformance-via-fiber-algebra-functor.md), this trace is what makes the planner conformance-testable.

- **The forbidden rewrites are structural, not heuristic.** Non-distributive pushdown of $\odot$ (which is not Frobenius), reordering across non-pullback diagrams, and heuristic projection elimination when the unit is not iso are all unsound — *not* "imprecise" or "approximation-quality" failures. The substrate's planner refuses them per the cited theorem's "What the theorem rules out" clause.

## Position in the platform

Query plan records are the substrate's *query-execution audit trail*. Per [witness](../../../objects/witness.md), queries record their plan; auditors can investigate slow queries by inspecting plans. Per the math grounding, the planner is not a heuristic optimizer with audit hooks bolted on: its rewrite catalog is a fixed list of Beck–Chevalley squares, its conformance is decidable, its cost model is quantale-graded, and the plan record is the substrate-content surface of one chain in that catalog. A platform that ships a heuristic planner alongside theorem-tracking telemetry is duplicating substrate machinery the math identifies as one construction.
