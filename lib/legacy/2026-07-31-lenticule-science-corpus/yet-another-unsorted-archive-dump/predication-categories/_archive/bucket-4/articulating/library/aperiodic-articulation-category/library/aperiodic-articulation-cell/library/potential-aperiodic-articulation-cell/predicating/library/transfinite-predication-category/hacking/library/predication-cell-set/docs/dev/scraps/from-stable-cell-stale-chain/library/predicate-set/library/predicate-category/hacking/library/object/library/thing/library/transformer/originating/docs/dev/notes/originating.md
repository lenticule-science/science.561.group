---
name: originating
description: The source-projection functor from the arrow category to its base category — sends a morphism to its domain object.
gerund: originating
agent-noun: originator
imperative: originate
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
---

Let $\mathcal{C}$ be a category. The **arrow category** $\mathrm{Arr}(\mathcal{C})$ has as objects the morphisms of $\mathcal{C}$ and as morphisms the commuting squares between them [@maclane1971, ch. II §4; @awodey2010, §1.4].

**Originating** is the functor $\mathrm{dom} : \mathrm{Arr}(\mathcal{C}) \to \mathcal{C}$ that sends a morphism $f : A \to B$ in $\mathcal{C}$ — that is, an object of $\mathrm{Arr}(\mathcal{C})$ — to its source object $A$. On a morphism of $\mathrm{Arr}(\mathcal{C})$, a commuting square
$$\begin{array}{ccc} A & \xrightarrow{f} & B \\ \downarrow{u} & & \downarrow{v} \\ A' & \xrightarrow{f'} & B' \end{array}$$
$\mathrm{dom}$ sends the square to the left-side arrow $u : A \to A'$ in $\mathcal{C}$.

Functoriality: $\mathrm{dom}$ preserves the identity of $f : A \to B$ in $\mathrm{Arr}(\mathcal{C})$ (the square $A \xrightarrow{\mathrm{id}_A} A$ / $B \xrightarrow{\mathrm{id}_B} B$) to $\mathrm{id}_A$ in $\mathcal{C}$, and preserves vertical composition of squares to composition in $\mathcal{C}$.

The cell $(f, \text{originating}, A)$ records the value of $\mathrm{dom}$ on the morphism $f$. Reading: "$f$ originates at $A$."

The dual functor — sending a morphism to its target object — is [terminating](terminating.md), the functor $\mathrm{cod} : \mathrm{Arr}(\mathcal{C}) \to \mathcal{C}$.
