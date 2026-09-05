---
name: predication-cell-set
description: "The Cartesian product Φ := E × Π × E. The set of all predication cells: ordered triples (s, p, o) at which predication-valuations assign values. The substrate's index set of cells; the domain of every predication-valuation."
symbol: "Φ"
realizes: [predication-cell, subject, object-as-cell-coordinate]
depends-on: [entity-set, predicate-set]
derives-from: docs/dev/scraps/predication-cell-set.md
---

# Predication cell set

$$\Phi \;:=\; E \times \Pi \times E.$$

The elements of `Φ` are **predication-cells** `(s, p, o)`: a subject entity `s ∈ E`, a predicate `p ∈ Π`, an object entity `o ∈ E`. Each cell is the type-judgment "the predicate `p` is being applied to the subject `s` in relation to the object `o`."

`Φ` is the **substrate's index set of cells**. Every predication-valuation has `Φ` as its domain; every closure-rule's antecedent ranges over `Φ`; every settlement-orbit's per-step content lives indexed by `Φ`.

## Cardinality

If `E` is finite with `|E| = n` and `Π` is finite with `|Π| = m`, then

$$|\Phi| \;=\; n \cdot m \cdot n \;=\; m n^2.$$

A substrate over `|E| = 100` entities and `|Π| = 50` predicates has half-a-million cells. Computational tractability of operations on `Φ` depends on this product staying small enough for the regime's algebraic operations to run in available memory.

For `|E| = ω` or `|Π| = ω`, `|Φ|` is countable; for higher cardinalities `|Φ|` is uncountable, putting the substrate in regimes where finite-step settling may not exist.

## Decomposition: per-predicate slicing

`Φ` decomposes into slices indexed by predicate:

$$\Phi \;=\; \coprod_{p \in \Pi} (E \times \{p\} \times E) \;\cong\; \coprod_{p \in \Pi} (E \times E).$$

Each slice `E × {p} × E` is `Π`-uniformly the entity-pair index `E × E` — the same `(n × n)` grid of subject-object combinations, with predicate fixed at `p`. The predication-fiber-algebra `A_p = L^⋈^(E×E)` is the value-space for the `p`-slice.

This per-predicate slicing is what makes the predication-fiber-functor `F: C^op → BiLat(L)` clean: it sends `p` to `A_p`, recovering precisely the value-space of the `p`-slice of `Φ`.

## Three cell-coordinate roles, two entity slots

A predication-cell `(s, p, o)` has three coordinate roles but only TWO independent slots: the subject slot `s ∈ E` and the object slot `o ∈ E`. The predicate `p ∈ Π` is the relation being asserted, not a third slot.

This matches the CLAUDE.md "Fregean predication forces FOUR" derivation: Frege's two-slot saturation gives exactly two independent slots, each binary-status (saturated or not), giving `2 × 2 = 4` joint states — the four FOUR-values.

So the predication-cell-set's `E × Π × E` shape encodes:

- **Two slots** for entities (subject, object) — the Fregean two-slot structure.
- **One label** for the relation (predicate) — what Frege calls the unsaturated function.

The cell-set is the type-language for "all possible saturations of all possible predicates."

## Position in the substrate stack

Below `Φ`:

- **entity-set** `E` supplies the first and third factors.
- **predicate-set** `Π` supplies the middle factor.

Above `Φ`:

- **predication-cell** as the type whose elements are `Φ`'s members.
- **predication-valuation** whose domain is `Φ`.
- **predication-fiber-algebra** as the value-space of one slice.
- **predication-cell-trace** (potential tree) as the per-cell history.

## Worked example: `Φ` for `|E| = |Π| = 2`

Take `E = {a, b}`, `Π = {p, q}`. Then `Φ = E × Π × E` has `2 × 2 × 2 = 8` cells:

| Subject | Predicate | Object |
|---|---|---|
| `a` | `p` | `a` |
| `a` | `p` | `b` |
| `a` | `q` | `a` |
| `a` | `q` | `b` |
| `b` | `p` | `a` |
| `b` | `p` | `b` |
| `b` | `q` | `a` |
| `b` | `q` | `b` |

A predication-valuation on this substrate assigns one of the four `FOUR` values to each of the 8 cells. The full state-of-knowledge at one moment is a function `Φ → FOUR`, equivalently a point in `FOUR^Φ = FOUR^8 = 4^8 = 65536` possible valuations.

This is the smallest non-trivial substrate setting where the four FOUR-values, the two-slot structure, and the cell-indexing are all in play. Larger substrates extend the same shape proportionally.

## Position

`transfinite-predication-category/hacking/library/predication-cell-set/`. Predicating tier — `Φ` is the index set the predicating-tier value structure ranges over. Wrapped in `hacking/` because the derivation that the predicating-tier category's index IS `Φ = E × Π × E` is not formally placed; it is admitted from the substrate setup.

## Derivation source

Adapted from `predication-categories/objects/predication-cell-set.md`, preserved verbatim at `docs/dev/scraps/`.
