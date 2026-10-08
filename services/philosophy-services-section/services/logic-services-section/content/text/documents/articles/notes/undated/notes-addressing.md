---
name: addressing
description: A partial interpretation functor from a category of name-strings to a category of objects-named — sends each name to the object it identifies, where defined.
gerund: addressing
agent-noun: addresser
imperative: address
originating: structure
terminating: structure
preserves:
  - identities
  - composition
references:
  - id: lambek-scott1986
    type: book
    title: Introduction to Higher-Order Categorical Logic
    publisher: Cambridge University Press
    location: Cambridge
    author:
      - literal: Lambek, Joachim
      - literal: Scott, Philip J.
    issued:
      - year: 1986
  - id: robinson-rosolini1988
    type: article-journal
    title: Categories of partial maps
    volume: 79
    issue: 2
    author:
      - literal: Robinson, Edmund
      - literal: Rosolini, Giuseppe
    container-title: Information and Computation
    page: 95-130
    issued:
      - year: 1988
title: addressing
---

Let $\mathcal{N}$ be a category whose objects are *name-strings* — finite sequences over some alphabet, equipped with the equality and inclusion relations of strings — and $\mathcal{O}$ a category whose objects are entities that names may refer to. An **addressing** of $\mathcal{O}$ by $\mathcal{N}$ is a partial functor
$$\alpha : \mathcal{N} \rightharpoonup \mathcal{O}$$
that sends each name $n \in \mathcal{N}$, where defined, to the object $\alpha(n) \in \mathcal{O}$ that $n$ identifies. Partiality is essential: not every name need resolve, and the domain of definition $\mathrm{dom}(\alpha) \subseteq \mathcal{N}$ is part of the addressing's data [@robinson-rosolini1988].

Addressing functors are not in general injective. Multiple distinct names may identify the same object: $\alpha(n_1) = \alpha(n_2)$ with $n_1 \neq n_2$. Nor are they in general surjective: an object may have no name yet, or be reachable only by composite naming. The standard properties stated of an addressing $\alpha$:

- **Faithfulness on morphisms where defined:** for any $n_1, n_2 \in \mathrm{dom}(\alpha)$, the map $\alpha_{n_1, n_2} : \mathcal{N}(n_1, n_2) \to \mathcal{O}(\alpha n_1, \alpha n_2)$ is injective. Distinct relationships between names map to distinct relationships between named objects.
- **Functoriality on the defined domain:** the restriction $\alpha|_{\mathrm{dom}(\alpha)} : \mathrm{dom}(\alpha) \to \mathcal{O}$ is a functor in the usual sense (preserves identities and composition).

The standard categorical-logic example: the interpretation functor from a syntactic category to a semantic category [@lambek-scott1986, Part II §11]. Names there are terms in the formal language; objects are their semantic referents in a chosen model. Partiality reflects that some terms denote in some models and not in others.

The cell $(N, \text{addressing}, X)$ records that the name-type $N$ is the source of an addressing functor whose image at instances of $N$ lies in instances of $X$ — equivalently, that names of type $N$ identify objects of type $X$ when they resolve. Reading: "$N$ addresses $X$."

Addressing differs from [realizing](realizing.md) in the partiality and the syntax-versus-semantics axis. A realization is total on its source and crosses an abstraction level by exhibiting a concrete witness of an abstract structure. An addressing is partial and crosses the name-versus-referent axis by interpreting a syntactic identifier as the object it points at.
