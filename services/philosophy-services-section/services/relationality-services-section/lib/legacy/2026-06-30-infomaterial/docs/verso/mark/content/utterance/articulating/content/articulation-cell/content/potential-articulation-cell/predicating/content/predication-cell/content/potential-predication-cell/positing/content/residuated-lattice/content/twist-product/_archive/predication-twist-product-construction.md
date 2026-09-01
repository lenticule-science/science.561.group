---
name: twist-product construction
description: The twist product $\mathbf{L}^\bowtie$ of an integral commutative residuated lattice $\mathbf{L}$ with itself, equipped with the coordinate-swap negation $\sim\langle a, b\rangle = \langle b, a\rangle$, is a bilattice in the sense of `code/structures/bilattice.md`. The two lattice structures, induced orders, and negation axioms are all derived from the lattice and monoid axioms of $\mathbf{L}$.
status: draft
references:
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
  - id: fitting1991
    type: article-journal
    title: Bilattices and the semantics of logic programming
    volume: 11
    issue: 2
    author:
      - literal: Fitting, Melvin
    container-title: The Journal of Logic Programming
    page: 91-116
    issued:
      - year: 1991
---

# Twist-product construction

**Claim.** Let $\mathbf{L} = \langle L, \vee, \wedge, \cdot, \to, 1 \rangle$ be an integral commutative [residuated lattice](../../../code/structures/residuated-lattice.md). The [twist product](../../../code/structures/twist-product.md) $\mathbf{L}^\bowtie$, with carrier $L \times L$ and operations

$$\langle a_+, a_- \rangle \wedge_t \langle b_+, b_- \rangle = \langle a_+ \wedge b_+,\ a_- \vee b_- \rangle$$
$$\langle a_+, a_- \rangle \vee_t \langle b_+, b_- \rangle = \langle a_+ \vee b_+,\ a_- \wedge b_- \rangle$$
$$\langle a_+, a_- \rangle \wedge_k \langle b_+, b_- \rangle = \langle a_+ \wedge b_+,\ a_- \wedge b_- \rangle$$
$$\langle a_+, a_- \rangle \vee_k \langle b_+, b_- \rangle = \langle a_+ \vee b_+,\ a_- \vee b_- \rangle$$

and coordinate-swap [negation](../../../code/transformers/negating.md) $\sim\langle a, b\rangle = \langle b, a\rangle$, is a [bilattice](../../../code/structures/bilattice.md).

## Definitions used

The definitions are stated from records that already hold in the substrate.

### Integral commutative residuated lattice

Per [residuated lattice](../../../code/structures/residuated-lattice.md): $\mathbf{L} = \langle L, \vee, \wedge, \cdot, \to, 1 \rangle$ where $\langle L, \vee, \wedge \rangle$ is a lattice, $\langle L, \cdot, 1 \rangle$ is a commutative monoid, and $x \cdot y \leq z \iff x \leq y \to z$. Integral: $1$ is the lattice top.

The lattice $\langle L, \vee, \wedge \rangle$ induces a partial order $\leq$ on $L$ in the standard way: $a \leq b \iff a \wedge b = a \iff a \vee b = b$.

### Pre-bilattice

Per [pre-bilattice](../../../code/structures/pre-bilattice.md): an algebra $\langle B, \wedge_t, \vee_t, \wedge_k, \vee_k\rangle$ in which both $\langle B, \wedge_t, \vee_t\rangle$ and $\langle B, \wedge_k, \vee_k\rangle$ are lattices.

### Bilattice

Per [bilattice](../../../code/structures/bilattice.md): a pre-bilattice equipped with a unary negation $\sim$ satisfying

- $a \leq_t b \Rightarrow \sim b \leq_t \sim a$ (antitone in $\leq_t$),
- $a \leq_k b \Rightarrow \sim a \leq_k \sim b$ (monotone in $\leq_k$),
- $\sim \sim a = a$ (involutive).

## Statement (precise)

Let $B := L \times L$ with operations $\wedge_t, \vee_t, \wedge_k, \vee_k$ defined componentwise as above. Let $\sim : B \to B$ be coordinate swap, $\sim\langle a, b\rangle = \langle b, a\rangle$.

**(P1)** $\langle B, \wedge_t, \vee_t\rangle$ is a lattice.

**(P2)** $\langle B, \wedge_k, \vee_k\rangle$ is a lattice.

By (P1) and (P2), $\langle B, \wedge_t, \vee_t, \wedge_k, \vee_k\rangle$ is a pre-bilattice. Its induced orders are

$$\langle a_+, a_-\rangle \leq_t \langle b_+, b_-\rangle \iff a_+ \leq b_+ \text{ and } b_- \leq a_-,$$
$$\langle a_+, a_-\rangle \leq_k \langle b_+, b_-\rangle \iff a_+ \leq b_+ \text{ and } a_- \leq b_-.$$

**(P3)** $\sim$ is antitone in $\leq_t$: $\langle a_+, a_-\rangle \leq_t \langle b_+, b_-\rangle$ implies $\sim\langle b_+, b_-\rangle \leq_t \sim\langle a_+, a_-\rangle$.

**(P4)** $\sim$ is monotone in $\leq_k$: $\langle a_+, a_-\rangle \leq_k \langle b_+, b_-\rangle$ implies $\sim\langle a_+, a_-\rangle \leq_k \sim\langle b_+, b_-\rangle$.

**(P5)** $\sim$ is involutive: $\sim \sim \langle a, b\rangle = \langle a, b\rangle$.

By (P1)–(P5), $\mathbf{L}^\bowtie = \langle B, \wedge_t, \vee_t, \wedge_k, \vee_k, \sim\rangle$ is a bilattice.

## Proof

### Proof of (P1)

The operations $\wedge_t$ and $\vee_t$ on $B = L \times L$ are defined componentwise: $\wedge_t$ uses $\wedge$ on the first coordinate and $\vee$ on the second; $\vee_t$ uses $\vee$ on the first coordinate and $\wedge$ on the second. To show $\langle B, \wedge_t, \vee_t\rangle$ is a lattice, the lattice axioms (commutativity, associativity, absorption, idempotence) must hold for both $\wedge_t$ and $\vee_t$, and the two must absorb each other.

**Commutativity.** $\langle a_+, a_-\rangle \wedge_t \langle b_+, b_-\rangle = \langle a_+ \wedge b_+, a_- \vee b_-\rangle = \langle b_+ \wedge a_+, b_- \vee a_-\rangle = \langle b_+, b_-\rangle \wedge_t \langle a_+, a_-\rangle$, using commutativity of $\wedge$ and $\vee$ on $L$. The argument for $\vee_t$ is symmetric.

**Associativity.** $(\langle a_+, a_-\rangle \wedge_t \langle b_+, b_-\rangle) \wedge_t \langle c_+, c_-\rangle = \langle (a_+ \wedge b_+) \wedge c_+, (a_- \vee b_-) \vee c_-\rangle = \langle a_+ \wedge (b_+ \wedge c_+), a_- \vee (b_- \vee c_-)\rangle = \langle a_+, a_-\rangle \wedge_t (\langle b_+, b_-\rangle \wedge_t \langle c_+, c_-\rangle)$, using associativity of $\wedge$ and $\vee$ on $L$. The argument for $\vee_t$ is symmetric.

**Absorption.** $\langle a_+, a_-\rangle \wedge_t (\langle a_+, a_-\rangle \vee_t \langle b_+, b_-\rangle) = \langle a_+, a_-\rangle \wedge_t \langle a_+ \vee b_+, a_- \wedge b_-\rangle = \langle a_+ \wedge (a_+ \vee b_+), a_- \vee (a_- \wedge b_-)\rangle = \langle a_+, a_-\rangle$, using the lattice absorption laws of $\mathbf{L}$ in each component. The dual absorption holds by the same argument.

**Idempotence.** $\langle a_+, a_-\rangle \wedge_t \langle a_+, a_-\rangle = \langle a_+ \wedge a_+, a_- \vee a_-\rangle = \langle a_+, a_-\rangle$, using idempotence of $\wedge$ and $\vee$ on $L$. The argument for $\vee_t$ is symmetric.

Therefore $\langle B, \wedge_t, \vee_t\rangle$ is a lattice. The induced order

$$\langle a_+, a_-\rangle \leq_t \langle b_+, b_-\rangle \iff \langle a_+, a_-\rangle \wedge_t \langle b_+, b_-\rangle = \langle a_+, a_-\rangle$$

expands componentwise to $a_+ \wedge b_+ = a_+$ and $a_- \vee b_- = a_-$, equivalently $a_+ \leq b_+$ and $b_- \leq a_-$. $\square_{(P1)}$

### Proof of (P2)

The operations $\wedge_k$ and $\vee_k$ are defined componentwise with $\wedge$ on both first and second coordinates (for $\wedge_k$) and $\vee$ on both (for $\vee_k$). Each lattice axiom on $\langle B, \wedge_k, \vee_k\rangle$ reduces to the corresponding axiom on $\mathbf{L}$ applied independently to each coordinate. The proofs mirror (P1), substituting $\vee$ for the second-coordinate $\vee$ in $\wedge_t$ (since $\wedge_k$'s second coordinate is $\wedge$, not $\vee$) and adjusting throughout. The induced order

$$\langle a_+, a_-\rangle \leq_k \langle b_+, b_-\rangle \iff \langle a_+, a_-\rangle \wedge_k \langle b_+, b_-\rangle = \langle a_+, a_-\rangle$$

expands to $a_+ \wedge b_+ = a_+$ and $a_- \wedge b_- = a_-$, equivalently $a_+ \leq b_+$ and $a_- \leq b_-$. $\square_{(P2)}$

### Proof of (P3)

Assume $\langle a_+, a_-\rangle \leq_t \langle b_+, b_-\rangle$, i.e. $a_+ \leq b_+$ and $b_- \leq a_-$. Then

$$\sim\langle b_+, b_-\rangle = \langle b_-, b_+\rangle, \quad \sim\langle a_+, a_-\rangle = \langle a_-, a_+\rangle.$$

We must show $\langle b_-, b_+\rangle \leq_t \langle a_-, a_+\rangle$, i.e. $b_- \leq a_-$ and $a_+ \leq b_+$. Both hold by hypothesis. $\square_{(P3)}$

### Proof of (P4)

Assume $\langle a_+, a_-\rangle \leq_k \langle b_+, b_-\rangle$, i.e. $a_+ \leq b_+$ and $a_- \leq b_-$. Then

$$\sim\langle a_+, a_-\rangle = \langle a_-, a_+\rangle, \quad \sim\langle b_+, b_-\rangle = \langle b_-, b_+\rangle.$$

We must show $\langle a_-, a_+\rangle \leq_k \langle b_-, b_+\rangle$, i.e. $a_- \leq b_-$ and $a_+ \leq b_+$. Both hold by hypothesis. $\square_{(P4)}$

### Proof of (P5)

$\sim \sim \langle a, b\rangle = \sim\langle b, a\rangle = \langle a, b\rangle$ by definition of $\sim$ applied twice. $\square_{(P5)}$

By (P1)–(P5), $\mathbf{L}^\bowtie$ is a bilattice. $\square$

## Discussion

The proof is fully internal to the residuated lattice axioms — every step reduces to lattice axioms on $\mathbf{L}$ applied componentwise. The integrality of $\mathbf{L}$ (existence of a top $1$) and the residuation structure ($\cdot, \to$) are not used in establishing the bilattice property; they are required by the downstream [twist-product residuation](twist-product-residuation.md) claim, which constructs the Lambek-residuation adjoint pair on $\mathbf{L}^\bowtie$.

The asymmetry between $\leq_t$ and $\leq_k$ is structural to the twist construction: in $\leq_t$ the second coordinate is *flipped* (positive evidence ascends, negative evidence descends together with truth), while in $\leq_k$ both coordinates ascend together (knowledge accumulates symmetrically over positive and negative). This is the geometric content of the twist.

Coordinate-swap negation is the involution that makes the truth order *self-dual* under $\sim$ while preserving the knowledge order. The proofs of (P3) and (P4) reduce to inspection of the coordinate-swap because the induced orders are already in coordinate-pair form.

The construction was introduced by [Ginsberg 1988] for the case where $\mathbf{L}$ is a distributive lattice; [Fitting 1991] applied it to the development of bilattice semantics for logic programming. The present claim extends the construction trivially to integral commutative residuated lattices — the lattice structure of $\mathbf{L}$ is what the bilattice proof leans on, and a residuated lattice's underlying lattice satisfies the same axioms used here.
