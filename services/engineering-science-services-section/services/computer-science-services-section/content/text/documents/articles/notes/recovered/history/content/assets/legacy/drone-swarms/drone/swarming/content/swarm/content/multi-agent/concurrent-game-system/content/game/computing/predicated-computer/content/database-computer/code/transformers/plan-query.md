---
type: morphism
class: data-access-operation
realizes: [query-planning]
depends-on:
  - query-language
  - query-plan-record
  - index-record
  - witness
  - predication-fibration
  - predication-fiber-algebra
  - beck-chevalley-commutation-on-predication-bilattices
  - predicate-pushdown-via-frobenius
  - join-reordering-via-beck-chevalley
see-also:
  - query
  - query-planning-via-beck-chevalley
  - graded-dispatch-via-q-enriched-fusion
  - secondary-index-as-alexandrov-cover
  - inverse-join
---

# Plan query

The substrate operation that *produces a [query-plan-record](../objects/query-plan-record.md) for a given query*: parse the query, identify applicable indexes, choose execution strategy, estimate cost.

Per [query-planning-via-beck-chevalley](../theorems/query-planning-via-beck-chevalley.md), this operation is not a heuristic optimizer pass: it is the substrate-content procedure that searches the Beck–Chevalley equivalence class of the query for the grade-minimal representative. Soundness is structural — the operation cannot emit a plan outside the equivalence class — and conformance is decidable per [conformance-via-fiber-algebra-functor](../../../theorems/conformance-via-fiber-algebra-functor.md).

## Signature

`plan-query(query-expression, scope?) → (query-plan-record, plan-witness)`

Inputs:

- **`query-expression`** — the query to plan; structurally, the input morphism chain in the [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) for which a Beck–Chevalley-equivalent rewrite is sought.
- **`scope`** — optional restriction to a particular [scope](../../teaching/explanations/scope.md); structurally, restriction of the search to plans whose reindexings $f^*$ factor through the scope's sub-base.

Outputs:

- **`query-plan-record`** — the chosen plan; structurally, the grade-minimal representative of the input's Beck–Chevalley equivalence class found within the planner's rewrite catalog.
- **`plan-witness`** — records the planning operation, including the rewrite-trace recovered for the chosen plan and the alternatives considered (their plans and grades).

## Operational semantics

1. **Parse the query into the fiber-algebra morphism chain.** The query's surface syntax (SQL, Datalog, etc.) is parsed into the canonical chain of [predicate-category](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) morphisms (specialization, converse, projections) and intra-fiber operations $\wedge_t, \wedge_k, \odot$ that the substrate's planner operates on.
2. **Enumerate Beck–Chevalley-licensed rewrites.** Per [query-planning-via-beck-chevalley](../theorems/query-planning-via-beck-chevalley.md), the planner's rewrite catalog is the fixed list of Beck–Chevalley squares: predicate-pushdown rewrites (per [predicate-pushdown-via-frobenius](../../../theorems/predicate-pushdown-via-frobenius.md)), join-reordering rewrites (per [join-reordering-via-beck-chevalley](../../../theorems/join-reordering-via-beck-chevalley.md)), projection-elimination rewrites (when the unit/counit of the projection adjunction is iso), index-substitution rewrites (per [secondary-index-as-alexandrov-cover](../theorems/secondary-index-as-alexandrov-cover.md)), and the [inverse-join](inverse-join.md) collapse for converses (per [inverse-join-as-converse-self-adjoint](../theorems/inverse-join-as-converse-self-adjoint.md)). Enumeration walks reachable members of the input's Beck–Chevalley equivalence class.
3. **Grade each candidate via the cost-quantale.** Per [graded-dispatch-via-q-enriched-fusion](../../../theorems/graded-dispatch-via-q-enriched-fusion.md), each candidate's cost is its Lawvere-quantale grade — computed from substrate statistics (cardinality estimates, distributions per [secondary-index-as-alexandrov-cover](../theorems/secondary-index-as-alexandrov-cover.md)'s cover refinement). The value-axis is identical across the equivalence class; only the grade differs.
4. **Pick the grade-minimal candidate.** The chosen plan is the equivalence-class member with the smallest quantale grade reachable in the planner's search budget. Per the math grounding, "grade-minimal within the catalog's reachable rewrites," not "cheapest globally" — a reachability claim, not an optimality claim.
5. **Emit the plan record with rewrite-trace.** The output `query-plan-record` includes the chain of Beck–Chevalley squares applied to derive `plan-tree` from `source-query`, with each step citing its licensing theorem; this is what makes conformance decidable per [conformance-via-fiber-algebra-functor](../../../theorems/conformance-via-fiber-algebra-functor.md).
6. **Per [witness](../../../objects/witness.md), emit `plan-witness`** with the chosen plan and alternatives considered.

Per [cost-discipline-reads-free](../../../theorems/cost-discipline-reads-free.md), planning is a substrate read.

## Engineering invariants

- **Soundness is structural.** Per [query-planning-via-beck-chevalley](../theorems/query-planning-via-beck-chevalley.md), every plan emitted is a member of the input's Beck–Chevalley equivalence class. The operation cannot emit a plan that returns a different fiber-algebra value — not by enforcement and policing, but because the rewrite catalog *is* the list of Beck–Chevalley squares. An "unsound rewrite" is by definition not in the catalog and is therefore unreachable.
- **Conformance is decidable.** Per [conformance-via-fiber-algebra-functor](../../../theorems/conformance-via-fiber-algebra-functor.md), a planner conforms to the substrate iff every rewrite it issues is a square in the fibration; the conformance test is decidable by walking the emitted rewrite-trace and verifying each square. The substrate's audit machinery can re-verify any historical plan-witness.
- **Result-equivalent.** Different chosen plans for the same query produce the same result. Structural per the previous invariant; not a separate condition.
- **Witnessed.** Per [witness](../../../objects/witness.md), plans (and the alternatives considered) are auditable, with the rewrite-trace recoverable for any historical plan.

## Math grounding

The plan-query operation is the substrate-content procedure that realizes the planner-soundness theorem [query-planning-via-beck-chevalley](../theorems/query-planning-via-beck-chevalley.md). The factorization:

- **Search ↔ walk in the Beck–Chevalley equivalence class.** The planner's enumeration is a graph walk in the predication fibration's groupoid of Beck–Chevalley squares, starting at `source-query` and visiting reachable equivalence-class members within the search budget.
- **Cost ↔ quantale grade per [graded-dispatch-via-q-enriched-fusion](../../../theorems/graded-dispatch-via-q-enriched-fusion.md).** The cost-quantale enriches the fusion; cost-comparison is grade-comparison in the quantale.
- **Optimality ↔ grade-minimality within the reachable equivalence-class subset.** Per the rewrite-catalog framing, the planner does not search "all possible plans"; it searches the catalog's reachable rewrites. Optimality claims are therefore relative to the catalog and the search budget.
- **Statistics ↔ inputs to the grade computation.** Cardinality estimates, distributions, and selectivity statistics feed the quantale-grade calculation but do not affect the value-axis — i.e., bad statistics produce a sub-optimal but still sound plan, never an unsound one.

## What the operation refuses

- **Rewrites without a licensing theorem.** The catalog is fixed by [query-planning-via-beck-chevalley](../theorems/query-planning-via-beck-chevalley.md); ad-hoc rewrites are forbidden. In particular, the planner refuses non-distributive pushdown of $\odot$ (which is not Frobenius), reordering across non-pullback diagrams, and heuristic projection elimination when the unit is not iso — per the cited theorem's "What the theorem rules out" clause.
- **Plans whose rewrite-trace cannot be reconstructed.** A plan that the planner cannot trace back to the source query through licensed squares is rejected; the audit machinery would not be able to re-verify it.
- **State-dependent rewrites.** A rewrite whose validity depends on substrate runtime state (rather than on the query expression and the fibration's static structure) is not a Beck–Chevalley square in $\mathbf{B}$ — it is a state-dependent branch in the runtime, which silently breaks the fibration's coherence frame.

## Position in the platform

Plan-query is the substrate's *query-optimization primitive*. Composes with the substrate's [query](../../../morphisms/query.md) execution morphism for the full query-execution pipeline. Per the math grounding, plan-query is not a heuristic optimizer with audit hooks bolted on: it is the substrate-content procedure that walks the Beck–Chevalley equivalence class searching for the grade-minimal representative, with soundness structural and conformance decidable. A platform that ships a heuristic optimizer alongside theorem-tracking telemetry is duplicating substrate machinery the math identifies as one construction.
