---
type: morphism
class: primitive-operator
realizes: [operator]
depends-on: [predication-graph-store]
see-also: [insertion, retraction]
---

# Traversal

The third of the three primitive [operators](teaching/explanations/operator.md). Traversal enumerates the [predication cells](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-cell-set.md) incident to a given entity under a given predicate. Traversal has two directions:

$$
\mathrm{traverse}^{\rightarrow}(G, s, p) \;=\; \{\, o \in E \;|\; G[\![s, p, o]\!] \neq \bot \,\}
$$

$$
\mathrm{traverse}^{\leftarrow}(G, p, o) \;=\; \{\, s \in E \;|\; G[\![s, p, o]\!] \neq \bot \,\}
$$

The forward traversal enumerates *what $s$ is related to under $p$*; the backward traversal enumerates *what relates to $o$ under $p$*. The two are duals under the [predicate converse](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-converse.md): forward traversal under $p$ on $s$ equals backward traversal under $p^{\mathrm{op}}$ on $s$.

Three properties:

- **Pure (read-only).** Traversal does not modify the [predication-graph store](../objects/predication-graph-store.md). Repeated traversals of the same coordinates produce the same result until an [insertion](insertion.md), [retraction](retraction.md), or [closure-rule application](closure-rule-application.md) intervenes.
- **$O(1)$ per result via the indexed store.** A predication-graph store maintains an entity-index that maps $(s, p)$ pairs to the set of objects $o$ with non-$\bot$ value, and analogously for $(p, o)$. Traversal returns the indexed set; the cost is the cost of returning the set, not of scanning the graph. This is the engineering content of the locality property.
- **Composable.** Multi-step traversals — "$s_1$'s related-under-$p_1$, then those entities' related-under-$p_2$" — are sequenced traversals. A query is a structured composition of traversals; query optimization is rearranging the traversal order to minimize intermediate set sizes.

Traversal does not produce a [witness](teaching/explanations/witness.md) entry by default — it does not change state. An operator that uses traversal results to produce a state change (e.g., a closure-rule application that reads neighbors via traversal and inserts a conclusion) records the witness for the state change, citing the traversal results as part of the witness's input-hash chain.
