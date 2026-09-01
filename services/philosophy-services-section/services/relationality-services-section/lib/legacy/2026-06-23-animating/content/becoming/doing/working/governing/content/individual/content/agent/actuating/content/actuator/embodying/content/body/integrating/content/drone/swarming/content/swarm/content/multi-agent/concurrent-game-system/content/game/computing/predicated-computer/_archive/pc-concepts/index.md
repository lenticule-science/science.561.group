---
type: concept
class: data-access-discipline
depends-on: [predication-graph-store, hash-discipline, cost-discipline-reads-free, alexandrov-topology, predication-fiber-algebra, knowledge-order]
see-also: [query-language, full-text-search, index-as-alexandrov-up-set]
---

# Index

A *substrate-recorded auxiliary structure for fast lookup of predications by some derivable key*. In the substrate's hyperdoctrine setting, an index is not arbitrary lookup machinery — it is *an [Alexandrov topology](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/alexandrov-topology.md) up-set on the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md)*: the indexed predications form an up-set under the [knowledge-order](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) (closed under "stronger than" — adding more knowledge keeps the predication in the index), and lookup against the index is exactly evaluating the up-set's membership at a query point. Per [index-as-alexandrov-up-set](../theorems/index-as-alexandrov-up-set.md), this structural identification is what makes index queries logarithmic-or-better in fiber-size.

Indexes are how the substrate makes large predication-graph queries tractable: instead of scanning every predication, the index pre-computes a lookup-by-key structure that the substrate can consult in (typically) logarithmic time.

## Hyperdoctrinal structure

Per [alexandrov-topology](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/alexandrov-topology.md), for a poset $(P, \leq)$ — in the substrate's case, the predication fiber algebra $A_p$ ordered by $\leq_k$ — the Alexandrov-open sets are exactly the up-sets. Sheaves on $(P, \leq)_{\mathrm{Alex}}$ are functors $P \to \mathcal{V}$.

An index on the substrate's predications is structurally:

- **An up-set $U_I \subseteq A_p$** under $\leq_k$ — the set of predications "indexed by this index." Up-set means: if $u \in U_I$ and $u' \geq_k u$, then $u' \in U_I$. Adding knowledge to an indexed predication keeps it indexed.
- **A key function $\kappa : U_I \to K$** mapping each indexed predication to a key in some sortable key-space $K$.
- **A lookup function $\mathrm{lookup}_I : K \to \mathcal{P}(U_I)$** returning the set of indexed predications with a given key.

The substrate already maintains two natural Alexandrov-open indexes implicit in the [predication-graph store](../objects/predication-graph-store.md): the entity-index (cells incident to a given entity — Alexandrov-open since adding cells keeps them in the index) and the value-index (cells with a given predicate-value pair — Alexandrov-open since adding stronger-knowledge values keeps them in the index). Additional indexes are explicit substrate content.

## Common index-kinds

Each index-kind is a particular shape of $\kappa$ and $\mathrm{lookup}_I$:

- **B-tree / sorted-index.** $K$ is a totally-ordered key space; $\kappa$ extracts a sortable key; $\mathrm{lookup}_I$ supports range queries via tree traversal.
- **Hash index.** $K$ is a hash-space; $\kappa$ is a content-hash; $\mathrm{lookup}_I$ supports point lookups in expected constant time.
- **Inverted index.** For full-text-search: $K$ is a set of terms; $\kappa$ extracts the terms appearing in each predication; $\mathrm{lookup}_I$ returns all predications containing a given term.
- **Geospatial index.** $K$ is a spatial coordinate; R-tree or geohash structures support spatial-range queries.
- **Vector index.** $K$ is an embedding space; HNSW, IVF support nearest-neighbor lookups.
- **Composite index.** $K$ is a tuple-space; $\kappa$ extracts multiple keys; $\mathrm{lookup}_I$ supports multi-criteria filtering.

In each case, the index's Alexandrov-up-set structure is preserved: adding knowledge to an indexed predication keeps it in $U_I$ (the predication continues to satisfy the indexing criterion).

## Self-representation

Per [self-representation](../../teaching/explanations/self-representation.md), indexes are substrate content. Index-records declare the index's key, its index-kind, the predication-set it covers, its build state. Per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), indexes are reconstructible from the underlying predications — so an index that's lost can be rebuilt, and an index's hash is determined by its contents.

## Index discipline

- **Indexes are derived.** Per [self-representation](../../teaching/explanations/self-representation.md), indexes can be reconstructed from the underlying predications. The substrate's invariant is that indexes are *conservative* — they may lag during rebuild but must not invent entries that don't exist in the underlying data. Per [index-as-alexandrov-up-set](../theorems/index-as-alexandrov-up-set.md), the up-set property structurally guarantees this: any indexed entry is necessarily a knowledge-strengthening of the underlying predication.
- **Index updates are substrate operations.** Per [witness](../objects/witness.md), index modifications produce witnesses; auditors can verify the index's consistency with the underlying data.
- **Indexes don't change behavior.** Per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), querying an index is a read; the substrate's settling is unaffected by index existence. Indexes affect performance, not correctness. Per the Alexandrov-up-set framing, indexes are *strict subsets* of the fiber-algebra's Alexandrov-open sets; they don't add anything not already implied by the closure.
- **Indexes federate as content.** Per [federation-convergence](../theorems/federation-convergence.md), federated substrates may share index content per their federation policy; alternatively, each substrate may maintain its own indexes derived from federated data. Per the Alexandrov-up-set property, federation-merged indexes remain up-sets — the federation's $\vee_k$-join preserves the indexing criterion.

## Cohomological reading

Per the [Alexandrov-topology](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/alexandrov-topology.md) sheaf-cohomology correspondence (Curry 2014), Alexandrov-topology sheaf cohomology agrees with the cellular cochain cohomology of the underlying poset. The substrate's indexes are therefore not just lookup structures — they are *sheaf sections* on the predication fiber-algebra's Alexandrov topology, and the substrate's index-coherence theorems are special cases of sheaf-cohomology vanishing in degree zero. This is the substrate-level reason indexes are reconstructible from the underlying data: the sheaf is determined by its sections.
