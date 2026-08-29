---
id: commutative-nuclear-square
description: "A nuclear square whose two nuclei commute: j₁∘j₂ = j₂∘j₁. Commutativity is the condition that makes the four-corner structure coherent and yields a canonical joint fixed-point projection."
defines: CommutativeNuclearSquare
---

### Definition — Commutative Nuclear Square {#commutative-nuclear-square}

A **commutative nuclear square** is a [nuclear square](nuclear-square.md) $(A, j_1, j_2)$ —
a [square](square.md) $D_1 \times D_2$ over a Heyting algebra $A$ with a
[nucleus](nucleus.md) on each of the two dyad-axes — satisfying the commutativity
condition on those nuclei.

Concretely: let $j_1 : A \to A$ and $j_2 : A \to A$ be two nuclei on the same Heyting
algebra $A$. The commutative nuclear square is the structure $(A, j_1, j_2)$ where $j_1$ governs
the $D_1$-axis and $j_2$ governs the $D_2$-axis, and the following condition holds.

#### The Commutativity Condition {#commutative-nuclear-square-commutativity}

Two nuclei $j_1, j_2$ on $A$ **commute** when
$$
j_1 \circ j_2 \;=\; j_2 \circ j_1.
$$

Commutativity is not automatic. Given two arbitrary nuclei, their composite need not be
a nucleus: in general $j_1 \circ j_2$ may fail idempotence or meet-preservation.
Commutativity is precisely the condition that guarantees the composite is well-behaved
(see [nucleus-commutation](nucleus-commutation.md)).

**Why commutativity is load-bearing.** Without commutativity, the four corners of the
square

| | $\mathrm{Fix}(j_2)$ | $A$ |
|---|---|---|
| $\mathrm{Fix}(j_1)$ | $\mathrm{Fix}(j_1) \cap \mathrm{Fix}(j_2)$ | $\mathrm{Fix}(j_1)$ |
| $A$ | $\mathrm{Fix}(j_2)$ | $A$ |

do not cohere: the inclusion $\mathrm{Fix}(j_1) \cap \mathrm{Fix}(j_2) \hookrightarrow A$
lacks a canonical projection, and the fixed-point intersection is merely a set with no
guaranteed algebraic structure. Commutativity supplies the reflection: $j_1 \circ j_2$
(which equals $j_2 \circ j_1$) is itself a nucleus, and it is the canonical projection
onto $\mathrm{Fix}(j_1) \cap \mathrm{Fix}(j_2)$.

In the primary instance in $R$, commutativity of the saturation and transfer
nuclei $\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$ is imposed as an explicit
condition on the presheaf $H$, motivated by the Diamond Lemma for history monoids but not
derived from it; see [fiber-doctrine](fiber-doctrine.md).

#### The Four Corners {#commutative-nuclear-square-corners}

A commutative nuclear square $(A, j_1, j_2)$ has four canonical sub-algebras, one at each corner of
the $D_1 \times D_2$ grid:

| | axis $D_2$ quiescent | axis $D_2$ free |
|---|---|---|
| **axis $D_1$ quiescent** | $\mathrm{Fix}(j_1) \cap \mathrm{Fix}(j_2)$ | $\mathrm{Fix}(j_1)$ |
| **axis $D_1$ free** | $\mathrm{Fix}(j_2)$ | $A$ |

The bottom-right corner $A$ is the whole algebra — no quiescence imposed. The top-left
corner $A^* := \mathrm{Fix}(j_1) \cap \mathrm{Fix}(j_2)$ is the joint fixed-point
algebra, where both nuclei have nothing left to apply. The two off-diagonal corners are
the individual fixed-point algebras.

The four corners are not independent: each is the image of the previous under a nucleus.
Moving from $A$ to $\mathrm{Fix}(j_1)$ applies $j_1$; moving to $\mathrm{Fix}(j_2)$
applies $j_2$; reaching $A^*$ applies both. This is what distinguishes a commutative
nuclear square from a bare nuclear square: in a bare nuclear square the two nuclei
impose no relationship on each other. In a commutative nuclear square, the nuclei force
a coherent gradient from the free corner to the doubly quiescent corner.

The four corners together with the nucleus maps between them form the
[nuclear quartet subalgebra](nuclear-quartet-subalgebra.md).

#### The Joint Fixed-Point Projection {#commutative-nuclear-square-joint-projection}

When $j_1$ and $j_2$ commute, define
$$
\pi \;:=\; j_1 \circ j_2 \;:\; A \longrightarrow A.
$$

**$\pi$ is a nucleus.** The three nucleus conditions are checked:

- *Extensive*: $a \leq j_2(a) \leq j_1(j_2(a)) = \pi(a)$, using extensivity of each.
- *Idempotent*: $\pi(\pi(a)) = j_1(j_2(j_1(j_2(a))))$. Using commutativity, swap
  $j_2 \circ j_1 = j_1 \circ j_2$, giving $j_1(j_1(j_2(j_2(a)))) = j_1(j_2(a)) = \pi(a)$,
  using idempotence of $j_1$ and $j_2$ separately.
- *Meet-preserving*: $\pi(a \wedge b) = j_1(j_2(a \wedge b)) = j_1(j_2(a) \wedge j_2(b))
  = j_1(j_2(a)) \wedge j_1(j_2(b)) = \pi(a) \wedge \pi(b)$, using meet-preservation
  of each nucleus.

**$\mathrm{Fix}(\pi) = A^*$.** An element $a$ satisfies $\pi(a) = a$ iff
$j_1(j_2(a)) = a$. Since $j_1$ is extensive, $j_2(a) \leq j_1(j_2(a)) = a \leq j_2(a)$,
forcing $j_2(a) = a$; and since $a = j_1(j_2(a)) = j_1(a)$, also $j_1(a) = a$. Thus
$\mathrm{Fix}(\pi) = \mathrm{Fix}(j_1) \cap \mathrm{Fix}(j_2) = A^*$.

So $\pi$ is the canonical reflection of $A$ onto its doubly quiescent sub-algebra $A^*$.
The joint fixed-point algebra $A^*$ is itself a Heyting algebra — a sub-Heyting-algebra
of $A$ — because it is the fixed-point set of a nucleus.

#### KZ-Lax Idempotence and Least Fixed Point {#commutative-nuclear-square-kz}

The KZ-monad (lax idempotent monad) condition on a nucleus $j$ is the statement that
the multiplication $j \circ j \dashv j$ is an adjunction, not an equality. Concretely,
for any $a \in A$:
$$
j(j(a)) = j(a) \qquad \text{(idempotence)}
$$
but the unit $\eta_a : a \to j(a)$ is not split by an inverse: $j$ inflates but does
not have a canonical deflation. The map $A \to \mathrm{Fix}(j)$ is a reflection, not
an equivalence. This adjoint gap — the space between $a$ and $j(a)$ — is what enables
the fixed-point set $\mathrm{Fix}(j)$ to be strictly smaller than $A$ and yet generated
from $A$.

In a commutative nuclear square $(A, j_1, j_2)$, the joint projection $\pi$ likewise satisfies
$\pi \circ \pi = \pi$ with a strict unit $a \leq \pi(a)$ for $a \notin A^*$. The
sub-algebra $A^*$ is reached from $A$ by a genuine collapse — elements are
identified (collapsed to their $\pi$-images), not merely reorganized. This collapse is
the algebraic content of self-generation: the nucleus does not merely name the
fixed-point layer, it actively generates it from below by iterating closure.

For the tower construction (see [hyperverse-tower](hyperverse-tower.md)), this matters at the universe level: the
Universe Closure operator $U_{\mathcal{H}}$ acts as a nucleus on the class of universes.
The KZ condition $U_{\mathcal{H}} \circ U_{\mathcal{H}} \dashv U_{\mathcal{H}}$ means that
the next level of the hyperverse tower $R^{(n+1)} = U_{\mathcal{H}}(R^{(n)})$ is not
isomorphic to $R^{(n)}$ but reflects it — and the colimit $\mathcal{H} = \varinjlim_n
R^{(n)}$ is the locus where this reflection stabilizes. The commutative nuclear square structure on
each fiber $(H_t, \sigma_t, \Delta_t)$ is the fiber-level instance of this same pattern:
the fixed fiber $H_t^*$ is where both nuclei have closed everything they can close,
producing the doubly quiescent layer that the tower construction lifts to the next level.

The self-generation property of the Relational Universe (see [closure-and-self-generation](closure-and-self-generation.md)) —
$\mathrm{Obj}(R) = \mathrm{Obj}(R_{\mathrm{gen}})$ — rests on the density of
representables, which is the topos-level counterpart of the same KZ-adjoint gap: the
closure $U_G$ generates all objects from atoms without collapsing to a smaller universe
than $R$ itself.

#### The Primary Instance {#commutative-nuclear-square-primary-instance}

The primary commutative nuclear square in $R$ is the fiber structure $(H_t, \sigma_t,
\Delta_t)$: the fiber Heyting algebra at each history $t$ equipped with the saturation
nucleus $\sigma_t$ and the transfer nucleus $\Delta_t$
(see [saturation-transfer-dyad](saturation-transfer-dyad.md)). The two dyad-axes are:

- The $\sigma_t$-axis: the Being pole of the saturation–transfer dyad, oriented toward
  sub-histories (the accumulated past).
- The $\Delta_t$-axis: the Becoming pole of the saturation–transfer dyad, oriented
  toward extensions (the committed future).

Their joint fixed-point $H_t^* = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$
is the fixed fiber (see [fixed-fiber](fixed-fiber.md)): the doubly quiescent layer at $t$. The joint
projection $\pi_t = \sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$ is the canonical
reflection of $H_t$ onto $H_t^*$.

The category $\mathbf{HA_{nucl}}$ (see [nuclear-heyting-algebra](nuclear-heyting-algebra.md)) is the category of such commutative nuclear squares:
its objects are triples $(A, \sigma, \Delta)$ where $\sigma, \Delta$ are commuting
nuclei on the finite Heyting algebra $A$, and its morphisms are Heyting algebra
homomorphisms preserving both nuclei.
