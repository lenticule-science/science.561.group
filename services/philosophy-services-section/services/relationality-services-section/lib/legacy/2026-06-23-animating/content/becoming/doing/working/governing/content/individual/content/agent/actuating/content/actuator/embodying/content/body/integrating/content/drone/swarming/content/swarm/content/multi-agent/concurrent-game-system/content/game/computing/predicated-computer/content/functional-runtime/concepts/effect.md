---
type: concept
class: program-annotation
depends-on:
  - function
  - capability
  - settlement-determinism
  - quantale-enriched-sheaf
  - twist-product-fusion
  - predication-fiber-algebra
see-also:
  - capability-passing
  - graded-effects-via-q-enriched-fusion
  - evaluation-as-closure-2-monad-algebra
  - capability-non-amplification
---

# Effect

A *typed annotation on function execution* declaring what the function does *in addition to* returning its result. Effects make a function's external interactions explicit at the type level, enabling type-checking to verify that effects are appropriate for the calling context.

Per [graded-effects-via-q-enriched-fusion](../theorems/graded-effects-via-q-enriched-fusion.md) (proved), an effect signature is structurally an element of a commutative unital quantale $\mathsf{Q}_{\mathrm{eff}}$, and effect composition across function calls is exactly the [twist-product fusion](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md) on a [quantale-enriched](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/quantale-enriched-sheaf.md) [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md). Effects are not a separate type-system extension — they are the q-enriched grade component of the substrate's standard predication-cell value. Each effect predication carries a *bilattice tag* (whether the function commits to the effect at all — present / absent / inconsistent / unknown) and a *quantale grade* (the strength, cost, or scope of the effect).

## Structural fields

Each common effect is one quantale-grade dimension on the function's effect signature:

- **`Pure` ↔ quantale identity.** No effects beyond returning a value. Per the theorem's "pure functions are the unit" engineering consequence, $\mathrm{eff}(\text{pure}) = 1_{\mathsf{Q}_{\mathrm{eff}}}$; composing with a pure function preserves the caller's grade exactly. Per [function-purity-replay-fidelity](../theorems/function-purity-replay-fidelity.md), pure functions are also byte-identically replayable — the unit of $\mathsf{Q}_{\mathrm{eff}}$ corresponds to the function-record-fiber-only coalgebra restriction.
- **`Read[Resource]` ↔ free quantale element.** Reads from a substrate resource without modifying it. Per [cost-discipline-reads-free](../../../theorems/cost-discipline-reads-free.md), pure reads compose as $1$ in the cost dimensions of $\mathsf{Q}_{\mathrm{eff}}$ — they have a bilattice tag (the read happened) but a free quantale grade.
- **`Write[Resource]` ↔ capability-grade element.** Writes to a substrate resource. Requires a [capability](capability.md) granting write access; structurally the effect's quantale grade in the capability dimension is $\{w_r\}$ (the singleton power-set marking the write capability used), composed multiplicatively along call chains.
- **`Throw[Exception]` ↔ exception-quantale element.** May throw an exception of a specified type. Structurally the partiality quantale $\mathsf{Q} = \mathbf{2}$ (Boolean: total or possibly-bottoming), composed by logical-or along call chains. The caller's effect signature inherits the throw possibility unless a handler discharges it.
- **`IO[Resource]` ↔ Lawvere-quantale element.** Performs external I/O on the named resource (file, network, database). The latency dimension uses the Lawvere quantale $\mathsf{Q} = ([0, \infty], +, \min)$ — sequential composition adds latencies; parallel composition takes the min.

The remaining standard effect kinds are *instantiations* of the product-quantale framework along dimensions not enumerated in the theorem's explicit table; per the theorem's "different effect kinds correspond to different quantales" warrant, each is presentable as a commutative unital quantale and admitted into $\mathsf{Q}_{\mathrm{eff}}$ by product:

- **`Async` ↔ scheduling dimension (derived).** Produces a future/promise rather than an immediate result. Async functions integrate with the substrate's wait/await machinery via the [channel](channel.md) fiber; structurally a future is a Bounded-1 channel per [channels-as-residuated-rendezvous](../theorems/channels-as-residuated-rendezvous.md), and the async grade is the channel's rendezvous accessibility lifted into a quantale presentation.
- **`Random` ↔ entropy dimension (derived).** Uses randomness; non-deterministic. Per [witness](../../../objects/witness.md), the entropy source's hash is recorded in the witness; the entropy dimension is presented as a power-set quantale on entropy-source identifiers, with composition unioning the sources used so two functions with the same set of entropy hashes are interchangeable for replay.
- **`ModelInvoke` ↔ entropy × latency product (derived).** Invokes a frontier AI model. Non-deterministic; per the witness, the model's response hash is recorded. The grade is the product of the entropy dimension (model identity + invocation seed) and the latency dimension already established by `IO`.
- **`Federated` ↔ multiplicative cross-substrate grade.** Produces effects on a federated peer substrate. Per the theorem, the multiplicative composition is *federation-stable* — effect grades cross substrate boundaries multiplicatively without ambiguity.

The runtime composes multiple effect kinds via the *product quantale* $\mathsf{Q}_{\mathrm{eff}} = \mathsf{Q}_{\mathrm{lat}} \times \mathsf{Q}_{\mathrm{alloc}} \times \mathsf{Q}_{\mathrm{cap}} \times \mathsf{Q}_{\mathrm{div}} \times \mathsf{Q}_{\mathrm{exc}} \times \cdots$, which is itself a commutative unital quantale; the substrate's $\odot$ at a function-call boundary handles all effect dimensions in one operation.

## Effect composition is grade arithmetic

Per the theorem, a function that calls $f$ then $g$ has effect grade

$$\mathrm{eff}(f; g) \;=\; \mathrm{eff}(f) \cdot \mathrm{eff}(g) \quad \text{in } \mathsf{Q}_{\mathrm{eff}}$$

— the runtime computes effect signatures by quantale-grade arithmetic, not by separate analysis passes. Effect *inference* is the substrate's traversal of the call graph composing grades along the way; the closed-form is the same $\odot$ that powers refinement-checking, channel send/receive, lock acquire/release, and capability composition. The runtime's six structural disciplines (typing, refinement, effect, capability, evaluation, channel/lock) sit at six coordinates of *one* predication fibration; effect occupies the quantale-grade coordinate.

## Engineering invariants

- **Effect inference is grade computation.** Per the theorem's first engineering consequence, the runtime computes effect signatures by quantale-grade arithmetic. Adding a new effect inference rule is choosing a quantale presentation, not implementing a new analysis pass.
- **Effect handlers are quantale homomorphisms.** Per the theorem's second engineering consequence, a handler that converts one effect class to another (e.g., `IO` to `IO + Logging`) is a $\mathsf{Q}$-homomorphism that lifts grades coherently. Handler composition is sound because homomorphism composition is.
- **Resource bounds are quantale ceilings.** Per the theorem's third engineering consequence and [resource-bound-respects-locality](../../../theorems/resource-bound-respects-locality.md), a function's resource budget (max fuel, max allocation, max latency) is a $\preceq$-upper-bound in $\mathsf{Q}_{\mathrm{eff}}$. The runtime enforces the bound by checking $\mathrm{eff}(\text{call chain}) \preceq \text{budget}$ before invocation.
- **Equivalence-up-to-q.** Per the theorem's fourth engineering consequence and [q-fuzzy-equivalence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/q-fuzzy-equivalence.md), two functions with effect grades within $q$ of each other in $\mathsf{Q}_{\mathrm{eff}}$ are interchangeable for purposes the platform considers $q$-tolerant (e.g., latency within 10ms is "the same" for soft-real-time scheduling). The runtime uses this equivalence for hot-swap, A/B testing, and adaptive scheduling decisions.
- **Pure as identity.** Per the theorem's fifth engineering consequence, a pure function has effect grade $1$ (the quantale identity). This recovers the standard purity intuition as the structural identity of effect composition; no special case is needed in the inference engine.
- **Capability-effect integration.** Per the theorem's sixth engineering consequence and [capability-non-amplification](../theorems/capability-non-amplification.md), capability use is itself a quantale grade (the power-set quantale on capability-keys); the same $\odot$ operation composes capability use along call chains, so capability-tracking and effect-tracking share machinery rather than running as parallel pipelines.
- **Modal restrictions on top of the grade.** Per [governance-as-modal-restriction](../../agential-orchestration-platform/theorems/governance-as-modal-restriction.md) (status: sketch), effects map to modal restrictions: a function with effect `Write[B]` requires the modal authorization $\Box_R$ for write-access to $B$ to evaluate to non-falsifying at the invocation context. The grade tells you how much you'd write; the modal tag tells you whether you're allowed to.
- **Capability-passing makes effects explicit.** Per [capability-passing](capability-passing.md), capability-based effect systems require the caller to *pass* the capability to the callee — making effect requirements explicit at the call site rather than implicit in ambient permissions. Structurally the call edge carries the capability cell into the callee's accessibility relation, and the grade composition tracks which capabilities flowed where.

## What the discipline refuses

- **Effect systems based only on subtyping or interface inheritance.** Per the theorem's first rule-out, a subtyping-based effect system requires the effect lattice to admit a meet-semilattice that is not a quantale (no multiplicative composition). Multiplicative composition is the substrate's discipline; subtyping-only effects are non-conformant for tracking sequential cost.
- **Hidden effects.** Per the theorem's second rule-out, an effect not represented in $\mathsf{Q}_{\mathrm{eff}}$ has no quantale grade and cannot be composed. Per [evaluation-as-closure-2-monad-algebra](../theorems/evaluation-as-closure-2-monad-algebra.md), undeclared effects break the algebra structure: the runtime's evaluate operator is no longer a $\mathrm{Cl}$-algebra on the declared function-record fiber.
- **Non-distributive cost models.** Per the theorem's third rule-out, a cost model where $p \cdot \bigvee q_i \neq \bigvee (p \cdot q_i)$ is not a quantale — it cannot be lifted into the $\mathsf{Q}$-enriched fiber. The substrate refuses such cost models; a runtime claiming to track such costs is not implementing the q-enriched discipline.
- **Effect annotation drift.** A function whose runtime behavior carries grades not declared in its effect signature is structurally incoherent: the substrate's $\odot$ along a call chain into this function produces a grade the type-checker did not see. Per [conformance-implies-substrate-properties](../../../theorems/conformance-implies-substrate-properties.md), conformance testing surfaces such drift.
- **Per-effect-kind separate engines.** A runtime that ships one engine for tracking latency, another for tracking allocation, another for tracking capability use, etc., duplicates structure the product quantale gives uniformly. The substrate computes one $\odot$ at each call boundary, fusing all dimensions in one operation.

## Position in the platform

Effect is the functional-runtime platform's *quantale-grade discipline*: the substrate's representation of what side-channels a function commits to and at what cost, composed multiplicatively along call chains. Together with [function](function.md) (the computation unit whose body fixes the grade contribution), [capability](capability.md) (the modal-accessibility discipline that one of the grade dimensions tracks), [type](type.md) (the predication-fibration base over which the grade is computed), [refined-type](refined-type.md) (the comprehension that further constrains the inputs), [channel](channel.md) and [lock](lock.md) (residuated and refined sub-fibers that the grade composes through), effect closes the platform's account of what a function commits to beyond its return value. The substrate-side observable of every function evaluation is one $\odot$ application on the q-enriched fiber; the entire tower of effect-tracking engineering — inference, handler composition, resource bounds, equivalence-up-to-tolerance, pure-as-identity, federation portability — falls out of the quantale axioms applied to that $\odot$.
