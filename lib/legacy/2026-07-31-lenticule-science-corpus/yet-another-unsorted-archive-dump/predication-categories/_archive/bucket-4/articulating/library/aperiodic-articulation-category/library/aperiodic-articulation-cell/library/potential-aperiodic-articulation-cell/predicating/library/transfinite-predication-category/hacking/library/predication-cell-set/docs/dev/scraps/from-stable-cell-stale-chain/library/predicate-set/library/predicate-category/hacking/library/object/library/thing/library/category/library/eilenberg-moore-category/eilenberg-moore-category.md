---
name: eilenberg-moore-category
description: "The category C^T of all T-algebras for a monad T. Its objects are pairs (A, α : T(A) → A) satisfying the algebra laws; its morphisms are algebra morphisms — morphisms in C commuting with the structure maps. The categorical home of 'all the structures with T-shape'; the forgetful U : C^T → C has a left adjoint, recovering the monad."
specializing: category
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

The **Eilenberg-Moore category** $\mathcal{C}^T$ of a [monad](../functor/library/monad/monad.md) $T$ on a category $\mathcal{C}$ has [@eilenbergmoore1965; @maclane1971, Ch. VI §2]:

- **Objects:** [T-algebras](../functor/library/monad/library/algebra-for-a-monad/algebra-for-a-monad.md), i.e., pairs $(A, \alpha : T(A) \to A)$ satisfying the algebra laws.
- **Morphisms:** $(A, \alpha) \to (B, \beta)$ is a morphism $f : A \to B$ in $\mathcal{C}$ such that $\beta \circ T(f) = f \circ \alpha$ (the algebra morphism square commutes).
- **Composition and identity:** inherited from $\mathcal{C}$.

**Free-forgetful adjunction.** The forgetful functor $U^T : \mathcal{C}^T \to \mathcal{C}$ sending $(A, \alpha) \mapsto A$ has a left adjoint $F^T : \mathcal{C} \to \mathcal{C}^T$ sending $A \mapsto (T(A), \mu_A)$. The adjunction $F^T \dashv U^T$ has the original monad as $U^T \circ F^T = T$.

**Monadicity and Beck's theorem.** A functor $G : \mathcal{D} \to \mathcal{C}$ is *monadic* — meaning there exists a monad $T$ on $\mathcal{C}$ and an equivalence $\mathcal{D} \simeq \mathcal{C}^T$ over $\mathcal{C}$ — iff $G$ has a left adjoint and creates coequalizers of $G$-split parallel pairs. Beck's monadicity theorem characterizes when a "structure-forgetful" functor is exactly a Eilenberg-Moore category.

**Universal property.** $\mathcal{C}^T$ is the *terminal* category over $\mathcal{C}$ admitting a $T$-algebra structure on its objects. Equivalently, it is universal among solutions to "give me a category whose forgetful-functor-to-$\mathcal{C}$ realizes the monad $T$."

**Comparison with Kleisli.** Both [Eilenberg-Moore](../eilenberg-moore-category/eilenberg-moore-category.md) and [Kleisli](../kleisli-category/kleisli-category.md) categories arise from the same monad, but they sit at opposite extremes: Eilenberg-Moore has *all* T-algebras; Kleisli has only the *free* T-algebras (the algebras of the form $(T(A), \mu_A)$). The Kleisli category sits initially inside Eilenberg-Moore as a full subcategory.

**Examples.**

- For the list monad on Set: $\mathrm{Set}^T = \mathrm{Mon}$, the category of monoids.
- For the maybe monad on Set: $\mathrm{Set}^T = \mathrm{Set}_*$, the category of pointed sets.
- For the free-group monad on Set: $\mathrm{Set}^T = \mathrm{Grp}$, the category of groups.
