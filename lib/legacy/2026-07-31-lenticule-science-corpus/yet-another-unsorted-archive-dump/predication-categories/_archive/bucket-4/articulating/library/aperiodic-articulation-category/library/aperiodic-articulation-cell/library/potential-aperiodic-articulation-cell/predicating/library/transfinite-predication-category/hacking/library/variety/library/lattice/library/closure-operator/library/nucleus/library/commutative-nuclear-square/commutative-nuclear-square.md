---
name: commutative-nuclear-square
description: "A Heyting algebra A equipped with two commuting nuclei (j_1, j_2): j_1 ∘ j_2 = j_2 ∘ j_1. Commutativity makes π = j_1 ∘ j_2 a nucleus with Fix(π) = Fix(j_1) ∩ Fix(j_2). The four corners (A, Fix(j_1), Fix(j_2), A*) form a 2×2 commuting square of Heyting sub-algebras."
specializing: nucleus
carrier: "Heyting algebra A"
operations: "two nuclei j_1, j_2 with j_1 ∘ j_2 = j_2 ∘ j_1"
axioms:
  - each j_i is a nucleus (extensive, idempotent, meet-preserving)
  - j_1 and j_2 commute
---

A **commutative nuclear square** is a Heyting algebra $A$ equipped with two [nuclei](../../nucleus.md) $j_1, j_2 : A \to A$ satisfying

$$
j_1 \circ j_2 \;=\; j_2 \circ j_1.
$$

Notation: $(A, j_1, j_2)$. The structure has two dyad-axes — one per nucleus — and a coherent four-corner structure that bare (non-commuting) nuclear squares lack.

## The commutativity condition

Given two arbitrary nuclei on $A$, their composite $j_1 \circ j_2$ need not be a nucleus: it may fail idempotence or meet-preservation. Commutativity is precisely the condition that guarantees the composite is well-behaved.

When $j_1$ and $j_2$ commute, the four corners

|                        | $D_2$ quiescent           | $D_2$ free        |
|------------------------|---------------------------|-------------------|
| **$D_1$ quiescent**    | $\mathrm{Fix}(j_1) \cap \mathrm{Fix}(j_2)$ | $\mathrm{Fix}(j_1)$ |
| **$D_1$ free**         | $\mathrm{Fix}(j_2)$       | $A$               |

cohere as a commuting square of Heyting sub-algebras, each inclusion a Heyting homomorphism with left adjoint given by the appropriate nucleus.

## The joint fixed-point projection

When $j_1$ and $j_2$ commute, define

$$
\pi \;:=\; j_1 \circ j_2 \;:\; A \to A.
$$

**$\pi$ is a nucleus.** Three conditions check directly:

- *Extensive*: $a \leq j_2(a) \leq j_1(j_2(a)) = \pi(a)$, using extensivity of each.
- *Idempotent*: $\pi(\pi(a)) = j_1(j_2(j_1(j_2(a))))$. By commutativity swap $j_2 \circ j_1 = j_1 \circ j_2$, giving $j_1(j_1(j_2(j_2(a)))) = j_1(j_2(a)) = \pi(a)$, using idempotence of each nucleus separately.
- *Meet-preserving*: $\pi(a \wedge b) = j_1(j_2(a \wedge b)) = j_1(j_2(a) \wedge j_2(b)) = j_1(j_2(a)) \wedge j_1(j_2(b)) = \pi(a) \wedge \pi(b)$, using meet-preservation of each.

**$\mathrm{Fix}(\pi) = A^* := \mathrm{Fix}(j_1) \cap \mathrm{Fix}(j_2)$.** If $\pi(a) = a$ then $j_1(j_2(a)) = a$. Since $j_1$ is extensive, $j_2(a) \leq j_1(j_2(a)) = a \leq j_2(a)$, forcing $j_2(a) = a$; then $a = j_1(j_2(a)) = j_1(a)$, so $j_1(a) = a$. The reverse inclusion is immediate.

So $\pi$ is the canonical reflection of $A$ onto its doubly quiescent sub-algebra $A^*$. The joint fixed-point algebra $A^*$ is itself a Heyting algebra — a sub-Heyting-algebra of $A$ — because it is the fixed-point set of a nucleus.

## The four corners

The four sub-algebras $(A, \mathrm{Fix}(j_1), \mathrm{Fix}(j_2), A^*)$ are not independent: each is the image of the previous under a nucleus. Moving from $A$ to $\mathrm{Fix}(j_1)$ applies $j_1$; moving to $\mathrm{Fix}(j_2)$ applies $j_2$; reaching $A^*$ applies both. The two off-diagonal corners are the individual fixed-point algebras of $j_1$ and $j_2$ alone.

The four corners together with the nucleus-arrows between them form the [nuclear quartet](../../../../../../../../../../../../../../../../../../../../../../../) — the derived four-sub-algebra structure proved out in the nuclear-quartet-subalgebra theorem.

## KZ-lax idempotence

The KZ-monad (lax idempotent monad) condition on a nucleus $j$ is that the multiplication $j \circ j \dashv j$ is an adjunction, not an equality. Concretely $j(j(a)) = j(a)$ (idempotence) but the unit $\eta_a : a \to j(a)$ has no canonical splitting — $j$ inflates but does not have a deflation. The map $A \to \mathrm{Fix}(j)$ is a reflection, not an equivalence.

The joint projection $\pi$ in a commutative nuclear square likewise satisfies $\pi \circ \pi = \pi$ with a strict unit $a \leq \pi(a)$ for $a \notin A^*$. The sub-algebra $A^*$ is reached from $A$ by genuine collapse: elements are identified (collapsed to their $\pi$-images), not merely reorganized. This collapse is the algebraic content of self-generation — the nucleus actively generates the fixed-point layer from below by iterating closure.

## The fiber instance

The fiber Heyting algebras $H_t$ over a history category $T$ form commutative nuclear squares $(H_t, \sigma_t, \Delta_t)$ where:

- $\sigma_t$ is the **saturation nucleus** (the Being-pole closure, oriented toward sub-histories — the accumulated past).
- $\Delta_t$ is the **transfer nucleus** (the Becoming-pole closure, oriented toward extensions — the committed future).
- $\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$ (commutativity) holds by construction.

The joint fixed-point $H_t^* = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ is the doubly quiescent fiber at $t$. The joint projection $\pi_t = \sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$ is the canonical reflection of $H_t$ onto $H_t^*$.

The category $\mathbf{HA}_{\mathrm{nucl}}$ has commutative nuclear squares as objects: triples $(A, j_1, j_2)$ where $j_1, j_2$ are commuting nuclei on the finite Heyting algebra $A$. Morphisms are Heyting algebra homomorphisms preserving both nuclei.
