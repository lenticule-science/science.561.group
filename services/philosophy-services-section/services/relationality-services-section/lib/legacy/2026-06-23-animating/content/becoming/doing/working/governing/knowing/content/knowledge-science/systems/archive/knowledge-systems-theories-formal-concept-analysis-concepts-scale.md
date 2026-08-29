---
type: concept
class: methodological-move
status: stable
depends-on: [formal-context]
see-also: [residuated-context]
---

# Scale (conceptual scaling)

The methodological move by which a many-valued context is reduced to a binary context analysable by the standard FCA machinery. A **(conceptual) scale** for a many-valued attribute $a: G \rightharpoonup W$ is a formal context $(W, N_a, I_a)$ whose object set is $a$'s value-set $W$ and whose attribute set $N_a$ is a chosen set of *scale attributes*. The scaled context replaces the many-valued attribute $a$ by the binary attributes in $N_a$, with $g$ bearing scale attribute $n \in N_a$ iff $a(g) \, I_a \, n$.

Conceptual scaling is the FCA lineage's standard pre-processing for non-Boolean data (Ganter & Wille 1999, Chapter 1.4). It separates two questions that the binary FCA framework conflates:

- *What is the value of attribute $a$ on object $g$?* — answered by the many-valued attribute itself.
- *What scale of distinctions is appropriate for analysing $a$?* — answered by choosing the scale $(W, N_a, I_a)$.

## Standard scales

The lineage names a small number of standard scales that recur across applications:

- **Nominal scale.** $N_a = W$, $I_a$ the identity. Each value becomes its own scale attribute; no two values are comparable. Appropriate for unordered categorical attributes.
- **Ordinal scale.** $W$ is linearly ordered; $N_a = W$ and $w \, I_a \, n \iff w \ge n$. Each value $n$ becomes the attribute "is at least $n$." Appropriate for ordinal categorical attributes.
- **Interordinal scale.** Combines two ordinal scales (one ascending, one descending) for attributes where both directions matter.
- **Dichotomic scale.** $W = \{0, 1\}$, $N_a = \{0\text{-or-}1\}$ with the identity. The trivial scaling for already-binary attributes.

The choice of scale is a methodological commitment of the analyst, not a derivable feature of the data. Different scales of the same many-valued attribute yield different concept lattices; the analyst's domain knowledge supplies the scale.

## Scaling and substrate

Read against the predicated framing, conceptual scaling corresponds to the substrate operation of *predicate refinement*: the many-valued attribute `a` becomes a family of binary predicates `a-at-least-n` (in the ordinal case) related by [specialize](../../predicated-knowledge-systems/morphisms/specialize.md) morphisms. The scale's choice fixes the predicate-category structure on the family; the resulting binary context is the substrate restricted to the refined predicate vocabulary. Conceptual scaling is, in this reading, the FCA lineage's name for the substrate's [predicate-category-stratification](../../predicated-knowledge-systems/concepts/predicate-category-stratification.md) discipline applied at the attribute level.

The residuated-lattice generalisation (per [residuated-context](../objects/residuated-context.md)) does for fuzzy data what scaling does for crisp many-valued data: it admits the original value-domain as the substrate's value-domain rather than reducing it. The two approaches are complementary; Belohlavek (2004) discusses both.
