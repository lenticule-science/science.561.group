---
title: "Minimal Cohesion (Higher Inductive Type)"
date-created: 2026-03-05T00:00:00
type: term
canonical-name: MinimalCohesion
movement: I (genesis — the first formal structure)
draft-names:
  draft-7: "MinimalCohesion (HIT in Cubical Agda formalization)"
stability: medium — unique to draft 7; philosophically significant but not carried forward into later drafts
formalization: "Cubical Agda (draft 7, system/units/minimal coherence.md and Relational Dynamic Cubical Agba Formalism.md)"
---

A Higher Inductive Type (HIT) formalizing the minimal coherent relational unit. MinimalCohesion has three constructors: a base point, a 1-dimensional path (inclusion), and a 2-dimensional coherence path. This demonstrates that coherence adds genuine higher-dimensional structure — not just holding things together but creating nontrivial topology.

## What it is

Draft 7 defines MinimalCohesion in Cubical Agda:

```
data MinimalCohesion : Set where
  point      : MinimalCohesion
  include    : Path MinimalCohesion point point
  coherence  : Path (Path MinimalCohesion point point) include include
```

- `point` — the base recognition (0-dimensional)
- `include` — a 1-dimensional path from point to point: inclusion as continuous identification
- `coherence` — a 2-dimensional path from include to include: coherence as a higher-dimensional condition on inclusions

The 2-dimensional coherence path is the key. It says: not only can you include (identify things), but the acts of including must themselves be coherently identified. Coherence is not a 1-dimensional condition but a 2-dimensional one — it operates on paths, not just on points.

## Why it matters

Most algebraic treatments of coherence (including the Heyting algebra approach used in PRE and later drafts) work at the 0-dimensional level: elements are equal or not, included or not. MinimalCohesion demonstrates that the philosophical concept of coherence has genuine higher-dimensional content.

Draft 7's statement of novelty claims this represents an integration of "hierarchically layered architecture, infinite extensibility, and internal coherence not previously achieved in type theory." The formalization extends MinimalCohesion through a recursive hierarchy:

1. **MinimalCohesion** — base point, inclusion path, coherence 2-cell
2. **RelationalUnit** — adds a `relate` path and `relateCoherence` condition, plus `higherCoherence` for stabilizing the reflexive lineage
3. **RelationalClosure** — adds `relatingRelation`, the sustained mediation between relational acts and inclusion
4. **RelationalBoundary** — adds exclusion dynamics and relational negation

Each level is a HIT with constructors at increasing dimensional levels (points, 1-paths, 2-paths, higher paths).

## Relationship to the main framework

MinimalCohesion is draft 7's unique contribution. Later drafts work at the algebraic level (Heyting algebras, toposes) which collapses the higher-dimensional content into 0-dimensional lattice operations. The philosophical question this raises: does the Heyting algebra approach lose genuine content that the HIT approach preserves?

Draft 6's SDIG framework (stratified directed infinity-homotopy geometry) preserves higher-dimensional content through homotopy theory. MinimalCohesion is the elementary building block of that approach — the simplest HIT that exhibits the coherence structure the framework requires.

The connection to PRE: MinimalCohesion's `include` path corresponds to the inclusion ordering (Includes). The `coherence` 2-cell corresponds to the condition that inclusions compose coherently — which PRE handles via the transitivity axiom of the partial order (if a includes b and b includes c, then a includes c). The HIT approach adds the information that this transitivity is itself a CONTINUOUS path, not just a logical fact.

## Relationships

- Provides: the elementary coherence structure from which RelationalUnit, RelationalClosure, and RelationalBoundary are built
- Corresponds to: the Heyting algebra's partial order (at the 0-dimensional level)
- Extends to: draft 6's SDIG framework (at the infinity-categorical level)
- Formalized in: Cubical Agda (draft 7, 2,652 lines of formalization)

## TTL encoding

Not currently in ontology.ttl. Could be added as a Structure with derivesFrom Differentiating and correspondsTo "Higher Inductive Type in Cubical Agda."

## Lean encoding

Not in the current Lean formalization. Lean 4's type theory does not natively support Higher Inductive Types (no Cubical features). Formalizing MinimalCohesion in Lean would require encoding the HIT as a quotient type or using an external library.
