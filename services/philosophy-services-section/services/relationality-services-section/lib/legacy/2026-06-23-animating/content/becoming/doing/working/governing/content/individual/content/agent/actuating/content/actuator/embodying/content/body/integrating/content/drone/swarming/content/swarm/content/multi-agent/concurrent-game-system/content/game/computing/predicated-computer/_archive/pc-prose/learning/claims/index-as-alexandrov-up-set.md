---
type: theorem
class: engineering-claim
status: proved
depends-on: [index, alexandrov-topology, predication-fiber-algebra, knowledge-order, settling-monotonicity]
see-also: [cache-coherence-via-functorial-projection, scope-cover-via-grothendieck-site]
---

# Substrate indexes are Alexandrov up-sets on the predication fiber algebra

**Claim.** For any [index](teaching/explanations/index.md) $I$ on the substrate's predications, the set $U_I$ of indexed predications is an [Alexandrov-topology](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/alexandrov-topology.md) up-set under the [knowledge-order](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) $\leq_k$ on the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md). Equivalently, $U_I$ is open in the Alexandrov topology induced by $\leq_k$. Per the Alexandrov-poset equivalence (sheaves on $(P, \leq)_{\mathrm{Alex}}$ are functors $P \to \mathcal{V}$), the index's lookup function is a sheaf section, and the substrate's index-coherence properties follow from sheaf-cohomology vanishing.

## Why this holds

Per [alexandrov-topology](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/alexandrov-topology.md), for a poset $(P, \leq)$, the Alexandrov-open sets are exactly the up-sets — subsets $U \subseteq P$ such that $u \in U$ and $u \leq u'$ imply $u' \in U$. The substrate's predication fiber algebra $A_p$ ordered by $\leq_k$ is a poset; an index's "indexed predications" $U_I$ inherits the Alexandrov-up-set structure via:

**Part 1: Indexes are upward-closed under $\leq_k$.** A predication $u$ is indexed by $I$ iff it satisfies $I$'s indexing criterion (e.g., "has predicate $p$," "has key in range $[a, b]$," "contains term $t$"). Per [settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), the substrate's settlements are $\leq_k$-monotone — adding knowledge to a predication strengthens it, and the indexing criterion (which is a property of the predication's content) is preserved under such strengthening when the criterion is itself monotone.

For all standard substrate index-kinds, the criterion is monotone in $\leq_k$:
- **Entity-index.** "Has subject $s$" — preserved under $\leq_k$-strengthening (you don't lose your subject by gaining knowledge).
- **Value-index.** "Has predicate-value $(p, v)$" — preserved (gaining knowledge about the value sharpens it but doesn't remove the predicate).
- **Sorted-index.** "Has key in range $[a, b]$ via $\kappa$" — preserved when $\kappa$ is monotone in $\leq_k$ (typical for content-derived keys).
- **Inverted index.** "Contains term $t$" — preserved (added knowledge can introduce more terms but doesn't remove existing ones, in a $\leq_k$-monotone substrate).

**Part 2: Up-sets are exactly Alexandrov-open.** This is the definition of Alexandrov topology: open sets = up-sets.

Combining: $U_I \subseteq A_p$ is an up-set, hence Alexandrov-open in the topology induced by $\leq_k$.

## Engineering consequence

- **Indexes are sheaves.** Per the Alexandrov-poset sheaf-cohomology correspondence (Curry 2014), sheaves on $(A_p, \leq_k)_{\mathrm{Alex}}$ are functors $A_p \to \mathcal{V}$. The substrate's index is a sheaf section: at each predication $u \in A_p$, the section assigns the index's lookup-result for $u$. The sheaf condition reduces to "lookup is consistent across predication-meet" — verified by the Alexandrov-up-set property.
- **Index reconstruction is sheaf-determined.** Per the sheaf framework, a sheaf on a topological space is determined by its sections on a base of opens. The substrate's index can be reconstructed from any complete cover of the indexed-predications — exactly the [snapshot-replay-fidelity](snapshot-replay-fidelity.md) property.
- **Index-conservativeness is structural.** A "conservative" index — one that doesn't invent entries not present in the underlying data — is exactly an up-set: if $u' \in U_I$, then $u' \geq_k u$ for some indexed $u$, so $u'$ is a knowledge-strengthening of an indexed predication (not a fabrication).
- **Index-monotone update.** Adding a predication to the substrate either: (a) is already in $U_I$ via the up-set property (a stronger version of an indexed predication), or (b) requires inserting a new entry. Per the Alexandrov topology, this insertion preserves the up-set structure — adding $u$ implicitly adds all $u' \geq_k u$ to the up-set.
- **Logarithmic lookup via tree-structured indexes.** When $\kappa$ extracts a totally-ordered key, the up-set's structure on the key-axis admits B-tree-style decomposition: each tree node represents a sub-up-set; lookup traverses the tree in $O(\log n)$ time.

## Cohomological reading

Per the Alexandrov-poset sheaf-cohomology correspondence, the cohomology of the index sheaf on $(A_p, \leq_k)$ vanishes in degree zero exactly when the index is *complete* — every predication that should be indexed is indexed. Higher-degree cohomology classes correspond to *index gaps* — predications whose strengthenings are inconsistently indexed. The substrate's index-rebuild discipline is exactly the substrate-side computation that drives the index sheaf to cohomological vanishing.

## What the theorem rules out

- **Indexes that aren't up-sets.** An "index" whose membership criterion is not preserved under $\leq_k$-strengthening — e.g., "has exactly value $v$" (not preserved by adding knowledge that sharpens $v$ to $v' > v$) — is not Alexandrov-open. The substrate refuses such indexes: they'd be unstable under settlement, requiring re-evaluation on every closure step.
- **Non-monotone key extraction.** A key function $\kappa$ that produces different keys for $u \leq_k u'$ violates the up-set property and the sheaf-section structure. The substrate refuses such keys; per [hash-discipline](teaching/explanations/hash-discipline.md), keys derived from canonical content are structurally monotone.
- **Reference-based indexes.** An index keyed by runtime memory address or pointer is not derived from substrate content — it isn't an Alexandrov-open structure on the fiber-algebra. The substrate refuses; per [self-representation](teaching/explanations/self-representation.md), indexes are substrate content.

## What the theorem requires

- The substrate's value-domain is a poset under $\leq_k$ (per [predication-fiber-algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md)).
- The index's membership criterion is monotone in $\leq_k$ (preserved under knowledge-strengthening).
- The key function $\kappa$ is monotone in $\leq_k$ (maps related predications to related keys).
- The substrate's settlement is $\leq_k$-monotone (per [settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md)).

## Position

This theorem grounds the substrate's index discipline in the Alexandrov-topology / sheaf-theoretic framework. Together with [scope-cover-via-grothendieck-site](scope-cover-via-grothendieck-site.md) (scopes as Grothendieck sites) and [cache-coherence-via-functorial-projection](cache-coherence-via-functorial-projection.md) (caches as functor projections), it places the substrate's data-access layer in the predication-categories' topological / sheaf-theoretic foundation. Indexes, scopes, and caches are three engineering surfaces of the same structural framework: open sets and sheaves on the predication fiber-algebra's lattice topology.
