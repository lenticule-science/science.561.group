---
type: concept
class: data-access-discipline
depends-on:
  - index
  - predication-graph-store
  - predication-fiber-algebra
  - knowledge-order
  - alexandrov-topology
see-also:
  - query-planning
  - secondary-index-as-alexandrov-cover
  - index-as-alexandrov-up-set
  - query-planning-via-beck-chevalley
---

# Secondary index

A *substrate-recorded index on a non-primary attribute*. Where the parent's [index](../../teaching/explanations/index.md) covers any indexable key, secondary indexes are specifically for attributes other than the primary entity-id.

Per [secondary-index-as-alexandrov-cover](../theorems/secondary-index-as-alexandrov-cover.md) (proved), a secondary index is not a generic "fast lookup data structure" — it is structurally an [Alexandrov-open](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/alexandrov-topology.md) up-set $U_{I_j} \subseteq A_p$ in the [knowledge-order](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) topology on the [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md). A *family* of secondary indexes on the same predicate is an Alexandrov cover of the index-served region $\bigcup_j U_{I_j} \subseteq A_p$, and the substrate's "is this query index-servable?" test is the open-cover question $F \subseteq \bigcup_j U_{I_j}$ on the query's required-predication footprint $F$.

## Common patterns and their cover roles

Each pattern below is a member of the index family $\{I_j\}_{j \in J}$ contributing one Alexandrov-open $U_{I_j}$ to the cover:

- **Field index.** `index on user.email` — $U_{I_j}$ is the up-set of predications whose `email` attribute is determined.
- **Compound index.** `index on (status, created-at)` — $U_{I_j}$ is the up-set of predications whose joint `(status, created-at)` projection is determined; supports queries filtering on status and ordering by date.
- **Partial index.** `index on email WHERE deleted = false` — $U_{I_j}$ is the up-set of predications whose `email` is determined *and* whose `deleted` flag is `false`; the WHERE clause is a sub-cover restriction per [where-clause-as-paraconsistent-comprehension](../theorems/where-clause-as-paraconsistent-comprehension.md).
- **Functional index.** `index on lower(email)` — $U_{I_j}$ is the up-set of predications under the functional reindexing $f^*$ where $f$ is the case-folding map; the index materializes the pullback fiber.
- **Full-text index.** Inverted index for text search — $U_{I_j}$ is the up-set of predications whose tokenized text content is determined.
- **Spatial index.** R-tree, geohash for geo queries — $U_{I_j}$ is the up-set of predications whose geometric attribute satisfies the spatial-resolution discipline.
- **Vector index.** HNSW, IVF for similarity search — $U_{I_j}$ is the up-set of predications whose vector embedding is determined; approximate-nearest-neighbor lookup is structurally a metric-bounded sub-cover.

Per [self-representation](../../teaching/explanations/self-representation.md), secondary indexes are substrate content per [index-record](../../../objects/index-record.md). Per [witness](../../../objects/witness.md), index updates produce witnesses; an auditor can verify index consistency with the underlying data.

Per [conformance-implies-substrate-properties](../../../theorems/conformance-implies-substrate-properties.md), index correctness is a conformance property: a substrate that maintains an index but fails to update it on writes produces incorrect query results — equivalently, advertises a cover element $U_{I_j}$ whose claim of "predication determined here" is not actually backed by the fiber-algebra state.

## Operations on the cover

Per [secondary-index-as-alexandrov-cover](../theorems/secondary-index-as-alexandrov-cover.md), the substrate's index-management operations are not ad-hoc data-structure mutations — each is a fixed move on the Alexandrov cover:

- **Adding an index ↔ refining the cover.** The new family $\{U_{I_j}\} \cup \{U_{I_{j^*}}\}$ is a refinement; the substrate's index-creation operation refines the cover monotonically. The Alexandrov topology guarantees the refinement is itself an open cover (up-sets close under union), so no coherence repair is needed.
- **Removing an index ↔ inverse coarsening.** Subject to no other dependent query losing coverage on its $F$. The substrate may refuse the removal if conformance tests show a query becomes scan-forced; this is a structural refusal, not a heuristic warning.
- **Index-coverage analysis ↔ the open-cover question.** The planner answers "does this query need a table scan?" by computing $F \setminus \bigcup_j U_{I_j}$. Empty residual ⇒ index-only plan; non-empty residual ⇒ scan-or-add-index decision. Per [query-planning-via-beck-chevalley](../theorems/query-planning-via-beck-chevalley.md), this analysis composes with rewrite soundness in `plan-query`.
- **Index union ↔ sheaf colimit.** Per the sheaf-cohomology correspondence (Curry 2014) noted in [index-as-alexandrov-up-set](../../../theorems/index-as-alexandrov-up-set.md), per-index lookups glue along the cover via the sheaf condition; the union step is automatic and structurally sound. No deduplication discipline beyond the bilattice's $\vee_k$ join is needed.
- **Index overlap ↔ Mayer–Vietoris.** When $U_{I_j} \cap U_{I_k} \neq \varnothing$, results from both indexes overlap on the intersection. Per [trace-causality-via-mayer-vietoris-spans](../../../theorems/trace-causality-via-mayer-vietoris-spans.md), the substrate handles the overlap with a Mayer–Vietoris-style reconciliation step; in a $\leq_k$-monotone substrate this is structurally cohomology-free.

## Index trade-offs (re-cast as cover trade-offs)

The conventional trade-offs survive but acquire structural content:

- **Read performance ↔ pre-computed cover element.** An indexed up-set is materialized; lookups consult the materialization rather than recomputing from the predicate's full fiber. Per [graded-dispatch-via-q-enriched-fusion](../../../theorems/graded-dispatch-via-q-enriched-fusion.md), candidate plans for the same query carry distinct quantale grades, and the planner uses the grade-comparison to prefer indexed lookups over scans when statistics indicate a lower grade — the magnitude of the improvement is statistics-dependent, not a structural strict-inequality.
- **Write cost ↔ cover-update cost.** Each admitted predication may belong to multiple cover elements $U_{I_j}$; the write must update each member-index. The cost is structurally the per-cell cardinality of the cover at that cell.
- **Storage cost ↔ cover materialization cost.** Each $U_{I_j}$'s materialization occupies persistent-set space. The total is the sum of cover-element sizes (with overlap counted multiply, since each materialization is a distinct substrate record).
- **Maintenance complexity ↔ cover-coherence discipline.** More indexes = more cover elements to keep coherent under writes. The bilattice's $\vee_k$-join discipline keeps the coherence cost local to each write's affected cells.

The substrate's discipline: index only what's queried often. Per [query-planning](query-planning.md), the planner identifies which queries' $F$ are not index-covered (residuals) and recommends new indexes whose $U_{I_{j^*}}$ would close the residual.

## Position

Secondary indexes are the database-platform's instantiation of the predication-fibration's open-cover discipline. They are not a separate engineering primitive layered above the math: they *are* the substrate-content surface of the cover, and the conventional index-management operations are fixed moves on the cover that the math (Alexandrov topology + sheaf condition + Mayer–Vietoris reconciliation) determines uniquely. A platform that ships index-management as a heuristic with audit-trail telemetry is duplicating substrate machinery the math identifies as one construction.
