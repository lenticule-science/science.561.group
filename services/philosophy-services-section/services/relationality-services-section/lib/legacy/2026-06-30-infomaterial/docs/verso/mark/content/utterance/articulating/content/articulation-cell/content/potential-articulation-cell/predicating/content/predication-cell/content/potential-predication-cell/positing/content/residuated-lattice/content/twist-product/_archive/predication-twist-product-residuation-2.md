---
name: twist-product residuation
description: For an integral commutative residuated lattice $\mathbf{L}$, the binary operations $\odot$ (twist-product fusion) and $\Rightarrow$ (twist-product right residual) on $\mathbf{L}^\bowtie$ are well-defined and form a Lambek-residuated pair under the truth order — $a \odot b \leq_t c \iff a \leq_t b \Rightarrow c$.
status: draft
depends-on:
  - twist-product-construction.md
references:
  - id: lambek1958
    type: article-journal
    title: The mathematics of sentence structure
    volume: 65
    issue: 3
    author:
      - literal: Lambek, Joachim
    container-title: The American Mathematical Monthly
    page: 154-170
    issued:
      - year: 1958
  - id: ginsberg1988
    type: article-journal
    title: Multivalued logics: A uniform approach to inference in artificial intelligence
    volume: 4
    issue: 3
    author:
      - literal: Ginsberg, Matthew L.
    container-title: Computational Intelligence
    page: 265-316
    issued:
      - year: 1988
---

# Twist-product residuation

**Claim.** Let $\mathbf{L} = \langle L, \vee, \wedge, \cdot, \to, 1 \rangle$ be an integral commutative [residuated lattice](../../../code/structures/residuated-lattice.md), and let $\mathbf{L}^\bowtie$ be the [twist-product](../../../code/structures/twist-product.md) bilattice (per [twist-product construction](twist-product-construction.md)). The binary operations [twist-product fusion](../../../code/transformers/fusing-by-twist-product.md) $\odot$ and [twist-product right residual](../../../code/transformers/residuating-right-by-twist-product.md) $\Rightarrow$ on the carrier $L \times L$, defined by

$$\langle x, y \rangle \odot \langle z, v \rangle := \langle x \cdot z,\ (x \to v) \wedge (z \to y) \rangle,$$
$$\langle x, y \rangle \Rightarrow \langle z, v \rangle := \langle (x \to z) \wedge (v \to y),\ x \cdot v \rangle,$$

satisfy the **Lambek-residuation** adjunction in the [truth order](../../teaching/explanations/order-of-truth.md) $\leq_t$ of $\mathbf{L}^\bowtie$: for all $a, b, c \in L \times L$,

$$a \odot b \leq_t c \iff a \leq_t b \Rightarrow c.$$

## Definitions used

### Residuated lattice axioms

Per [residuated lattice](../../../code/structures/residuated-lattice.md), the operations $\cdot$ and $\to$ on $L$ satisfy

$$x \cdot y \leq z \iff x \leq y \to z$$

for all $x, y, z \in L$. By commutativity of $\cdot$, this is equivalent to $y \cdot x \leq z \iff x \leq y \to z$.

The lattice order $\leq$ on $L$ is the induced order from $\langle L, \vee, \wedge\rangle$: $a \leq b \iff a \wedge b = a$.

### Twist-product truth order

Per [twist-product construction](twist-product-construction.md), the truth order on $\mathbf{L}^\bowtie$ is

$$\langle p_+, p_-\rangle \leq_t \langle q_+, q_-\rangle \iff p_+ \leq q_+ \text{ and } q_- \leq p_-.$$

The first coordinate ascends with the truth order; the second descends.

## Statement (precise)

Write $a = \langle a_+, a_-\rangle$, $b = \langle b_+, b_-\rangle$, $c = \langle c_+, c_-\rangle \in L \times L$.

**(R1) LHS expansion.** $a \odot b \leq_t c$ is equivalent to the conjunction

(i) $a_+ \cdot b_+ \leq c_+$,
(ii) $a_+ \cdot c_- \leq b_-$,
(iii) $b_+ \cdot c_- \leq a_-$.

**(R2) RHS expansion.** $a \leq_t b \Rightarrow c$ is equivalent to the same conjunction (i)–(iii).

**(R3) Equivalence.** Therefore $a \odot b \leq_t c \iff a \leq_t b \Rightarrow c$.

## Proof

### Proof of (R1)

Compute $a \odot b$:

$$a \odot b = \langle a_+ \cdot b_+,\ (a_+ \to b_-) \wedge (b_+ \to a_-) \rangle.$$

By the twist-product truth order definition, $a \odot b \leq_t c$ is equivalent to

$$a_+ \cdot b_+ \leq c_+ \quad \text{and} \quad c_- \leq (a_+ \to b_-) \wedge (b_+ \to a_-).$$

The first conjunct is (i). The second conjunct is equivalent to

$$c_- \leq (a_+ \to b_-) \quad \text{and} \quad c_- \leq (b_+ \to a_-),$$

since $x \leq y \wedge z \iff x \leq y \text{ and } x \leq z$ in any meet-semilattice. By the residuation axiom (with commutativity), $c_- \leq (a_+ \to b_-) \iff a_+ \cdot c_- \leq b_-$, which is (ii); and $c_- \leq (b_+ \to a_-) \iff b_+ \cdot c_- \leq a_-$, which is (iii). $\square_{(R1)}$

### Proof of (R2)

Compute $b \Rightarrow c$:

$$b \Rightarrow c = \langle (b_+ \to c_+) \wedge (c_- \to b_-),\ b_+ \cdot c_- \rangle.$$

By the twist-product truth order definition, $a \leq_t b \Rightarrow c$ is equivalent to

$$a_+ \leq (b_+ \to c_+) \wedge (c_- \to b_-) \quad \text{and} \quad b_+ \cdot c_- \leq a_-.$$

The second conjunct is (iii). The first conjunct decomposes (by the meet-semilattice property) into

$$a_+ \leq (b_+ \to c_+) \quad \text{and} \quad a_+ \leq (c_- \to b_-).$$

By the residuation axiom (with commutativity), $a_+ \leq (b_+ \to c_+) \iff b_+ \cdot a_+ \leq c_+ \iff a_+ \cdot b_+ \leq c_+$, which is (i); and $a_+ \leq (c_- \to b_-) \iff c_- \cdot a_+ \leq b_- \iff a_+ \cdot c_- \leq b_-$, which is (ii). $\square_{(R2)}$

### Proof of (R3)

By (R1), $a \odot b \leq_t c$ iff (i) $\wedge$ (ii) $\wedge$ (iii). By (R2), $a \leq_t b \Rightarrow c$ iff (i) $\wedge$ (ii) $\wedge$ (iii). The two are equivalent. $\square$

## Discussion

The proof reduces the Lambek-residuation adjunction on $\mathbf{L}^\bowtie$ to three scalar residuation instances on $\mathbf{L}$ — one per coordinate-axis condition produced by expanding the twist-product truth order. The symmetric appearance of (ii) and (iii) reflects the cross-implication structure of $\odot$ and $\Rightarrow$: each side's positive evidence is tested against the other side's negative evidence via the residuation arrow.

Three structural facts hold automatically:

- **Monoidal unit.** The unit for $\odot$ is $\langle 1, 1\rangle$ where $1$ is the residuated-lattice top: $\langle 1, 1\rangle \odot \langle z, v\rangle = \langle 1 \cdot z, (1 \to v) \wedge (z \to 1)\rangle = \langle z, v\rangle$, using $1 \cdot z = z$, $1 \to v = v$, and $z \to 1 = 1$ (integrality).
- **$\odot$ absorber under $\leq_k$.** The element $\mathbf{f} = \langle 0, 1\rangle$ (where $0$ is the residuated-lattice bottom, if it exists) is the $\leq_t$-bottom of $\mathbf{L}^\bowtie$ and is the $\odot$-absorber on its first coordinate. The unit-vs-top-vs-absorber misalignment between $\odot$ and the lattice operations is what makes Frobenius reciprocity for $\odot$ fail at the [predication hyperdoctrine](../../../code/structures/predication-hyperdoctrine.md) level — recorded as the closing remark of that structure record.
- **Order of arguments.** The adjunction is stated as $a \odot b \leq_t c \iff a \leq_t b \Rightarrow c$, treating $b$ as the *parameter* of the residual. By commutativity of $\odot$ in the first coordinate ($a_+ \cdot b_+ = b_+ \cdot a_+$), one might expect a left-residual form $b \odot a \leq_t c \iff a \leq_t b \Rightarrow c$ as well; but $\odot$ is *not* commutative on the second coordinate, because $(a_+ \to b_-) \wedge (b_+ \to a_-)$ swaps to $(b_+ \to a_-) \wedge (a_+ \to b_-)$ which equals itself by commutativity of $\wedge$. So $\odot$ is in fact commutative on both coordinates, and the residuation is symmetric in $a, b$ as expected for the commutative case.

The Lambek-residuation framework originates with [Lambek 1958], who introduced fusion–residual pairs as the algebraic core of categorial grammar; the twist construction on bilattices is from [Ginsberg 1988]. The present claim composes the two — the twist construction inherits residuation from $\mathbf{L}$ along the truth-order axes via the cross-implication terms in $\odot$ and $\Rightarrow$.

Downstream this claim grounds the existence-and-well-definedness assertions in [twist-product-fusion](../../../code/transformers/fusing-by-twist-product.md) and [twist-product-right-residual](../../../code/transformers/residuating-right-by-twist-product.md), and is the load-bearing precondition for any claim asserting Lambek-residuation structure at higher levels of the predication-categorical apparatus — the [predication fiber algebra](../../../code/structures/predication-fiber-algebra.md), the [predication fibration](../../../code/structures/predication-fibration.md), and eventually the [predication hyperdoctrine](../../../code/structures/predication-hyperdoctrine.md).
