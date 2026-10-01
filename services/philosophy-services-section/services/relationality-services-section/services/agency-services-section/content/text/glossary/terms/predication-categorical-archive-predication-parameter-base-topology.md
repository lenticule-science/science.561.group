---
type: definition
class: grothendieck-topology
symbol: "J_\\mathbf{B}"
depends-on: [parameter-base-category, priestley-dual-cover-topology]
name: Parameter base topology
description: The Grothendieck topology on the parameter base category $\mathbf{B}$ for which the settling moduli prestack is a stack.
---


The Grothendieck topology on the [parameter base category](../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/parameter-base-category.md) $\mathbf{B}$ for which the [settling moduli prestack](../../documents/articles/notes/undated/settling-moduli-prestack.md) is a stack.

## Definition

$J_\mathbf{B}$ is the **product topology** on $\mathbf{B} = \mathrm{ResLat}_{\mathrm{dist}} \times \mathrm{PredCat} \times \mathbf{Set} \times \mathbf{Ord}$, with components:

- $\mathrm{ResLat}_{\mathrm{dist}}$-component: the [Priestley-dual cover topology](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/priestley-dual-cover-topology/priestley-dual-cover-topology.md) $J_{\mathrm{ResLat}}$.
- $\mathrm{PredCat}, \mathbf{Set}, \mathbf{Ord}$-components: **trivial (discrete) topologies** — only isomorphisms are covers.

A family $\{(\ell_i, e_i, \pi_i, \phi_{\lambda, i}) : B_i \to B\}_{i \in I}$ is a **cover in $J_\mathbf{B}$** iff each component family is a cover in the component's topology — which forces $\pi_i, e_i, \phi_{\lambda, i}$ to be isomorphisms (the predicate category, entity set, and settling bound are fixed across the cover) and $\{\ell_i\}$ to be a Priestley cover.

## Why the other three are trivial

The choice is not free — three of the four components are forced to be discrete:

- **$\mathbf{Set}$.** A naive Set-level cover $\{E_1, E_2\}$ of $E$ does not induce a cover of $E \times E$: cross-cells $(s, o) \in (E_1 \setminus E_2) \times (E_2 \setminus E_1)$ are uncovered. Since settling data lives on $E \times E$, $\mathbf{Set}$-component covers cannot be non-trivial.
- **$\mathbf{Ord}$.** The settling bound $\lambda$ is a single ordinal; the cellwise data is indexed by $\lambda$ stage-by-stage. There is no natural notion of "covering $\lambda$" that preserves the settling structure.
- **$\mathrm{PredCat}$.** Similar to $\mathbf{Set}$: the predicate category's structure is rigid under the four-generator inventory; covering predicates by sub-categories breaks generator-action coherence.

Only $\mathrm{ResLat}_{\mathrm{dist}}$ supports a non-trivial topology, the [Priestley-dual cover topology](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/priestley-dual-cover-topology/priestley-dual-cover-topology.md).

## Reading

Covers in $\mathbf{B}$ are covers of the residuated-lattice component alone, with the other three components held fixed at identity. This means the [stack theorem](../../documents/articles/notes/undated/settling-moduli-stack-theorem.md) is essentially a residuated-lattice descent statement, lifted through the settling data structure to the moduli level. The cellwise nature of all settling data (each cell is an element of $\mathbf{L}^\bowtie$) is what makes this lift work.
