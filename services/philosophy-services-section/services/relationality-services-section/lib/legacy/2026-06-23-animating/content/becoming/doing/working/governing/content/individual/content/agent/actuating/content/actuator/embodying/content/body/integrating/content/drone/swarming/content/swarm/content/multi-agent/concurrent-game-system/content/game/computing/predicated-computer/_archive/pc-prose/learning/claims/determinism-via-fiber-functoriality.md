---
type: theorem
class: engineering-claim
status: proved
depends-on: [determinism, predication-fibration, predication-fiber-algebra, parameter-base-category, settlement-determinism, settlement-via-closure-2-monad]
see-also: [canonical-form-via-settling-quiescence, hash-injectivity-under-canonical-form]
---

# Substrate determinism is the runtime presentation of fibration functoriality

**Claim.** For any substrate operator $O$ realizing a [predication-fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) substitution functor $f^* : A_{\sigma'} \to A_\sigma$ (along a $\mathcal{C}$-morphism $f : \sigma \to \sigma'$ in the [parameter-base category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/parameter-base-category.md)), the substrate's [determinism](teaching/explanations/determinism.md) discipline — same canonical input, same canonical output — is *exactly the runtime presentation of $f^*$'s functoriality*. The operator cannot deviate from "single output for each input" without ceasing to implement the fibration's substitution.

## Why this holds

Per [predication-fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md), substitution along $f : \sigma \to \sigma'$ is a *functor* $f^* : A_{\sigma'} \to A_\sigma$ on the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md). A functor is by definition a function on objects (and a function on morphisms compatible with composition and identity). The defining property: for each object $v \in A_{\sigma'}$, $f^*(v)$ is a single, structurally-determined element of $A_\sigma$.

A substrate runtime that implements $f^*$ as an operator $O$ satisfies, by the functor's definition:

- **Functional.** $O(v) = f^*(v)$ — single output for each input.
- **Independent of when/where evaluated.** $f^*(v)$ is determined by $v$ and the fibration structure, not by runtime context (host, time, scheduler).
- **Independent of representation.** Two inputs $v_1 \cong v_2$ in $A_{\sigma'}$ produce the same $f^*(v_1) = f^*(v_2)$ in $A_\sigma$.
- **Composable.** $g^* \circ f^* = (f \circ g)^*$ — composing operators corresponds to composing morphisms in $\mathcal{C}$.

These are the substrate-side determinism properties: same canonical input produces same canonical output, regardless of host/runtime/scheduler. The substrate's runtime cannot deviate without ceasing to implement the functor — implementation freedom is exactly nil at the level of the function's mapping.

Per [settlement-determinism](../theorems/settlement-determinism.md), the substrate's settled state is a function of `(seed, closure-rule-system)`; per [settlement-via-closure-2-monad](settlement-via-closure-2-monad.md), settlement is the closure 2-monad's iteration to fixed point. Both follow from the functor structure: the substrate's runtime computation is a sequence of fibration-functor applications, each deterministic by its functorial nature.

## Engineering consequence

- **Determinism is structural, not enforced.** The substrate's runtime cannot "choose" non-determinism — non-deterministic implementations don't implement the fibration's functor, so they are *not* substrate operators. Per [conformance-via-fiber-algebra-functoriality](conformance-via-fiber-algebra-functoriality.md) (if existing) or analogous discipline, conformance verifies that the implementation is in fact functorial.
- **Cross-implementation determinism follows.** Two implementations of the same operator both implement the same functor $f^*$ — and a functor's defining property leaves no implementation freedom in the function's mapping. Implementations may differ in their runtime efficiency, memory layout, or parallelism strategy, but not in the function's value at any input.
- **Concurrent determinism follows.** Per [event-causality-via-lorentzian-settling](event-causality-via-lorentzian-settling.md), spacelike-separated operators may run concurrently; per the functor's compositionality, the order of independent functor applications is irrelevant. Two parallel applications of $f^*$ on the same input produce the same output.
- **Conformance vectors test functoriality.** A conformance test that fixes inputs and outputs (canonical $v_1, \dots, v_n$ and expected $f^*(v_1), \dots, f^*(v_n)$) is testing whether the implementation realizes the functor at those points. Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), the test reduces to byte-equality of canonical-form hashes.

## What the theorem rules out

- **Stochastic operators.** An operator that "samples from a distribution" is not implementing a fibration functor — its mapping is set-valued, not function-valued. The substrate refuses; if the use case requires stochasticity, the operator must take an explicit randomness-source predication as input (making the randomness substrate content, not runtime nondeterminism).
- **Time-dependent operators.** An operator that consults the wall clock or system time has inputs from outside the source fiber — its mapping isn't $f^* : A_{\sigma'} \to A_\sigma$, it's $f^* : A_{\sigma'} \times \text{time} \to A_\sigma$. Per [time-and-event-ordinals](teaching/explanations/time-and-event-ordinals.md), the substrate's discipline is to put time in the input as substrate content.
- **Implementation-defined behavior.** A specification that admits "the implementation may choose any of these outputs" is not specifying a functor. The substrate's specifications determine the functor structure exactly; implementations that deviate are non-conforming.
- **Externalities.** An operator with side effects on external systems (writing to filesystem outside its input bundle, network calls, mutable global state) is not a fibration functor — its effects aren't represented in the output value alone. Per [read-discipline](teaching/explanations/read-discipline.md), all operator behavior must be represented in the substrate-content output.

## What the theorem requires

- The substrate's value-domain is a [predication fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md).
- Each substrate operator corresponds to a particular substitution functor in the fibration.
- Operator inputs and outputs are entirely substrate content (no externalities).
- The substrate's runtime preserves canonical-form (per [canonical-form-via-settling-quiescence](canonical-form-via-settling-quiescence.md)) so that "same canonical input" is well-defined.

## Position

This theorem is the structural basis for the substrate's determinism, settlement-determinism, replay-equivalence, and federation-convergence properties. Together with [canonical-form-via-settling-quiescence](canonical-form-via-settling-quiescence.md) and [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), it grounds the substrate's content-identity-and-determinism discipline in the predication-fibration's structural definition. The substrate cannot be non-deterministic and remain a substrate; the functor structure forecloses the option.
