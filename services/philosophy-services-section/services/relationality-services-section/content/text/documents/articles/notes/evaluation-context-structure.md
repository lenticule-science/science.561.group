---
title: Evaluation Context Structure
keywords:
  - evaluation
  - context
layer: internal-theorem
status: plan
depends-on:
  - seed-evaluation-context
  - build-evaluation-context
description: The acts SeedEvaluationContext and BuildEvaluationContext induce an evaluation-context structure.
---

The acts `SeedEvaluationContext` and `BuildEvaluationContext` induce an
evaluation-context structure. Its points are evaluation frames and the
relations describe how frames extend and compose.

Concretely, there exists a structure

```text
EvalCtx = (Frame, plug, empty, compose)
```

such that:

1. **Frames and holes.**
   Elements of `Frame` represent evaluation frames with a single distinguished
   “hole”:
   - each frame records a surrounding trace/recognition state and the
     syntactic context around the hole,
   - plugging a term into the hole yields a whole program.

2. **Plug operator.**
   There is an operator

   ```text
   plug : Frame × Term → Term
   ```

   satisfying:
   - for every term `t`, there is an “empty” frame `empty` such that

     ```text
     plug(empty, t) = t;
     ```

   - for every frame `F` and term `t`, `plug(F, t)` is the program obtained by
     inserting `t` into the unique hole of `F`.

3. **Empty frame.**
   `empty ∈ Frame` is the neutral element for composition (see below) and
   represents the context with no surrounding structure:

   ```text
   plug(empty, t) = t
   ```

   for all terms `t`.

4. **Composition.**
   There is a partial composition operator

   ```text
   compose : Frame × Frame ⇀ Frame
   ```

   corresponding to nesting frames along the trace spine, such that whenever
   `compose(F1, F2)` is defined,

   ```text
   plug(compose(F1, F2), t) = plug(F1, plug(F2, t))
   ```

   and composition is associative wherever both sides are defined.

Starting from a base context seed, repeated applications of
`BuildEvaluationContext` generate elements of `Frame`; `SeedEvaluationContext`
provides the empty frame. This structure ensures that any local reduction step
can be lifted into a larger program: given a frame and a term, we can form a
whole program, reduce inside the hole, and then re-insert the result while
preserving witnesses.
