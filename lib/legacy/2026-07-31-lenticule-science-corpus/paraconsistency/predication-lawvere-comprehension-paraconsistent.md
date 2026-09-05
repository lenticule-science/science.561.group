---
type: theorem
status: proved
depends-on: [predication-hyperdoctrine, predicate-specialization, predicate-category, specialization-hyperdoctrinal-adjoints, knowledge-order, lawvere-comprehension-classical]
---

# Lawvere comprehension (paraconsistent / $\leq_k$-system)

For every $p \in \mathcal{C}$, the $\leq_k$-extension functor

$$\mathrm{Ext}^k : \mathcal{C}/p \to \mathcal{E}_p, \quad (g : q \to p) \mapsto \exists_g^k(\mathbf{1}_q^k)$$

— taking $\top$ on $\mathrm{dom}(q)$ and $\bot$ elsewhere — has a right adjoint

$$\{p : -\}_\top : \mathcal{E}_p \to \mathcal{C}/p$$

sending $\psi \in \mathcal{E}_p$ to the specialization $q_\psi \to p$ with $\mathrm{dom}(q_\psi) := \psi^{-1}(\top)$.

## Proof

Parallel to the [classical comprehension](lawvere-comprehension-classical.md) proof, with $\mathbf{t} \leadsto \top$, $\mathbf{f} \leadsto \bot$, and the [knowledge order](teaching/explanations/knowledge-order.md) $\leq_k$ replacing the truth order. $\square$

## Remark

The two comprehension schemas correspond to different *designated truth values*:

- $\{p : \psi\}_\mathbf{t}$: classical designation, "$\psi$ holds (is $\mathbf{t}$)."
- $\{p : \psi\}_\top$: information designation, "$\psi$ is information-maximal (is $\top$)."

Both are right adjoints to extension functors; both satisfy the Lawvere-style comprehension schema.
