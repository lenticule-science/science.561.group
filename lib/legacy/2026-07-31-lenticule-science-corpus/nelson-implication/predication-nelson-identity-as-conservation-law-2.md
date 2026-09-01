---
kind: narrative
discusses: [nelson-identity, contrapositive-failure, twist-product-residuation, negation, four-bilattice]
---

# The Nelson identity as a conservation law

Naive contrapositive — $\sim(x \odot y) = \sim y \Rightarrow \sim x$ — fails on the [twist product](../objects/twist-product.md) (see [contrapositive failure](../theorems/contrapositive-failure.md)): the residuation $\odot, \Rightarrow$ does not commute with the bilattice [negation](../morphisms/negation.md) $\sim$. This is a structural property of the pair $(\odot, \sim)$ on $\mathbf{L}^\bowtie$, independent of any morphism structure.

Yet a *corrected* contrapositive does hold. The [Nelson identity](../theorems/nelson-identity.md) on [$\mathbf{FOUR}$](../objects/four-bilattice.md):

$$\bigl(x \Rightarrow (x \Rightarrow y)\bigr) \;\wedge_k\; \bigl(\sim y \Rightarrow (\sim y \Rightarrow \sim x)\bigr) \;=\; x \Rightarrow y.$$

The reading is that the *iterated* application of implication, joined with the iterated application of contrapositive-with-negation, recovers the original implication. The identity is invariant under the joint action of "apply twice" and "negate-and-swap-arguments."

## Conservation-law shape

A conservation law in dynamics says: a quantity computed along an orbit equals a quantity computed in another way along a related orbit. The Nelson identity has exactly this shape. On the left:

- $x \Rightarrow (x \Rightarrow y)$ — two steps of left residuation by $x$ starting from $y$.
- $\sim y \Rightarrow (\sim y \Rightarrow \sim x)$ — two steps of left residuation by $\sim y$ starting from $\sim x$.

The two iterations sit on different orbits: one in the "implication direction," one in the "contrapositive direction." The $\wedge_k$-meet of their endpoints is invariant — equal to $x \Rightarrow y$, the single-step computation.

This is *not* the conservation laws of classical Hamiltonian mechanics, but it is the same algebraic shape: an invariant under iteration that ties two different dynamical paths together. Where classical contrapositive fails because $\odot$ and $\sim$ do not commute, Nelson's correction is the smallest algebraic object that records what survives.

## What survives, what does not

[Contrapositive failure](../theorems/contrapositive-failure.md) is genuine: on $\mathbf{FOUR}$, $\mathbf{t} \odot \mathbf{f} = \mathbf{f}$ but $\sim \mathbf{t} \odot \sim \mathbf{f} = \mathbf{f} \odot \mathbf{t} = \mathbf{f}$ — and $\sim \mathbf{f} = \mathbf{t}$, so naive contrapositive expects $\mathbf{t} \neq \mathbf{f}$. It is the first-order classical move that does not generalize.

What survives is the joint two-step iteration. Single-step residuation interacts non-trivially with negation; double-step residuation reconstitutes the structure. The conservation law is a record of *what symmetry the algebra has*, even though the obvious one-step symmetry is broken.

The interpretation is dynamical: in the settling, repeated residuation orbits stabilize at fixed points (see [four-bilattice residuation convergence](../theorems/four-bilattice-residuation-convergence.md)); the Nelson identity is a constraint relating those fixed points to their negation-conjugates.
