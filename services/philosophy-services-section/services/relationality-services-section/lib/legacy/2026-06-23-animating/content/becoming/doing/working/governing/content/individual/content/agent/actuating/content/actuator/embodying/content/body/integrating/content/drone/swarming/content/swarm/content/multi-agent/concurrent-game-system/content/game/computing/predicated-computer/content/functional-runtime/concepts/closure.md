---
type: concept
class: program-unit
depends-on:
  - function
  - type
  - closure-2-monad
  - settling-internal-hom
  - predication-fiber-algebra
see-also:
  - invoke-function
  - evaluation-as-closure-2-monad-algebra
  - function-purity-replay-fidelity
  - graded-effects-via-q-enriched-fusion
---

# Closure

A *function paired with its captured environment*: a closure is a function that references values from its defining scope (its "free variables") at the time the closure is created, carrying those references with it when invoked elsewhere.

Per [evaluation-as-closure-2-monad-algebra](../theorems/evaluation-as-closure-2-monad-algebra.md) (proved), a closure is structurally a substrate-content [function-record](../objects/function-record.md) that has *absorbed some inputs into its body* — equivalently, the partial-application image of a function-record under the [settling internal Hom](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-internal-hom.md)'s tensor-Hom adjunction. Currying for substrate-content function records *is* the adjunction $\mathcal{H}om_{\mathrm{settle}}(A \otimes B, C) \cong \mathcal{H}om_{\mathrm{settle}}(A, \mathcal{H}om_{\mathrm{settle}}(B, C))$; a closure is the right-hand object instantiated at a specific value of its first argument. The closure inherits the *unique* $\mathrm{Cl}$-algebra structure of its underlying function-record per Kelly–Lack K2 — there is no separate "closure semantics" the runtime can choose; the captured environment composes with the body via the same closure 2-monad as ordinary function evaluation.

## Structural fields

- **Function reference ↔ underlying function-record.** The [function](function.md) the closure encloses. Structurally this is the function-record whose fiber the closure inhabits; the closure does not introduce a new fiber, only a partially-applied state in the existing one.
- **Captured environment ↔ absorbed-input cells.** The values (or references to substrate entities holding values) the function references but doesn't take as parameters. Structurally these are the inputs the tensor-Hom adjunction has already paired with the function-record on its left, leaving the right-hand $\mathcal{H}om$-object as the closure's invocation surface.
- **Capture mode ↔ capture-time fiber binding.** `by-value` (the captured values are snapshot at closure-creation: the absorbed cells are pinned to their values at the closure's birth-ordinal) or `by-reference` (the captured values are looked up at invocation time: the absorbed cells are projection morphisms from the substrate's current state at invocation-ordinal). Both modes are valid presentations of the partial application; they differ in *which substrate ordinal* the absorbed-input cells sample from.

Per [self-representation](../../teaching/explanations/self-representation.md), closures are substrate content. A closure's canonical-form hash is determined by `(function-hash, captured-environment-hash, capture-mode)`; per [hash-injectivity-under-canonical-form](../../../theorems/hash-injectivity-under-canonical-form.md), two closures with the same function, same captured environment, and same capture mode are byte-identical.

## Invocation is the same Cl-algebra

Per [invoke-function](../morphisms/invoke-function.md), closure invocation is structurally function invocation with the captured environment merged into the function's parameter scope — the substrate's $\odot$ on the function-record's fiber, with the absorbed cells participating as constants and the new inbound parameters as variables. Per the unique-up-to-unique-iso property of the Cl-algebra (Kelly–Lack K2), there is no semantic latitude in how a closure evaluates; any two runtimes implementing closure invocation correctly agree up to unique iso.

Per [function-purity-replay-fidelity](../theorems/function-purity-replay-fidelity.md), pure closures produce byte-identical outputs on byte-identical (parameters + captured-environment) tuples — the unique iso collapses to byte-identity exactly when the underlying function-record's coalgebra restriction is the function-record fiber alone (no neighboring fibers participate). For `by-value` capture this is straightforward (the absorbed cells are constants in the function-record's content); for `by-reference` capture purity holds only if the referenced cells' values at invocation match the values at the original invocation under replay — a stricter condition the substrate enforces via [snapshot-replay-fidelity](../../../theorems/snapshot-replay-fidelity.md).

## Closure patterns

Each conventional closure pattern corresponds to a specific shape on the partial-application image:

- **Callbacks ↔ closure-passed-as-message.** A closure passed to another function for later invocation. Structurally the closure cell is one cell in a [channel](channel.md) fiber per [channels-as-residuated-rendezvous](../theorems/channels-as-residuated-rendezvous.md); the receiver's invocation of the closure is the standard $\mathrm{Cl}$-algebra application on the function-record fiber.
- **Partial applications ↔ pure tensor-Hom adjunction.** A function partially applied to some of its arguments, returning a closure waiting for the rest. Structurally this is exactly the adjunction $\mathcal{H}om_{\mathrm{settle}}(A \otimes B, C) \cong \mathcal{H}om_{\mathrm{settle}}(A, \mathcal{H}om_{\mathrm{settle}}(B, C))$ — partial application is the canonical isomorphism between the two sides.
- **Higher-order continuations ↔ captured-control-context closures.** Closures that capture continuation context for later resumption. Structurally these absorb not just values but the substrate's evaluation-state cell (a sub-cell of the function-record fiber recording where the calculation paused); resumption is the standard $\mathrm{Cl}$-algebra step from the captured state.
- **Event handlers ↔ closures bound to substrate-trigger cells.** Closures bound to substrate events that fire when triggers match. Structurally the binding is an accessibility cell from the trigger predicate to the closure's fiber; firing is the substrate's $\odot$ that fuses the trigger event into the closure's parameter list.

## Engineering invariants

- **Inherits the unique Cl-algebra.** Per [evaluation-as-closure-2-monad-algebra](../theorems/evaluation-as-closure-2-monad-algebra.md), the closure's invocation has no semantic latitude beyond the underlying function-record's. Two runtimes implementing closure invocation agree up to unique iso; one disagreement means one runtime is non-conformant.
- **Pure-closure replay fidelity.** Per [function-purity-replay-fidelity](../theorems/function-purity-replay-fidelity.md), pure closures replay byte-identically when the captured environment is also byte-identical at replay. For `by-value` this is automatic (the values are pinned at creation); for `by-reference` this requires the substrate's snapshot-replay discipline to reconstitute the referenced cells.
- **Higher-order via the closed monoidal structure.** Per the theorem's "higher-order functions inherit the algebra via the closed monoidal structure" engineering consequence, closures-of-closures (functions returning closures, closures taking closures) compose under the same $(\otimes_{\mathrm{settle}}, \mathcal{H}om_{\mathrm{settle}})$ closed symmetric monoidal structure. There is no separate "higher-order machinery" in the runtime; the closed monoidal structure of the underlying settlings category is the machinery.
- **Effect signatures pass through capture.** Per [graded-effects-via-q-enriched-fusion](../theorems/graded-effects-via-q-enriched-fusion.md), the effect signature of a closure is the effect signature of its underlying function-record with the absorbed inputs' read-effects fused in. Capturing a value reads it once at creation (`by-value`) or at every invocation (`by-reference`); the read-effects compose multiplicatively in the quantale grade.
- **Capability bundling.** Per [capability-non-amplification](../theorems/capability-non-amplification.md), a closure that captures a [capability](capability.md) carries it as an absorbed-input cell; subsequent invocations of the closure exercise the captured capability as if passed at the call site. The modal-necessity restriction $\Box_R$ along the closure's call edges still applies, so capability non-amplification holds: a closure cannot exercise more authority than the captured capabilities admit.
- **Self-representable.** Per [self-representation](../../teaching/explanations/self-representation.md), closures are substrate content. Creating, invoking, or discarding a closure is editing predications; the closure-record's content-hash determines its identity, and downstream invocations that pinned the prior hash continue to invoke the prior closure even if the underlying function-record changes.
- **Federation-portable when pure.** Per [federation-convergence](../../../theorems/federation-convergence.md), a pure `by-value` closure invoked on the same input on two substrates produces byte-identical outputs — the closure's content is fully on-substrate, and the cross-substrate evaluations sit on the same $\mathrm{Cl}$-algebra. `By-reference` closures with cross-substrate references require the referenced cells to converge under federation merge for the closure invocations to converge.

## What the discipline refuses

- **Implicit capture from ambient runtime state.** A "closure" that reads ambient runtime state (a thread-local, a global registry) without recording the read in its captured environment is not a closure — it is a function with hidden inputs. Per the underlying function-purity-replay-fidelity rule-out, replay diverges.
- **Capture-mode-dependent semantics under purity.** A pure function that returns different outputs when wrapped in a `by-value` closure vs a `by-reference` closure (with the same captured-environment values at the moment of invocation) is non-conformant: the unique-iso of the Cl-algebra forbids this.
- **Capture of non-substrate references.** A closure whose captured environment includes references outside the substrate (raw OS handles, native pointers) is not substrate-content; per [self-representation](../../teaching/explanations/self-representation.md), it cannot be hashed, replayed, or federated. The substrate's discipline is to wrap such handles in capability-records before capture, so the closure's content is fully on-substrate.
- **Closure invocation that bypasses the modal restriction.** A closure-invocation surface that admits operations the captured capabilities do not authorize violates [capability-non-amplification](../theorems/capability-non-amplification.md) at the closure's call edge. The modal-necessity check is the same one that applies to ordinary function invocation.
- **Non-witnessed capture of mutable state.** A `by-reference` closure capturing a cell that subsequently changes without the change being witnessed in the substrate's event log breaks audit-replayability: an auditor cannot reconstitute which value the closure observed at invocation. Per [witness-as-cell](../../../theorems/witness-as-cell.md), the capture and every subsequent observation are themselves cells in the predication graph.

## Position in the platform

Closure is the functional-runtime platform's *partial-application surface*: the substrate's representation of a function with some of its inputs already pinned, ready to be invoked on the rest. Together with [function](function.md) (the computation unit the closure encloses), [type](type.md) (the fiber-coordinate declaration the closure inhabits), [invoke-function](../morphisms/invoke-function.md) (the morphism that completes the application), [capability](capability.md) (one common kind of captured value), and [effect](effect.md) (the quantale grade the closure carries), closure completes the platform's account of how the closed monoidal structure of the underlying settlings category surfaces in the engineer-facing programming model. The substrate-side observable of every closure invocation is the same $\mathrm{Cl}$-algebra application as ordinary function evaluation; closures are not a parallel evaluation engine, only a presentation of partial-application against the unique semantics the closure 2-monad provides.
