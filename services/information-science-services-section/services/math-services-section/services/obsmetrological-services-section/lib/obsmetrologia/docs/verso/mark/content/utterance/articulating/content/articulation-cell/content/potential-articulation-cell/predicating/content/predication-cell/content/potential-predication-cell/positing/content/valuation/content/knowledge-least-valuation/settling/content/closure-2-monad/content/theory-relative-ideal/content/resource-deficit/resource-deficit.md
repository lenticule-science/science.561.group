---
type: concept
class: partition
symbol: "\\mathrm{Df}"
depends-on: [theory-relative-ideal, knowledge-order, predication-settling-category]
see-also: [idealization-morphism, invisible-automorphism-subgroup, visible-automorphism-quotient]
---

# Resource deficit

Given a resource settling $v^R$ and its [theory-relative ideal](../../theory-relative-ideal.md) $v^R_{T,\infty}$ within host theory $T$, every predication cell $c = (s, p, o) \in E \times \mathcal{C}^R \times E$ falls into exactly one of four classes under comparison in the [knowledge order](knowledge-order.md) $\leq_k$:

$$\mathrm{Al}(v^R, T) := \{c : v^R(c) \;=\; v^R_{T,\infty}(c)\}$$ $$\mathrm{De}(v^R, T) := \{c : v^R(c) \;<_k\; v^R_{T,\infty}(c)\}$$ $$\mathrm{Ex}(v^R, T) := \{c : v^R(c) \;>_k\; v^R_{T,\infty}(c)\}$$ $$\mathrm{Co}(v^R, T) := \{c : v^R(c) \;\perp_k\; v^R_{T,\infty}(c)\}$$

where $\perp_k$ denotes $\leq_k$-incomparability.
These four sets are pairwise disjoint and cover all cells.

The **resource deficit** $\mathrm{Df}(v^R, T)$ is the pair $(\mathrm{De}, \mathrm{Co})$: the cells where the resource is deficient and the cells where it contradicts the theory.
Collectively, $\mathrm{De} \cup \mathrm{Co}$ is what must be resolved for the resource to admit the [idealization morphism](../morphisms/idealization-morphism.md) toward its theory-relative ideal.

## Reading each class

**Aligned** ($\mathrm{Al}$): The resource is exactly what the theory expects at these cells.
No action needed.

**Deficient** ($\mathrm{De}$): The theory's settled state has more knowledge here than the resource expresses.
These are cells the resource should contain but does not.
In practice: missing content, incomplete derivations, unrecorded dependencies, unmarked proof gaps.

**Excessive** ($\mathrm{Ex}$): The resource claims more at these cells than the theory's settled ideal supports.
This may indicate: - Legitimate innovation — claims the theory hasn't yet absorbed. - Overreach — claims not grounded in the theory's current settled state.
The correct interpretation requires judgment: excessive cells are not automatically errors, but they flag content that outpaces the theory's current derivations.

**Contradicted** ($\mathrm{Co}$): The resource and the theory's ideal have $\leq_k$-incomparable values, meaning they assert incompatible truth-values at these cells (one says $\mathbf{t}$, the other says $\mathbf{f}$, or one says $\mathbf{t}$ while the other says $\top$, etc.).
These are genuine conflicts: the resource and the theory disagree.
Resolution requires either correcting the resource or recognizing a gap in the theory.

## Connection to existing automorphism theory

The existing [automorphism decomposition](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-automorphism-decomposition.md) classifies lateral transformations of a resource — automorphisms that keep knowledge constant.
The resource deficit classifies the VERTICAL dimension: how far the resource sits above or below its theory-relative ideal.
Together, the two structures give a complete two-axis picture:

- **Vertical axis**: alignment with theory ideal, measured by $(\mathrm{De}, \mathrm{Ex}, \mathrm{Co})$
- **Lateral axis**: internal symmetry structure of the resource, measured by $\mathrm{Aut}^\simeq(v^R)$

A refactoring (invisible automorphism) is lateral — it does not change any of $(\mathrm{De}, \mathrm{Ex}, \mathrm{Co})$.
An improvement changes the vertical position — it reduces $|\mathrm{De}|$ or $|\mathrm{Co}|$.
These two kinds of change are orthogonal.

## Bilattice structure of $\mathrm{Co}$

In the four-element bilattice $\mathbf{FOUR} = \{\mathbf{t}, \mathbf{f}, \bot, \top\}$ with knowledge order $\bot <_k \mathbf{t}, \mathbf{f} <_k \top$: the only $\leq_k$-incomparable pairs are $(\mathbf{t}, \mathbf{f})$ and $(\mathbf{f}, \mathbf{t})$.
So a cell is contradicted iff the resource asserts $\mathbf{t}$ where the theory says $\mathbf{f}$, or vice versa — a clean truth-value conflict with no ambiguity.

In continuous or quantale-enriched extensions, $\mathrm{Co}$ may be a richer set of incomparable pairs, but the same logical reading applies: contradicted cells are truth-value conflicts, not knowledge-level gaps.
