---
name: identify-load-bearing-theory-gaps
description: "Consume a coverage report; for every draft/stated theory entity it cites, judge whether the gap is load-bearing per the methodology spec. Output a prioritized gap list."
status: triage
owner-agent: theory-supporter
project: supporting-pypredcomp-development
blocked-by:
  - "operations/command/projects/supporting-pypredcomp-development/specs/methodology/what-counts-as-load-bearing.md"
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: identify-load-bearing-theory-gaps
---

The judgment half of theory-coverage analysis. Consumes a coverage report from [`audit-theory-coverage-for-target`](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/agent-skills/audit-theory-coverage-for-target/SKILL.md), applies the load-bearing rule from the methodology spec, emits a prioritized gap list.

## Inputs

- `coverage-report` — output of `audit-theory-coverage-for-target`.
- `release-window` — which pypredcomp release this analysis is gating (used for prioritization).

## Outputs

A prioritized list of (dev-claim, theory-entity, gap-status) triples, ordered by:

1. Gates the named release window?
2. Number of distinct dev claims that depend on it?
3. Dependency depth in the theory graph (closer-to-axioms first)?

## Procedure

1. Filter the coverage report to entities at `status: draft` or `status: stated` (skip `proved` and `not-a-theory-entity`).
2. For each remaining (dev-claim, theory-entity) pair, apply the load-bearing rule from the methodology spec.
3. Drop pairs judged not load-bearing.
4. Score remaining pairs by the prioritization keys.
5. Emit ordered list as markdown.

## Hand-off

Each entry in the output is then either:

- Closed locally via [`prepare-theory-for-dev-claim`](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/agent-skills/prepare-theory-for-dev-claim/SKILL.md), if the gap is small (definition tightening, example addition, theorem statement refinement).
- Filed as a research target via [`file-research-target`](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/agent-skills/file-research-target/SKILL.md), if the gap is non-trivial (requires actual proof work).

## Graduation criteria

Will graduate once the captain has answered the load-bearing question and the methodology spec has been exercised on at least three coverage reports.
