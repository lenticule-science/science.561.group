---
name: predication-shape
description: The signature of a structure-form within the predication category — a list of characteristic predication cells whose joint witness in an entity's cell-graph constitutes the entity's inhabitance of the form. Reduces the four kinds of signature data (sorts, operations, relations, constants) to a uniform cell-list form via the theorem in predication-shape.md.
specializing: signature
characteristic-cells-of: predication-cell
checked-by-inhabiting: inhabiting
title: predication-shape
---

A **predication-shape** is the signature of a structure-form in the predication category $\mathcal{P}$.

## Theorem

Let $F = (S, \mathrm{inh})$ be a structure-form, with $S$ a structure in the Bourbaki / Mac-Lane sense and $\mathrm{inh}$ the inhabitance relation between a base set $E$ of entities and $S$. The signature of $S$ is, in general, a finite list of typing judgments declaring sorts, operations, relations, and constants.

Consider $F$ interpreted in the predication category $\mathcal{P}$. The objects of $\mathcal{P}$ are entities, its morphisms are predication cells $(s, p, o)$, and its fibers are bilattice algebras indexed by entity-pairs. Under this interpretation the signature reduces to a single uniform shape:

$$\mathrm{Sig}(F) = \{(p_i, \sigma_i, \omega_i, c_i)\}_{i=1}^{n}$$

a finite list of *characteristic predication cells*, where each $(p_i, \sigma_i, \omega_i, c_i)$ is a tuple consisting of a predicate $p_i \in \mathcal{C}$, a subject-sort $\sigma_i \subseteq E$, an object-sort $\omega_i \subseteq E$, and a cardinality marker $c_i \in \{\text{required}, \text{optional}, \text{list-valued}, \text{set-valued}\}$.

**Proof sketch.** The four kinds of signature data — sorts, operations, relations, constants — all collapse into characteristic predication cells when the interpretation category is $\mathcal{P}$:

- A *sort* declaration on the structure becomes a subject-sort or object-sort constraint $\sigma \subseteq E$ on the entity-pair positions of a characteristic cell. The sort is internal to $E$; entities meeting the sort are precisely those in the subset $\sigma$.
- An *operation* of arity $n$ becomes $n$ characteristic cells linking the operation's argument-positions and result-position through predicates that record the operation's graph in the predication-fiber algebra.
- A *relation* becomes a single characteristic cell whose predicate is the relation and whose subject- and object-sorts cover the relation's argument-sorts.
- A *constant* becomes a characteristic cell with a singleton subject-sort $\{c\} \subseteq E$ and the predicate `is-the-constant-named` at the appropriate fiber.

The four cases differ only in cardinality and sort structure; the underlying cell-form is uniform. The signature of $F$ in $\mathcal{P}$ is therefore presentable as the list of characteristic cells above, and this presentation is a complete encoding of the signature. $\square$

## The inhabitance criterion

For $e \in E$ and $F = (S, \mathrm{inh})$ a structure-form with predication-shape $\mathrm{Sig}(F) = \{(p_i, \sigma_i, \omega_i, c_i)\}$:

$$e \text{ inhabits } F \iff \text{for every } i, \text{ the cell-graph at } e \text{ contains a cell } (s, p_i, o) \text{ with } s \in \sigma_i, o \in \omega_i, \text{ satisfying the cardinality } c_i.$$

The [inhabitance morphism](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/object/inhabiting/inhabiting.md) fires exactly on this criterion: cell $(e, \text{inhabiting}, F)$ holds iff the right-hand side holds.
