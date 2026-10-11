---
type: theorem
class: engineering-claim
status: proved
depends-on: [cost-discipline, fuel-bound, lawvere-quantale-settling, continuous-valued-settling, settlement-via-closure-2-monad, federation-path-metrics-multiplicative]
see-also: [telemetry-as-continuous-valued-settling-projection, federation-path-metrics-multiplicative]
---

# Substrate cost composes by Lawvere-quantale arithmetic

**Claim.** For any substrate computation traversing a sequence of operations $O_1, O_2, \dots, O_n$ with per-operation costs $c_1, c_2, \dots, c_n \in \mathcal{V}$ (where $\mathcal{V}$ is the substrate's chosen [Lawvere quantale](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/examples/benchmark-lawvere-quantale-settling.md), typically $([0, \infty], +, \min)$ for additive cost or $([0, 1], \cdot, \max)$ for multiplicative reliability), the total cost of the computation is

$$c_\mathrm{total} \;=\; c_1 \otimes c_2 \otimes \dots \otimes c_n$$

where $\otimes$ is the quantale's binary operation (addition for $[0, \infty]$, multiplication for $[0, 1]$). Reads contribute the unit $0$ (in $[0, \infty]$) or $1$ (in $[0, 1]$); settlements contribute positive cost. Per [federation-path-metrics-multiplicative](federation-path-metrics-multiplicative.md), this composition extends to federation-graph paths.

## Why this holds

Per [continuous-valued-settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/continuous-valued-settling.md), the substrate's runtime cost is a continuous-valued settling in the Lawvere quantale $\mathcal{V}$. Per [settlement-via-closure-2-monad](settlement-via-closure-2-monad.md), the substrate's computation is the iteration of the closure 2-monad to fixed point — a sequence of operations.

Per the Lawvere quantale's structure ($([0, \infty], +, \min)$ as the canonical example):

- The quantale is commutative and unital — $0$ is the additive unit.
- The quantale binary operation $\otimes$ (here $+$) distributes over arbitrary suprema — $a + \bigvee_i b_i = \bigvee_i (a + b_i)$.
- The quantale's order is the natural reverse — smaller cost is "better."

A composition of operations $O_1 \to O_2 \to \dots \to O_n$ is a path in the substrate's causal graph; per [event-causality-via-lorentzian-settling](event-causality-via-lorentzian-settling.md), the path's events are timelike-related. The cost composes additively along the path: $c_\mathrm{total} = c_1 + c_2 + \dots + c_n$ in $[0, \infty]$.

For non-additive quantales:

- **$\mathcal{V} = ([0, 1], \cdot, \max)$** — reliability composition is multiplicative. Independent failures multiply: a chain with reliabilities $r_1, r_2, \dots$ has total reliability $r_1 \cdot r_2 \cdots r_n$. The unit is $1$ (perfect reliability).
- **$\mathcal{V} = ([0, \infty], \min, \infty)$** — bottleneck composition takes the minimum. A chain's throughput is the bottleneck's throughput. The unit is $\infty$ (no bottleneck imposed).

Per [federation-path-metrics-multiplicative](federation-path-metrics-multiplicative.md), this composition extends to federation-graph paths via the same quantale arithmetic — costs cross substrate boundaries cleanly.

## The three substrate operation classes

Per [cost-discipline](teaching/explanations/cost-discipline.md), substrate operations fall into three cost classes; each contributes a particular $\mathcal{V}$-value:

- **Reads (unit cost).** A read contributes the quantale's unit — $0$ in $[0, \infty]$, $1$ in $[0, 1]$. Composing reads doesn't change the running cost.
- **Admissions (small constant cost).** An admission contributes a small constant $\epsilon \in \mathcal{V}$. A chain of $n$ admissions costs $n \cdot \epsilon$ in $[0, \infty]$.
- **Settlements (variable positive cost).** Each settlement step contributes a positive value depending on the closure-rule application's complexity. Per [wavefront-locality-via-cohomology-vanishing](wavefront-locality-via-cohomology-vanishing.md), the per-step cost is bounded by the affected-region size, not the substrate size.

Combining: a session's total cost is

$$c_\mathrm{session} \;=\; \sum_\mathrm{reads} 0 \;+\; \sum_\mathrm{admissions} \epsilon_i \;+\; \sum_\mathrm{settlements} c_j \;=\; n_\mathrm{adm} \cdot \epsilon \;+\; \sum_j c_j$$

— reads contribute nothing, admissions contribute a known small total, settlements contribute the load-bearing cost.

## Engineering consequence

- **Cost is structurally additive (or multiplicative, depending on quantale).** Per the theorem, the substrate's cost composition is determined by the quantale; engineering reasoning about cost reduces to quantale arithmetic.
- **Cost forecasting is structural.** Knowing per-operation cost contributions, the substrate can forecast total session cost via the quantale's composition. Per [fuel-bound](teaching/explanations/fuel-bound.md), the engine can decide whether a computation will fit in its fuel budget before starting.
- **Parallel branches compose via the quantale's join.** Per the quantale's distributivity, parallel branches' costs combine via the join (typically $\min$ for cheapest-path, $\max$ for parallel-completion). Per [event-causality-via-lorentzian-settling](event-causality-via-lorentzian-settling.md), spacelike-separated branches admit any relative order; per the quantale, their combined cost is well-defined.
- **Cost telemetry is structurally cohomology-class.** Per [telemetry-as-continuous-valued-settling-projection](telemetry-as-continuous-valued-settling-projection.md), telemetry is a continuous-valued settling; per this theorem, cost is structurally the $H^0$ of that settling along the operation's causal path.
- **Cost composition crosses federation cleanly.** Per [federation-path-metrics-multiplicative](federation-path-metrics-multiplicative.md), federation-graph paths compose costs by the same quantale. Cross-federation latency is the sum of per-substrate latencies; cross-federation reliability is the product. The substrate's cost-discipline extends to federation by structural quantale composition.

## What the theorem rules out

- **Non-quantale cost models.** A cost model that doesn't satisfy the quantale axioms (e.g., context-dependent composition, non-monotone aggregation) is not a Lawvere-quantale settling. The substrate refuses; per [cost-discipline](teaching/explanations/cost-discipline.md), cost composition is structural.
- **Read costs > 0.** A substrate that bills reads at positive cost is not implementing the Lawvere-quantale unit-for-reads convention. Per the theorem, reads are the quantale's unit and contribute nothing to total cost.
- **Hidden compositional terms.** A cost composition that includes terms not present in the per-operation costs (e.g., a "coordination overhead" added on top) is not the quantale's composition — it's a different cost model. The substrate's discipline is that the total is exactly the quantale-composition.
- **Quantale switching mid-composition.** A composition that uses different quantales for different sub-paths is not a single Lawvere-quantale settling. Per the theorem, the quantale is fixed by the substrate's deployment; switching requires explicit conversion via a quantale homomorphism.

## What the theorem requires

- The substrate's cost-domain is a commutative unital quantale (per [continuous-valued-settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/continuous-valued-settling.md)).
- Per-operation costs are recorded as substrate content (per [telemetry-as-continuous-valued-settling-projection](telemetry-as-continuous-valued-settling-projection.md)).
- The substrate's operations compose along the substrate's causal graph (per [event-causality-via-lorentzian-settling](event-causality-via-lorentzian-settling.md)).
- The chosen quantale's $\otimes$ operation is the substrate's intended cost composition.

## Position

This theorem grounds the substrate's cost-discipline in the Lawvere-quantale settling framework. Together with [telemetry-as-continuous-valued-settling-projection](telemetry-as-continuous-valued-settling-projection.md) and [federation-path-metrics-multiplicative](federation-path-metrics-multiplicative.md), it places the substrate's resource-accounting in the predication-categories' continuous-valued settling foundation. The substrate's claim to *quantitatively forecast* its performance is structural — the cost model is a Lawvere-quantale settling whose composition is fully determined by the chosen quantale. The substrate's runtime, telemetry, cost, and federation-routing all live in the same continuous-valued framework.
