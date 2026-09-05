---
name: realizing
description: A faithful interpretation functor from a category of concrete forms to a category of abstract forms — sends each concrete form to the abstract structure it materializes. Essentially surjective on objects; may collapse distinct concrete forms to isomorphic abstract images. Standard examples are the syntactic-to-semantic interpretation functor and the presentation-to-presented-structure functor.
gerund: realizing
agent-noun: realizer
imperative: realize
originating: object
terminating: object
preserves:
  - identities
  - composition
---

Let $\mathcal{C}$ and $\mathcal{A}$ be categories, with $\mathcal{C}$ thought of as a category of *concrete forms* (objects equipped with a presentation — a shape of symbols, a configuration of bytes, a syntactic expression) and $\mathcal{A}$ as a category of *abstract forms* (mathematical structures, considered up to isomorphism).

A **realization** of $\mathcal{A}$ by $\mathcal{C}$ is a faithful functor

$$\rho : \mathcal{C} \to \mathcal{A}$$

that is **essentially surjective** (Awodey 2010, §7.7) — for every $X \in \mathcal{A}$ there exists some $C \in \mathcal{C}$ with $\rho(C) \cong X$ — and that may collapse distinct concrete forms to isomorphic abstract images. Two concrete forms $C_1, C_2 \in \mathcal{C}$ with $\rho(C_1) \cong \rho(C_2)$ are *realizations of the same abstract form*; the functor is not in general injective on objects.

Faithfulness on morphisms: for any $C_1, C_2 \in \mathcal{C}$,

$$\rho_{C_1, C_2} : \mathcal{C}(C_1, C_2) \to \mathcal{A}(\rho C_1, \rho C_2)$$

is injective. Two distinct concrete-form morphisms have distinct images in $\mathcal{A}$ — the realization preserves the distinguishability of arrows in $\mathcal{C}$ even as it identifies isomorphic objects.

The standard examples of this pattern in categorical logic: the interpretation functor from a syntactic category to a semantic category (Lambek–Scott 1986, Part II §11), and the realization functor from a category of presentations to a category of presented structures (Mac Lane–Moerdijk 1992, ch. IV §10).

## Frontmatter usage

The cell

$$(C, \text{realizing}, X)$$

records that the concrete form $C$ is in the preimage of the abstract form $X$ under some realization functor $\rho : \mathcal{C} \to \mathcal{A}$ — equivalently, that $C$ presents $X$. Reading: "$C$ realizes $X$."

## Distinction from specializing

Realizing differs from [specializing](../specializing/specializing.md) in two ways. First, the source and target categories are at different levels of abstraction — $\mathcal{C}$ is the concrete level, $\mathcal{A}$ the abstract level — whereas specialization works within a single level. Second, realization functors are typically essentially surjective and not injective on objects (multiple concrete forms realize the same abstract structure), whereas specialization functors are injective on objects.
