title: Evaluation Engine Structure
tags:
  - evaluation
  - substitution
  - normalization
layer: internal-theorem
status: plan
depends_on:
  - theorem/internal/evaluation-context-structure
  - theorem/internal/substitution-discipline
  - theorem/internal/reduction-normalization-structure
---
# Evaluation Engine Structure

The evaluation-context structure, substitution discipline, and
reduction/normalization structure together induce a single **evaluation engine
structure**:

- a set of evaluation states,
- a step function on those states, and
- a normalisation map for the earned programs.

Concretely, there exists a structure

```text
EvalEngine = (State, step, norm)
```

such that:

1. **States and frames.**
   Elements of `State` pair terms with evaluation frames drawn from
   `EvalCtx`:

   ```text
   State ⊆ Frame × Term
   ```

   Every state `(F, t)` can be decomposed into a frame `F` and a focused term
   `t`, and recomposed into a whole program using the `plug` operator from the
   evaluation-context structure.

2. **Step function.**
   The `step` function uses the substitution discipline and the reduction
   structure to map states to states:

   ```text
   step : State ⇀ State
   ```

   such that whenever `step(F, t)` is defined:

   - it applies the primitive step relation to the focused term `t`,
   - uses substitution to compute a new term `t'`,
   - and returns a new state `(F, t')` or `(F', t')` with `F'` obtained from
     `F` by admissible frame operations.

   `step` is defined exactly when the underlying primitive reduction is
   defined on `plug(F, t)`.

3. **Normalisation map.**
   The `norm` map is induced by the normalization structure:

   ```text
   norm : State ⇀ State
   ```

   and, for states in the earned class of programs:

   - iterating `step` from an initial state reaches a normal state whenever
     the normalization theorem guarantees termination, and
   - `norm` selects that normal state, unique up to the earned equivalences
     from the reduction/normalization structure.

This evaluation engine structure is the single object that interpreters and
runtimes must realise: any concrete evaluator must provide carriers and
operations instantiating `(State, step, norm)` in a way that respects the
evaluation-context, substitution, and reduction/normalization theorems.
