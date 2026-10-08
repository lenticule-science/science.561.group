---
name: monad
description: "An endofunctor T : C → C with unit η : Id ⇒ T and multiplication μ : T² ⇒ T satisfying associativity and unit laws. Monads formalize 'iterable computational effects' and are the categorical generalization of monoids in an endofunctor category."
specializing: functor
references:
  - id: eilenbergmoore1965
    type: article-journal
    title: Adjoint functors and triples
    volume: 9
    issue: 3
    author:
      - literal: Eilenberg, Samuel
      - literal: Moore, John C.
    container-title: Illinois Journal of Mathematics
    page: 381-398
    issued:
      - year: 1965
  - id: maclane1971
    type: book
    title: Categories for the Working Mathematician
    series: Graduate Texts in Mathematics
    volume: 5
    publisher: Springer-Verlag
    location: New York
    author:
      - literal: Mac Lane, Saunders
    issued:
      - year: 1971
  - id: awodey2010
    type: book
    title: Category Theory
    edition: "2"
    series: Oxford Logic Guides
    volume: 52
    publisher: Oxford University Press
    location: Oxford
    author:
      - literal: Awodey, Steve
    issued:
      - year: 2010
title: monad
---

A **monad** on a category $\mathcal{C}$ is a triple $(T, \eta, \mu)$ where [@maclane1971, Ch. VI; @eilenbergmoore1965; @awodey2010, §10]:

- $T : \mathcal{C} \to \mathcal{C}$ is an endofunctor.
- $\eta : \mathrm{Id}_{\mathcal{C}} \Rightarrow T$ is a natural transformation called the **unit**.
- $\mu : T \circ T \Rightarrow T$ is a natural transformation called the **multiplication**.

These data satisfy two coherence laws:

- **Associativity:** $\mu \circ T\mu = \mu \circ \mu T$ as natural transformations $T^3 \Rightarrow T$.
- **Unit laws:** $\mu \circ T\eta = \mathrm{id}_T = \mu \circ \eta T$.

A monad is a *monoid in the endofunctor category* $[\mathcal{C}, \mathcal{C}]$ under composition. The tensor product is functor composition; $\eta$ is the unit element; $\mu$ is the multiplication.

**Provenance — adjunctions and monads.** Every adjunction $F \dashv G$ between functors $F : \mathcal{C} \to \mathcal{D}$ and $G : \mathcal{D} \to \mathcal{C}$ gives rise to a monad on $\mathcal{C}$: $T = G \circ F$, with $\eta$ the unit of the adjunction and $\mu = G \varepsilon F$ where $\varepsilon$ is the counit. Conversely, every monad arises from some adjunction (typically the [Kleisli-category](kleisli-category.md) adjunction or the [Eilenberg-Moore-category](eilenberg-moore-category.md) adjunction).

**Examples.**

- The **identity monad** $(\mathrm{Id}, \mathrm{id}, \mathrm{id})$ — trivial structure.
- The **list monad** on Set: $T(A) = $ list of $A$'s, $\eta_A(a) = [a]$, $\mu_A$ flattens a list of lists into one list.
- The **maybe (option) monad** on Set: $T(A) = A \sqcup \{*\}$, $\eta$ wraps an element, $\mu$ collapses double-wrapping.
- The **free-group monad** on Set: $T(A) = $ free group on $A$, $\eta$ embeds generators, $\mu$ multiplies expressions.
- The **closure operator** on a preorder $\mathcal{C}$ viewed as a one-cell-per-relation category is exactly a monad on $\mathcal{C}$: the closure-2-monad cited in legacy `code/transformers/closure-2-monad.md`. The closure-operator's monotonicity, inflationarity, and idempotence are exactly the monad's covariant-functor, unit, and multiplication conditions.

**Specializations.** A monad whose multiplication $\mu$ is left adjoint to the unit-precomposition $T \eta$ is a [lax-idempotent-monad](lax-idempotent-monad.md) (KZ-monad) — the case of the 561 closure-2-monad. Idempotent monads (those where $\mu$ is an isomorphism) generalize closure operators in posets.

**Algebra of monads.** A $T$-[algebra](algebra-for-a-monad.md) is an object $A$ together with a structure morphism $\alpha : T(A) \to A$ satisfying unit and multiplication compatibilities. The category of all $T$-algebras is the [Eilenberg-Moore-category](eilenberg-moore-category.md) $\mathcal{C}^T$.
