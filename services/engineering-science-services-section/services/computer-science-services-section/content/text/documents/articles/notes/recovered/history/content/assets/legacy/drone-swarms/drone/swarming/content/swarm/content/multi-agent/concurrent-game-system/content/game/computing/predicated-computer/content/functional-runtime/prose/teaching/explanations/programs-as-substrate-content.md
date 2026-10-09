---
type: narrative
status: current
introduces: [code-as-substrate, capability, capability-passing]
discusses: [function, type, evaluate, type-soundness, capability-non-amplification]
---

# Programs as substrate content

The parent corpus has [closure-rule application](../../../morphisms/closure-rule-application.md) as the unit of computation: predication cells are admitted, closure rules fire, more cells are derived, the substrate settles. This is enough to be a computer in the broadest sense — the substrate computes the closure of a rule system over a base. It is not enough to be a programming-language platform.

This subtheory adds the commitment that *programs themselves are substrate content*. Functions, types, capabilities, channels — the things a programming language manipulates — are predication cells in the substrate, not entities that live outside it. The closure-rule machinery handles their evaluation; the witness chain records their effects.

## What the commitment buys

Three engineering consequences follow once programs are substrate content:

- **Evaluation is a substrate operation.** Per [evaluate](../morphisms/evaluate.md), reducing a function application to its result is a closure-rule application: the cell representing the application has a derivation rule that produces the cell representing the result, with the function's body substituted. The witness chain records the reduction; the substrate's settlement guarantees apply to evaluation. This is structurally the same as the substrate's other settling work — programs are not a separate machinery alongside the substrate, they are one of the things the substrate settles.

- **Type-checking is a substrate operation.** Per [check-type](../morphisms/check-type.md), verifying that a function's body conforms to its declared type is a closure-rule application that produces a `valid` or `invalid` cell. The substrate can audit type-check decisions just as it audits any other closure-rule firing; the witness records which type-environment was used and which derivation succeeded. [type-soundness](../theorems/type-soundness.md) is the substrate-content statement of progress-and-preservation: well-typed programs reduce to well-typed values, and the substrate's settling discipline guarantees the reduction terminates at a value (modulo undecidable refinements per the [decidability-boundary question](../learning/questions/refinement-type-decidability-boundary.md)).

- **Capability-passing is a substrate-recorded transfer.** Per [capability-passing](../teaching/explanations/capability-passing.md), granting a function the right to perform an effect is recording a predication cell that says "function $f$ holds capability $c$ at time $t$." The cell is part of the substrate's normal state; the witness chain records the grant. [capability-non-amplification](../theorems/capability-non-amplification.md) — the guarantee that a function cannot invoke an effect without a corresponding capability cell — is the substrate-content statement of the capability discipline, enforced by the type-checker's substrate operation.

## Lineage

Two strands of programming-language tradition converge in this subtheory's commitment:

- **Homoiconicity** — the tradition of Lisp, Smalltalk, Forth — commits to representing programs in the same data structure the language manipulates. A Lisp program is a list; lists are first-class data; programs can construct, inspect, and execute lists. The substrate's commitment is the same shape, generalized: programs are predication cells; cells are first-class substrate content; programs can construct, inspect, and execute cells. The homoiconic tradition's central insight (programs are data) becomes (programs are substrate content) when the data layer is a predication graph rather than a list.

- **Capability discipline** — the tradition of E (Mark Miller), Joe-E, Caja, Pony, Roc — commits to making authority explicit. No function can perform an effect except by exercising a capability passed to it as argument. The substrate's commitment is the same: no closure-rule application can produce a witnessed effect without the corresponding capability cell being present in the rule's premise. The capability-discipline tradition's central insight (authority must be intentional, not ambient) becomes (every effect is witness-bound to a capability cell) when authority lives in the predication graph.

The subtheory inherits both strands. From homoiconicity it takes the reflective stance: programs and the substrate are the same kind of thing. From capability-discipline it takes the authority stance: every effect is intentional, recorded, and traceable.

## The hard part

The commitment is not free. Three engineering tensions are unavoidable when programs become substrate content:

- **Performance.** Compiled native-code execution is orders of magnitude faster than substrate-mediated reduction. The subtheory's realizations face a tradeoff: full reflection (programs always live in the substrate, evaluation always goes through closure-rule application — slow but auditable) vs. compile-and-cache (programs are compiled to native code; only the source-graph and the witness summaries live in the substrate — fast but the compiled artifact is opaque). The [Roc example](../examples/roc.md) takes the compile-and-cache stance; a substrate-faithful realization would need a hybrid (interpret in audit mode, compile in production mode, with substrate-recorded equivalence).

- **Type system completeness.** The substrate's type-checker must be able to handle whatever type system the subtheory commits to. H-M is decidable and well-engineered. Refinement types are partially decidable; system F is decidable but expensive; dependent types touch undecidability. The substrate's discipline must declare its type-system commitments and live within them. The [refinement-type decidability boundary question](../learning/questions/refinement-type-decidability-boundary.md) is the central open thread.

- **Effect granularity.** Capability-discipline is uniform — every effect requires a capability — but the granularity is engineering choice. One global `IO` capability per program is uniform but useless (no separation of authority). One capability per system call is uniform and powerful (full separation) but ergonomically heavy. The subtheory has not committed to a granularity discipline; the [capability](../teaching/explanations/capability.md) concept is silent on it.

These tensions are not failures. They are the design space the subtheory's discipline characterizes. The commitment "programs are substrate content" frames the design space; living within the frame is the engineering work each realization does.

## What this changes for the engineer

When a predicated-computing engineer is told "we need a programming-language runtime for X," the right move is not to embed an existing runtime as a black-box component. The right move is to recognize that the substrate is the runtime's evaluation engine, and to ask which subtheory disciplines the use case requires. A use case that needs reflection (programs that operate on programs) requires the homoiconic-strand commitments. A use case that needs effect isolation requires the capability-discipline commitments. A use case that needs static guarantees about runtime behavior requires the [type-soundness](../theorems/type-soundness.md) commitments and the corresponding type-system parameter choices.

The architecture stays one substrate; the runtime disciplines layer onto it. The engineering question is not "which language runtime do we choose" but "which subset of functional-runtime-platform disciplines does this use case require, and is the substrate operationally configured to provide them."
