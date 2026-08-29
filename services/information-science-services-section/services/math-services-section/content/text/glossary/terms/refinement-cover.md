---
type: term
term-kind: morphism
class: poset-cover-relation
depends-on: [bipartite-multipartition, bipartite-multipartition-lattice]
see-also: [closure-poset-of-strata, mobius-function-of-bipartite-lattice]
---

# Refinement cover relation

The atomic morphism in the [bipartite multipartition lattice](./bipartite-multipartition-lattice.md): one-step refinement of a multipartition by splitting a single block.

## Definition

Bipartite multipartitions $\Pi$ and $\Pi'$ satisfy $\Pi \lessdot \Pi'$ ($\Pi$ is covered by $\Pi'$, equivalently $\Pi'$ refines $\Pi$ minimally) iff $\Pi'$ is obtained from $\Pi$ by partitioning exactly one block $B \in \Pi$ into two non-empty parts $B_1, B_2$ with $B = B_1 \sqcup B_2$, leaving all other blocks unchanged.

In closure-poset terms: $\Pi \lessdot \Pi'$ iff $\overline{\mathrm{Stratum}(\Pi')}$ contains $\mathrm{Stratum}(\Pi)$ and there is no intermediate stratum.

## Geometric meaning

A cover $\Pi \lessdot \Pi'$ corresponds to **one extra eigenvalue equality being broken** in passing from a $\Pi$-point to a generic $\Pi'$-point in moduli. The block $B$ in $\Pi$ has $|B|$ identified eigenvalues; in $\Pi'$ they split into $|B_1|$ identified + $|B_2|$ identified (still partially identified, just two clusters instead of one).

The codim of a single cover step: $\sum_B(|B|-1)|_{\Pi'} - \sum_B(|B|-1)|_\Pi = (|B_1| - 1) + (|B_2| - 1) - (|B|-1) = |B_1| + |B_2| - |B| - 1 = -1$. The codim *decreases* by 1 per cover step (refinement reduces codim).

## Two types of covers

**Within-block split**: $B$ has all entries in the same chain degree ($k_n^B \ne 0$ for one $n$). Splitting it produces two within-degree blocks. Stab dim drop: $\binom{k_n^B}{2} - \binom{k_n^{B_1}}{2} - \binom{k_n^{B_2}}{2}$ (depends on the split).

**Cross-degree split**: $B$ has entries in multiple degrees. Splitting can break a cross-degree identification. Stab dim drop depends on the split structure.

The cross-degree asymmetry (codim sees splits, stab does not for cross-degree) appears as: cross-degree splits reduce codim by 1 but produce no stab change if the resulting blocks are still cross-degree.

## Length of the lattice

The length of a maximal chain $\hat 0 \lessdot \cdots \lessdot \hat 1$ in $\mathcal P_{\mathrm{bip}}(\mathbf r)$ equals $N_* - 1$ — the codim difference between the bottom (single block) and top (singletons) elements. Each cover step refines by exactly 1.

## Möbius function relations

The cover relations generate the partial order; the [Möbius function](./bipartite-multipartition-lattice.md#mobius-function) is determined by them via the inversion identity. For the conjectured product formula, each cover-step Möbius value factors as a univariate Möbius factor on the split block.

## Action on stratum closures

A cover step $\Pi \lessdot \Pi'$ corresponds geometrically to a deformation: starting from a $\Pi$-stratum point and applying first-order Rayleigh–Schrödinger perturbation, the eigenvalues split in the direction of the cover. ([Closure poset proof](../../documents/articles/research-articles/closure-poset-of-strata.md).)

## Example: $(2, 2)$ chain

For the (2, 2) chain with $d_1$ iso (Hodge-constrained lattice with 2 elements):
- $\hat 0 = \Pi_{\max} = \{\{(0,1),(0,2),(1,1),(1,2)\}\}$, codim 3 in eigenvalue moduli.
- $\hat 1 = \Pi_{\min} = \{\{(0,1),(1,1)\}, \{(0,2),(1,2)\}\}$, codim 2.
- Cover: $\hat 0 \lessdot \hat 1$, splitting the block of 4 into two blocks of 2 (preserving Hodge pairings).
- Codim difference: 1 (matches the formula).
