---
extends: [record]
description: "A derived reading of system state at a point in time — what tracking produces. Metrics, anomalies, and status reports are all observations at different scopes."
date-created: 2026-04-07
instance-of: act
part-of-stage: tracking
has: [scope, method, value, baseline, timestamp]
scope-takes: [task, plan, project, endeavor]
responds-to-takes: [event]
display:
  headline: title
  body: value
  metadata: [scope, method, timestamp, baseline]
help-predicates: [id, scope, value, method, timestamp]
references:
  deming1986:
    authors: ["W. Edwards Deming"]
    title: "Out of the Crisis"
    publication: "MIT Press"
    year: 1986
  shewhart1931:
    authors: ["Walter A. Shewhart"]
    title: "Economic Control of Quality of Manufactured Product"
    publication: "Van Nostrand"
    year: 1931
  beer1972:
    authors: ["Stafford Beer"]
    title: "Brain of the Firm"
    publication: "Allen Lane"
    year: 1972
---

An observation is a derived reading of system state. It is what the [tracking](./tracking.md) stage produces. An observation takes events and entity states as input and produces a computed quantity — a metric, an anomaly, a status snapshot.

Observations are not raw data. Raw data is the [event](../../../../philosophy/terms/event.md) stream — timestamped records of acts. An observation is a *derivation* from that stream: "plan X is 3 of 7 tasks complete" requires reading seven task entities and computing a ratio. "Velocity this sprint was 5 tasks" requires counting completion events within a time window. The observation records both the value and the method that produced it, so the derivation is reproducible.

## What an observation carries

- **scope** — what set of entities this observes. A single task, a plan, a project, the whole system. Scope determines what events and states are inputs.
- **method** — how the value was derived. A query, a computation, a human judgment. The method makes the observation reproducible and auditable.
- **value** — the reading. A number, a status, a list of anomalies. The observation's content.
- **baseline** — what was expected, if applicable. A target, a historical average, a plan's definition-of-done. Without a baseline, the observation is a measurement. With a baseline, it becomes the input to a [finding](./finding.md).
- **timestamp** — when the reading was taken. Observations are snapshots — the same method applied at different times may yield different values.

## Observations as derived entities

Observations are composed from other entities' predicates. They are the tracking-stage instance of the derived entity pattern: the observation doesn't have its own source content — its value is computed from the states of the entities it observes. This is the same pattern as CLAUDE.md being composed from ship + charter + office entities. The observation's scope predicates define its composition inputs; its method defines the composition function.

In Shewhart's (1931) statistical process control, an observation is a data point on a control chart. The value is the measurement. The baseline is the process mean. Deviation beyond control limits is an anomaly. Deming (1986) extended this: observations feed the Check step of PDCA, which feeds the Act step (adjustment). The observation is the sensory input that makes the loop a loop.

In Beer's (1972) Viable System Model, observations are the output of System 3* — the sporadic audit function that checks whether the operational units are reporting accurately. Observations are not neutral — they are acts of attention, and what you choose to observe shapes what you can learn.

## See also

- [Tracking](./tracking.md) — the stage that produces observations
- [Finding](./finding.md) — the judgment that observations feed
- [Event](../../../../philosophy/terms/event.md) — the raw data observations derive from
- [Metric](../../../../../../../../content/text/glossary/terms/metric.md) — a specific kind of observation value
