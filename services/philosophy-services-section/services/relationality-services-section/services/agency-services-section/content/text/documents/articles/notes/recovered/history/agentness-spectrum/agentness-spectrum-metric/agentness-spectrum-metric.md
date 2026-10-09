---
type: question
class: open
status: open
depends-on:
  - teaching/explanations/agentness-spectrum.md
  - teaching/explanations/agentic-system.md
see-also:
  - ../theorems/three-condition-characterization.md
  - references/bent2025.md
  - references/sapkota2025.md
  - references/staufer2026.md
---

# Can Bent's agentness spectrum be metrized?

## Question

Can the five dimensions of the [agentness-spectrum](teaching/explanations/agentness-spectrum.md)
be given a metric — a distance function — that produces a partial or total order
on the set of agentic systems? If not a metric, can a weaker structure (partial
order, preorder) be defined that is empirically useful?

## Background

Bent's (2025) five dimensions — environmental interaction sophistication,
goal-directed behavior complexity, temporal coherence, learning/adaptation, and
autonomy — are currently ordinal scales: for each dimension, "higher is more
agentic." But the dimensions are not commensurable: how does one trade off high
environmental interaction sophistication against low autonomy? Is a system with
a score of (high, high, low, low, medium) more or less agentic than one with
(medium, medium, high, high, low)?

The MIT AI Agent Index (Staufer et al., 2026) operationalizes one dimension
(autonomy: at least three autonomous tool calls) with a threshold, but does not
provide a commensuration scheme for the full five-dimensional space.

The Sapkota et al. (2025) taxonomy has five similar dimensions and classifies
systems "somewhere" on each, but explicitly avoids specifying commensuration.

## Why this matters

A metric on the agentness spectrum would enable:

1. **Comparison across systems.** "System A is more agentic than system B" would
   be a precise claim rather than a claim relative to one particular dimension.

2. **Progress measurement.** "Agentness has increased by X from 2024 to 2026"
   would be a measurable claim.

3. **Regulatory threshold specification.** A regulator wishing to apply a
   particular oversight regime to "sufficiently agentic" systems needs a
   commensuration scheme to specify the threshold.

## Challenges

**Incommensurability.** The five dimensions measure different kinds of things:
latency characteristics (temporal coherence), computational expense (learning/
adaptation), and social/governance properties (autonomy). There is no obvious
unit that converts one into another.

**Context-dependence.** The appropriate commensuration may depend on the
use case. A system with high autonomy and low environmental interaction
sophistication is appropriate for some tasks (text analysis) and inappropriate
for others (industrial control). The "most agentic" system is not a context-free
designation.

**Non-monotonicity.** Higher values on some dimensions increase risk rather than
"agentness" in any useful sense. Very high autonomy in a system with low goal-
directed behavior complexity is dangerous, not impressive. A metric that increases
with autonomy regardless of other dimensions would fail to capture this.

## Open subquestions

1. Does a useful partial order exist? A partial order that refuses to compare
   systems with different capability profiles may be more honest than a total
   order achieved through arbitrary weighting.

2. Can the three conditions serve as qualitative thresholds that define ordinal
   "classes" of agentness above which the dimensions apply?

3. Is there empirical evidence about which dimensions predict task success,
   which predict safety risk, and which are orthogonal to both? Such evidence
   would ground a principled commensuration for specific purposes.
