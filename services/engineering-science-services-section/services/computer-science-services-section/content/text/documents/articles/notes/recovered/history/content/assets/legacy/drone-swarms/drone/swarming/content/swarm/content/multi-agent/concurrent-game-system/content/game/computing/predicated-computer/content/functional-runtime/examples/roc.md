---
type: example
status: documented
instantiates: [function, type, capability, code-as-substrate, capability-non-amplification, type-soundness]
---

# Roc as a functional-runtime-platform realization

Roc is a pure-functional language with platform-defined effects, capability-based effect handling, and a Hindley-Milner-style type system extended with tags and records. It is the realization that maps most cleanly onto this subtheory's central commitments: programs are values (pure functions, deterministic evaluation), effects are explicit (no ambient I/O), and capabilities are passed not granted (the platform-host model).

## Mapping to subtheory structure

| Subtheory structure | Roc realization |
|---|---|
| [function](teaching/explanations/function.md) | A Roc value of function type; first-class, can be passed and returned |
| [function-record](../objects/function-record.md) | Compile-time record of name, signature, body; not first-class at runtime in current Roc, but the discipline matches |
| [type](teaching/explanations/type.md) | Roc's algebraic data types: tag unions, records, type variables, function types |
| [type-record](../objects/type-record.md) | The compiler's type-environment entries; one per declared type alias |
| [check-type](../morphisms/check-type.md) | Roc's type-checker: H-M inference with row-polymorphic record and tag inference |
| [type-soundness](../theorems/type-soundness.md) | Roc commits to standard H-M soundness; well-typed programs do not stuck on type errors at runtime |
| [refined-type](teaching/explanations/refined-type.md) | Not first-class in current Roc (no general refinements); the discipline boundary is at H-M |
| [closure](teaching/explanations/closure.md) | Roc closures capture their environment; first-class values |
| [capability](teaching/explanations/capability.md) | Roc *platforms* expose capabilities; effects are functions from capability to result |
| [capability-passing](teaching/explanations/capability-passing.md) | Roc requires effects to receive their capability as argument; no ambient access |
| [capability-non-amplification](../theorems/capability-non-amplification.md) | Verified by Roc's type system: a function without a capability in its signature cannot perform the corresponding effect |
| [exercise-capability](../morphisms/exercise-capability.md) | Calling an effect function with its capability argument |
| [code-as-substrate](teaching/explanations/code-as-substrate.md) | Roc programs are not substrate content at runtime (they're compiled); the discipline holds at the compile-time-graph level |
| [evaluate](../morphisms/evaluate.md) | The platform-host's invocation of compiled Roc effect functions |
| [function-purity-replay-fidelity](../theorems/function-purity-replay-fidelity.md) | Pure Roc functions are referentially transparent; same input gives same output |
| [channel](teaching/explanations/channel.md), [send-channel](../morphisms/send-channel.md) | Not built-in to Roc core; concurrency is platform-defined (Tasks for async I/O) |

## The capability-non-amplification theorem realized

Roc's design centers on the platform / application split. The platform supplies capabilities (file system, network, time, random, etc.) as concrete values; the application is a pure function from capabilities-and-input to output. A Roc function whose type signature does not include `Effect.t` (or the platform-specific effect type) cannot invoke any platform effect — the type system refuses the program if it tries.

This is the substrate's [capability-non-amplification](../theorems/capability-non-amplification.md) realized: the only operations a function can perform are those it received as arguments. There is no global mutable state, no ambient stdin/stdout, no implicit allocator. A Roc function that wants to write a file requires a `Write` capability in its signature; the caller must supply one.

## The function-purity-replay-fidelity theorem realized

Roc's pure functions are deterministic by construction: no side effects, no global state, no ambient I/O. A function called twice with the same arguments produces the same result. The substrate's [function-purity-replay-fidelity](../theorems/function-purity-replay-fidelity.md) — that pure functions can be replayed deterministically against a recorded substrate state — is the substrate-content statement of what Roc's purity guarantees operationally.

The discipline boundary: Roc's effect system makes the *platform* call site potentially non-deterministic (file contents, network responses, current time vary across calls). The substrate's replay discipline must record those non-deterministic results in the witness chain, which in Roc terms means recording every capability invocation's result. A predicated-computing realization with Roc would add witness-recording to the platform layer.

## Where the realization deviates from the subtheory

Roc currently lacks general refinement types — its type system stops at H-M with tags and rows. The [refinement-type-decidability-boundary question](questions/refinement-type-decidability-boundary.md) is therefore not addressed by Roc; a Roc-based subtheory realization would need a refinement extension (or a separate refinement-checking pass at compile time) to engage that question.

Roc programs are not substrate content at runtime — they are compiled to native code via LLVM. The [code-as-substrate](teaching/explanations/code-as-substrate.md) commitment holds at the source-code-graph level (Roc modules are tracked, dependencies are tracked, compilation is a substrate operation in principle), but it does not hold at the running-program level the way it does in homoiconic languages. A Roc-based realization that wants reflective-programs-as-substrate would need either an interpretive variant or substrate-side reification of the compile-time program graph.

## Reference

Roc Programming Language. *Roc Documentation*. https://www.roc-lang.org/. Particularly the *Tutorial* (purity, types, tags, capabilities), the *Platform* documentation (effect handling, application/platform split), and the *FAQ* (design rationale for capabilities and purity).
