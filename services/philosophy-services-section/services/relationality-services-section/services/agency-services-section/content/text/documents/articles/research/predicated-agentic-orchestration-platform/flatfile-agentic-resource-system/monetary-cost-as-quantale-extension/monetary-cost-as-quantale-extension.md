---
name: monetary-cost-as-quantale-extension
description: "Does the cost-discipline's quantale extend cleanly to dollar-denominated cost?"
type: question
class: cost-discipline
status: candidate-answers-drafted
depends-on: [../../../../teaching/explanations/cost-discipline, ../../../../../theorems/cost-composition-via-lawvere-quantale]
splits-from: routable-llm-endpoint-as-swarm-participant
see-also: [routable-llm-endpoint-as-swarm-participant, endpoint-as-outbound-swarm-participant, rate-limit-as-time-windowed-availability-predication]
title: monetary-cost-as-quantale-extension
---

# Does the cost-discipline's quantale extend cleanly to dollar-denominated cost?

Sub-question 2 of [routable-llm-endpoint-as-swarm-participant](../routable-llm-endpoint-as-swarm-participant/routable-llm-endpoint-as-swarm-participant.md).
The substrate's [cost-discipline](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/cost-discipline.md) lives in the Lawvere quantale $([0, \infty], +, \min)$ — settlement cost composes by addition along causal chains, choice among alternatives takes the minimum.
API tier costs are denominated in dollars.
The arithmetic shape is identical (addition for composition, min for choice), but the units differ.
Is monetary cost the same dimension as settlement cost, a separate dimension, or a calibration of one onto the other?

## What pulls the question

The cost-discipline's framing — reads are free, only settling pays, the cheapest causal path is the minimum — was developed to account for the substrate's *internal* fuel: closure-rule applications, wavefront width, witness emissions.
None of those have natural dollar units.
But once the substrate dispatches to a paid endpoint, the settle-action's *dollar cost* becomes a substrate-observable quantity (parsed from response metadata or computed from the endpoint's declared `cost-per-token-out × tokens-out`).
The substrate now has a second cost dimension whose discipline-question is open.

A working FARS that ignores the question still works: the runtime can carry a separate dollar accounting outside the substrate, and dispatch can read both cost-discipline costs (settlement fuel) and external dollar costs (runtime accounting) independently.
But that puts the dollar-cost lever outside the substrate's algebra, where the captain wants it inside.

## Candidate readings

1. **Single quantale with unit conversion.** Define a fixed exchange rate (e.g., one settlement-fuel unit = $X) and convert dollar cost into settlement-cost units.
  Composition and choice work in one quantale.

*Drawback.* The exchange rate is arbitrary; settlement fuel measures closure-iteration work, dollars measure provider-billing-rate.
Forcing them into one dimension is a calibration the substrate has no principled way to set, and any downstream decision that uses the unified value carries the calibration's arbitrariness.

2. **Product quantale $[0, \infty] \times [0, \infty]$.** Settlement cost and dollar cost are independent dimensions.
  Composition is component-wise addition.
  Choice is *Pareto-min*: the set of options not dominated component-wise.
  Lawvere quantales are closed under products, so the cost-composition theorem extends mechanically.

*Property.* When two endpoints sit on the Pareto frontier — neither dominates the other — dispatch surfaces both, and a separate predication in the closure-rule sub-system breaks ties (per the 561 charter's preference for free-tier work, the rule prefers $0-cost).
When a third option is dominated (more expensive *and* more fuel), it is dropped without manual intervention.

3. **Quantale-graded cost with kind-tagged values.** A single $[0, \infty]$ value carrying a tag $\{\text{settlement}, \text{dollar}\}$, with composition undefined across tags.
  Equivalent to (2) at the algebra level but more fragile in implementation: cross-tag composition errors must be raised explicitly, where (2) handles them by construction.

## Recommended reading: (2)

Treat monetary cost as a second dimension of a *product* Lawvere quantale.
The cost-discipline's commitment ("reads are free, only settling pays") extends to both dimensions independently:

- *Read cost in dollars*: $0 (no API call made).
- *Settle cost in dollars*: the dollar cost of the settle-action's external calls, summed along the causal chain.
- *Choice operator*: Pareto-min.
  The dispatch considers any option not Pareto-dominated; tie-breaks among Pareto-optimal options are predications on the closure-rule sub-system (e.g., "prefer free-tier when settlement-fuel is comparable").

This is substrate-native.
The bilattice machinery already deals with multi-valued fibers; product quantales are the standard generalization in the cost-composition theorem's framing (per [cost-composition-via-lawvere-quantale](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/cost-composition-via-lawvere-quantale.md)), and the substrate already composes multiple value-dimensions via the bilattice's truth/information axes.

The reading extends without further work to additional cost dimensions — latency, rate-limit-budget consumed, tokens-against-monthly-budget — each as another factor of the product quantale.
The dispatch's eligible-options query becomes "Pareto frontier in the cost-product quantale, restricted by capability ⊙ work-requirement".

## Tie-breaking on the Pareto frontier

Multiple Pareto-optimal endpoints is the common case (e.g., Cerebras $0/1800tps and NVIDIA NIM $0/200tps for a non-latency-sensitive task — both are free, neither dominates on latency without further information).
Tie-breaking belongs in the closure-rule system as charter-bound predications:

- A 561-charter rule prefers $0 paths whenever they exist (free-tier first; the captain has named this as the working policy).
- A capability rule prefers higher-grade models when work-type requires precision (e.g., math reasoning prefers `qwen3-235b` over `llama-3.3-70b`).
- A latency rule prefers lower-latency endpoints for interactive work-types.

Each rule is a substrate-content predication, not a runtime choice.
The dispatch is auditable per the existing dispatch-as-closure-rule-system theorem.

## What this resolves and what it leaves open

Resolves the original sub-question: dollar cost is a separate dimension, not a calibration of settlement cost.
The product quantale carries both; choice is Pareto-min; tie-breaking is closure-rule predications.

Leaves open: how many dimensions the substrate eventually carries (latency, monthly-token-budget-consumed, provider-trust, etc.).
The product-quantale answer scales to any finite number of cost dimensions, so the substrate can grow them as needed without revisiting the algebra.

Does *not* depend on resolving [endpoint-as-outbound-swarm-participant](../endpoint-as-outbound-swarm-participant/endpoint-as-outbound-swarm-participant.md); the cost question is structurally upstream and applies to any substrate operation with a dollar-denominated settle-action, endpoints or otherwise (e.g., a future paid-API integration for satellite imagery, weather, etc.).
