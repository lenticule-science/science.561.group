---
name: "Predication cell"
description: "The minimum writable unit of predication: an ordered triple (subject, predicate, object) at which a value can be assigned. The directed triadic structure that relationality's primitive paradox spells out into when fully articulated."
symbol: "φ"
date-created: 2026-04-28
---

A **predication cell** is an ordered triple $\phi = (s, p, o)$ where $s$ is a subject (an entity), $p$ is a predicate, and $o$ is an object (also an entity). The triple records the proposition *predicate $p$ holds of subject $s$ in relation to object $o$*. Predication cells are the elements of the **predication cell set** $\Phi = E \times \Pi \times E$, where $E$ is a set of entities and $\Pi$ is a set of predicates.

The cell is the smallest unit at which a [predication](predication.md) valuation can assign a value. The value lives in a residuated bilattice $\mathbf{L}^\bowtie$ associated to the predicate; the cell is *where* the value is assigned, the value is *what* is assigned. Predication cells are not relations in their own right — they are the directed triadic shapes that relations *take* when written out.

## The directed triadic structure

The cell has three coordinates, and the three are not interchangeable. The first and third (subject and object) are entities and could in principle be swapped, but doing so produces a different cell, related to the original by the [predicate converse](predicate-category.md) generator rather than equal to it. The second coordinate (the predicate) is the directional element: it holds of $s$ in relation to $o$, not of $o$ in relation to $s$. The cell is directed by construction.

This directionality is the structural form of what the [relationality](../../../../philosophy/domains/relationality/_index.md) framework calls lopsidedness in [relating](../../../../philosophy/domains/relationality/terms/relating.md), and is what survives of the [relationlessness](../../../../philosophy/domains/relationality/terms/relationlessness.md) paradox once the paradox has been spelled out: the would-be symmetric absence resolves into a directed triple, not into nothing. The cell is the *minimum writable form* in which the paradox can be expressed; there is no shorter form.

## Coordinates

- **Subject** ($s$) — the first entity coordinate. The predicate is asserted *of* the subject.
- **Predicate** ($p$) — the directed element. Holds *from* subject *toward* object.
- **Object** ($o$) — the second entity coordinate. The predicate is asserted *in relation to* the object.

Unary predicates (those that depend only on one entity, not on a pair) appear as the special case where the predicate has been pre-projected onto the subject or object diagonal — formally, where one of the projection generators of the [predicate category](predicate-category.md) has been applied. The cell shape itself never collapses below three coordinates; the binary base $E \times E$ of the entity index is the minimal index, and unary predicates are derived structurally rather than admitted as a separate primitive.

## See also

- [Predication](predication.md) — the activity at which cells are valued; predication cells are its units.
- [Predicate category](predicate-category.md) — the category whose morphisms relate predication cells across predicates.
- [Relating](../../../../philosophy/domains/relationality/terms/relating.md) — the philosophy-voice counterpart of the activity that takes place at cells.
- [Relationlessness](../../../../philosophy/domains/relationality/terms/relationlessness.md) — the originating paradox whose articulation produces the cell structure.
