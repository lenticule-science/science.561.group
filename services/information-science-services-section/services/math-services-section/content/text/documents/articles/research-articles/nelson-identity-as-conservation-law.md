---
kind: explanatory-note
status: canonicalized
discusses: [nelson-identity, contrapositive-failure, twist-product-residuation, negation, four-bilattice]
source-variants:
  - nelson-implication/predication-nelson-identity-as-conservation-law.md
  - nelson-implication/predication-nelson-identity-as-conservation-law-1.md
  - nelson-implication/predication-nelson-identity-as-conservation-law-2.md
type: research-article

title: The Nelson identity as a conservation law
description: Naive contrapositive fails on a twist product because residuation and bilattice negation do not commute.
---

# The Nelson identity as a conservation law

Naive contrapositive fails on a twist product because residuation and bilattice negation do not commute. The Nelson identity on $\mathbf{FOUR}$ supplies a corrected form:

$$\bigl(x \Rightarrow (x \Rightarrow y)\bigr) \wedge_k \bigl(\mathord{\sim} y \Rightarrow (\mathord{\sim} y \Rightarrow \mathord{\sim} x)\bigr) = x \Rightarrow y.$$

The identity joins two iterations: $x \Rightarrow (x \Rightarrow y)$ takes two implication-direction steps, while $\mathord{\sim} y \Rightarrow (\mathord{\sim} y \Rightarrow \mathord{\sim} x)$ takes two negation-reversed steps. Their knowledge-order meet is invariant and equals the single-step implication. This is a conservation-law shape—an invariant relating two different algebraic paths—not a conservation law of Hamiltonian mechanics.

The failure of naive contrapositive is structural. Single-step residuation interacts nontrivially with negation; the two-step Nelson correction records what symmetry survives. On $\mathbf{FOUR}$, the concrete failure is witnessed by $\mathbf{t} \odot \mathbf{f} = \mathbf{f}$ while $\mathord{\sim}\mathbf{t} \odot \mathord{\sim}\mathbf{f} = \mathbf{f} \odot \mathbf{t} = \mathbf{f}$ and $\mathord{\sim}\mathbf{f} = \mathbf{t}$, so the naive contrapositive would require unequal values to agree. The corrected identity instead relates the two-step residuation orbits to their negation-conjugates. The interpretation should not be extended to arbitrary non-idempotent residuated lattices without a separate proof.
