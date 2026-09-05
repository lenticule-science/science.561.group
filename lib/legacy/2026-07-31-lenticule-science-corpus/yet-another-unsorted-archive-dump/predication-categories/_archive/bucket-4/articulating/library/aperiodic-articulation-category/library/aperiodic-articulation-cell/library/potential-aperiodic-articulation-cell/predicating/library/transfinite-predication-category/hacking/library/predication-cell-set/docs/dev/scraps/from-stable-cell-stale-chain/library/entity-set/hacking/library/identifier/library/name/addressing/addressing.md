---
name: addressing
description: A partial interpretation functor from a category of name-strings to a category of objects-named — sends each name to the object it identifies, where defined. Partiality is essential: not every name need resolve. Not in general injective (synonyms) or surjective (anonymous objects).
gerund: addressing
agent-noun: addresser
imperative: address
originating: name
terminating: object
preserves:
  - identities
  - composition
---

Let $\mathcal{N}$ be a category whose objects are *name-strings* — finite sequences over some alphabet, equipped with the equality and inclusion relations of strings — and $\mathcal{O}$ a category whose objects are entities that names may refer to. An **addressing** of $\mathcal{O}$ by $\mathcal{N}$ is a partial functor

$$\alpha : \mathcal{N} \rightharpoonup \mathcal{O}$$

that sends each name $n \in \mathcal{N}$, where defined, to the object $\alpha(n) \in \mathcal{O}$ that $n$ identifies. Partiality is essential: not every name need resolve, and the domain of definition $\mathrm{dom}(\alpha) \subseteq \mathcal{N}$ is part of the addressing's data (Robinson–Rosolini 1988).

## Non-injectivity and non-surjectivity

Addressing functors are not in general injective. Multiple distinct names may identify the same object: $\alpha(n_1) = \alpha(n_2)$ with $n_1 \neq n_2$. Nor are they in general surjective: an object may have no name yet, or be reachable only by composite naming. The standard properties stated of an addressing $\alpha$:

- **Faithfulness on morphisms where defined.** For any $n_1, n_2 \in \mathrm{dom}(\alpha)$, the map

  $$\alpha_{n_1, n_2} : \mathcal{N}(n_1, n_2) \to \mathcal{O}(\alpha n_1, \alpha n_2)$$

  is injective. Distinct relationships between names map to distinct relationships between named objects.
- **Functoriality on the defined domain.** The restriction $\alpha|_{\mathrm{dom}(\alpha)} : \mathrm{dom}(\alpha) \to \mathcal{O}$ is a functor in the usual sense — preserves identities and composition.

The standard categorical-logic example: the interpretation functor from a syntactic category to a semantic category (Lambek–Scott 1986, Part II §11). Names there are terms in the formal language; objects are their semantic referents in a chosen model. Partiality reflects that some terms denote in some models and not in others.

## Frontmatter usage

The cell

$$(N, \text{addressing}, X)$$

records that the name-type $N$ is the source of an addressing functor whose image at instances of $N$ lies in instances of $X$ — equivalently, that names of type $N$ identify objects of type $X$ when they resolve. Reading: "$N$ addresses $X$."

## Distinction from realizing

Addressing differs from [realizing](../../../../object/realizing/realizing.md) in the partiality and the syntax-versus-semantics axis. A realization is total on its source and crosses an abstraction level by exhibiting a concrete witness of an abstract structure. An addressing is partial and crosses the name-versus-referent axis by interpreting a syntactic identifier as the object it points at.
