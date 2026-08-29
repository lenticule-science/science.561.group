---
name: predication-shape
description: The signature of a structure-form within the predication category — a list of characteristic predication cells whose joint witness in an entity's cell-graph constitutes the entity's inhabitance of the form.
specializing: signature
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
---

A **predication-shape** is the signature of a structure-form in the predication category $\mathcal{P}$.

## Theorem

Let $F = (S, \mathrm{inh})$ be a structure-form, with $S$ a structure in the Bourbaki / Mac-Lane sense and $\mathrm{inh}$ the inhabitance relation between a base set $E$ of entities and $S$. The signature of $S$ is, in general, a finite list of typing judgments declaring sorts, operations, relations, and constants [@maclane1971, ch. II §1; @lambek-scott1986, Part I §1].

Consider $F$ interpreted in the predication category $\mathcal{P}$. The objects of $\mathcal{P}$ are entities, its morphisms are predication cells $(s, p, o)$, and its fibers are bilattice algebras indexed by entity-pairs. Under this interpretation the signature reduces to a single uniform shape:

$$\mathrm{Sig}(F) = \{(p_i, \sigma_i, \omega_i, c_i)\}_{i=1}^{n}$$

a finite list of *characteristic predication cells*, where each $(p_i, \sigma_i, \omega_i, c_i)$ is a tuple consisting of a predicate $p_i \in \mathcal{C}$, a subject-sort $\sigma_i \subseteq E$, an object-sort $\omega_i \subseteq E$, and a cardinality marker $c_i \in \{\text{required}, \text{optional}, \text{list-valued}, \text{set-valued}\}$.

**Proof sketch.** The four kinds of signature data [@bourbaki1968, ch. IV] — sorts, operations, relations, constants — all collapse into characteristic predication cells when the interpretation category is $\mathcal{P}$:

- A *sort* declaration on the structure becomes a subject-sort or object-sort constraint $\sigma \subseteq E$ on the entity-pair positions of a characteristic cell. The sort is internal to $E$; entities meeting the sort are precisely those in the subset $\sigma$.
- An *operation* of arity $n$ becomes $n$ characteristic cells linking the operation's argument-positions and result-position through predicates that record the operation's graph in the predication-fiber algebra.
- A *relation* becomes a single characteristic cell whose predicate is the relation and whose subject- and object-sorts cover the relation's argument-sorts.
- A *constant* becomes a characteristic cell with a singleton subject-sort $\{c\} \subseteq E$ and the predicate `is-the-constant-named` at the appropriate fiber.

The four cases differ only in cardinality and sort structure; the underlying cell-form is uniform. The signature of $F$ in $\mathcal{P}$ is therefore presentable as the list of characteristic cells above, and this presentation is a complete encoding of the signature: an entity $e \in E$ inhabits $F$ iff its cell-graph supplies a witnessing cell for each $(p_i, \sigma_i, \omega_i, c_i)$ in $\mathrm{Sig}(F)$ at the prescribed cardinality.

This is the predication-shape of $F$. $\square$

## The inhabitance criterion

For $e \in E$ and $F = (S, \mathrm{inh})$ a structure-form with predication-shape $\mathrm{Sig}(F) = \{(p_i, \sigma_i, \omega_i, c_i)\}$:

$$e \text{ inhabits } F \iff \text{for every } i, \text{ the cell-graph at } e \text{ contains a cell } (s, p_i, o) \text{ with } s \in \sigma_i, o \in \omega_i, \text{ satisfying the cardinality } c_i.$$

The inhabitance morphism named at [`inhabiting`](../transformers/inhabiting.md) fires exactly on this criterion: cell $(e, \text{inhabiting}, F)$ holds iff the right-hand side holds.

## Why "predication-shape"

The compound names what the predication category contributes to the signature concept: not a different concept, but the same concept viewed through the predication category's particular structure. In a different category (sets-with-relations, sheaves, syntactic categories of a different theory) the signature has a different concrete shape. In $\mathcal{P}$, the shape is the list of characteristic predication cells. The English word "shape" emphasizes the concreteness of the encoding — the cells you can read off a structure-form's record and check against an entity's cell-graph.
