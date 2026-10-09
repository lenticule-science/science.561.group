---
name: terminating
description: "The target-projection functor cod : Arr(C) → C from a category's arrow category to itself — sends a morphism to its codomain object. Dual to originating. Used in every structure-record's frontmatter to encode the transformer's typed signature."
gerund: terminating
agent-noun: terminator
imperative: terminate
originating: transformer
terminating: thing
preserves:
  - identities
  - composition
title: terminating
---

Let $\mathcal{C}$ be a category. The **arrow category** $\mathrm{Arr}(\mathcal{C})$ has as objects the morphisms of $\mathcal{C}$ and as morphisms the commuting squares between them (Mac Lane 1971, ch. II §4; Awodey 2010, §1.4).

**Terminating** is the functor

$$\mathrm{cod} : \mathrm{Arr}(\mathcal{C}) \to \mathcal{C}$$

that sends a morphism $f : A \to B$ in $\mathcal{C}$ to its target object $B$. On a morphism of $\mathrm{Arr}(\mathcal{C})$, a commuting square

$$\begin{array}{ccc} A & \xrightarrow{f} & B \\ \downarrow{u} & & \downarrow{v} \\ A' & \xrightarrow{f'} & B' \end{array}$$

$\mathrm{cod}$ sends the square to the right-side arrow $v : B \to B'$ in $\mathcal{C}$.

Functoriality: $\mathrm{cod}$ preserves the identity of $f : A \to B$ in $\mathrm{Arr}(\mathcal{C})$ to $\mathrm{id}_B$ in $\mathcal{C}$, and preserves vertical composition of squares to composition in $\mathcal{C}$.

## Frontmatter usage

In the 561 OS, every transformer record encodes its typed signature by predicating its own identifier with [`originating:`](transformer-originating.md) and `terminating:`. The cell

$$(f, \text{terminating}, B)$$

records the value of $\mathrm{cod}$ on the morphism $f$: "$f$ terminates at $B$." A transformer record's frontmatter `terminating: structure` therefore declares that the transformer's codomain is the object named *structure*.

## Dual

The dual functor — sending a morphism to its source object — is [originating](transformer-originating.md), the functor $\mathrm{dom} : \mathrm{Arr}(\mathcal{C}) \to \mathcal{C}$.
