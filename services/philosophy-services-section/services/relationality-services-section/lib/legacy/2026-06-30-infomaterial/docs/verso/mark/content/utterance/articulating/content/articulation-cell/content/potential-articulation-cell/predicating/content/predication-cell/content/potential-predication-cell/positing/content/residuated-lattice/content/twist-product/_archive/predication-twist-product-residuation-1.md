---
kind: theorem
status: proved
lean: SpatiotemporalKnowledgeSystem.Homebrew.Algebra.TwistProduct.fusion_le_iff_le_twResiduum
depends-on: [residuated-lattice, twist-product, twist-product-fusion, twist-product-right-residual, truth-order]
---

# Twist-product residuation

For any integral commutative [residuated lattice](../objects/residuated-lattice.md) $\mathbf{L} = \langle L, \vee, \wedge, \cdot, \to, 1 \rangle$, the structure $\langle L^2, \sqcup, \sqcap, \odot, \Rightarrow, \langle 1, 1 \rangle \rangle$ on the carrier of the [twist product](../objects/twist-product.md) $\mathbf{L}^\bowtie$ is a commutative residuated lattice. Explicitly:

1. $\langle L^2, \sqcup, \sqcap \rangle$ is a lattice.
2. $\langle L^2, \odot, \langle 1, 1 \rangle \rangle$ is a commutative monoid.
3. **Residuation:** for all $\langle a, b \rangle, \langle c, d \rangle, \langle e, f \rangle \in L^2$,

$$\langle a, b \rangle \odot \langle c, d \rangle \leq_t \langle e, f \rangle \iff \langle a, b \rangle \leq_t \langle c, d \rangle \Rightarrow \langle e, f \rangle$$

where $\leq_t$ is the [truth order](../concepts/truth-order.md), $\odot$ is the [twist-product fusion](../morphisms/twist-product-fusion.md), and $\Rightarrow$ is the [twist-product right residual](../morphisms/twist-product-right-residual.md).

## Proof

Parts (1) and (2) follow by direct computation: (1) is immediate from the lattice operations on $L^2$; (2) uses commutativity and associativity of $\cdot$, the currying identity $(x \cdot y) \to z = x \to (y \to z)$, and the integral law $x \to 1 = 1$.

For (3), the residuation, the following are equivalent:

(i) $\langle a, b \rangle \odot \langle c, d \rangle \leq_t \langle e, f \rangle$,

(ii) $\langle a \cdot c,\ (a \to d) \wedge (c \to b) \rangle \leq_t \langle e, f \rangle$ — by the definition of $\odot$,

(iii) $a \cdot c \leq e$ and $f \leq (a \to d) \wedge (c \to b)$ — by the definition of $\leq_t$ on $L^2$,

(iv) $a \cdot c \leq e$, $f \leq a \to d$, $f \leq c \to b$ — the meet condition expanded,

(v) $a \leq c \to e$, $a \leq f \to d$, $c \cdot f \leq b$ — by residuation in $\mathbf{L}$ applied three times (using commutativity to rewrite $a \cdot f \leq d$ as $a \leq f \to d$ in the second),

(vi) $a \leq (c \to e) \wedge (f \to d)$ and $c \cdot f \leq b$ — combining the two $a$-bounds by meet,

(vii) $\langle a, b \rangle \leq_t \langle (c \to e) \wedge (f \to d),\ c \cdot f \rangle$ — by the definition of $\leq_t$,

(viii) $\langle a, b \rangle \leq_t \langle c, d \rangle \Rightarrow \langle e, f \rangle$ — by the definition of $\Rightarrow$.

Every step is an if-and-only-if. $\square$

## Remark

The monoidal unit $\langle 1, 1 \rangle$ is not the top of the lattice $\langle L^2, \sqcup, \sqcap \rangle$, which is $\langle 1, 0 \rangle$. Consequently $\langle L^2, \odot, \Rightarrow \rangle$ is a **non-integral** commutative residuated lattice.
