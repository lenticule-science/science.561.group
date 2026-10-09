---
type: theorem
class: engineering-claim
status: proved
depends-on: [evaluate, function, function-record, runtime, runtime-record, closure-2-monad, closure-2-monad-lax-idempotence, predication-fibration, settlement-via-closure-2-monad, function-purity-replay-fidelity, settling-coalgebra-structure, settling-internal-hom, fibered-coinduction]
see-also: [graded-effects-via-q-enriched-fusion, type-soundness, capability-non-amplification]
---

# Function evaluation is a Cl-algebra structure on the function-record fiber, unique up to unique iso

**Claim.** The runtime's [evaluate](../morphisms/evaluate.md) operator is a $\mathrm{Cl}$-algebra structure on the [function-record](../objects/function-record.md) fiber of the substrate's [predication fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md). Per [closure-2-monad-lax-idempotence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md) and its corollary, *being a $\mathrm{Cl}$-algebra is a property, not additional structural data*: any two runtimes that implement evaluation correctly on the same function-record fiber agree up to unique isomorphism. There is no genuine choice in evaluation semantics beyond what the function record specifies — implementations either realize the unique algebra or fail to be evaluators.

## Why this holds

Per [closure-2-monad](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md), the closure operation $\mathrm{Cl}$ is a 2-monad on $\mathbf{PrFib}$ — the 2-category of predication fibrations. Per [closure-2-monad-lax-idempotence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md), $\mathrm{Cl}$ is lax-idempotent (Kelly–Lack K1). The Kelly–Lack property-like theorem (K2) then implies: every predication fibration admits *at most one* $\mathrm{Cl}$-algebra structure up to unique iso.

A function-record substrate predication carries:

- A type signature (input fiber, output fiber per the predication fibration).
- A body (a substrate-content closure-rule presentation per [code-as-substrate](teaching/explanations/code-as-substrate.md)).
- An effect signature (per [effect-record](../objects/effect-record.md)).

The runtime's evaluate operator takes a function-record together with an input value and produces an output value. Structurally, evaluate is the substrate operation that drives the function-record's body to its closure-fixed-point on the input fiber — i.e., the $\mathrm{Cl}$-algebra structure map $\mathrm{Cl}(\mathcal{E}) \to \mathcal{E}$ restricted to the function-record's fiber.

Per [settlement-via-closure-2-monad](../../../theorems/settlement-via-closure-2-monad.md), settlement on the substrate is exactly the closure 2-monad's iteration; evaluate is the function-record-fiber-restricted instance of this settlement.

By the K2 corollary, two runtimes implementing evaluate on the same function-record agree up to unique isomorphism: there is no semantic latitude in evaluation. Per [function-purity-replay-fidelity](function-purity-replay-fidelity.md), the unique iso is byte-identity for pure functions on the same input.

## Engineering consequence

- **Runtime portability is structural.** A function-record evaluated on runtime A and runtime B produces the same output (up to the unique iso). Cross-runtime portability of substrate functions is not a discipline to be enforced — it is a structural consequence of the closure 2-monad's lax-idempotence. Two runtimes failing to agree are therefore not both correct; one is non-conformant.
- **JIT, AOT, and interpreted execution are equivalent.** A JIT compiler, an AOT compiler, and a tree-walking interpreter implementing the same function-record specify the *same* $\mathrm{Cl}$-algebra structure; their outputs agree byte-identically (modulo non-deterministic effect channels per [effect-record](../objects/effect-record.md)). Performance differs; semantics do not.
- **Evaluator conformance is a decidable test.** Per [conformance-implies-substrate-properties](../../../theorems/conformance-implies-substrate-properties.md), a runtime's conformance reduces to checking that its evaluate operator is a $\mathrm{Cl}$-algebra structure on the function-record fiber. The conformance suite for runtimes is a finite battery of function-records with known fixed-points.
- **Higher-order functions inherit the algebra via the closed monoidal structure.** Functions that take functions as input (or return them as output) operate within the same fibration; their evaluate is the same $\mathrm{Cl}$-algebra on a larger fiber. The math entity making "no additional structural commitment is needed" precise is the [settling internal Hom](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-internal-hom.md): the category of settlings-with-rules is closed symmetric monoidal under $(\otimes_{\mathrm{settle}}, \mathcal{H}om_{\mathrm{settle}})$, and the tensor-Hom adjunction $\mathcal{H}om_{\mathrm{settle}}(A \otimes B, C) \cong \mathcal{H}om_{\mathrm{settle}}(A, \mathcal{H}om_{\mathrm{settle}}(B, C))$ *is* currying for substrate-content function records. Higher-order is not added structure on the runtime; it is the closed monoidal structure of the underlying settlings category.
- **Recursion terminates per the regime classification.** Recursive function evaluation drives the substrate toward a fixed point per the closure 2-monad's iteration; per [regime-classification-for-substrate](../../../theorems/regime-classification-for-substrate.md), the runtime's choice of regime determines whether recursion terminates in finite, $\omega$-many, or transfinite-bounded steps. Aperiodic regimes correspond to non-terminating recursion; the runtime can refuse to schedule such function-records (per [scott-continuous-regime-engineering-envelope](../../../theorems/scott-continuous-regime-engineering-envelope.md)).
- **Coinductive function bodies via fibered coinduction.** A function-record whose body is a corecursive definition (e.g., a stream-producing function whose evaluation is never globally complete but is locally productive) is the substrate-side instance of a terminal coalgebra in the function-record fiber. Per [fibered-coinduction](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/fibered-coinduction.md), the predication fibration admits a coinduction principle whenever the fibration admits quotient types — which the substrate does, via the [settling-equipped predication hyperdoctrine](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-coalgebra-structure.md). Bisimulation proofs for substrate function-records are therefore not a separate proof discipline; they are the standard fibered coinduction recipe applied to the runtime's coalgebra.

## What the theorem rules out

- **Implementation-defined evaluation order semantics.** A runtime that returns different outputs based on its choice of evaluation order (call-by-value vs call-by-name) for a *pure* function is not implementing the unique $\mathrm{Cl}$-algebra — it is non-conformant. Per the closure 2-monad's lax-idempotence, the fixed-point is unique; how the runtime gets there is implementation freedom, but the destination is fixed.
- **Hidden global state in pure functions.** A function declared pure that depends on a runtime-global value (current-time, environment-variable, allocator-state) is not a function on the function-record's declared input fiber — it is a function on a larger fiber that includes the global. Per [function-purity-replay-fidelity](function-purity-replay-fidelity.md), the substrate refuses such declarations.
- **Side-effecting evaluation pretending to be functional.** Effects that are not declared in the function-record's effect signature violate the algebra structure (the algebra maps $\mathrm{Cl}(\mathcal{E}) \to \mathcal{E}$ in the function-record fiber; side effects map to neighboring fibers). Per [graded-effects-via-q-enriched-fusion](graded-effects-via-q-enriched-fusion.md), effects must be declared and graded; undeclared effects are non-conformant.

## What the theorem requires

- The runtime's evaluate operator is presented within the predication fibration (per [predication-fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md)).
- The function-record carries a substrate-content body per [code-as-substrate](teaching/explanations/code-as-substrate.md).
- Effects are declared per the function-record's effect signature (per [effect-record](../objects/effect-record.md)).

## Position

Together with [type-soundness](type-soundness.md) (well-typed terms don't go wrong), [graded-effects-via-q-enriched-fusion](graded-effects-via-q-enriched-fusion.md) (effects compose multiplicatively), and [capability-non-amplification](capability-non-amplification.md) (capabilities don't grow), this theorem grounds the functional-runtime-platform's evaluation semantics in the predication-categories' closure-2-monad. Evaluation is the closure structure; types are fibration coordinates; effects are quantale grades; capabilities are modal restrictions. The runtime's four primary disciplines are four structural projections of the same fibration.
