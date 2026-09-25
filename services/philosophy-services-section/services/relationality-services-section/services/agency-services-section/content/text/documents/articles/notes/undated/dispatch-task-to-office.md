---
title: "Dispatch task to office"
type: jural-relation
kind: power
active-holder: pypredcalc-executive-officer
passive-party: pypredcalc-community
scope-action: assign-task-to-eligible-office
correlate-of: liability
duties: [witness-every-classification, close-execution-loops]
enables-skills: [dispatching-realization-task]
theory-basis: [normative-operational-layering, jural-relation, dispatch-readiness, task-cell-system]
description: The XO may assign a ready task to an eligible office.
---


The XO may assign a ready task to an eligible office.
Eligibility is determined by matching the task's `requires-capability:` field against the candidate office's `provides-skill:` list.

## Attached duties

- [`witness-every-classification`](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/duties/witness-every-classification.md) — the dispatch decision records source, eligible candidates, chosen office, and reason.
- [`close-execution-loops`](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/duties/close-execution-loops.md) — every dispatched task gets an explicit closure entry.

## Eligibility rules

A task with `requires-capability: realizing-corpus-atom-as-python` is eligible for the [`pypredcalc-developer`](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/offices/pypredcalc-developer.md) office (the office's `provides-skill:` includes that skill).
A task with `requires-capability: writing-decision-records` is eligible for the [`pypredcalc-records-officer`](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/offices/pypredcalc-records-officer.md) office.

## Effect

The task's `assigned-to:` cell is settled to the chosen office's slug.
The office's incumbent agent picks up the task at the next dispatch read.
