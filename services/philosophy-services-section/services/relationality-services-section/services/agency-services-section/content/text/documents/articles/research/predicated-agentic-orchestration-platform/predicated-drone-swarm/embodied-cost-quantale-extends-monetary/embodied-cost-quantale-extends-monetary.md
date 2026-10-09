---
type: theorem
status: sketch
class: cost-discipline-extension
depends-on: [cost-discipline, embodied-cost-coordinate, physical-budget-record]
see-also: [pareto-min-cost-discipline, embodied-handedness]
proof-target: subsequent-session
title: Embodied cost quantale extends monetary
description: The polity's cost-discipline operates over a Lawvere-quantale of cost-coordinates.
---

# Embodied cost quantale extends monetary

The polity's cost-discipline operates over a Lawvere-quantale of cost-coordinates.
For purely-software dispatch the surveyed coordinates are `(settlement-fuel, dollars)` with [Pareto-min](../../flatfile-agentic-resource-system/monetary-cost-as-quantale-extension/monetary-cost-as-quantale-extension.md) ranking.
The predicated-drone-swarm theory extends this to *embodied* dispatch: the cost-quantale becomes `(fuel, dollars, tokens, joules-against-battery, bandwidth-bytes-against-window)`, with the additional dimensions encoding physical resource budgets that bound an embodied participant's actuation envelope.

## Statement

**Theorem.** *Let $Q_{\mathrm{disembodied}} = (\mathrm{fuel}, \mathrm{dollars}, \mathrm{tokens})$ be the AOP-baseline cost-quantale.
Let $Q_{\mathrm{embodied}} = (\mathrm{fuel}, \mathrm{dollars}, \mathrm{tokens}, \mathrm{joules}, \mathrm{bandwidth})$ be the embodied extension.
Then:*

1. *(Quantale extension.) $Q_{\mathrm{embodied}}$ is a Lawvere-quantale extension of $Q_{\mathrm{disembodied}}$: the embedding $\iota : Q_{\mathrm{disembodied}} \hookrightarrow Q_{\mathrm{embodied}}$ that sends $(f, d, t) \mapsto (f, d, t, 0, 0)$ is a quantale homomorphism, and the projection $\pi : Q_{\mathrm{embodied}} \twoheadrightarrow Q_{\mathrm{disembodied}}$ that drops the last two coordinates is its left adjoint in the quantale-enriched setting.*

2. *(Pareto-min extends.)
  The Pareto-min ranking on $Q_{\mathrm{disembodied}}$ extends to a five-coordinate Pareto-min on $Q_{\mathrm{embodied}}$.
  A dispatchable that exceeds any of the embodied participant's physical-budget cells (joules-budget, bandwidth-budget) is Pareto-dominated regardless of its monetary cost.*

3. *(Physical-budget-record as Pareto-witness.)
  Each embodied participant's [physical-budget-record](../physical-budget-record/physical-budget-record.md) cell-shape carries the participant's current `joules-remaining` and `bandwidth-budget-window` predicates.
  Closure rule `verify-physical-budget` reads these at dispatch time; a `(workitem, dispatchable)` pair whose projected cost exceeds budget is rejected on this axis.*

## Why this matters

Free-tier-first selection (per the polity's charter) ranks endpoints by zero-dollar cost.
For embodied participants the dollar-zero axis is dominated by the *physical* axes: a drone with a fully-free-tier model still cannot fly when its battery is dead.
The cost-quantale extension is what makes the substrate-recorded dispatch decision physically realizable.

## Proof sketch

Part (1) follows from the quantale-extension construction in standard category theory (sum of two quantales is a quantale; the embedding by zero-padding and the projection by truncation are adjoint quantale homomorphisms).
The Lawvere-quantale-enriched version is straightforward.

Part (2) follows from the partial-order structure of Pareto domination — adding coordinates refines the order without changing existing comparisons.

Part (3) is operational: the closure rule reads the budget cells, computes the projection of cost across the five coordinates for the proposed dispatch, and emits the rejection witness when any axis exceeds budget.

The full proof depends on the [cost-discipline](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/cost-discipline.md) concept's quantale formalization and on the [physical-budget-record](../physical-budget-record/physical-budget-record.md) cell-shape's predicate inventory. ∎-sketch

## Position

Cost-discipline extension for the sub-theory.
Composes with [verify-certifiability-sectors](../../../../../../../../../../../../../engineering-science-services-section/services/technology-science-services-section/content/text/documents/articles/notes/undated/verify-certifiability-sectors.md) (that rule gates on cohomological consistency; this theorem gates on physical realizability).
Both are disqualification axes in the dispatch graph's selection logic.

## Open

- Whether tokens and joules are independent or coupled.
  (LLM dispatch consumes both compute power and time; on a drone, that compute is on the drone's battery.
  Not independent.)
- The exact `bandwidth-budget-window` semantics — fixed window vs. token-bucket vs. event-triggered.
  The communications-as-control-plant section of the theory-gap question suggests event-triggered.
