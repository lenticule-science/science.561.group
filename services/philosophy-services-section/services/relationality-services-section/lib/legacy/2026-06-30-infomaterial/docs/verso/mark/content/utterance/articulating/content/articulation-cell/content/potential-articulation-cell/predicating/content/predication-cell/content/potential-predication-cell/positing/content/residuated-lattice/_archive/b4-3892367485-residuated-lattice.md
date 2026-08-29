---
name: residuated lattice
description: A commutative residuated lattice ⟨L, ∨, ∧, ·, →, 1⟩ — a lattice with a commutative monoid (·, 1) and a residual → such that x · y ≤ z iff x ≤ y → z. Integral when 1 is the lattice top. The L parameter of predication fiber algebras is an integral commutative residuated lattice.
---

A commutative residuated lattice is an algebra $\mathbf{L} = \langle L, \vee, \wedge, \cdot, \to, 1 \rangle$ where $\langle L, \vee, \wedge \rangle$ is a lattice, $\langle L, \cdot, 1 \rangle$ is a commutative monoid, and the binary operations $\cdot$ (the *fusion product*) and $\to$ (the *residual*) satisfy

$$x \cdot y \leq z \iff x \leq y \to z$$

for all $x, y, z \in L$.

A residuated lattice is *integral* when $1$ is the top element of the lattice, and *bounded* when a bottom element $0$ exists. The Boolean lattice $\mathbf{2}$ with $\cdot = \wedge$ and classical implication $x \to y := \neg x \vee y$ is an integral commutative residuated lattice; so is any Heyting algebra (with $\cdot = \wedge$). MV-algebras are integral commutative residuated lattices in which $\cdot$ is the Łukasiewicz strong conjunction.
