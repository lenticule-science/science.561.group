---
type: theorem
status: proved
lean: PredicationCategories.Homebrew.Algebra.FOURTheorems.nelson
depends-on: [four-bilattice, twist-product-right-residual, negation, knowledge-order]
---

# Nelson identity on $\mathbf{FOUR}$

For all $x, y \in$ [$\mathbf{FOUR}$](../objects/four-bilattice.md),

$$(x \Rightarrow (x \Rightarrow y)) \wedge_k (\sim y \Rightarrow (\sim y \Rightarrow \sim x)) = x \Rightarrow y.$$

## Proof

Direct enumeration on the $|\mathbf{FOUR}|^2 = 16$ pairs $(x, y)$. For each pair, compute both sides using the [twist-product right residual](../morphisms/twist-product-right-residual.md) formula and the [negation](../morphisms/negation.md) $\sim \langle a, b \rangle = \langle b, a \rangle$, then verify equality. The [knowledge-order](teaching/explanations/knowledge-order.md) meet $\wedge_k$ on the left-hand side combines the two iterated implications cellwise. $\square$

## Remark

The Nelson identity does not generalize directly to arbitrary integral commutative residuated lattices $\mathbf{L}$. Algebraic expansion of $x \Rightarrow (x \Rightarrow y)$ produces terms of the form $x_+ \cdot x_+$ and $x_+ \to (x_+ \to y_+)$ which equal $x_+$ and $x_+ \to y_+$ only when $\mathbf{L}$ is idempotent (i.e., $x \cdot x = x$ for all $x \in L$). The Boolean lattice $\mathbf{2}$ is idempotent; Łukasiewicz MV-algebras are not. Whether a suitably modified identity holds in non-idempotent $\mathbf{L}^\bowtie$ — and whether the modification has the same conservation-law interpretation — is open.

## Interpretation

The Nelson identity says that the *iterated* application of implication, together with its contrapositive-with-negation, recovers the original implication. Where naive contrapositive $\sim(x \odot y) = \sim y \Rightarrow \sim x$ fails (see [contrapositive failure](contrapositive-failure.md)), the Nelson-corrected version — involving double applications of $\Rightarrow$ — holds. This is a conservation law in the dynamical sense: implication is invariant under the joint action of "apply twice" and "negate and swap arguments."
