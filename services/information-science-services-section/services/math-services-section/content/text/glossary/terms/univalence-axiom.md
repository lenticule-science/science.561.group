---
term-kind: axiom
status: stated
depends-on: [identity-type, universe, dependent-type-theory]
aliases:
  - Univalence axiom
type: axiom
---

# Univalence axiom

For any two types $A, B : \mathrm{Type}_i$, the canonical map

$$
(A =_{\mathrm{Type}_i} B) \;\longrightarrow\; (A \simeq B)
$$

from [identity-type](./identity-type.md) inhabitants between $A$ and $B$ to *type equivalences* between them is itself an equivalence.

## Statement

In words: *equality of types is the same as equivalence of types*. The [identity type](./identity-type.md) at the [universe](./universe.md) level is fully determined by the equivalence structure on its inhabitants.

## Status: axiom

Univalence is *stated as an axiom* in book-style Homotopy Type Theory ([Univalent Foundations Program 2013](../../documents/articles/bibliographies/univalent-foundations2013.md)) — it cannot be derived from the standard MLTT rules, but adding it preserves consistency: the *simplicial-set model* (Voevodsky, formalised in cubical type theory) gives a model of MLTT in which univalence holds. Cubical type theory promotes univalence to a *theorem* by changing the [identity-type](./identity-type.md) into an interval-based equality whose inhabitants are paths.

## Consequences

- *Function extensionality*: pointwise-equal functions are equal. (Provable from univalence; not provable from bare MLTT.)
- *Propositional extensionality*: logically equivalent propositions are equal as types.
- *Mathematical structures transfer along equivalences*: every property invariant under isomorphism is, by univalence, invariant under equality — formalising the *structuralist* slogan that mathematics is invariant under isomorphism.

## Remarks

Univalence is the central addition of HoTT to plain MLTT. It changes the meaning of equality at the universe level — from intensional MLTT identity to homotopical equivalence — while leaving the rest of the theory intact. The choice between *book HoTT* (univalence as axiom) and *cubical HoTT* (univalence as derived theorem with computational content) is the subject of [questions/cubical-vs-book-hott](../../documents/articles/research-articles/questions/cubical-vs-book-hott.md). Reference: [Univalent Foundations Program 2013](../../documents/articles/bibliographies/univalent-foundations2013.md) Ch. 2.
