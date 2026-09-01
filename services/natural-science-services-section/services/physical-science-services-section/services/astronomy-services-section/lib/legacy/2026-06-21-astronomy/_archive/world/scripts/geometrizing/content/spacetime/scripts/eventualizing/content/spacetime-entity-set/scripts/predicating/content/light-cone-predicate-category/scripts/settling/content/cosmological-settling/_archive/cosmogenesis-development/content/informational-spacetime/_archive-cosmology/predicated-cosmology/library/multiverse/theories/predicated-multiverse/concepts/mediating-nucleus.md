---
type: concept
class: mediator
status: draft
depends-on: [world-as-nucleus, hole, portal-morphism]
see-also: [wood-between-worlds]
---

# Mediating nucleus

For a family of [worlds](../objects/world-as-nucleus.md) $\{W_i\}$, a **mediating nucleus** is a triple

$$(M, \{Q_i\}, \{\psi_i\})$$

in the ambient relational category, where:

- $M$ is a [nucleus](../objects/world-as-nucleus.md#ambient) — an object of the ambient relational topos $\mathsf{R}$;
- each $Q_i \hookrightarrow M$ is a [hole](hole.md) subobject of $M$;
- each $\psi_i : Q_i \to W_i$ is a [portal morphism](../morphisms/portal-morphism.md) from the hole into the corresponding world.

A mediator is, intuitively, *some* connecting structure that can serve as a way-station among the worlds: it has internal regions ($Q_i$) that are degenerate enough to admit factorization through their boundaries, and from those regions there are well-typed maps into the worlds.
Many mediators may exist for a given family $\{W_i\}$; they form a category whose morphisms are structure-preserving comparisons.

## What this concept is doing

Mediating nucleus is the object-of-comparison in the central [Wood as initial mediator](../theorems/wood-as-initial-mediator.md) theorem.
The Wood is characterized as the *initial* such mediator — every other mediator factors uniquely through it.
Without the mediating-nucleus concept, the Wood could only be defined by its axioms; with it, the Wood gets a universal-property characterization in the standard categorical sense.

## What this concept is not

A mediating nucleus is not itself a [world](../../multiverse/terms/world.md).
It does not satisfy the world conditions `(W1)`–`(W3)` in [world-as-nucleus](../objects/world-as-nucleus.md).
It is a connecting structure, not a candidate universe in its own right.
The structural distinction matters: the Wood is canonical *as a mediator*, not as a world.

## Provenance

Translated from §3.1 ("Mediating Nucleus") of the source draft [`wood-between-worlds.md`](../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relating/triage/provenance/math-from-relationality-bucket/wood-between-worlds.md), retaining the original categorical statement.
