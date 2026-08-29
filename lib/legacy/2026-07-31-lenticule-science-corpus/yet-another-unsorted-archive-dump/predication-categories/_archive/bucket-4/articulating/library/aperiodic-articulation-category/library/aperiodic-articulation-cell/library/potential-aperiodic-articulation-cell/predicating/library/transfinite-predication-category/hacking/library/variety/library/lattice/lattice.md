---
name: lattice
description: A bounded lattice ⟨L, ⊓, ⊔⟩ — an algebra on a finite carrier L with binary meet and join operations satisfying idempotence, commutativity, associativity, and absorption. The signature parameter for the twist-product construction and the underlying lattice of every pre-bilattice and bilattice.
meeting: lattice
joining: lattice
specializing-to-distributive: lattice
parameter-of-twist-product: twist-product
parameter-of-residuated-lattice: residuated-lattice
---

A **lattice** is an algebra $\mathbf{L} = \langle L, \sqcap, \sqcup \rangle$ on a carrier $L$ whose two binary operations satisfy the lattice axioms:

- Idempotence: $a \sqcap a = a$, $a \sqcup a = a$.
- Commutativity: $a \sqcap b = b \sqcap a$, $a \sqcup b = b \sqcup a$.
- Associativity: $a \sqcap (b \sqcap c) = (a \sqcap b) \sqcap c$, $a \sqcup (b \sqcup c) = (a \sqcup b) \sqcup c$.
- Absorption: $a \sqcap (a \sqcup b) = a$, $a \sqcup (a \sqcap b) = a$.

The induced partial order is $a \leq b \iff a \sqcap b = a$, equivalently $a \sqcup b = b$. A lattice is **bounded** when it carries designated elements $\bot, \top \in L$ with $\bot \leq a \leq \top$ for every $a$. A lattice is **distributive** when $a \sqcap (b \sqcup c) = (a \sqcap b) \sqcup (a \sqcap c)$ holds (equivalently the dual law).

The two-element Boolean lattice $\mathbf{2}$ has carrier $\{0, 1\}$, $\sqcap = \min$, $\sqcup = \max$, $\bot = 0$, $\top = 1$. Specializing the twist-product construction to $\mathbf{L} = \mathbf{2}$ yields the four-element bilattice $\mathbf{FOUR}$.
