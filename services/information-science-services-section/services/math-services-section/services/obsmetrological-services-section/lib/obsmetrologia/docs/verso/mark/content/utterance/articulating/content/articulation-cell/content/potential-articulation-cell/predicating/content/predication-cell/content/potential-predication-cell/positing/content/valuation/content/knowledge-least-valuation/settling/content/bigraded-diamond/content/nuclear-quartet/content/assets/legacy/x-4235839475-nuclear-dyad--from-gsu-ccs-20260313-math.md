---

name: nuclear-dyad
description: "Phenomenon: Nuclear Dyad"
---

### Definition — Nuclear Dyad {#nuclear-dyad}

A **nuclear dyad** is a Heyting algebra $A$ equipped with a single nucleus
$j : A \to A$. The nucleus produces two actual mathematical objects:

$$
(A,\; \mathrm{Fix}(j))
$$

— the free algebra $A$ and the quiescent sub-algebra $\mathrm{Fix}(j)$. These
are the two poles. They are not labels for a way of looking at $A$; they are
two distinct sub-algebras with an adjoint relationship between them.

#### The Two Poles {#nuclear-dyad-poles}

| Pole | Object | Status |
|------|--------|--------|
| **Free** | $A$ | All propositions — the nucleus still has work to do |
| **Quiescent** | $\mathrm{Fix}(j) = \{a \in A : j(a) = a\}$ | The nucleus is trivial — it has closed everything it can close |

The free pole is the whole Heyting algebra. The quiescent pole is the
sub-Heyting-algebra where $j$ is the identity — where the closure process
has completed.

#### The Adjoint {#nuclear-dyad-adjoint}

The nucleus $j$ itself is the canonical map from the free pole to the quiescent
pole: it is the reflector $A \to \mathrm{Fix}(j)$. This map has a right adjoint,
the inclusion $\mathrm{Fix}(j) \hookrightarrow A$. The adjoint pair

$$
j : A \;\rightleftharpoons\; \mathrm{Fix}(j) : \iota
$$

(where $\iota$ is inclusion) makes the quiescent pole a reflective subcategory
of $A$. The unit of this adjunction is $a \leq j(a)$ (extensivity). The counit
is the identity (since $j$ restricted to $\mathrm{Fix}(j)$ is the identity).

The KZ-lax idempotence condition ($j \circ j = j$, but $a \leq j(a)$ strictly
for $a \notin \mathrm{Fix}(j)$) means this is a genuine reflection — elements
not already quiescent are strictly moved upward.

#### The Instances {#nuclear-dyad-instances}

Two nuclear dyads appear at every fiber $H_t$:

| Dyad | Nucleus | Free pole | Quiescent pole |
|------|---------|-----------|----------------|
| $\sigma_t$-dyad | $\sigma_t$ (saturation) | $H_t$ | $\mathrm{Fix}(\sigma_t)$ — saturation-stable propositions |
| $\Delta_t$-dyad | $\Delta_t$ (transfer) | $H_t$ | $\mathrm{Fix}(\Delta_t)$ — transfer-stable propositions |

Each is a nuclear dyad. The two together form the commutative nuclear square
([CommutativeNuclearSquare](commutative-nuclear-square.md))
$(H_t, \sigma_t, \Delta_t)$: when two nuclear dyads share the same free pole $A$
and their nuclei commute, their quiescent poles intersect to produce $A^*$.

#### Nuclear Dyad vs. Nuclear Square {#nuclear-dyad-vs-square}

A nuclear dyad has one nucleus — two poles, one adjoint. A nuclear square has
two commuting nuclei on the same carrier — four actual objects (the four corners),
two individual adjoint pairs, and a joint fixed-point projection $\pi = j_1 \circ j_2$.

The nuclear dyad is the atomic unit. A nuclear square is a pair of nuclear dyads
whose quiescent poles meet at the joint fixed-point $A^*$.

#### Nuclear Dyads Within a Nuclear Square {#nuclear-dyad-in-square}

A nuclear square $(A, j_1, j_2)$ contains four natural nuclear dyads — one for each
edge of the commuting square of the nuclear quartet ([NuclearQuartetSubalgebra](nuclear-quartet-subalgebra.md)):

| Edge | Free pole | Nucleus | Quiescent pole |
|------|-----------|---------|----------------|
| Top | $A$ | $j_1$ | $\mathrm{Fix}(j_1)$ |
| Left | $A$ | $j_2$ | $\mathrm{Fix}(j_2)$ |
| Right | $\mathrm{Fix}(j_1)$ | $j_2|_{\mathrm{Fix}(j_1)}$ | $A^*$ |
| Bottom | $\mathrm{Fix}(j_2)$ | $j_1|_{\mathrm{Fix}(j_2)}$ | $A^*$ |

There are two paths from $A$ to $A^*$: the top-right path
$A \xrightarrow{j_1} \mathrm{Fix}(j_1) \xrightarrow{j_2|} A^*$ and the left-bottom
path $A \xrightarrow{j_2} \mathrm{Fix}(j_2) \xrightarrow{j_1|} A^*$. Both equal
$\pi = j_1 \circ j_2 = j_2 \circ j_1$: commutativity is exactly the statement that
the two paths agree.

The Proposition of Nuclear Quartet Pairing (§nuclear-quartet-pairing) identifies
one canonical path as the construction order at the universe level, with the
intermediate node $\mathrm{Fix}(j_1)$ as the handshake object.
