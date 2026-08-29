---
type: morphism
class: primitive-operator
realizes: [operator]
depends-on: [predication-graph-store]
see-also: [retraction, traversal, merge]
---

# Insertion

The first of the three primitive [operators](teaching/explanations/operator.md). Insertion adds a [predication cell](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-cell-set.md) $(s, p, o)$ with bilattice value $v$ to the [predication-graph store](../objects/predication-graph-store.md). Formally:

$$
\mathrm{insert}(G,\, (s, p, o),\, v) \;=\; G[\![s, p, o \mapsto G[\![s, p, o]\!] \vee_k v]\!]
$$

where $\vee_k$ is the [knowledge join](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md). Inserting at a cell that already exists raises the cell's value in the knowledge order to the join of the old value and the new; inserting at a cell that does not yet exist creates the cell with value $v$ (treating the absent cell as having value $\bot$, the knowledge-order bottom).

Insertion is *monotone in the knowledge order*: $\mathrm{insert}(G, c, v)[\![c]\!] \geq_k G[\![c]\!]$ for every cell $c$. This monotonicity is what makes the [wavefront](teaching/explanations/wavefront.md) propagation pattern terminating — each cell can be inserted-into only finitely many times before its value reaches the top of the bilattice and cannot rise further.

Insertion is *idempotent*: inserting the same value at the same cell twice produces the same result as once. This is a direct consequence of $v \vee_k v = v$ in the bilattice. Idempotence is what makes insertion safe to retry under network failure: a duplicate insertion produces no spurious effect.

Insertion is *commutative*: $\mathrm{insert}(\mathrm{insert}(G, c_1, v_1), c_2, v_2) = \mathrm{insert}(\mathrm{insert}(G, c_2, v_2), c_1, v_1)$ when $c_1 \neq c_2$, because the two cells are independent. When $c_1 = c_2$, commutativity reduces to $v_1 \vee_k v_2 = v_2 \vee_k v_1$, which holds in the bilattice. Commutativity is what makes insertion safe to reorder: the [wavefront](teaching/explanations/wavefront.md) can apply insertions in any order consistent with the the substrate's closure machinery and produce the same fixed-point.

Every insertion produces a [witness](teaching/explanations/witness.md)-chain entry: the canonical hash of $G$ before, the cell coordinates, the value, the canonical hash after. The entry goes into the [event log](../objects/event-log.md). Insertions that fail to produce a witness entry violate the substrate's audit contract and are not admissible.
