---
name: comonad
description: "An endofunctor T : C → C with counit ε : T ⇒ Id and comultiplication δ : T ⇒ T² satisfying coassociativity and counit laws. The dual of monad. Comonads formalize 'context-dependent computation' and the categorical generalization of comonoids in an endofunctor category."
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
---

A **comonad** on a category $\mathcal{C}$ is a triple $(T, \varepsilon, \delta)$ where [@maclane1971, Ch. VI; @eilenbergmoore1965]:

- $T : \mathcal{C} \to \mathcal{C}$ is an endofunctor.
- $\varepsilon : T \Rightarrow \mathrm{Id}_{\mathcal{C}}$ is the **counit**.
- $\delta : T \Rightarrow T \circ T$ is the **comultiplication**.

satisfying the dual laws to a [monad](../monad/monad.md):

- **Coassociativity:** $T\delta \circ \delta = \delta T \circ \delta$ as natural transformations $T \Rightarrow T^3$.
- **Counit:** $T\varepsilon \circ \delta = \mathrm{id}_T = \varepsilon T \circ \delta$.

**Comonads from adjunctions.** Every adjunction $F \dashv G$ gives a comonad on $\mathcal{D}$: $T = F \circ G$, with $\varepsilon$ the counit and $\delta = F \eta G$. Conversely, every comonad arises this way.

**Examples.**

- The **environment comonad** (also called *coreader*) on Set: $T(A) = E \times A$ for a fixed environment $E$. The counit projects $\varepsilon_{E \times A}(e, a) = a$; the comultiplication duplicates the environment $\delta_{E \times A}(e, a) = (e, (e, a))$.
- The **stream comonad** on Set: $T(A) = $ infinite streams of $A$. The counit takes the head; the comultiplication produces a stream of suffixes.
- The **interior operator** on a topological space's open-set lattice — taking the largest open subset — is a comonad on the open-set poset.

**Algebras and coalgebras.** A T-algebra of a monad is dual to a T-coalgebra of a comonad: $\alpha : A \to T(A)$ satisfying counit and comultiplication compatibilities. The category of T-coalgebras is the dual of the Eilenberg-Moore category.

**Closure vs interior.** In a poset viewed as a category, monads are exactly closure operators (monotone, inflationary, idempotent), and comonads are exactly interior operators (monotone, deflationary, idempotent). The duality is exact.
