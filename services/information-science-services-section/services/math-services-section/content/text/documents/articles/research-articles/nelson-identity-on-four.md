---
kind: theorem
status: proved
depends-on: [four-bilattice, twist-product-right-residual, negation, knowledge-order]
formalizations:
  - PredicationCategories.Homebrew.Algebra.FOURTheorems.nelson
  - SpatiotemporalKnowledgeSystem.Homebrew.Algebra.FOURTheorems.nelson
source-variants:
  - nelson-implication/predication-nelson-identity.md
  - nelson-implication/predication-nelson-identity-1.md
  - nelson-implication/predication-nelson-identity-2.md
type: research-article

---

# Nelson identity on $\mathbf{FOUR}$

For all $x,y \in \mathbf{FOUR}$,

$$\bigl(x \Rightarrow (x \Rightarrow y)\bigr) \wedge_k \bigl(\mathord{\sim} y \Rightarrow (\mathord{\sim} y \Rightarrow \mathord{\sim} x)\bigr) = x \Rightarrow y.$$

## Proof

Direct enumeration of the $|\mathbf{FOUR}|^2 = 16$ pairs $(x,y)$ proves the equality. For each pair, compute both sides from the twist-product right-residual formula and the negation $\mathord{\sim}\langle a,b\rangle = \langle b,a\rangle$. The knowledge-order meet $\wedge_k$ combines the two iterated implications cellwise. The result is the formalized theorem recorded by both source Lean namespaces above.

## Scope

This identity is not established here for arbitrary integral commutative residuated lattices. The algebraic reduction uses idempotence ($x \cdot x = x$); the Boolean lattice $\mathbf{2}$ is idempotent, while Łukasiewicz MV-algebras are not. The non-idempotent generalization remains an open question rather than a consequence of this theorem.

The theorem's interpretation is that the iterated implication and its negation-reversed counterpart jointly recover the original implication. It is a corrected contrapositive principle, not a claim that naive contrapositive commutes with twist-product negation.

