---
id: mathematical-object
description: "A mathematical object is an object of a category — the primitive datum from which all mathematical structure is built. In Set it is a set, in Top a topological space, in Grp a group. The choice of ambient category determines what counts as an object and what structure it carries."
mathematical-object: category
references:
  - "Mac Lane, Categories for the Working Mathematician, 2nd ed., Springer, 1998"
date-created: 2026-03-29
date-modified: 2026-03-29
params:
  ambient-category: category
output: object
ast:
  object-in-category:
    - ambient-category

aliases:
  - Mathematical Object
---

# Mathematical Object

This is the mathematical and category-theoretic sense of **object**, not the programming-language sense.

Let $\mathcal{C}$ be a category.

**Definition.** A **mathematical object** is an object of $\mathcal{C}$. It is the primitive datum: the thing that morphisms go between, that products and coproducts are taken of, that functors act on.

What "object" means depends entirely on $\mathcal{C}$:

| $\mathcal{C}$ | Objects are |
|---|---|
| $\mathbf{Set}$ | sets |
| $\mathbf{Top}$ | topological spaces |
| $\mathbf{Grp}$ | groups |
| $\mathbf{Ring}$ | rings |
| $\mathbf{Vect}_k$ | vector spaces over $k$ |
| a topos $\mathcal{E}$ | generalized spaces / sheaves |
| an $(\infty,1)$-category | homotopy types with structure |

**Proposition.** An object $A$ in $\mathcal{C}$ is determined up to isomorphism by its hom-functor $\mathrm{Hom}_{\mathcal{C}}(-, A) : \mathcal{C}^{\mathrm{op}} \to \mathbf{Set}$ (Yoneda lemma). Two objects with naturally isomorphic hom-functors are isomorphic.

**Proposition.** Every mathematical object lives in at least one category. The `mathematical-object` frontmatter field on a term file names the category (or specific object within a category) that the term requires in order to be stated. If a file says `mathematical-object: topological-space`, it means: "to define this term, let $(X, \tau)$ be a topological space" — the ambient category is $\mathbf{Top}$ and the term operates on an object of $\mathbf{Top}$.

In set-theoretic foundations (ZFC), an object is a set. In type-theoretic foundations (HoTT), an object is a type. In categorical foundations, "object" is primitive — it is characterized entirely by the morphisms it participates in (Yoneda lemma).

## Open questions

- Whether the system should track the ambient category explicitly (e.g. `ambient-category: Top`) separately from the specific object within it.
