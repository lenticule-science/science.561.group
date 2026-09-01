---
type: definition
class: store
realizes: [predication-substrate]
depends-on: [predication-cell-set, predication-valuation, predication-fiber-algebra]
see-also: [event-log, two-store-coherence]
---

# Predication graph store

The live, queryable representation of a [predicated computer](predicated-computer.md)'s [predication valuation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-valuation.md) at the substrate's current ordinal. The store records each [predication cell](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/predication-cell.md) $(s, p, o)$ as an entry of the [predication cell set](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-cell-set.md) $\Phi = E \times \Pi \times E$, paired with the cell's value in the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) $A_p$ at the cell's predicate $p$. Cells without a recorded value are computationally distinct from cells recorded with the value-domain's $\bot$ (no-evidence) value: the former are not enumerable by the store's traversal operators; the latter are.

A predication graph store supports three primitive queries — the operational presentation of the substrate's [three primitive operators](teaching/explanations/operator.md):

- The **cell-value query**: given a cell's coordinates $(s, p, o)$, return $v(p)(s, o) \in A_p$ or report it absent.
- The **forward-traversal query**: given a subject $s$ and a predicate $p$, return the set of objects $o$ predicated to from $s$ under $p$ (i.e., cells with $v(p)(s, o) \neq \bot$).
- The **backward-traversal query**: given a predicate $p$ and an object $o$, return the set of subjects $s$ predicated from to $o$ under $p$.

The cell-value query is a one-step traversal; forward and backward neighbor queries are the structured traversals that compose into queries of arbitrary depth.

The store is typically *indexed* in two complementary ways: by entity (the entity-index returns every cell incident to a given entity in either subject or object position) and by predicate-value (the value-index returns every cell carrying a given predicate-value pair). Both indexes are derivable from the underlying [predication cell set](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-cell-set.md); maintaining both lets a [wavefront](teaching/explanations/wavefront.md) reach a cell from either direction in constant time, making local computation tractable on graphs of millions of cells.

The predication graph store is one of two stores in the [two-store coherence](teaching/explanations/two-store-coherence.md) discipline. The other is the [event log](event-log.md) — the append-only history of mutations that the predication graph is the reduction of. The store materializes the current valuation $v_t$; the event log materializes the [increment sequence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/increment-sequence.md) $U$ that produced it. Coherence between them is what makes both meaningful: replaying the event log under the active closure-rule system produces the predication graph; mutations to the predication graph are recorded in the event log.

The predication graph store does not commit to a specific [residuated lattice](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/residuated-lattice.md) $\mathbf{L}$ for the underlying value-domain. Different predicated computers may store Boolean values ($\mathbf{L} = \mathbf{2}$, $\mathbf{L}^\bowtie = \mathbf{FOUR}$), multi-valued evidence with affirming and denying components, larger residuated-lattice values, or probability weights. The choice of $\mathbf{L}$ is a parameter of a particular predicated computer; the substrate-level commitment is to the predication-cell-as-storage-unit, the fiber-algebra-valued cell, and the three primitive queries.
