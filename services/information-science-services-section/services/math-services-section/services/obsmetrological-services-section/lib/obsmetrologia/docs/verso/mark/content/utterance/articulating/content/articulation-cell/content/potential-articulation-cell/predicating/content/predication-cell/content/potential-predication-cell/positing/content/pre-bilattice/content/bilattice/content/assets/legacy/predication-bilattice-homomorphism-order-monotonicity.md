---
type: theorem
status: proved
symbol: ""
depends-on: [bilattice-homomorphism, bilattice, truth-order, knowledge-order]
see-also: [modeling-morphism, predication-settling-preorder-morphism]
---

# Bilattice homomorphisms are order-monotone in both orders

Every [bilattice homomorphism](../morphisms/bilattice-homomorphism.md) $h : \mathbf{B}_1 \to \mathbf{B}_2$ is $\leq_t$-monotone and $\leq_k$-monotone.

## Proof

Both orders are defined in terms of the four binary operations that $h$ preserves. Recall that for any lattice, a map that preserves $\wedge$ and $\vee$ is order-preserving: if $a \leq b$ (i.e., $a \wedge b = a$ and $a \vee b = b$), then $h(a) \wedge h(b) = h(a \wedge b) = h(a)$ and $h(a) \vee h(b) = h(a \vee b) = h(b)$, so $h(a) \leq h(b)$.

- **$\leq_k$-monotone.** The [knowledge order](teaching/explanations/knowledge-order.md) $\leq_k$ is the order of the sub-lattice $(B, \wedge_k, \vee_k)$. Since $h$ preserves $\wedge_k$ and $\vee_k$, the argument above applies with $\wedge = \wedge_k$ and $\vee = \vee_k$.

- **$\leq_t$-monotone.** The [truth order](teaching/explanations/truth-order.md) $\leq_t$ is the order of the sub-lattice $(B, \wedge_t, \vee_t)$. Since $h$ preserves $\wedge_t$ and $\vee_t$, the same argument applies. $\square$

## Remark

The result is immediate from the definition and holds for both orders simultaneously — there is no asymmetry between the two. Its role is to make the composition of [modeling morphisms](../morphisms/modeling-morphism.md) well-behaved: if $\Psi : v' \models v''$ and $\Phi_p(v_\lambda(p)) \leq_t v'_\lambda(p)$, applying $\Psi_p$ to both sides uses $\leq_t$-monotonicity to obtain $\Psi_p(\Phi_p(v_\lambda(p))) \leq_t \Psi_p(v'_\lambda(p))$, and the truth transport for $\Psi$ then closes the chain. The $\leq_k$ case is the same structure underlying the composability of the [predication-settling preorder morphism](../morphisms/predication-settling-preorder-morphism.md) class.
