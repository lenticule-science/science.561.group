---
type: concept
class: execution-environment
depends-on: [code-as-substrate, function, settlement-determinism]
see-also: [evaluate, compile]
---

# Runtime

A *substrate-recorded execution environment* for [functions](function.md): the runtime defines what evaluation strategy the substrate uses, what effects functions can perform, what concurrency primitives are available.

A runtime has the structure:

- **Evaluation strategy** — eager (call-by-value), lazy (call-by-need), normal-order (call-by-name), or some hybrid.
- **Effect system** — which [effects](effect.md) the runtime supports and how it tracks them.
- **Concurrency model** — which concurrency primitives ([lock](lock.md), [channel](channel.md), async-future) the runtime provides.
- **Garbage collection / memory model** — how the runtime manages value lifetime (refcount, tracing GC, region-based, none).
- **Foreign function interface** — how the runtime calls into non-substrate code (host system calls, external libraries).
- **Capability environment** — the runtime's mechanism for tracking which capabilities are available at each evaluation context.

Per [code-as-substrate](code-as-substrate.md), the runtime itself is substrate content: a runtime-record declares the evaluation strategy, the effect system, the concurrency model. Multiple runtimes can coexist on a substrate (each with its own runtime-record); functions can declare which runtime they require.

Per [settlement-determinism](../../../theorems/settlement-determinism.md), a function's evaluation under a given runtime is deterministic on its inputs (modulo declared non-deterministic effects). Per [snapshot-replay-fidelity](../../../theorems/snapshot-replay-fidelity.md), replaying a function evaluation produces the same result as the original.

Per [conformance-implies-substrate-properties](../../../theorems/conformance-implies-substrate-properties.md), a runtime is conformant when its evaluations satisfy the runtime-record's declared properties. Two conformant runtimes with the same runtime-record produce byte-identical evaluation outcomes (modulo non-deterministic effects).

The substrate's runtime composes with [agential-orchestration-platform](../../agential-orchestration-platform/_index.md): per [skill-invocation](../../agential-orchestration-platform/morphisms/skill-invocation.md), a skill's execution proceeds through the runtime's evaluation strategy. A skill at formality layer $F_3$ (per [settlement-path-cost-monotonicity](../../agential-orchestration-platform/theorems/settlement-path-cost-monotonicity.md)) is a function evaluated by the runtime without model invocation.
