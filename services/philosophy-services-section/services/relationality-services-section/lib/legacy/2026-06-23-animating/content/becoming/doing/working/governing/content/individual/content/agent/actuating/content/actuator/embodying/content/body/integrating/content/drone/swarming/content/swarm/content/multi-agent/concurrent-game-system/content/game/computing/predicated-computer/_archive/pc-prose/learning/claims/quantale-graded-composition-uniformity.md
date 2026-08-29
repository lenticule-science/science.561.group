---
type: theorem
class: engineering-claim
status: proved
depends-on: [continuous-valued-settling, quantale-enriched-sheaf, q-enriched-cohomology, lawvere-quantale-settling, federation-trust-bilattice-graded, federation-path-metrics-multiplicative, graded-dispatch-via-q-enriched-fusion, cost-composition-via-lawvere-quantale, telemetry-as-continuous-valued-settling-projection]
see-also: [interfacer-counit-law-uniformity, paraconsistency-as-substrate-discipline, modal-restriction-as-substrate-authorization-primitive]
---

# Quantale-graded composition is the substrate's universal continuous-valued-dimension discipline

**Claim.** The substrate's seven (and counting) continuous-valued dimensions — federation trust grades (per [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md)), federation path metrics (per [federation-path-metrics-multiplicative](federation-path-metrics-multiplicative.md)), dispatch matching (per [graded-dispatch-via-q-enriched-fusion](graded-dispatch-via-q-enriched-fusion.md)), cost composition (per [cost-composition-via-lawvere-quantale](cost-composition-via-lawvere-quantale.md)), telemetry/metrics (per [telemetry-as-continuous-valued-settling-projection](telemetry-as-continuous-valued-settling-projection.md)), network bandwidth, latency, reliability — are *structurally one composition pattern*: a [continuous-valued settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/continuous-valued-settling.md) in a commutative unital quantale $\mathcal{V}$, with composition via $\mathcal{V}$'s binary operation $\otimes$ and aggregation via $\mathcal{V}$'s arbitrary join.

The dimensions differ in *which quantale* $\mathcal{V}$ they use ($([0, \infty], +, \min)$ for additive cost, $([0, 1], \cdot, \max)$ for reliability, $\mathbf{L}^\bowtie$ for trust grades, etc.) but the structural property (commutative unital quantale, composition via $\otimes$, distributivity over suprema) is uniform.

## Why this holds

Per [continuous-valued-settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/continuous-valued-settling.md), the substrate's framework extends to value-domains beyond the bilattice — Lawvere quantales, fuzzy lattices, real-valued residuated lattices. Each continuous-valued substrate dimension is an instance of this extension.

Per [quantale-enriched-sheaf](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/quantale-enriched-sheaf.md), a $\mathcal{V}$-enriched sheaf carries hom-objects in $\mathcal{V}$. Each substrate's continuous dimension is a $\mathcal{V}$-enriched sheaf:

**[federation-trust-bilattice-graded](federation-trust-bilattice-graded.md).** $\mathcal{V} = \mathbf{L}^\bowtie$ (the bilattice itself, viewed as a quantale). Trust grades compose via the bilattice's $\odot$ along federation edges.

**[federation-path-metrics-multiplicative](federation-path-metrics-multiplicative.md).** $\mathcal{V} = ([0, \infty], +, \min)$ for latency, $([0, 1], \cdot, \max)$ for reliability, $([0, \infty], \min, \infty)$ for bandwidth bottleneck. Path metrics compose along federation paths.

**[graded-dispatch-via-q-enriched-fusion](graded-dispatch-via-q-enriched-fusion.md).** $\mathcal{V}$ is the dispatcher's chosen quantale (typically a product quantale combining capability-fit, cost, value). Dispatch matches compose via the quantale's product.

**[cost-composition-via-lawvere-quantale](cost-composition-via-lawvere-quantale.md).** $\mathcal{V} = ([0, \infty], +, \min)$. Substrate operation costs compose additively along causal chains.

**[telemetry-as-continuous-valued-settling-projection](telemetry-as-continuous-valued-settling-projection.md).** $\mathcal{V}$ is the chosen telemetry quantale (per dimension: latency, throughput, error rate). Telemetry composes via the quantale.

**Network bandwidth.** $\mathcal{V} = ([0, \infty], \min, \infty)$. Bandwidth along a path is the bottleneck (min) across the path.

**Latency.** $\mathcal{V} = ([0, \infty], +, \min)$. Latency along a path is the sum of per-hop latencies.

**Reliability.** $\mathcal{V} = ([0, 1], \cdot, \max)$. Reliability is the product of independent components.

In each case:

- $\mathcal{V}$ is a commutative unital quantale (associative-commutative-unital binary operation, distributive over arbitrary joins).
- The substrate's continuous-valued dimension is a $\mathcal{V}$-enriched sheaf or settling.
- Composition along causal chains, federation paths, dispatch chains is via the quantale's $\otimes$.
- Aggregation across parallel branches is via the quantale's join.

Per [q-enriched-cohomology](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/q-enriched-cohomology.md), the cohomology of a $\mathcal{V}$-enriched sheaf is itself $\mathcal{V}$-valued — so substrate metrics (per [metric](teaching/explanations/metric.md)) are $\mathcal{V}$-valued cohomology classes of telemetry settlings.

## Engineering consequence

- **One composition implementation.** A substrate that implements $\mathcal{V}$-composition once *gets all seven dimensions*. The implementation is parameterized by which quantale each dimension uses; the composition machinery is shared.
- **Composition is structurally well-defined.** Per the quantale axioms (distributivity over suprema), parallel-branch composition is independent of branch order. Per [event-causality-via-lorentzian-settling](event-causality-via-lorentzian-settling.md), spacelike-separated branches admit any order; per the quantale's distributivity, their composed value is well-defined.
- **Cross-dimension composition via product quantales.** Multi-dimensional composition (e.g., dispatch matches need to combine capability-fit, cost, and value) uses a *product quantale* $\mathcal{V}_1 \times \mathcal{V}_2 \times \mathcal{V}_3$. Per the quantale axioms, products of quantales are quantales; composition is pointwise.
- **Federation-graph metrics are quantale-paths.** Per [federation-path-metrics-multiplicative](federation-path-metrics-multiplicative.md), federation paths compose metrics via the quantale; per the theorem's uniformity, this works for any $\mathcal{V}$, not just latency or reliability — substrates can choose what dimension to optimize federation routing on.
- **Cost prediction is quantale-arithmetic.** A substrate predicting "if I do this work-chain, what's the total cost?" runs $\mathcal{V}$-composition on per-step costs. Per the quantale's structure, the prediction is exact (modulo per-step cost-estimate accuracy).
- **Conformance covers all dimensions uniformly.** Per [conformance-via-fiber-algebra-functor](conformance-via-fiber-algebra-functor.md), conformance verifies functorial realization. Per the theorem, conformance on $\mathcal{V}$-composition reduces to verifying the chosen quantales satisfy the axioms and the composition implementation respects them — one structural test per dimension.

## Why this matters: the comparison to ad-hoc cost models

Most production systems use ad-hoc cost models — heuristic cost-functions per use case (database query optimizer cost, network routing cost, scheduler cost) with hand-crafted composition rules. The result: composition is per-system, predictability is poor, federation is hard.

Per the theorem, the substrate's approach is structurally principled — every continuous-valued dimension is a quantale, composition is the quantale's $\otimes$, aggregation is the quantale's join. The substrate's runtime can compose across dimensions (per the product-quantale construction), across federation (per [federation-path-metrics-multiplicative](federation-path-metrics-multiplicative.md)), across causal chains (per [cost-composition-via-lawvere-quantale](cost-composition-via-lawvere-quantale.md)) using one structural mechanism.

This is the substrate's structural answer to "how do I quantitatively reason about my system's performance, cost, and trust without per-system bespoke cost models?" — by representing all continuous-valued dimensions as quantales and using their structural composition.

## What the theorem rules out

- **Per-dimension composition implementations.** A substrate that has separate composition for cost vs trust vs latency vs throughput is implementing the same quantale-composition machinery many times. Per the theorem, one parameterized implementation suffices.
- **Non-quantale composition.** A composition that doesn't satisfy the quantale axioms (commutativity, associativity, unit, distributivity over joins) is not a quantale — it's a different mathematical structure. Per the theorem, the substrate's continuous-valued composition is bounded to quantale-respecting operations.
- **Heuristic cost models.** Per the theorem, cost composition is structurally determined by the quantale; ad-hoc heuristics are non-conformant. The substrate's discipline is to declare the quantale and compose per its axioms.
- **Composition that loses the quantale's join distributivity.** A composition that's commutative-and-associative but doesn't distribute over arbitrary suprema is missing the quantale's key property — per [continuous-valued-settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/continuous-valued-settling.md), distributivity is what makes parallel-branch composition order-independent.

## What the theorem requires

- Each continuous-valued substrate dimension uses a commutative unital quantale (per [quantale-enriched-sheaf](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/quantale-enriched-sheaf.md)).
- The substrate's runtime implements $\mathcal{V}$-composition per the quantale's axioms.
- Per-dimension theorems hold individually ([federation-trust-bilattice-graded](federation-trust-bilattice-graded.md), [federation-path-metrics-multiplicative](federation-path-metrics-multiplicative.md), etc.).
- Cross-dimension composition uses product quantales when needed.

## Position

This theorem is the substrate's *uniformity claim about continuous-valued composition*. Together with [substrate-runtime-as-closure-driven-settling](substrate-runtime-as-closure-driven-settling.md) (one runtime), [modal-restriction-as-substrate-authorization-primitive](modal-restriction-as-substrate-authorization-primitive.md) (one authorization), [interfacer-counit-law-uniformity](interfacer-counit-law-uniformity.md) (one boundary discipline), and [paraconsistency-as-substrate-discipline](paraconsistency-as-substrate-discipline.md) (one contradiction-handling), the substrate's architecture is *one mechanism per fundamental concern*: runtime, authorization, boundaries, contradictions, continuous composition.

The five uniformity theorems together describe the substrate's *structural simplicity behind its functional richness* — the substrate covers what a real-world computer system does, but the implementation is structurally one mechanism per concern, not many. Implementers don't have to learn five subsystems per concern; they implement the structural primitive once and instantiate per surface.

This is the substrate's answer to "how does it stay buildable as it scales to cover everything from per-cell admission to cross-substrate federation to LLM-agent orchestration?" — because its complexity is in *how the surfaces compose*, not in *how many distinct mechanisms it implements*.
