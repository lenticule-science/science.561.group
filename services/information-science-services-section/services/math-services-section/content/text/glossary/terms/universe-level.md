---
term-kind: concept
class: stratification
status: current
depends-on: []
---

# Universe level

*A universe level* is a natural-number index on the cumulative hierarchy of [universes](./universe.md) $\mathrm{Type}_0 : \mathrm{Type}_1 : \mathrm{Type}_2 : \cdots$ used to stratify type theory and prevent paradox. Each $\mathrm{Type}_i$ is itself a type, but only at the next level: $\mathrm{Type}_i : \mathrm{Type}_{i+1}$.

A naïve type-of-all-types $\mathrm{Type} : \mathrm{Type}$ is inconsistent — Russell's paradox in type-theoretic form (Girard's paradox), which derives the [empty-type](./empty-type.md) from the assumption. Stratification by levels avoids this: every type sits at a definite level, and a universe quantifier $\Pi(A : \mathrm{Type}_i).\,B(A)$ lives at level $i+1$, never at level $i$.

## Position

Universe levels are the type-theoretic answer to the [size paradoxes](../../../../../science/theories/information/) of naive set theory. Most modern proof assistants (Lean, Coq, Agda) hide level annotations behind *universe polymorphism*, inferring levels and managing them implicitly; explicit level juggling is needed only when a definition must work uniformly at every level. The corresponding operator is [universe-lifting](./universe-lifting.md). Trade-offs around when to admit *impredicativity* (allowing $\mathrm{Type}_i$ to quantify over itself in restricted form, as in Coq's `Prop`) are the subject of [questions/impredicativity](../../documents/articles/research-articles/questions/impredicativity.md). Reference: [Martin-Löf 1984](../../documents/articles/bibliographies/martin-lof1984.md), [Univalent Foundations Program 2013](../../documents/articles/bibliographies/univalent-foundations2013.md) §A.2.
