---
name: originating
description: The source-projection functor dom : Arr(C) → C from a category's arrow category to itself — sends a morphism to its domain object. One of two universal arrow-category projections (the other is terminating). Used in every structure-record's frontmatter to encode the transformer's typed signature.
gerund: originating
agent-noun: originator
imperative: originate
originating: transformer
terminating: thing
preserves:
  - identities
  - composition
---

Let $\mathcal{C}$ be a category. The **arrow category** $\mathrm{Arr}(\mathcal{C})$ has as objects the morphisms of $\mathcal{C}$ and as morphisms the commuting squares between them (Mac Lane 1971, ch. II §4; Awodey 2010, §1.4).

**Originating** is the functor

$$\mathrm{dom} : \mathrm{Arr}(\mathcal{C}) \to \mathcal{C}$$

that sends a morphism $f : A \to B$ in $\mathcal{C}$ — that is, an object of $\mathrm{Arr}(\mathcal{C})$ — to its source object $A$. On a morphism of $\mathrm{Arr}(\mathcal{C})$, a commuting square

$$\begin{array}{ccc} A & \xrightarrow{f} & B \\ \downarrow{u} & & \downarrow{v} \\ A' & \xrightarrow{f'} & B' \end{array}$$

$\mathrm{dom}$ sends the square to the left-side arrow $u : A \to A'$ in $\mathcal{C}$.

Functoriality: $\mathrm{dom}$ preserves the identity of $f : A \to B$ in $\mathrm{Arr}(\mathcal{C})$ (the identity square with $u = \mathrm{id}_A$, $v = \mathrm{id}_B$) to $\mathrm{id}_A$ in $\mathcal{C}$, and preserves vertical composition of squares to composition in $\mathcal{C}$.

## Frontmatter usage

In the 561 OS, every transformer record encodes its typed signature by predicating its own identifier with `originating:` and [`terminating:`](../terminating/terminating.md). The cell

$$(f, \text{originating}, A)$$

records the value of $\mathrm{dom}$ on the morphism $f$: "$f$ originates at $A$." A transformer record's frontmatter `originating: structure` therefore declares that the transformer's domain is the [object](../../../../../object.md) named *structure*.

## Dual

The dual functor — sending a morphism to its target object — is [terminating](../terminating/terminating.md), the functor $\mathrm{cod} : \mathrm{Arr}(\mathcal{C}) \to \mathcal{C}$.
