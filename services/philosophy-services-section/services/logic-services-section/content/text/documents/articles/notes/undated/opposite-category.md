---
name: opposite-category
description: "The category C^op with the same objects as C but arrows reversed. For every morphism f : A → B in C there is f^op : B → A in C^op, and composition is reversed. Used to type contravariant functors as covariant functors from C^op."
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
title: opposite-category
---

The **opposite category** $\mathcal{C}^{\mathrm{op}}$ of a category $\mathcal{C}$ is the category with [@maclane1971, Ch. II §2; @awodey2010, §1.3]:

- $\mathrm{Ob}(\mathcal{C}^{\mathrm{op}}) = \mathrm{Ob}(\mathcal{C})$ — same objects as $\mathcal{C}$.
- For every morphism $f : A \to B$ in $\mathcal{C}$, an opposite morphism $f^{\mathrm{op}} : B \to A$ in $\mathcal{C}^{\mathrm{op}}$ — arrows reversed.
- Composition reversed: $g^{\mathrm{op}} \circ^{\mathrm{op}} f^{\mathrm{op}} = (f \circ g)^{\mathrm{op}}$ — note the order swap on the right side.

The opposite construction is an involution: $(\mathcal{C}^{\mathrm{op}})^{\mathrm{op}} = \mathcal{C}$.

**Why we need it.** Without `opposite-category` as a typed thing, contravariant functors cannot be cleanly typed. A contravariant functor $F : \mathcal{C} \to \mathcal{D}$ reverses arrows — but the category-theoretic move is to declare $F$ as a covariant functor $F : \mathcal{C}^{\mathrm{op}} \to \mathcal{D}$, with the reversal absorbed into the source category. The predication-fiber-functor `F : C^op → DBiLat(L)` is the prototypical contravariant functor in the 561 corpus; its typing requires `opposite-category`.

**Universal property of the opposite.** The opposite construction gives an isomorphism of categories $(-)^{\mathrm{op}} : \mathrm{Cat} \to \mathrm{Cat}^{\mathrm{op}}$. It interchanges limits with colimits, products with coproducts, terminal with initial, mono with epi, and right adjoints with left adjoints. Most categorical concepts come in dual pairs because of this involution.

**The opposite of an opposite.** Since $(\mathcal{C}^{\mathrm{op}})^{\mathrm{op}} = \mathcal{C}$, opposites form a $\mathbb{Z}/2$-symmetry on the category Cat. This involution distinguishes Cat from many other "structured" categories — it has a canonical non-trivial self-isomorphism (the opposite).

**Examples by category.**

- $\mathrm{Set}^{\mathrm{op}}$ — the category of sets with reversed functions. By Yoneda's theorem applied to representable presheaves, $\mathrm{Set}^{\mathrm{op}}$ embeds into the category of presheaves on Set, but is generally not equivalent to a familiar category.
- $\mathrm{Pos}^{\mathrm{op}}$ — posets with reversed order. The opposite of a poset is itself a poset, with $\leq^{\mathrm{op}}$ defined as $\geq$.
- The opposite of a group $G$ viewed as a one-object category is the opposite group $G^{\mathrm{op}}$.
