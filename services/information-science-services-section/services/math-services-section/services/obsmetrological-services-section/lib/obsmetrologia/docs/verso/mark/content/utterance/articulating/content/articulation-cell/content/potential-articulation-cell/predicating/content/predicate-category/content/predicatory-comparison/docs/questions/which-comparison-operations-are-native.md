---
type: question
status: open
explores: [predicatory-comparison, predicatory-commutation, predicatory-confluence, predicatory-equalization, predicatory-differentiation]
depends-on: [predication-settling-category, predication-valuation, knowledge-order, closure-operator, positing-morphism]
see-also: [what-counts-as-a-comparison-witness, comparison-context, comparison-standard, comparison-witness, four-symmetric-evidence-difference, positing-closure-commutation-defect]
---

# Which comparison operations are native to predication categories?

Can predication category theory supply a native calculus of comparison operations -- commuting, confluencing, equalizing, comparing, differentiating -- without collapsing back into Boolean equality tests or ordinary set-theoretic diffs?

The working answer is: yes for several operations, but each operation must be placed at the right categorical level.

1. **Commutation** is equality of composites. In PredCat, this is nontrivial for operational endomaps such as positing, closure, reindexing, projection, merge, and modal evaluation. It is mostly trivial inside $\mathbf{PS}$ itself, because hom-sets are singletons or empty.
2. **Confluence** is joinability of divergent settling paths. In $\mathbf{PS}$, knowledge-order completeness gives a canonical common successor $u \vee_k w$ for any two states above a common source. Operational confluence still requires checking that the successor is reachable by the allowed operations, not merely present as a lattice join.
3. **Equalization** is universal agreement of parallel arrows. In the preorder category $\mathbf{PS}$ it collapses to the identity on the source of an already-equal parallel pair. Nontrivial equalizers therefore live in an ambient category of valuation endomaps or in explicitly defined equalization loci.
4. **Differentiation** is not yet a differential-category structure. The native candidate is an evidence-residual operation measuring what must be added, in $\leq_k$, to move from one settling to another. This gives calculator-grade "what changed?" and "what evidence is missing?" operations, but does not by itself satisfy the differential-category axioms of [@blute-cockett-seely2006] or [@blute-et-al2020].

The first closed calculator fragment is now:

- finite positing paths are confluent under $\vee_k$;
- equalizers internal to $\mathbf{PS}$ collapse, so nontrivial equalization is an equalization locus of operational maps;
- comparable differences use $\partial_k$;
- arbitrary $\mathbf{FOUR}$-valued differences use $\delta^{\oplus}_k$;
- noncommuting operational composites expose a predication-valued defect, as in [positing-closure-commutation-defect](../examples/positing-closure-commutation-defect.md).

The deeper open work is to determine which of these operators are merely useful computations and which lift to standard-indexed, witness-producing comparison morphisms across the predication fibration, hyperdoctrine, and sheaf/cohomology layers.
