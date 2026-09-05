---

title: "Nucleus"
description: "A closure operator on a Heyting algebra that preserves finite meets — the algebraic mechanism by which a sub-algebra of fixed points is canonically determined."
date-created: 2026-04-05
aliases:
  - nucleus
  - Heyting nucleus
specialization: closure
requires:
  - heyting-algebra
properties:
  - extensive
  - idempotent
  - meet-preserving
---

A **nucleus** on a [Heyting algebra](../../logic/objects/heyting-algebra.md) $A$ is an operator $j : A \to A$ satisfying three conditions:

1. **Extensive**: $a \leq j(a)$ for all $a \in A$.
2. **Idempotent**: $j(j(a)) = j(a)$ for all $a \in A$.
3. **Meet-preserving**: $j(a \wedge b) = j(a) \wedge j(b)$ for all $a, b \in A$.

The first two conditions make $j$ a [closure operator](../concepts/closure.md). The third is the condition that distinguishes a nucleus from a general closure operator: it forces the fixed-point set $\mathrm{Fix}(j) = \{a \in A : j(a) = a\}$ to inherit the full Heyting algebra structure from $A$, not merely the lattice structure.

## The fixed-point sub-algebra

The set $\mathrm{Fix}(j)$ is a Heyting sub-algebra of $A$. The inclusion $\iota : \mathrm{Fix}(j) \hookrightarrow A$ has a left adjoint given by $j$ itself:

$$
j : A \;\rightleftharpoons\; \mathrm{Fix}(j) : \iota
$$

This adjoint pair makes $\mathrm{Fix}(j)$ a reflective sub-algebra. The unit of the adjunction is the inequality $a \leq j(a)$ (extensivity). The counit is the identity, since $j$ restricted to $\mathrm{Fix}(j)$ is the identity.

The KZ-lax idempotence condition — $j \circ j = j$, but $a < j(a)$ strictly for $a \notin \mathrm{Fix}(j)$ — means this is a genuine reflection: elements not already fixed are strictly moved upward. The fixed-point set is reached by collapsing, not by reorganizing.

## Origin in locale theory

The concept originates in locale theory, where a nucleus on the frame of opens $\mathcal{O}(X)$ determines a sublocale. Each nucleus $j$ on $\mathcal{O}(X)$ identifies a quotient locale whose frame of opens is $\mathrm{Fix}(j)$. The correspondence between nuclei and sublocales is bijective: sublocales of a locale are in exact correspondence with nuclei on its frame.

## See also

- [Closure](../concepts/closure.md) — the general concept; a nucleus adds meet-preservation
- [Nuclear dyad](./nuclear-dyad.md) — a Heyting algebra equipped with one nucleus
- [Nuclear quartet](./nuclear-quartet.md) — the four sub-algebras from two commuting nuclei
- [Idempotence](../concepts/idempotence.md)
