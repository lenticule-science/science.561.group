---
type: concept
class: discipline
depends-on: [canonical-form, predication-fibration, settling-monotonicity, settlement-determinism, settling-quiescence]
see-also: [hash-discipline, witness, fuel-bound, determinism-via-fiber-functoriality]
---

# Determinism

The discipline that an [operator](operator.md), given the same canonical input, produces exactly the same canonical output on every execution, regardless of host, runtime, scheduler, or wall-clock state. In the substrate's hyperdoctrine setting, determinism is not a side-effect-elimination convention — it is *the substrate-side instance of [predication-fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) functoriality*: substitution along a $\mathcal{C}$-morphism is a *function* from one fiber to another, by definition functorial, and the substrate's operators are exactly the runtime presentations of these fiber morphisms. Per [determinism-via-fiber-functoriality](../theorems/determinism-via-fiber-functoriality.md), the substrate's runtime cannot deviate from the functor structure without ceasing to implement the fibration.

Determinism is what makes the [witness](witness.md) replay valid: an auditor with the input bytes and the operator specification can reproduce the output bytes byte-for-byte.

## Why determinism is structural

A predication-fibration's substitution functor $f^* : A_{\sigma'} \to A_\sigma$ is a *function* in the mathematical sense: a single output for each input, independent of when, where, or by whom the function is evaluated. The substrate's runtime implementing $f^*$ as an operator inherits this property structurally — the operator cannot produce different outputs for the same input without violating the functor's definition.

Per [settlement-determinism](../theorems/settlement-determinism.md), the substrate's settlement (closure 2-monad iteration to fixed point) is determined by `(seed, closure-rule-system)`. Per [settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), each iteration step is $\leq_k$-monotone, building a chain that converges to a unique fixed point. The substrate's "deterministic operator" is exactly the runtime presentation of this functorial computation.

## How the discipline is enforced

The discipline is enforced by removing every implicit source of variation that would break the functor structure:

- **Worklist purity.** The order in which the substrate's closure machinery inspects predications, applies rules, and emits results is determined entirely by the input — typically by lexicographic order of canonical hashes. Per [hash-discipline](hash-discipline.md), canonical hashes are content-determined; the worklist order is therefore content-determined. Host-side iteration order, hash-table traversal order, and concurrency-induced reordering are forbidden as inputs to operator behavior.
- **No ambient state.** An operator does not consult the wall clock, the random number generator, the filesystem outside the input bundle, or environment variables. Anything that would constitute a side effect is either *not done* or is recorded as part of the canonical input. The fibration's substitution functor takes its inputs from the source fiber alone — no ambient state is admissible.
- **No host identity.** Two predications with the same canonical-form serialization are the same predication. Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), object identity (Python `id()`, JVM identity hash, etc.) is not consulted; only canonical content. The fibration's value-domain is the predication-fiber-algebra; runtime identity is not part of it.
- **Cache keys are content hashes.** A cache hit on input $x$ is the cache hit for the canonical hash of $x$, computed identically across hosts. Per [hash-discipline](hash-discipline.md), the hash is the substrate-side identity of the value.

## Determinism under concurrency

Substrate operators MUST be thread-safe and reentrant: parallel invocations on different inputs do not interleave their effects, and parallel invocations on the same canonical input produce byte-identical outputs. Internal caches MAY be shared but MUST be invisible at the operator's surface — concurrent access does not change the operator's observable behavior, only its performance.

This is more than thread-safety in the conventional sense: a substrate operator's *outputs* under concurrency are required to match its outputs in serial execution. Per [event-causality-via-lorentzian-settling](../theorems/event-causality-via-lorentzian-settling.md), spacelike-separated events admit any relative ordering — the substrate's parallel-replay produces the same fixed point regardless of order. Two parallel invocations of [settle](../morphisms/settle.md) on the same canonical input produce the same settled output and the same witness, even if the host scheduled rule-application steps in different orders. The substrate's worklist-purity discipline (lexicographic-canonical-hash ordering) is what makes this admissible.

## Cross-implementation determinism

Two independent implementations of the same operator MUST produce byte-identical outputs on byte-identical inputs. The substrate's discipline is *cross-implementation* determinism, not merely intra-implementation: a predicated computer in C, one in Rust, and one in Python all running the same operator specification produce the same outputs. Per [determinism-via-fiber-functoriality](../theorems/determinism-via-fiber-functoriality.md), this follows from the operator being a *runtime presentation of a fibration functor* — the functor's defining property doesn't admit implementation freedom.

Conformance vectors (canonical input/output pairs distributed with the operator specification) are the substrate-level test of this property; an implementation that fails the conformance vectors is non-conforming, and the substrate's federation discipline rejects it.
