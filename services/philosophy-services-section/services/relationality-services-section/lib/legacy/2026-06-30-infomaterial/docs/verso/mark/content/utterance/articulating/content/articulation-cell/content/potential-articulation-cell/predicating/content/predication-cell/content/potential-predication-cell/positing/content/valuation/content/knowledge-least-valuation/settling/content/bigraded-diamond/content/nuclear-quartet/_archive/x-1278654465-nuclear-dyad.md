---
name: nuclear-dyad
description: "A Heyting algebra equipped with a single nucleus, producing two poles — the free carrier and the quiescent sub-algebra of fixed points — connected by an adjoint reflection."
specializing: nucleus
carrier: "Heyting algebra A"
operations: "one nucleus j : A → A"
axioms:
  - j is a nucleus (extensive, idempotent, meet-preserving)
---

A **nuclear dyad** is a Heyting algebra $A$ equipped with a single [nucleus](../../nucleus.md) $j : A \to A$. The nucleus produces two distinct mathematical objects:

$$
(A,\; \mathrm{Fix}(j))
$$

— the free algebra $A$ and the quiescent sub-algebra $\mathrm{Fix}(j)$. These are the two poles of the dyad.

## The two poles

| Pole       | Object             | Status                                          |
|------------|--------------------|-------------------------------------------------|
| **Free**   | $A$                | All propositions — the nucleus still has work to do |
| **Quiescent** | $\mathrm{Fix}(j) = \{a \in A : j(a) = a\}$ | The nucleus is trivial — it has closed everything it can close |

The free pole is the whole Heyting algebra. The quiescent pole is the sub-Heyting-algebra where $j$ acts as identity — where the closure process has completed.

## The adjoint

The nucleus $j$ is the canonical map from the free pole to the quiescent pole: the reflector $A \to \mathrm{Fix}(j)$. This map has a right adjoint, the inclusion $\iota : \mathrm{Fix}(j) \hookrightarrow A$:

$$
j : A \;\rightleftharpoons\; \mathrm{Fix}(j) : \iota
$$

The unit is $a \leq j(a)$ (extensivity). The counit is the identity (since $j$ restricted to $\mathrm{Fix}(j)$ is the identity). The KZ-lax idempotence condition means elements not already quiescent are strictly moved upward — a genuine reflection, not a reindexing.

## Nuclear dyad vs. commutative nuclear square

A nuclear dyad has one nucleus — two poles, one adjoint. A [commutative nuclear square](../commutative-nuclear-square/commutative-nuclear-square.md) has two commuting nuclei on the same carrier — four sub-algebras (the four corners), two individual adjoint pairs, and a joint fixed-point projection $\pi = j_1 \circ j_2$. The nuclear dyad is the atomic unit; a commutative nuclear square is a pair of nuclear dyads whose quiescent poles meet at the joint fixed point $A^*$.
