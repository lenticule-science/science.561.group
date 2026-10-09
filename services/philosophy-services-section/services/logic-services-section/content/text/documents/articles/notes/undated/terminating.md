---
name: terminating
description: The target-projection functor from the arrow category to its base category — sends a morphism to its codomain object.
gerund: terminating
agent-noun: terminator
imperative: terminate
originating: transformer
terminating: structure
preserves:
  - identities
  - composition
references:
  - id: maclane1971
    type: book
    title: Categories for the Working Mathematician
    publisher: Springer
    location: New York
    author:
      - literal: Mac Lane, Saunders
    issued:
      - year: 1971
  - id: awodey2010
    type: book
    title: Category Theory
    edition: 2nd
    publisher: Oxford University Press
    location: Oxford
    author:
      - literal: Awodey, Steve
    issued:
      - year: 2010
title: terminating
---

Let $\mathcal{C}$ be a category. The **arrow category** $\mathrm{Arr}(\mathcal{C})$ has as objects the morphisms of $\mathcal{C}$ and as morphisms the commuting squares between them [@maclane1971, ch. II §4; @awodey2010, §1.4].

**Terminating** is the functor $\mathrm{cod} : \mathrm{Arr}(\mathcal{C}) \to \mathcal{C}$ that sends a morphism $f : A \to B$ in $\mathcal{C}$ — that is, an object of $\mathrm{Arr}(\mathcal{C})$ — to its target object $B$. On a morphism of $\mathrm{Arr}(\mathcal{C})$, a commuting square
$$\begin{array}{ccc} A & \xrightarrow{f} & B \\ \downarrow{u} & & \downarrow{v} \\ A' & \xrightarrow{f'} & B' \end{array}$$
$\mathrm{cod}$ sends the square to the right-side arrow $v : B \to B'$ in $\mathcal{C}$.

Functoriality: $\mathrm{cod}$ preserves the identity of $f : A \to B$ in $\mathrm{Arr}(\mathcal{C})$ to $\mathrm{id}_B$ in $\mathcal{C}$, and preserves vertical composition of squares to composition in $\mathcal{C}$.

The cell $(f, \text{terminating}, B)$ records the value of $\mathrm{cod}$ on the morphism $f$. Reading: "$f$ terminates at $B$."

The dual functor — sending a morphism to its source object — is [originating](originating.md), the functor $\mathrm{dom} : \mathrm{Arr}(\mathcal{C}) \to \mathcal{C}$.
