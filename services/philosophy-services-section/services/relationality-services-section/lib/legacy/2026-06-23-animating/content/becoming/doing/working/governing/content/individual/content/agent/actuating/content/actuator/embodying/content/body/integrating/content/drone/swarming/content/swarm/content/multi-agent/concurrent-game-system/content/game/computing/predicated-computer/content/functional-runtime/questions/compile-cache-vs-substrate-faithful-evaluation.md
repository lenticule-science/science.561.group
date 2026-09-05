---
type: question
status: open
explores:
  - ../morphisms/compile.md
  - ../morphisms/evaluate.md
  - ../theorems/function-purity-replay-fidelity.md
see-also:
  - references/plotkin1981.md
  - references/pierce2002.md
---

# Is the substrate's compile-cache faithful to the substrate's evaluation discipline?

The subtheory's [compile](../morphisms/compile.md) morphism transforms a source function-record into an executable representation; the substrate's natural commitment is to *cache* compiled artifacts keyed by `(source-hash, compile-options-hash)`. The question is whether the cache is *structurally faithful* to the substrate's evaluation discipline — i.e., whether evaluating against the cached compiled artifact produces a witness chain bisimilar to evaluating against a freshly-compiled artifact.

## Statement

> Does substrate-resident compile-caching introduce a structural divergence between cached-artifact evaluation and faithful re-evaluation, and if so, what witness-chain discipline restores faithfulness?

## Partial decomposition

- **(P1) Source-hash faithfulness.** Two source representations with the same canonical-form hash compile to artifacts with the same observable behaviour; the cache is keyed on the source-hash. Strengths: deterministic cache lookup. Weaknesses: requires source-canonical-form to be byte-deterministic (per [hash-injectivity-under-canonical-form](../../../theorems/hash-injectivity-under-canonical-form.md)).
- **(P2) Compiler-version faithfulness.** Two compiled artifacts produced by different compiler versions may have different observable behaviour even from the same source; the cache key must include the compiler-version-hash. Question: does the substrate commit to one compiler version per substrate-deployment, or admit per-call compiler-version selection?
- **(P3) Witness-chain bisimulation.** Per [function-purity-replay-fidelity](../theorems/function-purity-replay-fidelity.md), pure-function evaluation is replay-faithful. The sub-question: does evaluating against a cached compiled artifact produce a witness chain that is *bisimilar* to (or *identical* to) the witness chain produced by evaluating against a freshly-compiled artifact? If only the *result* is the same but the witness chains differ, then audit-replay is not faithful even though function-purity is preserved.
- **(P4) Effect-faithfulness under caching.** A cached compiled artifact's evaluation may exercise capabilities differently from a freshly-compiled artifact's evaluation (e.g., the cache lookup itself is an effect; the cached-artifact load is an effect). Does the substrate's effect discipline track these cache-introduced effects, or are they invisible per the cache's structural transparency?

## What is established

- Per [function-purity-replay-fidelity](../theorems/function-purity-replay-fidelity.md), pure-function evaluation produces deterministic results given inputs; this is independent of whether evaluation goes through a compile cache.
- Per the substrate's [hash-injectivity-under-canonical-form](../../../theorems/hash-injectivity-under-canonical-form.md), source-canonical-form hashing is byte-deterministic; the cache key is well-defined.
- Per [snapshot-replay-fidelity](../../../theorems/snapshot-replay-fidelity.md), substrate replay is byte-faithful when substrate state is reconstructed; whether the compile cache is part of substrate state or a separate operational concern is currently unspecified.

## What remains open

- Whether the compile cache is part of substrate state (and therefore witness-chain-tracked) or a separate operational artifact (and therefore witness-chain-invisible). The first is structurally cleaner; the second is operationally cheaper.
- The bisimulation status of witness chains across cached vs uncached evaluation paths (P3).
- The effect-faithfulness of cache-introduced effects (P4).
- Whether [compile](../morphisms/compile.md)'s morphism signature should declare its cache-discipline as a parameter, and whether [check-type](../morphisms/check-type.md) inherits a similar question for the typing-derivation cache.
