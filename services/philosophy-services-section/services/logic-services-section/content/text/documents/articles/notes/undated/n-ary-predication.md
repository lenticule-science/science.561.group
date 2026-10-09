---
name: n-ary-predication
description: "Generalizes binary predication-cells (E × E) to n-ary cells (E^n) for n ≥ 1. An n-ary predicate p has values v^(n)(p)(e_1, ..., e_n) ∈ L^⋈. Special cases: n=0 nullary (global facts), n=1 unary (properties), n=2 binary (the substrate's standard relations), n=3 ternary, etc."
symbol: "v^(n)"
depends-on: [settlement, predicate-category, entity-set, closure-2-monad]
derives-from: docs/dev/scraps/n-ary-predication.md
title: n-ary-predication
---

# `n`-ary predication

Generalizes binary predication-cells `(s, p, o) ∈ E × Π × E` to **`n`-ary cells** `(e_1, …, e_n, p) ∈ E^n × Π` for `n ≥ 1`.

An `n`-ary predicate `p` has values

$$v^{(n)}(p)(e_1, \ldots, e_n) \;\in\; \mathbf{L}^\bowtie$$

— a bilattice-valued (or more generally `V`-valued) assignment of "how `p` relates the `n`-tuple `(e_1, …, e_n)`."

## Special cases

| `n` | Name | Cell shape | Cardinality | Example |
|---|---|---|---|---|
| `0` | nullary | single cell `(p)` | `|Π|` | "is the world clean?" (global facts) |
| `1` | unary | `(e, p)` | `|E| · |Π|` | "is `e` red?" (properties) |
| `2` | binary | `(s, p, o)` | `|E|² · |Π|` | "does `s` know `o`?" (relations) — substrate standard |
| `3` | ternary | `(e_1, e_2, e_3, p)` | `|E|³ · |Π|` | "is `(cause, effect, mechanism)` valid?" |
| `≥ 4` | higher | `(e_1, …, e_n, p)` | `|E|ⁿ · |Π|` | rare in substrate; specialized applications |

The substrate's **standard** is `n = 2`. The four predicate-category morphism classes are defined for binary predication and exhaust the natural homomorphisms (by the Sym(E)-equivariance theorem with `|E| ≥ 3`).

## Why binary is the substrate's standard

Frege's two-slot saturation argument (CLAUDE.md, "Fregean predication forces FOUR") establishes that the minimal complete predication has exactly TWO argument-slots. Unary and nullary predications reduce to binary via diagonal-projection or trivial-projection (e.g., `is-red(e) = is-color(e, red)` for a fixed `red ∈ E`).

So binary predication is **structurally complete** — every higher arity reduces to compositions of binary predications, and unary/nullary are degenerate cases of binary.

This is why the substrate's primary development is binary; `n`-ary predication is the generalization for applications that need explicit higher-arity structure (causal triples, multi-party relations, etc.).

## Where `n`-ary appears naturally

**Causal predication** (`n = 3`): `(cause, effect, mechanism)`. The mechanism is the third slot recording HOW the causal relation operates. Reducing to binary loses the mechanism info; explicit ternary is needed.

**Multi-party transaction** (`n = 4` or more): `(sender, receiver, asset, amount)`. Reducible to a chain of binary relations but more naturally captured as a 4-cell.

**Quantum-style entanglement** (`n = k`): `k`-particle entangled states. Pairwise reductions miss the genuine `k`-party correlation; explicit `k`-ary cells are required.

## Generalized fiber-algebra

For an `n`-ary predicate `p`, the fiber-algebra is

$$A_p^{(n)} \;:=\; \mathbf{L}^{\bowtie\, E^n}.$$

An element is a function `E^n → L × L` — a bilattice value at each `n`-tuple.

The bilattice operations lift pointwise (same as binary, just over `E^n` instead of `E × E`). Distributivity, residuation, and the four bilattice operations transfer to the `n`-ary fiber-algebra.

## Generalized predicate-category morphisms

The four canonical generators (specialization, converse, subject-projection, object-projection) generalize to `n`-ary predication:

| `n=2` generator | `n`-ary generalization |
|---|---|
| specialization | restriction along a sub-support inclusion `dom(q) ↪ dom(p) ⊆ E^n` |
| converse | permutation of the `n` argument-slots |
| subject-projection | collapse to a diagonal sub-tuple `(e_1, …, e_n) ↦ (e_i, …, e_i)` for some `i` |
| object-projection | similar to subject-projection for other slot-indices |

For `n ≥ 3`, the **number of permutations** is `n!` (not just `2!` = 2), and the **number of diagonal-projections** is `n` (one per slot). So `n`-ary predicate-categories have richer morphism structure than binary.

The Sym(E)-equivariance theorem doesn't directly generalize: in the binary case, four generator classes suffice; in the higher-arity case, there are more natural generator classes, and the exhaustiveness theorem requires re-verification.

## Position

`transfinite-predication-category/hacking/library/n-ary-predication/`. Predicating tier — extends the binary predication structure to higher arities. The substrate's binary standard is the `n = 2` special case.

## Derivation source

Adapted from `predication-categories/objects/n-ary-predication.md`, preserved at `docs/dev/scraps/`.
