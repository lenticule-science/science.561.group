---
type: theorem
status: proved
realizes: [closure-restriction]
depends-on: [closure-restriction, closure-operator, predicate-category, predication-fiber-algebra]
see-also: [subtheory-settled-state, subtheory]
---

# Closure restriction is a closure operator

**Theorem.** Let $\mathrm{Cl}^T = (\mathrm{Cl}^T_q)_{q \in \mathcal{C}^T}$ be a [closure operator](../morphisms/closure-operator.md) on the predication fiber functor over $(\mathbf{L}, \mathcal{C}^T, E)$, and let $\pi : \mathcal{C}^S \hookrightarrow \mathcal{C}^T$ be a type embedding. Then the family

$$\pi^*(\mathrm{Cl}^T) \;:=\; \bigl(\mathrm{Cl}^T_{\pi(p)}\bigr)_{p \in \mathcal{C}^S}$$

is a closure operator on the predication fiber functor over $(\mathbf{L}, \mathcal{C}^S, E)$.

**Proof.** Since $\mathbf{L}$ and $E$ are common, the [predication fiber algebra](../objects/predication-fiber-algebra.md) at any $p \in \mathcal{C}^S$ and at $\pi(p) \in \mathcal{C}^T$ are the same:

$$A^S_p \;=\; \mathbf{L}^{\bowtie\, E \times E} \;=\; A^T_{\pi(p)}.$$

Write $\mathrm{Cl}^S_p := \mathrm{Cl}^T_{\pi(p)}$. We verify the four closure axioms.

**Axiom (1): $\leq_k$-monotonicity.** Let $v \leq_k v'$ in $A^S_p$. Then

$$\mathrm{Cl}^S_p(v) \;=\; \mathrm{Cl}^T_{\pi(p)}(v) \;\leq_k\; \mathrm{Cl}^T_{\pi(p)}(v') \;=\; \mathrm{Cl}^S_p(v'),$$

where the inequality holds by $\leq_k$-monotonicity of $\mathrm{Cl}^T_{\pi(p)}$. $\checkmark$

**Axiom (2): Inflation.** For any $v \in A^S_p$:

$$v \;\leq_k\; \mathrm{Cl}^T_{\pi(p)}(v) \;=\; \mathrm{Cl}^S_p(v),$$

by inflation of $\mathrm{Cl}^T_{\pi(p)}$. $\checkmark$

**Axiom (3): Idempotence.**

$$\mathrm{Cl}^S_p\bigl(\mathrm{Cl}^S_p(v)\bigr) \;=\; \mathrm{Cl}^T_{\pi(p)}\bigl(\mathrm{Cl}^T_{\pi(p)}(v)\bigr) \;=\; \mathrm{Cl}^T_{\pi(p)}(v) \;=\; \mathrm{Cl}^S_p(v),$$

by idempotence of $\mathrm{Cl}^T_{\pi(p)}$. $\checkmark$

**Axiom (4): Naturality in $\mathcal{C}^S$.** Let $f : q \to p$ be a morphism in $\mathcal{C}^S$. We must show

$$f^* \circ \mathrm{Cl}^S_p \;=\; \mathrm{Cl}^S_q \circ f^*.$$

The reindexing functor $f^* : A^S_p \to A^S_q$ associated to a generator-class morphism $f$ in $\mathcal{C}^S$ is determined entirely by the generator class of $f$ and the shared parameters $(\mathbf{L}, E)$ — not by which particular predicates $p, q$ are. Since $\pi$ preserves generator classes, the morphism $\pi(f) : \pi(q) \to \pi(p)$ in $\mathcal{C}^T$ belongs to the same generator class as $f$. Because the fiber algebras coincide ($A^S_p = A^T_{\pi(p)}$ and $A^S_q = A^T_{\pi(q)}$), the reindexing maps are equal:

$$f^* \;=\; \pi(f)^* \qquad \text{as maps } A^T_{\pi(p)} \;\to\; A^T_{\pi(q)}.$$

By naturality of $\mathrm{Cl}^T$ at the morphism $\pi(f) \in \mathcal{C}^T$:

$$\pi(f)^* \circ \mathrm{Cl}^T_{\pi(p)} \;=\; \mathrm{Cl}^T_{\pi(q)} \circ \pi(f)^*.$$

Substituting $f^* = \pi(f)^*$ and $\mathrm{Cl}^S_p = \mathrm{Cl}^T_{\pi(p)}$, $\mathrm{Cl}^S_q = \mathrm{Cl}^T_{\pi(q)}$:

$$f^* \circ \mathrm{Cl}^S_p \;=\; \mathrm{Cl}^S_q \circ f^*. \qquad \checkmark$$

All four axioms hold, so $\pi^*(\mathrm{Cl}^T)$ is a closure operator on $(\mathbf{L}, \mathcal{C}^S, E)$. $\square$
