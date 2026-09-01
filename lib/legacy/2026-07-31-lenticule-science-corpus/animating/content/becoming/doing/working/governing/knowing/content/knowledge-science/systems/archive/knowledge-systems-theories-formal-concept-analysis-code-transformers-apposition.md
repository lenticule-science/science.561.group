---
type: morphism
class: context-combination
status: stable
depends-on: [formal-context]
see-also: [subposition, scale-measure]
---

# Apposition

The combination of two formal contexts that share an object set, by union of their attribute sets. Given $\mathbb{K}_1 = (G, M_1, I_1)$ and $\mathbb{K}_2 = (G, M_2, I_2)$ with $M_1 \cap M_2 = \emptyset$, their **apposition** is

$$\mathbb{K}_1 \mid \mathbb{K}_2 := (G, M_1 \cup M_2, I_1 \cup I_2).$$

Apposition is the FCA lineage's standard "horizontal" combination — appending columns of one context onto another. The shared object set is the join axis; the disjoint attribute sets are stacked.

## Effect on the concept lattice

The concept lattice of an apposition is generally *finer* than either factor's. Specifically:

- Every extent of $\mathbb{K}_1 \mid \mathbb{K}_2$ is the intersection of an extent of $\mathbb{K}_1$ with an extent of $\mathbb{K}_2$.
- Every intent of $\mathbb{K}_1 \mid \mathbb{K}_2$ is the disjoint union of an intent of $\mathbb{K}_1$ with an intent of $\mathbb{K}_2$.
- $\mathfrak{B}(\mathbb{K}_1 \mid \mathbb{K}_2)$ embeds into the direct product $\mathfrak{B}(\mathbb{K}_1) \times \mathfrak{B}(\mathbb{K}_2)$ as a sub-supremum-lattice.

The embedding is rarely surjective: most product pairs $((A_1, B_1), (A_2, B_2))$ do not correspond to apposition concepts because their extent intersection $A_1 \cap A_2$ may not be closed in either factor.

## Apposition as substrate operation

Read against the predicated framing: apposition corresponds to the substrate's [federate](../../predicated-knowledge-systems/morphisms/federate.md) operation under the identity-mapping that identifies objects of the two contexts and treats the attribute predicates as disjoint. In particular, the substrate's federation is more general — it admits non-disjoint predicate vocabularies with explicit predicate-category morphisms — but apposition is the FCA-specific case of "federation under identity object-mapping and disjoint attribute predicates".
