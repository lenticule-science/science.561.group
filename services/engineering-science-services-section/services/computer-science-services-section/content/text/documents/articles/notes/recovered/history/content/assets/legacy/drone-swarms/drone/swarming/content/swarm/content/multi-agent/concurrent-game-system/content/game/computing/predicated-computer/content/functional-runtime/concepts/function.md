---
type: concept
class: program-unit
depends-on:
  - type
  - code-as-substrate
  - settlement-determinism
  - settling-coalgebra-structure
  - closure-2-monad-lax-idempotence
  - predication-fiber-algebra
see-also:
  - closure
  - effect
  - invoke-function
  - function-purity-replay-fidelity
  - graded-effects-via-q-enriched-fusion
---

# Function

A *substrate-recorded computation unit*: a function takes inputs, performs computation, and produces outputs. Functions are the programming-platform's primary unit of code-as-substrate-content (per [code-as-substrate](code-as-substrate.md)).

Per [function-purity-replay-fidelity](../theorems/function-purity-replay-fidelity.md) (proved), a function declared `pure` produces *byte-identical* outputs on byte-identical inputs across substrate invocations and across snapshot replay. The structural reason is that pure evaluation restricts the runtime's [settling-equipped predication hyperdoctrine](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-coalgebra-structure.md) coalgebra map to the function-record's fiber alone — no neighboring fibers (capabilities, effects, channels) participate. Per [closure-2-monad-lax-idempotence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md), the algebra structure on a single fiber is unique up to unique iso; for pure functions, "up to unique iso" collapses to byte-identity because the canonical-form hash is the iso class's representative. The three determinism declarations (`pure`, `effectful`, `non-deterministic`) are not arbitrary policy categories — they correspond to three regimes of the same coalgebra map operating on progressively larger fibers.

## Structural fields

- **Type signature ↔ fiber-coordinate declaration.** `(parameters) → return-type`, declared via [type](type.md). Per [type](type.md), the signature includes parameter types and may include effect annotations (per [effect](effect.md)). Structurally the type signature is the declaration of *which fiber-coordinates* of the [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) the function reads from and writes to.
- **Body ↔ closure-rule sub-region.** The computation: a sequence of substrate operations, expressions, sub-function-invocations. Per [code-as-substrate](code-as-substrate.md), the body is itself substrate-content — a sequence of expressions or operations stored as predications, queryable, modifiable, replayable. Structurally the body is a sub-region of the substrate's overall closure-rule system, scoped to the function's invocation fiber.
- **Captured environment ↔ inbound accessibility cells.** For [closures](closure.md), references to values from the function's defining scope. Structurally these are inbound accessibility cells in the function's call-graph world, fixing the values readable at the closure's defining context.
- **Authority requirements ↔ inbound capability fiber.** Declared [capabilities](capability.md) the function needs to execute. Per [capability-non-amplification](../theorems/capability-non-amplification.md), the function's available authority is the modal-necessity restriction $\Box_R u_{\text{caller}}$ along the call edge — never higher in the knowledge order than the caller's, never ambient.
- **Determinism declaration ↔ coalgebra-map regime.** `pure` (deterministic, replay-byte-identical), `effectful` (uses capabilities, replay requires same capability state), `non-deterministic` (involves randomness, external services, model invocation). The three declarations correspond to the three fiber-restrictions of the runtime's coalgebra map: pure restricts to the function-record fiber alone, effectful expands to the capability fiber, non-deterministic admits the entropy-source fiber.

## Determinism regimes as coalgebra restrictions

Per [function-purity-replay-fidelity](../theorems/function-purity-replay-fidelity.md), the three determinism declarations correspond to three regimes of the runtime's coalgebra map:

- **`pure` ↔ function-record-fiber-only.** Output depends only on inputs; the coalgebra map restricts to the function-record fiber alone. Per the theorem, the canonical-form hash of the result is determined by the result's content, so two invocations with byte-identical inputs produce byte-identical outputs.
- **`effectful` ↔ function-record + capability fibers.** Output depends on inputs *and* on the capability state at invocation. Per [graded-effects-via-q-enriched-fusion](../theorems/graded-effects-via-q-enriched-fusion.md), the replay-fidelity is graded by the effect signature, not byte-identical: replay reproduces the output when the capability state at replay matches the capability state at original invocation.
- **`non-deterministic` ↔ function-record + entropy-source fiber.** Output depends on inputs and on an entropy source (RNG, external service, model invocation). The function records its entropy source's hash in its witness; per [snapshot-replay-fidelity](../../../theorems/snapshot-replay-fidelity.md), an auditor with access to the entropy source reproduces the output by re-supplying the recorded entropy.

A function's declared determinism is therefore a substrate-content commitment about which fibers its evaluation reads from — not a policy hint, but a structural claim the substrate enforces and conformance verifies.

## Function patterns

Each conventional function pattern corresponds to a structural shape on the function-record:

- **First-order function ↔ value-fiber morphism.** Takes values, returns values. The function-record has no function-typed parameters or return.
- **Higher-order function ↔ fiber-of-functions parameter.** Takes functions, returns functions. The parameter or return position carries a function-record value, lifting the call to the function-fiber.
- **Recursive function ↔ self-referential closure-rule.** Calls itself. Per [wavefront-termination](../../../theorems/wavefront-termination.md), the substrate bounds nested invocations, so the recursion has a substrate-side termination obligation visible in the witness.
- **Curried function ↔ chained single-argument morphisms.** Multi-argument function as a chain of single-argument functions, each returning the next.
- **Composed function ↔ substrate's function-composition primitive.** `f ∘ g`. Per [code-as-substrate](code-as-substrate.md), the composition is itself a substrate operation producing a function-record, not a compile-time syntactic construction.

## Engineering invariants

- **Pure functions are memoization-safe.** Per the theorem's first engineering consequence, pure functions can be memoized without correctness loss; the cache key is `(function-record-hash, input-hash)`. The substrate may cache pure-function results indefinitely without invalidation discipline.
- **Pure functions are parallel-safe.** Per the theorem's second engineering consequence, pure functions can be invoked in parallel without coordination — no inter-invocation accessibility cells need to be checked.
- **Audit-replayable.** Per [snapshot-replay-fidelity](../../../theorems/snapshot-replay-fidelity.md), a pure function's historical invocation can be replayed to verify the recorded output. Effectful functions replay against the recorded capability state; non-deterministic functions replay against the recorded entropy.
- **Federation-portable.** Per [federation-convergence](../../../theorems/federation-convergence.md), two substrates invoking the same pure function on the same input produce the same output. Cross-substrate pure-function invocation is byte-identical.
- **Self-representable.** Per [self-representation](../../teaching/explanations/self-representation.md), functions are substrate content. Adding, modifying, removing a function is editing predications; the function-record's content-hash changes when the body changes, and downstream invocations that pinned the prior hash continue to invoke the prior body.

## What the discipline refuses

- **Misdeclared purity.** Per the theorem's first rule-out, a function declared `pure` that actually reads global state, the wall clock, calls the model, or invokes external services is misdeclared. Per [conformance-implies-substrate-properties](../../../theorems/conformance-implies-substrate-properties.md), conformance testing surfaces such misdeclarations: replaying a misdeclared-pure function produces non-byte-identical outputs.
- **Non-deterministic pure-function evaluation.** Per the theorem's second rule-out, a runtime that introduces non-determinism into pure-function evaluation (random scheduling that affects results, race-prone evaluation order) is non-conformant per [settlement-determinism](../../../theorems/settlement-determinism.md). The runtime owes pure-function evaluators a deterministic environment.
- **Ambient state reads in any declared regime.** A function that reads ambient runtime state without parameter-passing the source breaks the coalgebra restriction for its declared regime. Per [code-as-substrate](code-as-substrate.md), reads must come through the substrate's fiber-coordinate machinery, not via host-environment side channels.
- **Non-recorded effects.** An `effectful` function whose effects are not recorded as substrate operations breaks the graded-replay discipline per [graded-effects-via-q-enriched-fusion](../theorems/graded-effects-via-q-enriched-fusion.md): replay cannot reconstitute the effect and the output diverges.
- **Non-witnessed entropy.** A `non-deterministic` function that does not record its entropy source's hash in its witness breaks audit-replay: the auditor cannot reconstruct the conditions that produced the output.

## Position in the platform

Function is the functional-runtime platform's *primary computation unit*: the substrate-recorded morphism that turns input fiber-coordinates into output fiber-coordinates under one of three coalgebra-restriction regimes. Together with [closure](closure.md) (function plus captured environment), [effect](effect.md) (the graded specification of the function's fiber-restriction), [capability](capability.md) (the substrate-side instance of the call-graph accessibility relation), [type](type.md) (the fiber-coordinate declaration), and [invoke-function](../morphisms/invoke-function.md) (the morphism that composes the function-record with its inputs), function completes the platform's account of the path from substrate-content code to substrate-content output. The substrate-side observable of every function invocation is a single coalgebra-map application on the predication-fiber algebra; everything else — replay-fidelity, parallel-safety, memoization, federation portability, audit-replayability — falls out of which fiber that coalgebra-map restricts to.
