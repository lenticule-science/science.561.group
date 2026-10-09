---
type: theorem
class: engineering-claim
status: proved
depends-on: [effect, effect-record, function, function-record, invoke-function, graded-dispatch-via-q-enriched-fusion, quantale-enriched-sheaf, twist-product-fusion, predication-fiber-algebra]
see-also: [evaluation-as-closure-2-monad-algebra, capability-non-amplification, federation-path-metrics-multiplicative]
---

# Effect signatures form a quantale; effect composition is q-enriched fusion

**Claim.** A function's [effect signature](teaching/explanations/effect.md) — the declaration of what side-channels (I/O, allocation, time, divergence, exception, capability use) the function commits to — is an element of a commutative unital quantale $\mathsf{Q}_{\mathrm{eff}}$. The composition of effects across function calls is exactly the [twist-product fusion](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md) on a [quantale-enriched](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/quantale-enriched-sheaf.md) [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md), per the parent's [graded-dispatch-via-q-enriched-fusion](../../../theorems/graded-dispatch-via-q-enriched-fusion.md). The runtime's effect-tracking discipline is therefore not a separate type-system extension; it is the q-enriched grade component of the substrate's standard predication-cell value.

## Why this holds

Per [graded-dispatch-via-q-enriched-fusion](../../../theorems/graded-dispatch-via-q-enriched-fusion.md), the substrate's $\odot$ operator on a $\mathsf{Q}$-enriched fiber decomposes into a bilattice tag and a quantale grade, with the grade composing multiplicatively across sequential operations.

For effects:

- **Bilattice tag.** Whether the function commits to the effect at all (modal: present / absent / inconsistent / unknown).
- **Quantale grade.** The strength / cost / scope of the effect — a Lawvere-quantale latency for I/O, an additive-quantale allocation byte count for memory, a bounded-lattice resource ceiling for fuel/budget.

Different effect kinds correspond to different quantales:

- **Latency / wall-time.** $\mathsf{Q} = ([0, \infty], +, \min)$ — the [Lawvere quantale](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/examples/benchmarks/benchmark-lawvere-quantale-settling.md). Sequential composition adds; parallel composition takes the min.
- **Allocation / memory.** $\mathsf{Q} = (\mathbb{N}, +, 0)$ with $\preceq$ as $\leq$. Sequential composition adds bytes.
- **Capability use.** $\mathsf{Q} = (\mathcal{P}(K), \cup, \varnothing)$ — power-set of capability-keys; composition unions.
- **Divergence / fuel.** $\mathsf{Q} = (\mathbb{N} \cup \{\infty\}, +, 0)$ with the $\infty$-absorbing convention.
- **Exception / partiality.** $\mathsf{Q} = \mathbf{2}$ (Boolean) — total or possibly-bottoming. Composition is logical-or.

Per the [quantale-enriched-sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/quantale-enriched-sheaf.md) framework, multiple effect kinds compose via the *product quantale* $\mathsf{Q}_{\mathrm{eff}} = \mathsf{Q}_{\mathrm{lat}} \times \mathsf{Q}_{\mathrm{alloc}} \times \mathsf{Q}_{\mathrm{cap}} \times \mathsf{Q}_{\mathrm{div}} \times \cdots$. The product quantale is itself a commutative unital quantale; the substrate's $\odot$ at a function-call boundary handles all effect dimensions in one operation.

Per [graded-dispatch-via-q-enriched-fusion](../../../theorems/graded-dispatch-via-q-enriched-fusion.md), the multiplicative composition is *federation-stable* — effect grades cross substrate boundaries multiplicatively without ambiguity.

## Engineering consequence

- **Effect inference is grade computation.** A function that calls $f$ then $g$ has effect grade $\mathrm{eff}(f) \cdot \mathrm{eff}(g)$ in $\mathsf{Q}_{\mathrm{eff}}$ — the runtime computes effect signatures by quantale-grade arithmetic, not by separate analysis passes.
- **Effect handlers are quantale homomorphisms.** A handler that converts one effect class to another (e.g., `IO` to `IO + Logging`) is a $\mathsf{Q}$-homomorphism that lifts grades coherently. Per the homomorphism property, handler composition is sound.
- **Resource bounds are quantale ceilings.** A function's resource budget (max fuel, max allocation, max latency) is a $\preceq$-upper-bound in $\mathsf{Q}_{\mathrm{eff}}$. Per [resource-bound-respects-locality](../../../theorems/resource-bound-respects-locality.md), the runtime enforces the bound by checking $\mathrm{eff}(\text{call chain}) \preceq \text{budget}$ before invocation.
- **Effect equivalence classes per the q-fuzzy equivalence.** Two functions with effect grades within $q$ of each other in $\mathsf{Q}_{\mathrm{eff}}$ are interchangeable for purposes the platform considers $q$-tolerant (e.g., latency within 10ms is "the same" for soft-real-time scheduling). Per [q-fuzzy-equivalence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/q-fuzzy-equivalence.md), the runtime uses this equivalence for hot-swap, A/B testing, and adaptive scheduling decisions.
- **Pure functions are the unit of $\mathsf{Q}_{\mathrm{eff}}$.** A pure function has effect grade $1$ (the quantale identity); composing with a pure function preserves the caller's grade exactly. This recovers the standard purity intuition as the structural identity of effect composition.
- **Graded effects compose with capability discipline.** Per [capability-non-amplification](capability-non-amplification.md), capability use is itself a quantale grade (the power-set quantale on capability-keys); the same $\odot$ operation composes capability use along call chains, so capability-tracking and effect-tracking share machinery.

## What the theorem rules out

- **Effect systems based on subtyping or interface inheritance.** A subtyping-based effect system requires the effect lattice to admit a meet-semilattice that is not a quantale (no multiplicative composition). Per the theorem, multiplicative composition is the substrate's discipline; subtyping-only effects are non-conformant for tracking sequential cost.
- **Hidden effects.** An effect not represented in $\mathsf{Q}_{\mathrm{eff}}$ has no quantale grade and cannot be composed. Per [evaluation-as-closure-2-monad-algebra](evaluation-as-closure-2-monad-algebra.md), undeclared effects break the algebra structure.
- **Non-distributive cost models.** A cost model where $p \cdot \bigvee q_i \neq \bigvee (p \cdot q_i)$ is not a quantale — it cannot be lifted into the $\mathsf{Q}$-enriched fiber. Per [graded-dispatch-via-q-enriched-fusion](../../../theorems/graded-dispatch-via-q-enriched-fusion.md), the substrate refuses such cost models.

## What the theorem requires

- Each effect kind admits a commutative unital quantale presentation (per [quantale-enriched-sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/quantale-enriched-sheaf.md)).
- The runtime's $\odot$ implementation respects the quantale's $\cdot$ on the grade dimension.
- The function record declares its effect signature per [effect-record](../objects/effect-record.md).

## Position

Together with [evaluation-as-closure-2-monad-algebra](evaluation-as-closure-2-monad-algebra.md) (evaluation as algebra), [type-soundness](type-soundness.md) (typing as fibration), and [capability-non-amplification](capability-non-amplification.md) (capabilities as modal restriction), this theorem grounds the functional-runtime-platform's effect discipline in the q-enriched-sheaf machinery. The runtime's four disciplines — types, effects, capabilities, evaluation — sit at four structural coordinates of the same predication fibration: types in the base, effects in the quantale grade, capabilities in the modal accessibility, evaluation in the closure algebra.
