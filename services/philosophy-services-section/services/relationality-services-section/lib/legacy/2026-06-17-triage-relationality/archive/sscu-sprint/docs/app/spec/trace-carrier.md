---
title: Trace Carrier
tags:
  - trace
  - carrier
  - execution
layer: spec
status: plan
depends-on:
  - theorem/internal/trace-infrastructure
enacts: idea
part-of: relational-computer
in-domain: science/relationality
description: "Fixes concrete carriers for trace steps and traces that instantiate the trace infrastructure."# Trace Carrier

This specification fixes concrete carriers for trace steps and traces that
instantiate the **Trace Infrastructure**. These carriers are used by the
kernel machine, the judgment calculus, and the recognition‑carrier and
persistence structures to record and replay earned derivations.

## 1. Types

Implementations must provide concrete types that realise the trace notions
in the internal theorem.

- **Act identifier (`ActId`).**  
  A stable identifier for an earned act or judgement:
  - typically the slug from `docs/math/acts/<slug>.md` or an internal
    judgement id from the judgment‑calculus theorems,
  - sufficient to drive replay (selecting the appropriate handler or
    rewrite rule).

- **Runbook / step identifiers (`RunbookId`, `RunbookStepIndex`).**  
  Optional identifiers used when a trace step is part of a runbook
  execution:
  - `RunbookId` identifies the runbook carrier (from the wiring spec),
  - `RunbookStepIndex` is a non‑negative integer indexing a step in that
    runbook.

- **Reference type (`Ref`).**  
  A typed reference to previously materialised objects touched by a step:
  - may point to terms, contexts, recognition carriers, snapshots, or
    other trace steps,
  - includes enough information to look up the referenced object in the
    current kernel state (for example, a tagged union of `(kind, id)`).
  No separate tracepoint object is introduced; references always target
  existing carriers.

- **Trace step (`TraceStep`).**  
  A carrier encoding a single admissible derivation step:

  ```text
  TraceStep = {
    act_id            : ActId,
    runbook_id        : RunbookId? ,
    runbook_step      : RunbookStepIndex? ,
    inputs            : list[Ref],
    outputs           : list[Ref],
    position          : int,          # 0-based index in the enclosing trace
  }
  ```

  A `TraceStep` witnesses one application of an earned act or judgement in
  the sense of the trace infrastructure theorem. Its `inputs` and `outputs`
  are references sufficient to replay the step against the kernel state.

- **Trace (`Trace`).**  
  A finite, ordered sequence of `TraceStep` values:

  ```text
  Trace = list[TraceStep]
  ```

  A `Trace` records the admissible derivation steps that earned a particular
  judgement or recognition. It is always finite; infinite behaviour is
  represented via baseline and renewal acts in the persistence stack, not by
  infinite traces.

## 2. Operators

Implementations must provide at least the following operators over traces.

- **Construction and extension.**

  ```text
  empty_trace  : Trace
  append_step  : Trace × TraceStep → Trace
  concat_trace : Trace × Trace     → Trace
  ```

  `empty_trace` has no steps. `append_step` appends a single `TraceStep`,
  adjusting its `position` field to match its index in the result.
  `concat_trace` concatenates two traces, renumbering the `position` fields
  of the right‑hand side accordingly.

- **Prefix and extension checks.**

  ```text
  is_prefix           : Trace × Trace → bool
  is_trace_extension  : Trace × Trace → bool
  ```

  `is_prefix(t, t')` holds when `t` is a prefix of `t'` (same steps in the
  same order, up to the length of `t`). `is_trace_extension(t, t')` holds
  when `t'` extends `t` by zero or more additional steps; equivalently,
  `is_prefix(t, t')` is true.

- **Replay.**

  A partial replay operator

  ```text
  replay : Trace × RelationalState ⇀ RelationalState
  ```

  that:
  - takes an initial `RelationalState`,
  - applies each `TraceStep` in order using the trace acts from the
    **Trace Infrastructure** (for example, `StartTrace`, `TraceStep`,
    `RenewTrace`, `RestepTrace`),
  - and returns the resulting `RelationalState` when all steps have been
    replayed successfully.

  Replay is required to respect the admissible step set fixed by the syntax
  layer (see the judgment‑calculus and evaluation‑engine theorems); steps
  that refer to external carriers (e.g. snapshots) must be interpreted via
  the kernel operators.

## 3. Invariants

Concrete instances of `TraceStep` and `Trace` must satisfy:

- **Finite length.**  
  Every `Trace` is finite; there is no infinite list of `TraceStep`s.
  Long‑running behaviour is handled using baseline/renewal in the
  persistence stack, not by extending traces beyond finiteness.

- **Position consistency.**  
  For any `Trace = [s₀, s₁, …, sₙ]`, each step’s `position` field equals
  its index: `s_i.position = i`.

- **Replay soundness.**  
  For any `Trace`, if `replay(trace, r)` is defined, then the resulting
  `RelationalState` is the one obtained by applying the corresponding
  earned acts to `r` along the trace spine, as required by the trace
  infrastructure theorem.

- **Prefix closure.**  
  Any prefix of a valid `Trace` is itself a valid `Trace` (replayable up to
  that point). This ensures that extending a trace with additional steps
  never invalidates the already recorded history.

## 4. Relationship to other specs

- **Recognition carriers.**  
  `RecognitionCarrier.trace` is a `Trace` in the sense of this spec. The
  `is_trace_extension` predicate in the recognition‑carrier spec must be
  implemented using `is_prefix`/`is_trace_extension` on these carriers.

- **Persistence.**  
  Baseline and renewal acts in the persistence structure refer to tails and
  limits of traces. Those tails are always finite traces built from this
  carrier; convergence and renewal are expressed via the internal theorems,
  not by changing the `Trace` type.

- **Kernel machine.**  
  The Relational Machine Kernel treats traces as part of `RecognitionCarrier` state and
  uses them to justify recognitions, snapshots, and context persistence. No
  other hidden trace state is permitted.
