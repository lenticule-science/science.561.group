---
name: kleisli-category
description: "The category C_T of free T-algebras for a monad T on C. Objects are objects of C; morphisms A → B in C_T are morphisms A → T(B) in C. The categorical home of 'monadic computation' as effectful arrows. Equivalent to the full subcategory of free algebras inside the Eilenberg-Moore category."
specializing: category
references:
  - id: kleisli1965
    type: article-journal
    title: Every standard construction is induced by a pair of adjoint functors
    volume: 16
    issue: 3
    author:
      - literal: Kleisli, Heinrich
    container-title: Proceedings of the American Mathematical Society
    page: 544-546
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
title: kleisli-category
---

The **Kleisli category** $\mathcal{C}_T$ of a [monad](monad.md) $T$ on a category $\mathcal{C}$ has [@kleisli1965; @maclane1971, Ch. VI §5]:

- **Objects:** the objects of $\mathcal{C}$ (same as $\mathcal{C}$).
- **Morphisms:** $\mathrm{Hom}_{\mathcal{C}_T}(A, B) = \mathrm{Hom}_{\mathcal{C}}(A, T(B))$ — a morphism in $\mathcal{C}_T$ is a morphism in $\mathcal{C}$ whose codomain is wrapped in $T$.
- **Composition:** given $f : A \to T(B)$ and $g : B \to T(C)$ in $\mathcal{C}$ (corresponding to morphisms in $\mathcal{C}_T$), the Kleisli composite is $\mu_C \circ T(g) \circ f : A \to T(C)$.
- **Identity:** $\mathrm{id}^{\mathcal{C}_T}_A = \eta_A : A \to T(A)$ (the monad's unit).

**The Kleisli adjunction.** The Kleisli category comes with the **Kleisli adjunction** $F_T \dashv G_T$ where $F_T : \mathcal{C} \to \mathcal{C}_T$ is the identity on objects and sends $f : A \to B$ to $\eta_B \circ f : A \to T(B)$, and $G_T : \mathcal{C}_T \to \mathcal{C}$ sends $A$ to $T(A)$ and $f^* : A \to T(B)$ (a morphism in $\mathcal{C}_T$) to $\mu_B \circ T(f^*) : T(A) \to T(B)$.

The composite $G_T \circ F_T = T$ recovers the original monad.

**Kleisli vs. Eilenberg-Moore.** Both arise from the same monad; both have adjunctions whose composite is the monad. But they sit at extremes:

- The **Kleisli** $\mathcal{C}_T$ is the *initial* category in this sense — embedded as the full subcategory of *free* T-algebras in $\mathcal{C}^T$. Objects are unrestricted, but morphisms are constrained.
- The **Eilenberg-Moore** $\mathcal{C}^T$ is the *terminal* category — contains *all* T-algebras, not just free ones. Both objects and morphisms carry the algebra structure explicitly.

Every category over $\mathcal{C}$ realizing the monad $T$ sits between $\mathcal{C}_T$ and $\mathcal{C}^T$ as a "thickening" of free algebras toward all algebras.

**Monads in functional programming.** Monads in programming languages like Haskell are interpreted via their Kleisli category. The `>>=` (bind) operator is Kleisli composition; `return` is the unit. A function `A -> M B` (where `M` is a monad) is a morphism in the Kleisli category of $M$.

**Examples.**

- For the list monad: morphisms in the Kleisli category are functions $A \to [B]$ (list of $B$). Kleisli composition is "do the first computation, then map the second over each result and concatenate."
- For the maybe monad: morphisms are partial functions (or functions $A \to B \cup \{*\}$).
- For the continuation monad: morphisms are continuation-passing-style functions.
