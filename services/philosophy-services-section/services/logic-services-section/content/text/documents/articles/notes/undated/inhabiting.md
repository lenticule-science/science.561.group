---
name: inhabiting
description: The element-belongs-to-type morphism — sends an element of a base set to a structure-form whose signature its associated cells satisfy.
gerund: inhabiting
agent-noun: inhabiter
imperative: inhabit
originating: entity
terminating: structure
preserves:
  - identities
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
  - id: bourbaki1968
    type: book
    title: Theory of Sets
    publisher: Hermann
    location: Paris
    author:
      - literal: Bourbaki, Nicolas
    issued:
      - year: 1968
  - id: maclane1971
    type: book
    title: Categories for the Working Mathematician
    publisher: Springer
    location: New York
    author:
      - literal: Mac Lane, Saunders
    issued:
      - year: 1971
title: inhabiting
---

Let $E$ be a set, $\mathcal{P}$ a category whose objects include both elements of $E$ (as a sub-class) and structure-forms $S$ with signatures, and $\mathcal{S}$ the sub-class of $\mathcal{P}$ consisting of structure-forms. An **inhabitance** of $\mathcal{S}$ by $E$ is a partial relation
$$\mathrm{inh} \subseteq E \times \mathcal{S}$$
where $(e, S) \in \mathrm{inh}$ — written $e$ inhabits $S$ — when $e$'s cell-graph in $\mathcal{P}$ satisfies the signature of $S$: for every characterization $\sigma$ that $S$'s signature requires of an inhabitant, the predication cells incident to $e$ supply a witness of $\sigma$.

Standard categorical-logic formulation [@lambek-scott1986, Part II §11]: a structure-form $S$ is presented by a list of typing judgments and equations in a syntactic category; an interpretation in a semantic category sends each typing judgment to a morphism into $S$'s scoping object, and each equation to a commutation of such morphisms. An element $e$ inhabits $S$ when the interpretation factors through $e$'s slice in the semantic category — equivalently, when the slice $\mathcal{P}/e$ contains a witnessing morphism for each piece of $S$'s signature [@bourbaki1968, ch. IV; @maclane1971, ch. II §1].

Inhabitance is not in general a function: an element may inhabit zero, one, or many structure-forms simultaneously. It is not in general injective: many elements may inhabit the same structure-form. The relation is *fibered* by the structure-form catalog: for fixed $S$, the set $\{e \in E : e \text{ inhabits } S\}$ is the *extent* of $S$ — the elements that realize the type.

The cell $(e, \text{inhabiting}, S)$ records that the element $e$ is in the extent of the structure-form $S$ — equivalently, that $e$'s cell-graph in $\mathcal{P}$ satisfies $S$'s signature. Reading: "$e$ inhabits $S$."

Inhabiting differs from [specializing](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/entity-set/library/entity/inhabiting/docs/dev/notes/specializing.md) in that the source is an *element of a base*, not a structure-form narrowing another type. Specialization is a relation among types at one level; inhabitance crosses from element-level to type-level. It differs from [realizing](realizing.md) in that realization is a functor between *categories* of concrete and abstract forms — total on its source and crossing an abstraction level — whereas inhabitance is a *relation* between an element and a type that the element may or may not realize.
