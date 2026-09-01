---
type: theorem
status: proved
depends-on: [twist-product, bilattice, negation, conflation, klein-four-symmetry, bilattice-two-orders-duality]
see-also: [four-bilattice, internal-z2-gauge, bilattice-klein-four-symmetry, conflation-strong-mld, strong-mld-via-composed-duality]
---

# Dihedral symmetry on de Morgan twist-products

The order-swap involution $\sigma$ extends canonically from $\mathbf{FOUR}$ to any twist-product $\mathbf L \otimes \mathbf L$ over a de Morgan algebra $\mathbf L$, and the [Klein-four group](teaching/explanations/klein-four-symmetry.md) $K_4 = \langle \sim, - \rangle$ together with $\sigma$ generates the **dihedral group** $D_4$ of order 8 — the symmetry group of the square. The action is canonical: it depends only on the de Morgan structure of $\mathbf L$ and the standard twist-product structure, not on any choice of basis or labeling.

This identifies predication categories' [$G_8$ extended group](bilattice-two-orders-duality.md) as $G_8 \cong D_4$, and lifts it from $\mathbf{FOUR}$ to all symmetric distributive bilattices with internal negation.

## Setup

A **de Morgan algebra** is a bounded distributive lattice $(\mathbf L, \wedge, \vee, \bot_L, \top_L)$ equipped with an involutive order-reversing automorphism $\neg_L : \mathbf L \to \mathbf L$ — i.e., $\neg_L \neg_L a = a$ and $a \leq b \Rightarrow \neg_L b \leq \neg_L a$. The Boolean lattice $\mathbf 2 = \{0, 1\}$ with $\neg 0 = 1, \neg 1 = 0$ is the smallest example.

For any de Morgan algebra $\mathbf L$, the [twist-product](../objects/twist-product.md) $\mathbf L^\bowtie = \mathbf L \otimes \mathbf L$ is a distributive bilattice equipped with the standard [negation](../morphisms/negation.md) $\sim\langle a, b\rangle = \langle b, a\rangle$ (coordinate swap), and admits the [conflation](../morphisms/conflation.md) $-\langle a, b\rangle = \langle \neg_L b, \neg_L a\rangle$ (coordinate-complemented swap). Define additionally the **order-swap involution**

$$\sigma : \mathbf L^\bowtie \to \mathbf L^\bowtie, \qquad \sigma\langle a, b\rangle := \langle a,\, \neg_L b\rangle.$$

For $\mathbf L = \mathbf 2$, this $\sigma$ on $\mathbf{FOUR} = \mathbf 2^\bowtie$ is exactly the order-swap of [bilattice two-orders duality](bilattice-two-orders-duality.md): $\sigma(\bot) = \mathbf f$, $\sigma(\mathbf f) = \bot$, $\sigma(\mathbf t) = \top$, $\sigma(\top) = \mathbf t$.

## Statement

**Theorem (dihedral symmetry on de Morgan twist-products).** *Let $\mathbf L$ be a de Morgan algebra. On the twist-product $\mathbf L^\bowtie$:*

1. *The map $\sigma\langle a, b\rangle = \langle a, \neg_L b\rangle$ is an involution that intertwines $\leq_k$ and $\leq_t$:*
   $$\langle a_1, b_1\rangle \leq_k \langle a_2, b_2\rangle \;\;\iff\;\; \sigma\langle a_1, b_1\rangle \leq_t \sigma\langle a_2, b_2\rangle.$$

2. *Negation $\sim$ and conflation $-$ commute and generate the [Klein-four group](teaching/explanations/klein-four-symmetry.md) $K_4 = \langle \sim, -\rangle$.*

3. *Together with $\sigma$, the group generated is the dihedral group of order 8:*
   $$G_8 \;:=\; \langle \sim,\, -,\, \sigma\rangle \;\cong\; D_4.$$
   *Specifically, $\sigma\sim$ has order 4 (a "rotation" generator), and $\sigma$ is an order-2 "reflection," satisfying the standard dihedral presentation $\langle r, s : r^4 = s^2 = (rs)^2 = e\rangle$ with $r = \sigma\sim, s = \sigma$.*

4. *The action is canonical: it depends only on the de Morgan structure of $\mathbf L$ and the standard twist-product structure on $\mathbf L \otimes \mathbf L$ — no choice of basis or labeling enters.*

5. *For $\mathbf L = \mathbf 2$, the action restricts to the $G_8$-action on $\mathbf{FOUR}$ recorded in the [bilattice two-orders duality theorem](bilattice-two-orders-duality.md).*

## Proof

### Step 1: $\sigma$ is an involution that intertwines orders

*Involutive:* $\sigma\sigma\langle a, b\rangle = \sigma\langle a, \neg_L b\rangle = \langle a, \neg_L \neg_L b\rangle = \langle a, b\rangle$, using $\neg_L \neg_L = \mathrm{id}$.

*Intertwines $\leq_k$ and $\leq_t$:* From the [twist-product](../objects/twist-product.md) definitions,
$$\langle a_1, b_1\rangle \leq_k \langle a_2, b_2\rangle \iff a_1 \leq a_2 \;\wedge\; b_1 \leq b_2,$$
$$\langle a_1, b_1\rangle \leq_t \langle a_2, b_2\rangle \iff a_1 \leq a_2 \;\wedge\; b_2 \leq b_1.$$

Apply $\sigma$ to a $\leq_k$-relation:
$$\sigma\langle a_1, b_1\rangle \leq_t \sigma\langle a_2, b_2\rangle \iff \langle a_1, \neg_L b_1\rangle \leq_t \langle a_2, \neg_L b_2\rangle \iff a_1 \leq a_2 \;\wedge\; \neg_L b_2 \leq \neg_L b_1.$$

By order-reversal of $\neg_L$: $\neg_L b_2 \leq \neg_L b_1 \iff b_1 \leq b_2$. So
$$\sigma\langle a_1, b_1\rangle \leq_t \sigma\langle a_2, b_2\rangle \iff a_1 \leq a_2 \;\wedge\; b_1 \leq b_2 \iff \langle a_1, b_1\rangle \leq_k \langle a_2, b_2\rangle. \quad\checkmark$$

### Step 2: $K_4 = \langle \sim, -\rangle$ is the Klein-four group

The two involutions are:
- $\sim\langle a, b\rangle = \langle b, a\rangle$.
- $-\langle a, b\rangle = \langle \neg_L b, \neg_L a\rangle$.

Both are involutive: $\sim\sim\langle a, b\rangle = \langle a, b\rangle$ and $--\langle a, b\rangle = -\langle \neg_L b, \neg_L a\rangle = \langle \neg_L \neg_L a, \neg_L \neg_L b\rangle = \langle a, b\rangle$.

They commute:
$$\sim\circ-\langle a, b\rangle = \sim\langle \neg_L b, \neg_L a\rangle = \langle \neg_L a, \neg_L b\rangle,$$
$$-\circ\sim\langle a, b\rangle = -\langle b, a\rangle = \langle \neg_L a, \neg_L b\rangle.$$

So $\sim\circ- = -\circ\sim$, and $\langle \sim, -\rangle = \{\mathrm{id}, \sim, -, \sim-\} \cong \mathbb{Z}/2 \times \mathbb{Z}/2$. $\checkmark$

### Step 3: $G_8 \cong D_4$

We compute the eight elements of $\langle \sim, -, \sigma\rangle$ explicitly as endofunctions of $\mathbf L^\bowtie$:

| element | acts as $\langle a, b\rangle \mapsto$ |
|---|---|
| $\mathrm{id}$ | $\langle a, b\rangle$ |
| $\sim$ | $\langle b, a\rangle$ |
| $-$ | $\langle \neg_L b, \neg_L a\rangle$ |
| $\sim-$ | $\langle \neg_L a, \neg_L b\rangle$ |
| $\sigma$ | $\langle a, \neg_L b\rangle$ |
| $\sim\sigma$ | $\langle \neg_L b, a\rangle$ |
| $-\sigma$ (also $=\sim-\sigma\sim$) | $\langle b, \neg_L a\rangle$ |
| $\sim-\sigma$ | $\langle \neg_L a, b\rangle$ |

(All eight are distinct as functions — distinguishable already on the four corner elements where each coordinate is $\bot_L$ or $\top_L$.)

Compute the order of each element:

- $\mathrm{id}$: order 1.
- $\sim, -, \sigma, \sim-, \sim-\sigma$: each is involutive by direct check. For $\sim-\sigma$: $(\sim-\sigma)^2\langle a, b\rangle = \sim-\sigma\langle \neg_L a, b\rangle = \sim-\langle \neg_L a, \neg_L b\rangle = \sim\langle \neg_L \neg_L b, \neg_L \neg_L a\rangle = \sim\langle b, a\rangle = \langle a, b\rangle$. ✓ Five elements of order 2.
- $\sigma\sim$ and $\sim\sigma$: each has order 4. Compute: $(\sigma\sim)^2\langle a, b\rangle = \sigma\sim\langle b, \neg_L a\rangle$. Apply $\sim$: $\langle \neg_L a, b\rangle$. Apply $\sigma$: $\langle \neg_L a, \neg_L b\rangle = \sim-\langle a, b\rangle$. So $(\sigma\sim)^2 = \sim-$, which has order 2, hence $(\sigma\sim)^4 = \mathrm{id}$ and $\sigma\sim$ has order 4. Similarly for $\sim\sigma$ — they are inverses of each other. Two elements of order 4.

Total order distribution: $1 + 5 \cdot 2 + 2 \cdot 4 = 1 + 5 + 2 = 8$ elements with orders $\{1, 2, 2, 2, 2, 2, 4, 4\}$. This matches $D_4$ exactly: identity (order 1), 180° rotation + four reflections (5 elements of order 2), 90° and 270° rotations (2 elements of order 4).

The dihedral relations are satisfied. Take $r := \sigma\sim$ and $s := \sigma$. Then:
- $r^4 = (\sim-)^2 = \mathrm{id}$. ✓
- $s^2 = \sigma^2 = \mathrm{id}$. ✓
- $(rs)^2 = (\sigma\sim\cdot\sigma)^2$. Compute $\sigma\sim\sigma\langle a, b\rangle$: $\sigma\langle a, b\rangle = \langle a, \neg_L b\rangle$; $\sim\langle a, \neg_L b\rangle = \langle \neg_L b, a\rangle$; $\sigma\langle \neg_L b, a\rangle = \langle \neg_L b, \neg_L a\rangle = -\langle a, b\rangle$. So $\sigma\sim\sigma = -$, hence $(rs)^2 = (-)^2 = \mathrm{id}$. ✓

So $G_8$ satisfies the standard dihedral presentation $\langle r, s : r^4 = s^2 = (rs)^2 = e\rangle$, hence $G_8 \cong D_4$. $\checkmark$

### Step 4: canonicality

The construction uses only:
- The standard twist-product structure on $\mathbf L \otimes \mathbf L$.
- The de Morgan negation $\neg_L$ on $\mathbf L$.

Both are intrinsic to the data $(\mathbf L, \neg_L)$. No choice of basis, labeling, or coordinate frame enters. Any de Morgan algebra automorphism $\phi : \mathbf L \to \mathbf L$ (i.e., a bounded-lattice isomorphism commuting with $\neg_L$) lifts to an automorphism $\phi^\bowtie : \mathbf L^\bowtie \to \mathbf L^\bowtie$ via $\phi^\bowtie\langle a, b\rangle = \langle \phi a, \phi b\rangle$, and $\phi^\bowtie$ commutes with each of $\sim, -, \sigma$ — confirming the action is intrinsic to the de Morgan structure. $\checkmark$

### Step 5: specialization to $\mathbf{FOUR}$

Take $\mathbf L = \mathbf 2$. Then $\mathbf 2^\bowtie \cong \mathbf{FOUR}$ via $\bot = \langle 0, 0\rangle, \mathbf t = \langle 1, 0\rangle, \mathbf f = \langle 0, 1\rangle, \top = \langle 1, 1\rangle$. The eight elements of $G_8$ act on these four corners:

| element | $\bot \mapsto$ | $\mathbf t \mapsto$ | $\mathbf f \mapsto$ | $\top \mapsto$ |
|---|---|---|---|---|
| $\mathrm{id}$ | $\bot$ | $\mathbf t$ | $\mathbf f$ | $\top$ |
| $\sim$ | $\bot$ | $\mathbf f$ | $\mathbf t$ | $\top$ |
| $-$ | $\top$ | $\mathbf t$ | $\mathbf f$ | $\bot$ |
| $\sim-$ | $\top$ | $\mathbf f$ | $\mathbf t$ | $\bot$ |
| $\sigma$ | $\mathbf f$ | $\top$ | $\bot$ | $\mathbf t$ |
| $\sim\sigma$ | $\mathbf f$ | $\bot$ | $\top$ | $\mathbf t$ |
| $-\sigma$ | $\mathbf t$ | $\top$ | $\bot$ | $\mathbf f$ |
| $\sim-\sigma$ | $\mathbf t$ | $\bot$ | $\top$ | $\mathbf f$ |

This matches the $G_8$-action on $\mathbf{FOUR}$ described in the [bilattice two-orders duality theorem](bilattice-two-orders-duality.md). $\checkmark$

$\blacksquare$

## Consequences

### Lift of bilattice two-orders duality

The corpus's [bilattice two-orders duality theorem](bilattice-two-orders-duality.md) was stated for $\mathbf{FOUR}$. With $\sigma$ now defined on any de Morgan twist-product, the theorem's machinery (cellwise $\sigma_*$ as an auto-equivalence of predication-presheaves; $\sigma$-conjugate of $T_k$ as a $T_t$; settling and cohomology correspondences) lifts directly to predication-presheaves valued in any $\mathbf L^\bowtie$ for de Morgan $\mathbf L$. The proof's calculations transport unchanged because they use only $\sigma$-involutivity and the order-intertwining property, both established for general $\mathbf L^\bowtie$ above.

So the full corpus's "bi-fold" structure ($T_k$-theory and $T_t$-theory paired by $\sigma$-conjugation) holds beyond $\mathbf{FOUR}$ — for any de Morgan-based predication value algebra.

### Subgroup structure of $G_8$

The Klein-four subgroup $K_4 = \langle \sim, -\rangle = \{\mathrm{id}, \sim, -, \sim-\}$ is the unique normal subgroup of $D_4$ of order 4 consisting of the identity, the 180° rotation, and two perpendicular reflections — specifically, it's the subgroup of *coordinate-respecting* operations ($\sim, -$, and their composite $\sim-$ all preserve the partition of $\mathbf L^\bowtie$ into "first coordinate is $\neg_L$ of second" classes).

The other normal subgroups of $D_4$:
- Center $Z(D_4) = \{\mathrm{id}, \sim-\} \cong \mathbb{Z}/2$ — coordinatewise complement, the unique non-identity central element.
- The two "diagonal" Klein-four subgroups $\langle \sigma, \sim-\rangle$ and $\langle -\sigma, \sim-\rangle$ (each $\cong \mathbb{Z}/2 \times \mathbb{Z}/2$).
- The cyclic rotation subgroup $\langle \sigma\sim\rangle \cong \mathbb{Z}/4$.

The five subgroups of order 4 give five distinct refinement equivalence relations on settlings via orbit-type stratification (a refinement of [strong-MLD](strong-mld-via-composed-duality.md)'s $\mathbb{Z}/2$-action). The full $D_4$-orbit-type stratification is strictly finer than any of these.

### Resolution of open subquestions

This theorem resolves:

- *Sub-question 3 of the [bilattice Klein-four symmetry question](questions/bilattice-klein-four-symmetry.md)*: the categorical statement "every distributive bilattice has a canonical $\mathbb{Z}/2 \times \mathbb{Z}/2$-action coming from its two-order duality structure" is established for symmetric de Morgan-based distributive bilattices ($\mathbf L \otimes \mathbf L$ with $\mathbf L$ a de Morgan algebra), and is sharpened to a $D_4$-action when $\sigma$ is included.

- *Sub-question 1 of the [bilattice two-orders duality question](questions/bilattice-two-orders-duality.md)*, partially: the "extreme of one order = incomparable middle of the other" property holds for any twist-product $\mathbf L \otimes \mathbf L$ — the extremes of $\leq_k$ are $\{\langle \bot_L, \bot_L\rangle, \langle \top_L, \top_L\rangle\}$, which are the incomparable middles of $\leq_t$, and vice versa. So this property does *not* distinguish a sub-class of distributive bilattices; it's structural to the twist-product. The full sub-question (whether it characterizes distributive bilattices, in the sense that every structure with this property is a distributive bilattice) requires the converse, which is not addressed here.

## Open

1. **Non-symmetric distributive bilattices.** For $\mathbf L_1 \otimes \mathbf L_2$ with $\mathbf L_1 \neq \mathbf L_2$, negation $\sim$ doesn't exist (no canonical coordinate swap). Conflation $-$ requires both factors to be de Morgan algebras. $\sigma$ requires $\mathbf L_2$ to have internal negation. So the canonical action degenerates depending on which structures are present. A complete classification of "which subgroup of $D_4$ acts canonically on $\mathbf L_1 \otimes \mathbf L_2$ as a function of the de Morgan / Boolean / bare-distributive structure on each factor" would round out the picture.

2. **Beyond de Morgan.** For bilattices not arising as twist-products (e.g., the [$\mathbf{NINE}$ bilattice](questions/bilattice-two-orders-duality.md), corresponding to $\mathbf 3 \otimes \mathbf 3$ — but $\mathbf 3$ is a chain with no Boolean complement, only a Kleene-style negation), the action's structure changes. Sub-question 4 of the bilattice-two-orders-duality question is open here.

3. **$D_4$-orbit catalog on substitution settlings.** The [Klein-four self-duality on named substitutions example](../examples/klein-four-self-duality-on-named-substitutions.md) computes $K_4$-orbits on Fibonacci, Padovan, Tribonacci, Tetranacci, Thue-Morse. Extending to $D_4$-orbits — incorporating $\sigma$'s action — would be the natural follow-up empirical work.
