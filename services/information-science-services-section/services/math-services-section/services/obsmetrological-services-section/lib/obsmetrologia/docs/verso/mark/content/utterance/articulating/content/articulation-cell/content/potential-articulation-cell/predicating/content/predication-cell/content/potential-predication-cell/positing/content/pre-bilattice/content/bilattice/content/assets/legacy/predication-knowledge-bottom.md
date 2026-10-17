---
name: knowledge-bottom
description: "The bottom element ⊥ of the knowledge-order ≤_k on a bilattice's carrier. The least element under ≤_k. Decidable from the bilattice's knowledge-meet table: ⊥ is the unique x such that x ∧_k y = x for every y. The named instance ⊥ is *void*."
specializing: bilattice-value
position-in: knowledge-order
having-named-instance: void
---

The **knowledge-bottom** of a [bilattice](../../../../../../../../object/library/thing/library/category/library/variety/library/bilattice/bilattice.md) $\mathbf{B}$ is the bottom element $\bot \in |\mathbf{B}|$ of its [knowledge-order](../../knowledge-order.md) $\leq_k$ — the least element under $\leq_k$:

$$\bot \leq_k v \text{ for every } v \in |\mathbf{B}|.$$

Equivalently, $\bot$ is the unique element such that $\bot \sqcap_k v = \bot$ for every $v$ — the universal absorber of the knowledge-meet $\sqcap_k$.

## Decidability

The knowledge-bottom is decidable from the bilattice's knowledge-meet table. $\bot$ is the unique element $x \in |\mathbf{B}|$ satisfying

$$\forall y \in |\mathbf{B}|, \quad x \sqcap_k y = x.$$

Equivalently, $\bot$ is the element whose row in the knowledge-meet table consists entirely of itself. This is a finite check on $\mathbf{B}$'s data; every concrete bilattice has a decidable knowledge-bottom.

## Specialization-by-invariant

Knowledge-bottom specializes [bilattice-value](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/bilattice/bilattice-value.md) by the additional invariant *carrier-element equals the knowledge-order bottom*:

$$P(\langle \mathbf{B}, v \rangle) \iff v = \mathrm{knowledge\text{-}bottom}(\mathbf{B}).$$

The [specializing](../../../../../../../../object/specializing/specializing.md) inclusion functor $\iota : \mathbf{KnowledgeBottom} \hookrightarrow \mathbf{BilatticeValue}$ is faithful (every knowledge-bottom $\langle \mathbf{B}, \bot \rangle$ has a unique bilattice-value representation) and injective on objects (distinct bilattices give distinct knowledge-bottoms). Its image is the full subcategory of bilattice-values whose carrier-element is the parent bilattice's knowledge-order bottom.

## Named instance

The knowledge-bottom of every concrete bilattice carries the name [void](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/documents/articles/notes/void.md). Void is the named instance of knowledge-bottom — the value name the predication system assigns to the no-evidence cell-internal state.
