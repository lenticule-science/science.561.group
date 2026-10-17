---
type: theorem
class: engineering-claim
status: proved
depends-on: [function, function-record, settlement-determinism, snapshot-replay-fidelity, evaluate, settling-coalgebra-structure, closure-2-monad-lax-idempotence]
see-also: [invoke-function]
---

# Pure functions replay byte-identically

**Claim.** Let $f$ be a [function-record](../objects/function-record.md) declared `pure` (per [function](teaching/explanations/function.md)). For any inputs $x$, replaying [invoke-function](../morphisms/invoke-function.md) on $(f, x)$ produces byte-identical output as the original invocation. Per [settlement-determinism](../../../theorems/settlement-determinism.md), this generalizes to: for all pure functions, $\mathrm{invoke}(f, x)$ at substrate ordinal $\tau_1$ and at substrate ordinal $\tau_2$ produce byte-identical outputs as long as the substrate's relevant state at $\tau_1$ and $\tau_2$ is the same on the inputs.

## Proof

A pure function's output depends only on its inputs (per [function](teaching/explanations/function.md)'s definition: no effects, no captured state, no externals). Two invocations with byte-identical inputs:

1. Per [invoke-function](../morphisms/invoke-function.md), produce byte-identical evaluation traces.
2. Per [evaluate](../morphisms/evaluate.md), produce byte-identical evaluation results.
3. Per [hash-injectivity-under-canonical-form](../../../theorems/hash-injectivity-under-canonical-form.md), the canonical-form hash of the result is determined by the result's content.

Therefore the two invocations produce the same canonical-form hash, hence (by hash injectivity) byte-identical outputs.

Per [snapshot-replay-fidelity](../../../theorems/snapshot-replay-fidelity.md), replay over a snapshot reconstructs substrate state byte-identically. A pure-function invocation during replay has byte-identical inputs (from the reconstructed state) and therefore produces byte-identical outputs.

**Why purity is the right cut.** The structural reason byte-identity holds is that pure evaluation restricts the runtime's [settling-equipped predication hyperdoctrine](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-coalgebra-structure.md) coalgebra map to the function-record fiber alone — no neighboring fibers (capabilities, effects, channels) participate. Per [closure-2-monad-lax-idempotence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md), the algebra structure on a single fiber is unique up to unique iso. For pure functions, "up to unique iso" collapses to byte-identity because the canonical-form hash is the iso class's representative. Effectful functions live on a larger fiber and do not collapse the same way; their replay-fidelity is graded per [graded-effects-via-q-enriched-fusion](graded-effects-via-q-enriched-fusion.md), not byte-identical.

$\square$

## Engineering consequence

- **Memoization-safe.** Pure functions can be memoized without correctness loss; the cache key is `(function-record-hash, input-hash)`.
- **Parallel-safe.** Pure functions can be invoked in parallel without coordination.
- **Audit-replayable.** Per [snapshot-replay-fidelity](../../../theorems/snapshot-replay-fidelity.md), a pure function's historical invocation can be replayed to verify the recorded output.
- **Federation-portable.** Two substrates invoking the same pure function on the same input produce the same output; per [federation-convergence](../../../theorems/federation-convergence.md), this strengthens cross-substrate equivalence.

## What the theorem rules out

- A function declared `pure` that actually reads global state (not via parameters), reads the wall clock, calls the model, or invokes external services is misdeclared. Per [conformance-implies-substrate-properties](../../../theorems/conformance-implies-substrate-properties.md), conformance testing surfaces such misdeclarations.
- A runtime that introduces non-determinism into pure-function evaluation (random scheduling that affects results) is non-conformant per [settlement-determinism](../../../theorems/settlement-determinism.md).

## What the theorem requires

- The function is correctly declared `pure` (no hidden effects).
- The runtime evaluates pure functions deterministically per [settlement-determinism](../../../theorems/settlement-determinism.md).
- Per [hash-injectivity-under-canonical-form](../../../theorems/hash-injectivity-under-canonical-form.md), substrate canonical-form is byte-deterministic.
