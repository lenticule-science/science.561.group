---
name: minimal-cohesion
type: concept
status: sketch
---

A Higher Inductive Type (HIT) formalizing the minimal coherent relational unit. MinimalCohesion has three constructors: a base point, a 1-dimensional path (inclusion), and a 2-dimensional coherence path. This demonstrates that coherence adds genuine higher-dimensional structure — not just *holding things together* but *creating nontrivial topology*.

## The definition

In Cubical Agda:

```agda
data MinimalCohesion : Set where
  point      : MinimalCohesion
  include    : Path MinimalCohesion point point
  coherence  : Path (Path MinimalCohesion point point) include include
```

- `point` — the base recognition (0-dimensional).
- `include` — a 1-dimensional path from `point` to `point`: inclusion as continuous identification.
- `coherence` — a 2-dimensional path from `include` to `include`: coherence as a higher-dimensional condition on inclusions.

The 2-dimensional coherence path is the key. It says: not only can you include (identify things), but the *acts of including* must themselves be coherently identified. Coherence is a 2-dimensional condition operating on paths, not a 0-dimensional condition on points.

## The recursive hierarchy

MinimalCohesion is the bottom rung of a recursive hierarchy of HITs:

1. **MinimalCohesion** — base point, inclusion path, coherence 2-cell.
2. **RelationalUnit** — adds a `relate` path and `relateCoherence` condition, plus `higherCoherence` for stabilizing the reflexive lineage.
3. **RelationalClosure** — adds `relatingRelation`, the sustained mediation between relational acts and inclusion.
4. **RelationalBoundary** — adds exclusion dynamics and relational negation.

Each level is a HIT with constructors at increasing dimensional levels (points, 1-paths, 2-paths, higher paths).

## Why it matters

Most algebraic treatments of coherence — Heyting algebras, toposes — work at the 0-dimensional level: elements are equal or not, included or not. MinimalCohesion shows that the philosophical concept of coherence has genuine higher-dimensional content. The 2-dimensional coherence path corresponds to the condition that inclusions compose coherently — what the algebraic version handles through the transitivity axiom of the partial order. The HIT approach adds that this transitivity is itself a *continuous path*, not just a logical fact.

The philosophical question this raises: does the algebraic Heyting-algebra approach lose genuine content the HIT approach preserves?

The infinity-categorical answer (via stratified directed infinity-homotopy geometry, *SDIG*) is that higher-dimensional content can be preserved through homotopy theory. MinimalCohesion is the elementary building block of that approach.

## Note on formalization

Lean 4's type theory does not natively support Higher Inductive Types. Formalizing MinimalCohesion in Lean would require encoding the HIT as a quotient type or using an external library. The complete Cubical Agda formalization is ~2,650 lines.
