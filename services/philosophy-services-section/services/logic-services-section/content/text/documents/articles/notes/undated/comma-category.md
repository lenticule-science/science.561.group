---
name: comma-category
description: "Given functors F : A → C and G : B → C with common target, the comma category (F ↓ G) has triples (a, b, h : F(a) → G(b)) as objects and compatible morphism pairs as arrows. Generalizes slice and coslice categories; the canonical home of universal-arrow constructions."
specializing: category
references:
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
title: comma-category
---

The **comma category** $(F \downarrow G)$ associated to two functors $F : \mathcal{A} \to \mathcal{C}$ and $G : \mathcal{B} \to \mathcal{C}$ with common target $\mathcal{C}$ has [@maclane1971, Ch. II §6; @awodey2010, §1.6]:

- **Objects:** triples $(a, b, h)$ where $a \in \mathrm{Ob}(\mathcal{A})$, $b \in \mathrm{Ob}(\mathcal{B})$, and $h : F(a) \to G(b)$ in $\mathcal{C}$.
- **Morphisms:** $(a, b, h) \to (a', b', h')$ is a pair $(\alpha : a \to a', \beta : b \to b')$ such that $h' \circ F(\alpha) = G(\beta) \circ h$ — the obvious square in $\mathcal{C}$ commutes.
- **Composition** and **identity** componentwise.

**Generalizations.** Comma categories specialize to:

- **Slice category $\mathcal{C}/A$:** take $F = \mathrm{Id}_{\mathcal{C}}$ and $G : \mathbf{1} \to \mathcal{C}$ picking $A$. Then $(F \downarrow G) = \mathcal{C}/A$ — objects are pairs $(c, h : c \to A)$.
- **Coslice category $A/\mathcal{C}$:** take $F : \mathbf{1} \to \mathcal{C}$ picking $A$ and $G = \mathrm{Id}_{\mathcal{C}}$. Then $(F \downarrow G) = A/\mathcal{C}$.
- **Arrow category $\mathcal{C}^{\to}$:** take $F = G = \mathrm{Id}_{\mathcal{C}}$. Then $(F \downarrow G) = \mathcal{C}^{\to}$ — objects are arrows in $\mathcal{C}$.

**Use cases.**

- **Universal arrows.** The notion of a universal arrow from an object $a$ to a functor $G$ is exactly an initial object in the comma category $(a \downarrow G)$. This unifies many universal-property constructions.
- **Adjoints.** $F \dashv G$ iff for every object $b$, the category $(F \downarrow b)$ has a terminal object — equivalently, the category $(b \downarrow G)$ has an initial object. Adjunctions live naturally in the comma-category framework.
- **Kan extensions.** Both left and right Kan extensions can be defined via comma categories' (co)limits.
