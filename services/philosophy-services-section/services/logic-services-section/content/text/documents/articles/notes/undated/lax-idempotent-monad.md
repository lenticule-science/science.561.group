---
name: lax-idempotent-monad
description: "A 2-monad T whose multiplication μ : T² ⇒ T is left adjoint to the unit-precomposition T(η) : T ⇒ T². Also called a KZ-monad after Kock and Zöberlein. KZ-monads characterize 'free completion' constructions — adding limits, colimits, or other universal properties. The closure-2-monad referenced in the legacy 561 corpus is a KZ-monad."
specializing: monad
references:
  - id: kock1995
    type: article-journal
    title: Monads for which structures are adjoint to units
    volume: 104
    issue: 1
    author:
      - literal: Kock, Anders
    container-title: Journal of Pure and Applied Algebra
    page: 41-59
    issued:
      - year: 1995
  - id: zoberlein1976
    type: article-journal
    title: Doctrines on 2-categories
    volume: 148
    issue: 3
    author:
      - literal: Zöberlein, Volker
    container-title: Mathematische Zeitschrift
    page: 267-279
    issued:
      - year: 1976
title: lax-idempotent-monad
---

A **lax-idempotent monad** (also called a **KZ-monad** after Kock and Zöberlein, or a **doctrine** in the 2-categorical sense) is a 2-monad $T = (T, \eta, \mu)$ on a 2-category $\mathcal{C}$ such that the multiplication $\mu : T^2 \Rightarrow T$ is *left adjoint* to the precomposition $T(\eta) : T \Rightarrow T^2$ [@kock1995; @zoberlein1976]:

$$\mu \dashv T(\eta)$$

with $\mu \circ T(\eta) = \mathrm{id}_T$ as the unit of the adjunction.

The adjunction $\mu \dashv T(\eta)$ encodes a "lax" form of idempotence: an idempotent monad has $\mu$ as an isomorphism, but a lax-idempotent monad has the weaker condition that $\mu$ is left adjoint to a canonical companion.

**KZ-monads characterize free completion.** The pattern is: a KZ-monad $T$ on a 2-category $\mathcal{C}$ presents an "adding-X-completion" operation, where T-algebras are exactly the objects of $\mathcal{C}$ that already have X. Examples:

- The **finite-coproduct completion** monad on Cat: T-algebras are categories with finite coproducts; the structure morphism witnesses how to compute them.
- The **idempotent-completion** monad on Cat: T-algebras are idempotent-complete categories.
- The **filtered-colimit completion** Ind: T-algebras are categories with filtered colimits.
- The **closure-2-monad** in the 561 corpus is the KZ-monad whose algebras are closed under the closure operator $\mathrm{Cl}$.

The 561 closure operator is monotone, inflationary, and idempotent. In poset categories these properties exactly characterize a monad; in 2-categorical settings the "idempotent" piece becomes "lax-idempotent" — the same content but as a 2-categorical adjunction rather than a strict equality. The legacy `code/transformers/closure-2-monad.md` reference names this 2-categorical structure; the lax-idempotent-monad record is its categorical home.

**Recognition.** A 2-monad is lax-idempotent iff every object has at most one $T$-algebra structure, and that structure (when it exists) is determined uniquely by the action. This is the 2-categorical version of "idempotent monad's algebras are essentially objects-where-the-monad-fixes-them."

**Where the witness lives.** The schema's `unit-multiplication-adjunction-witness` cell references an [adjunction](adjunction.md) instance — specifically the adjunction $\mu \dashv T(\eta)$. Recording this adjunction explicitly makes the KZ structure schema-visible.
