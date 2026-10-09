---
name: anomaly-as-contradiction
description: "The discipline that anomalies are substrate-visible $\top$-cells, not signals from a separate monitoring layer."
type: concept
class: framing
depends-on: [validation-as-settlement, fiber, closure-rule-record, heartbeat]
see-also: [tick-as-iteration, heartbeat-cycle, advance-tick]
title: anomaly-as-contradiction
---

# Anomaly as contradiction

The discipline that *anomalies are substrate-visible $\top$-cells*, not signals from a separate monitoring layer.
When the heartbeat detects a stale task, an overdue session, a capacity overrun, or an integrity-check violation, the detection is a closure rule firing during a tick; the rule's conclusion produces a $\top$-cell on the affected entity's fiber; the substrate's existing event-and-witness machinery surfaces the contradiction as a `guard`-channel diagnostic event.

There is no separate monitoring subsystem in FARS.
Anomaly detection is closure-rule application; anomaly surfacing is event emission; anomaly response is repair invocation per [closure-rule-record](../objects/closure-rule-record.md)'s `repair-catalog-entry`.
All three steps are the substrate's algebra acting on substrate content.
Editing what counts as an anomaly is editing substrate predications.

The discipline has the same load-bearing property as [validation-as-settlement](../validation-as-settlement/validation-as-settlement.md), at the operational tier rather than the input tier: validation rejects bad inputs as $\top$ before they reach the substrate; anomaly-as-contradiction surfaces bad operational states as $\top$ after they're in the substrate.
Both use the same machinery; both rely on the four-valued bilattice's ability to *carry the failure visibly* rather than throwing it as an out-of-band signal.

## What anomaly detection looks like

A typical anomaly-detection rule:

- **`name`** — `stale-task` (or whichever anomaly).
- **`premise`** — match pattern: e.g., "an entity carrying `kind: task` AND `status: in-progress` AND `last-activity` predicate older than threshold."
- **`conclusion`** — produce: `(self, anomaly-stale: $\top$)` cell on the matched entity's fiber, and emit an event on the `analysis` or `guard` channel naming the rule and the matched entity.
- **`match-radius`** — typically 1 (single-fiber anomalies) or 2 (the entity plus a neighbor that holds the threshold predicate).
- **`severity`** — `warning` for soft anomalies (stale task surfaces but doesn't block); `error` for hard ones (capacity overrun blocks new assignments).
- **`repair-catalog-entry`** — optional pointer to a repair recipe.

The rule fires during the heartbeat cycle's normal tick — there is no separate "monitor pass."
When the rule's premise matches, the conclusion places the $\top$-cell, and the substrate's coherence-glue discipline ([per RC's `coherence-glue` morphism](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/coherence-glue.md)) takes over.

## OpenClaw HEARTBEAT.md as precedent

The OpenClaw HEARTBEAT.md pattern (cited in the prior-art survey) makes this concrete: a checklist of checks runs at scheduled intervals (every 6 hours, 24 hours, weekly).
Each check is a `message()` that composes department contents against health predicates.
Anomalies surface as $\top$ — *contradiction between expected and actual state*.
The substrate-level commitment is the same: the check is a rule, the failure is a $\top$-cell, the response is a repair (or escalation).

FARS adopts the same shape: scheduled checks are closure rules with premise patterns referencing time-since-last-tick or accumulated-counts; their conclusions place $\top$-cells; the heartbeat's standard cycle picks up the diagnostics on the appropriate channels.

## What anomaly-as-contradiction is not

- **Not exception-throwing.** A failing rule does not raise an exception.
  The $\top$-cell is the substrate-visible record of the failure; no out-of-band signal escapes the substrate.
- **Not a logging discipline.** Log lines are human-readable notes about events; $\top$-cells are machine-readable substrate content.
  A realization may render $\top$-cells as log lines, but the canonical representation is the cell.
- **Not a separate monitoring system.** Tools like Prometheus, OpenTelemetry, or Datadog are external monitoring layers that observe the substrate from outside.
  FARS's anomaly detection is *inside* the substrate, using the substrate's own machinery.
  A FARS realization MAY export $\top$-cells to an external monitoring system for human-facing dashboards; the export is a *protocol adapter* per the four-layer architecture, not the detection itself.

## Composition with repair

Per [closure-rule-record](../objects/closure-rule-record.md), a rule whose conclusion produces $\top$ MAY cite a repair recipe.
The repair catalog (per RC's [repair concept](../../../../teaching/explanations/repair.md)) is the substrate's curated set of recipes for resolving particular contradictions; a rule's `repair-catalog-entry` is a pointer to the applicable recipe.

When an anomaly's $\top$-cell appears, the substrate's coherence-glue discipline either invokes the repair (if the recipe is admissible at the current state) or records the unresolved contradiction.
Per [validation-as-settlement](../validation-as-settlement/validation-as-settlement.md), the contradiction's persistence is itself a substrate metric: an anomaly that is detected, recorded, and never resolved generates a long-running $\top$-cell that downstream rules can match against.

## Position

Anomaly-as-contradiction is the framing that lets FARS's heartbeat be the *only* operational-monitoring machinery.
There is no separate monitor.
There is no separate alert system.
The substrate's algebra detects, surfaces, and (when admissible) repairs anomalies through the same machinery it uses for inference.
This is the engineering content of "the substrate is one substrate."

The framing depends on [validation-as-settlement](../validation-as-settlement/validation-as-settlement.md) (the substrate-level $\top$-as-rejection discipline) and on [closure-rule-record](../objects/closure-rule-record.md)'s severity and repair-catalog-entry fields.
It composes with [tick-as-iteration](../../tick-as-iteration/tick-as-iteration.md): anomaly detection is one kind of work that ticks do, alongside ordinary inference; the heartbeat doesn't distinguish them, and that's the point.
