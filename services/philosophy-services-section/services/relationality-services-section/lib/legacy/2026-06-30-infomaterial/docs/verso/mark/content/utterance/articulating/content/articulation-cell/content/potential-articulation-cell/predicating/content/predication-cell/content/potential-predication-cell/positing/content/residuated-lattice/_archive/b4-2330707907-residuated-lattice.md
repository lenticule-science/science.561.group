---
name: residuated-lattice
description: A bounded integral commutative residuated lattice ⟨L, ⊓, ⊔, ⊥, ⊤, ⊗, →, e⟩ — a bounded lattice equipped with a commutative monoidal fusion ⊗ whose unit e coincides with the lattice top, together with the right-residual → adjoint to fusion. The parameter L in every predication fiber algebra A_p = L^⋈^(E×E).
extending: lattice
fusing: residuated-lattice
right-residuating: residuated-lattice
parameter-of-predication-fiber-algebra: predication-fiber-algebra
---

A **residuated lattice** is the structure $\mathbf{L} = \langle L, \sqcap, \sqcup, \bot, \top, \otimes, \to, e \rangle$ where:

- $\langle L, \sqcap, \sqcup, \bot, \top \rangle$ is a bounded lattice.
- $\otimes : L \times L \to L$ is associative and commutative with unit $e$: $a \otimes (b \otimes c) = (a \otimes b) \otimes c$, $a \otimes b = b \otimes a$, $a \otimes e = a$.
- $\to : L \times L \to L$ is the **right residual** of $\otimes$, satisfying the adjunction $a \otimes b \leq c \iff a \leq b \to c$ for all $a, b, c \in L$.

The lattice is **integral** when $e = \top$; the fusion's unit coincides with the lattice top. Integrality and commutativity are the hypotheses on $\mathbf{L}$ throughout the 561 OS's predication category theory: every fiber algebra $A_p = \mathbf{L}^{\bowtie\, E \times E}$ is parameterized by such an $\mathbf{L}$.

The two-element Boolean lattice $\mathbf{2}$ is the canonical integral commutative residuated lattice with $\otimes = \sqcap$ and $a \to b = (\neg a) \sqcup b$. More generally, any Heyting algebra is integral commutative residuated with $\otimes = \sqcap$.
