---
name: "Entity set"
description: "The set whose elements are entities — the source of the cell index E × E over which predication fiber algebras are built. Carries no required structure beyond set-hood; specific applications may add finiteness, sortedness, or other refinements."
symbol: "E"
date-created: 2026-04-29

---

An **entity set**, denoted $E$, is a set whose elements are [entities](entity.md). The entity set is one of the base parameters of the predication framework, alongside a [predicate set](predicate-set.md) $\Pi$ (the object set of a [predicate category](predicate-category.md)) and a residuated lattice $\mathbf{L}$ from which the [bilattice](bilattice.md) is built.

The entity set carries no required structure beyond set-hood in general. Specific theorems and applications may impose additional structure:

- **Finiteness.** Many constructions (the predicate-category generator-exhaustiveness theorem, the existence of certain limits, decidable settlement checks) require $E$ to be finite, often with $|E| \geq 3$ for the equivariance hypothesis to be non-degenerate.
- **Sortedness.** $E$ may be sorted into kinds: $E = \bigsqcup_i E_i$ where each $E_i$ is a sub-set of entities of one type. Sortedness affects which predicates apply to which entity pairs.
- **Group action.** The framework's $\mathrm{Sym}(E)$-equivariance hypothesis treats $E$ as a set acted on by its symmetric group $\mathrm{Sym}(E)$; this is what makes the four predicate-category generator classes exhaustive (under $|E| \geq 3$).

## The cell index

The Cartesian product $E \times E$ is the **cell index** — the set of pairs over which [predication fiber algebras](predication-fiber-algebra.md) are built. For each [predicate](predicate.md) $p$, the fiber algebra $A_p$ assigns a value to each pair $(s, o) \in E \times E$, where $s$ is the [subject](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/subject/subject.md) and $o$ is the [object](./object.md) of the resulting [predication cell](predication-cell.md).

The cell index is the same for every predicate; what varies between predicates is the morphisms of the [predicate category](predicate-category.md), not the index. This uniformity is what makes the predication framework cleanly fibrational.

## See also

- [Entity](entity.md) — an element of an entity set.
- [Predication cell](predication-cell.md) — the triple $(s, p, o)$ where $s, o \in E$.
- [Predication fiber algebra](predication-fiber-algebra.md) — the bilattice-valued algebra over $E \times E$ at each predicate.
- [Predicate set](predicate-set.md) — the parallel base structure on the predicate side.

---

## Additional formulation

```yaml
---
name: "Entity set"
description: "The set whose elements are entities — the source of the cell index E × E over which predication fiber algebras are built. Carries no required structure beyond set-hood; specific applications may add finiteness, sortedness, or other refinements."
symbol: "E"
date-created: 2026-04-29
---
```

An **entity set**, denoted $E$, is a set whose elements are [entities](entity.md). The entity set is one of the base parameters of the predication framework, alongside a [predicate set](predicate-set.md) $\Pi$ (the object set of a [predicate category](predicate-category.md)) and a residuated lattice $\mathbf{L}$ from which the [bilattice](bilattice.md) is built.

The entity set carries no required structure beyond set-hood in general. Specific theorems and applications may impose additional structure:

- **Finiteness.** Many constructions (the predicate-category generator-exhaustiveness theorem, the existence of certain limits, decidable settlement checks) require $E$ to be finite, often with $|E| \geq 3$ for the equivariance hypothesis to be non-degenerate.
- **Sortedness.** $E$ may be sorted into kinds: $E = \bigsqcup_i E_i$ where each $E_i$ is a sub-set of entities of one type. Sortedness affects which predicates apply to which entity pairs.
- **Group action.** The framework's $\mathrm{Sym}(E)$-equivariance hypothesis treats $E$ as a set acted on by its symmetric group $\mathrm{Sym}(E)$; this is what makes the four predicate-category generator classes exhaustive (under $|E| \geq 3$).

## The cell index

The Cartesian product $E \times E$ is the **cell index** — the set of pairs over which [predication fiber algebras](predication-fiber-algebra.md) are built. For each [predicate](predicate.md) $p$, the fiber algebra $A_p$ assigns a value to each pair $(s, o) \in E \times E$, where $s$ is the [subject](../../../../philosophy/domains/relationality/terms/subject.md) and $o$ is the [object](../../../../philosophy/domains/relationality/terms/object.md) of the resulting [predication cell](predication-cell.md).

The cell index is the same for every predicate; what varies between predicates is the morphisms of the [predicate category](predicate-category.md), not the index. This uniformity is what makes the predication framework cleanly fibrational.

## See also

- [Entity](entity.md) — an element of an entity set.
- [Predication cell](predication-cell.md) — the triple $(s, p, o)$ where $s, o \in E$.
- [Predication fiber algebra](predication-fiber-algebra.md) — the bilattice-valued algebra over $E \times E$ at each predicate.
- [Predicate set](predicate-set.md) — the parallel base structure on the predicate side.
