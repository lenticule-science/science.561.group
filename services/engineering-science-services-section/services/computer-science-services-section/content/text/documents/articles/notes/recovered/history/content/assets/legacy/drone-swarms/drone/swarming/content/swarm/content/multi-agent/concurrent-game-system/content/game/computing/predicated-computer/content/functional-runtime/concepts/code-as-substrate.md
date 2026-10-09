---
type: concept
class: program-discipline
depends-on: [self-representation, predication-cell]
see-also: [runtime, evaluation]
---

# Code as substrate

The discipline by which *programs are themselves substrate content* — function bodies, type definitions, capability specifications, all stored as substrate predications, queryable and modifiable through the same operators that act on any other content.

The substrate's commitment: there is no separate "code repository" outside the substrate. Programs live in the predication graph alongside data; per [self-representation](../../teaching/explanations/self-representation.md), this is structural to the predicated-computing model.

Three engineering consequences:

- **Programs are versionable as substrate content.** Per [snapshot-replay-fidelity](../../../theorems/snapshot-replay-fidelity.md), program versions are recoverable; per [federation-convergence](../../../theorems/federation-convergence.md), program updates federate across substrates per the substrate's normal merge discipline.
- **Programs are auditable.** Per [witness](../../../objects/witness.md), every program edit and every program invocation is recorded. An auditor can ask "who modified this function?" and "what did this function do at that ordinal?" via substrate traversal.
- **Programs are first-class for operators.** The substrate's [traversal](../../../morphisms/traversal.md), [project](../../../morphisms/project.md), [edit-document](../../interactive-application-platform/morphisms/edit-document.md) operators can act on program code (functions are documents at the type level). Refactoring is editing predications; analysis is querying predications.

A function's body, in code-as-substrate form:

- The function's signature is a type predication.
- The function's body is a sequence of expression-predications (or a single AST-shaped predication).
- The function's effects are effect-predications.
- The function's compiled form (if any) is a separate predication referencing the source.

Per [compile](../morphisms/compile.md), the substrate may transform a high-level function representation into an evaluatable lower-level form; both representations are substrate content, and the compilation step is itself a substrate operation producing a witness.

Per [evaluate](../morphisms/evaluate.md), invoking a function is a substrate operation; per [settlement-determinism](../../../theorems/settlement-determinism.md), pure-function evaluations are replay-deterministic.

Code-as-substrate composes with [agential-orchestration-platform](../../agential-orchestration-platform/_index.md): per [settlement-path-cost-monotonicity](../../agential-orchestration-platform/theorems/settlement-path-cost-monotonicity.md), an agent's skill at formality layer $F_3$ is a code-as-substrate function executable without inference. The substrate's runtime executes the function deterministically.
