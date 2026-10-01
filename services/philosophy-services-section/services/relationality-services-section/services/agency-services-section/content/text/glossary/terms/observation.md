---
type: definition
class: cell-system
status: draft
symbol: O
depends-on: [execution-event, task-cell-system, predication-cell]
realizes: [observation]
see-also: [finding, execution-event, audit-as-cech-resolution-of-operations-settling]
name: Observation
description: "The substrate-entity produced by the tracking stage: a derived reading of the work substrate's state at a point in time."
---

# Observation

The substrate-entity produced by the [tracking](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/tracking.md) stage: a derived reading of the work substrate's state at a point in time.
Observations live in their own fiber, *separate from the entities they observe* — the substrate-algebraic implementation of Goodhart's law (Strathern 1997): the metric is not part of the fiber being measured.
The FARS substrate's commitment to this isolation is [observation-fiber-isolation](../../documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/observation-fiber-isolation/observation-fiber-isolation.md).

This realizes the work-vocabulary [observation](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/actuating/content/actuator/embodying/content/body/integrating/content/drone/swarming/content/swarm/content/social/_archive/sociology/content/work/theories/terms/observation.md) as a cell-system in predication-categories vocabulary.
It is *distinct* from the FARS [observation-record](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/actuating/content/actuator/embodying/content/body/integrating/content/drone/swarming/content/swarm/content/social/_archive/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/objects/observation-record.md), which is the agent-noticing-during-session input to the consolidation→instinct pipeline.
Both senses of "observation" live in the substrate; they exhibit the same separate-fiber discipline at different scales.

## Definition

An observation cell-system is a triple

$$O = (G_O, \mathcal{S}_O, v^O_0)$$

where:

- $G_O \subseteq \Phi_{\mathrm{op}}$ — the *observation claim cells*:
  - $\langle O, \texttt{is-a}, \texttt{observation} \rangle$
  - $\langle O, \texttt{observes}, X \rangle$ — the entity (task, plan, office, endpoint, …) being read
  - $\langle O, \texttt{observed-at}, t \rangle$ — the read's timestamp
  - $\langle O, \texttt{method}, \mu \rangle$ — reference to the composition or query that produced the value
  - $\langle O, \texttt{value}, v \rangle$ — the read's content; may be scalar (count, ratio, status) or a sub-fiber
  - $\langle O, \texttt{baseline}, b \rangle$ — what was expected at this read; may be $\bot$ for measurements with no baseline
  - $\langle O, \texttt{scale}, \sigma \rangle$ — Stevens' measurement scale (`nominal`, `ordinal`, `interval`, `ratio`); see Stevens-scales-as-composition-guards below

- $\mathcal{S}_O$ — closure rules over observations; in particular, *cadence* rules that bind a tracking query's output to a sequence of observations indexed by the cadence window.

- $v^O_0$ — initial valuation at emission: schema cells at $\mathbf{t}$ on supplied values, derived cells at $\bot$ until consumers force settlement.

## Why observations live in their own fiber

If tracking wrote back into the observed entity's fiber — for example, asserting $\langle T, \texttt{velocity}, 3 \rangle$ as a cell on the task — then the metric becomes part of the fiber being measured.
Every subsequent composition involving $T$ would carry the metric; every dispatch would compose against a task whose fiber is no longer just the task but task-plus-metric; the metric becomes constitutive, and any pressure to change the metric becomes pressure on the task itself.

The separate-fiber discipline cuts this loop.
Observations reference $T$ via $\langle O, \texttt{observes}, T \rangle$ but do not write any cell on $T$.
Compositions involving $T$ are unaffected by observations; consumers that want the metric walk from $T$ outward to $O$, fold the values, and use them downstream — without modifying $T$.

This is Principle 4 (reads walk geometry) applied at the tracking stage.
Tracking does not commit to task state; tracking is a parallel structure that lets metrics exist without becoming the task.

## No permanent fixpoint

Unlike planning or execution, tracking does not converge.
The observation fiber is *cyclically rebuilt*: each cadence tick fires a tracking-query that emits new observations whose `observed-at` cells supersede the prior ones in the most-recent-first fold.
Older observations remain in the log for audit; newer ones drive the working-model projection.

The cadence window is itself a predication: $\langle Q, \texttt{cadence-window}, w \rangle$ on the tracking query $Q$.
A consumer asks "what does $Q$ currently say?" by walking $Q \to O_{\mathrm{newest within } w}$ — not by reading a cached value.

## Stevens scales as composition guards

The `scale` cell on an observation is not metadata; it is a load-bearing predicate that *composition rules consult*.
Aggregation operations (mean, median, sum, mode) are themselves predications $\langle \mu_{\mathrm{agg}}, \texttt{requires-scale}, \sigma_{\mathrm{ok}} \rangle$.
Composing $\mu_{\mathrm{agg}}$ with an observation whose `scale` does not satisfy $\sigma_{\mathrm{ok}}$ produces a $\top$ on the result cell — averaging ordinals does not silently misbehave, it visibly settles to contradiction and forces the consumer to either change the aggregation or change the scale claim.

Whether the algebra can really enforce Stevens' constraints without hard-coding each scale's arithmetic is an empirical question.
The cell shape exists either way; if the composition guard turns out to require runtime knowledge the fiber can't carry, the scale predicate becomes documentary rather than constitutive.

## Algebraic role: walk that emits

Tracking is a walk that *produces new entities* rather than returning a value to a caller.
The tracking-status morphism is the canonical example: $\texttt{message}(\texttt{model}, \langle \texttt{compose tracking-status fiber} \rangle)$ returns a geometry, and the rendering pump emits an observation entity for each cell in the geometry's output.
The observation entities then enter the log on the `track` channel and are queryable like any other entity.

## Position

Observations are the inputs to [findings](finding.md): a finding's `observed` cell points at the observation(s) whose values the review compared against the [plan](plan.md)'s `expected` cells.
They are also the inputs to [adjustments](adjustment.md) when feedback closes the loop without first crystallizing a finding (e.g., automatic rate-limit-budget updates from a provider's response headers — see [rate-limit-as-time-windowed-availability-predication](../../documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/rate-limit-as-time-windowed-availability-predication/rate-limit-as-time-windowed-availability-predication.md)).
