---
name: algebra-for-a-monad
description: "A T-algebra: a pair (A, α : T(A) → A) where α satisfies the unit law α ∘ η_A = id_A and the multiplication law α ∘ μ_A = α ∘ T(α). The categorical formalization of 'a T-shape with structure on A.' Algebras for a monad form the Eilenberg-Moore category C^T."
specializing: object
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
---

A **T-algebra** of a [monad](../../monad.md) $(T, \eta, \mu)$ on a category $\mathcal{C}$ is a pair $(A, \alpha)$ where $A \in \mathrm{Ob}(\mathcal{C})$ and $\alpha : T(A) \to A$ is a morphism (the *structure morphism*) satisfying [@maclane1971, Ch. VI §2; @eilenbergmoore1965]:

- **Unit law:** $\alpha \circ \eta_A = \mathrm{id}_A$.
- **Multiplication law:** $\alpha \circ \mu_A = \alpha \circ T(\alpha)$.

Intuitively, $\alpha$ "interprets" the $T$-shape on $A$: it tells you how to compute an $A$-result from $T(A)$-input. The unit law says interpreting a trivially-wrapped value gives the value back; the multiplication law says nested $T$-shapes can be collapsed coherently before or after interpretation.

**Examples.**

- For the **list monad**, a $T$-algebra is a set with a way to "fold" any list of elements into a single element. The unit law makes singleton lists fold to themselves; the multiplication law makes nested folding coherent. List-algebras for the list monad on Set are exactly **monoids**.
- For the **maybe monad**, a $T$-algebra is a pointed set — a set with a chosen default element to use when interpreting "nothing."
- For the **free-group monad** on Set, a $T$-algebra is a **group**.
- For the **identity monad**, every object has a trivial algebra structure $(\mathrm{id})$; every morphism is an algebra morphism. The category of identity-algebras is just $\mathcal{C}$.

**The free-forgetful adjunction.** The category of T-algebras [Eilenberg-Moore-category](../../../../../eilenberg-moore-category/eilenberg-moore-category.md) $\mathcal{C}^T$ comes with a forgetful functor $U : \mathcal{C}^T \to \mathcal{C}$ sending $(A, \alpha)$ to $A$. This forgetful functor has a left adjoint $F : \mathcal{C} \to \mathcal{C}^T$, the *free algebra functor*, sending each $A$ to the free $T$-algebra $(T(A), \mu_A)$. The composite $U \circ F = T$ recovers the original monad.

**Recognition theorem.** A functor $G : \mathcal{D} \to \mathcal{C}$ is monadic (i.e., $\mathcal{D}$ is equivalent to $\mathcal{C}^T$ for some monad $T$) iff $G$ has a left adjoint and creates coequalizers of $G$-split parallel pairs. This is Beck's monadicity theorem.
