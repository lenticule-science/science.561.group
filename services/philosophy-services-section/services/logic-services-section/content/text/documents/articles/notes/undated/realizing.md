---
name: realizing
description: A faithful interpretation functor from a category of concrete forms to a category of abstract forms — sends each concrete form to the abstract structure it materializes.
gerund: realizing
agent-noun: realizer
imperative: realize
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
  - id: maclane-moerdijk1992
    type: book
    title: "Sheaves in Geometry and Logic: A First Introduction to Topos Theory"
    publisher: Springer
    location: New York
    author:
      - literal: Mac Lane, Saunders
      - literal: Moerdijk, Ieke
    issued:
      - year: 1992
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
title: realizing
---

Let $\mathcal{C}$ and $\mathcal{A}$ be categories, with $\mathcal{C}$ thought of as a category of *concrete forms* (objects equipped with a presentation — a shape of symbols, a configuration of bytes, a syntactic expression) and $\mathcal{A}$ as a category of *abstract forms* (mathematical structures, considered up to isomorphism).

A **realization** of $\mathcal{A}$ by $\mathcal{C}$ is a faithful functor
$$\rho : \mathcal{C} \to \mathcal{A}$$
that is **essentially surjective** [@awodey2010, §7.7] — for every $X \in \mathcal{A}$ there exists some $C \in \mathcal{C}$ with $\rho(C) \cong X$ — and that may collapse distinct concrete forms to isomorphic abstract images. Two concrete forms $C_1, C_2 \in \mathcal{C}$ with $\rho(C_1) \cong \rho(C_2)$ are *realizations of the same abstract form*; the functor is not in general injective on objects.

Faithfulness on morphisms: for any $C_1, C_2 \in \mathcal{C}$,
$$\rho_{C_1, C_2} : \mathcal{C}(C_1, C_2) \to \mathcal{A}(\rho C_1, \rho C_2)$$
is injective. Two distinct concrete-form morphisms have distinct images in $\mathcal{A}$ — the realization preserves the distinguishability of arrows in $\mathcal{C}$ even as it identifies isomorphic objects.

The standard examples of this pattern in categorical logic: the interpretation functor from a syntactic category to a semantic category [@lambek-scott1986, Part II §11], and the realization functor from a category of presentations to a category of presented structures [@maclane-moerdijk1992, ch. IV §10].

Realizing differs from [specializing](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/realizing/docs/dev/notes/specializing.md) in two ways. First, the source and target categories are at different levels of abstraction — $\mathcal{C}$ is the concrete level, $\mathcal{A}$ the abstract level — whereas specialization works within a single level. Second, realization functors are typically essentially surjective and not injective on objects (multiple concrete forms realize the same abstract structure), whereas specialization functors are injective on objects.

The cell $(C, \text{realizing}, X)$ records that the concrete form $C$ is in the preimage of the abstract form $X$ under some realization functor $\rho : \mathcal{C} \to \mathcal{A}$ — equivalently, that $C$ presents $X$. Reading: "$C$ realizes $X$."
