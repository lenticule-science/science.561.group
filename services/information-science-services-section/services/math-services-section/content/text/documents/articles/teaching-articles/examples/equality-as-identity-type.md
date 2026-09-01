---
type: example
status: current
depends-on: [identity-type, dependent-type-theory, inductive-type]
---

# Equality as the identity type

In [dependent-type-theory](../../../../glossary/terms/dependent-type-theory.md), equality $a = b$ is *not* a primitive predicate. It is a *type*: the [identity-type](../../../../glossary/terms/identity-type.md) $\mathrm{Id}_A(a, b)$, with one constructor $\mathrm{refl}_a : \mathrm{Id}_A(a, a)$. This example walks through what that means in concrete proof-development practice.

## The type and its inhabitants

For any type $A$ and elements $a, b : A$, the type $\mathrm{Id}_A(a, b)$ is the type of *proofs that $a = b$*. The only canonical inhabitant is $\mathrm{refl}_a$ — and it inhabits only the diagonal $\mathrm{Id}_A(a, a)$.

So:

- $\mathrm{refl}_3 : \mathrm{Id}_{\mathbb{N}}(3, 3)$ — by direct construction.
- $\mathrm{refl}_3 : \mathrm{Id}_{\mathbb{N}}(2 + 1, 3)$ — *also* of this type, when $2 + 1$ judgmentally equals $3$ (which it does, because addition unfolds during type checking).
- A proof of $\mathrm{Id}_{\mathbb{N}}(\mathrm{fact}(5), 120)$ is $\mathrm{refl}_{120}$ — the type checker computes both sides to $120$.

## The induction principle (J)

The eliminator for the identity type — the *path induction* principle, written J — says: to define a function on $\mathrm{Id}_A(a, b)$ for arbitrary $a, b$, it suffices to define it on the special case where $a = b$ and the proof is $\mathrm{refl}$. Symbolically:

$$
\mathrm{J} : \Pi(C : \Pi(x\,y : A).\,\mathrm{Id}_A(x, y) \to \mathrm{Type}).\,(\Pi(x : A).\,C(x, x, \mathrm{refl}_x)) \to \Pi(x\,y : A).\,\Pi(p : \mathrm{Id}_A(x, y)).\,C(x, y, p).
$$

Read informally: "to do something with an arbitrary equality proof, it suffices to know how to do it with reflexivity".

## What this enables

- *Symmetry, transitivity, congruence* — the standard equality laws — are all *derived* from J, not posited.
- *Equality is a type with structure*. The inhabitants of $\mathrm{Id}_{\mathrm{Id}}(p, q)$ are *equalities between equalities* — which in ordinary MLTT may be trivial (proof-irrelevance) or rich (in HoTT).
- *Equality computes*. A proof of $\mathrm{Id}(\mathrm{fact}(5), 120)$ produced by $\mathrm{refl}$ is checked by the kernel reducing both sides — the proof "is" the computation.

## What this exhibits

- *Why equality in type theory is more than equality in set theory*. The structure of $\mathrm{Id}$ is the entry point to Homotopy Type Theory and the [univalence-axiom](../../../../glossary/terms/univalence-axiom.md): when $A$ and $B$ are themselves *types*, the structure of $\mathrm{Id}_{\mathrm{Type}}(A, B)$ encodes what equivalences between $A$ and $B$ look like.
- *Why proof assistants treat equality syntactically*. A Lean proof of $a = b$ is a closed term of type $a = b$, type-checkable by reduction. There is no separate equality predicate to manage.
