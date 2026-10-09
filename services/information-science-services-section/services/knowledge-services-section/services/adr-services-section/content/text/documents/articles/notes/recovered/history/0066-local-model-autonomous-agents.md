---

name: 0066-local-model-autonomous-agents
date-created: 2026-03-09T00:00:00
authors:
  - claude
priority: medium
depends-on: [0015-mcp-tooling]
milestone: ""
supersedes: [46, 52, 53, 54]
specialization: research
---

## Summary

Define capability requirements in skill specs so work routes to the
right model, then build infrastructure for local models to run
operational tasks autonomously — on a schedule, without a Claude
session, producing repository artifacts.

## Motivation

Many operational tasks (triage enrichment, journal scanning, daily
observation summaries) are routine and recurring. They are well-suited
to local models running on the NPU without consuming cloud API credits
or requiring a human at the keyboard. The gap: no capability taxonomy,
no routing, no agent scaffolding.

## Steps

1. Define capability taxonomy in the skill spec format:
   `trivial` (keyword extraction, format detection),
   `classification` (multi-label, tag generation),
   `extraction` (structured output, entity extraction),
   `generation` (coherent prose, summarization),
   `reasoning` (multi-step inference, planning),
   `cloud-required` (final review, editorial judgment).
2. Add `minimum-capability:` field to all existing skill specs.
3. Write skill-router logic: reads minimum-capability, selects model
   from a config, rejects routing below threshold.
4. Build autonomous agent scaffolding: Python base class with run-log,
   report-file output, designated inbox, no modification of existing
   content without provenance.
5. Build first autonomous agent: triage enrichment — classify new
   triage files, infer frontmatter, write enriched versions to
   `triage/enriched/`. Run on a trigger (new files in triage/).
6. Document the agent model: how to create a new autonomous agent,
   how to deploy it, how reports are reviewed.

## Done when

- [ ] Capability taxonomy documented in skill spec
- [ ] All existing skills carry `minimum-capability:` field
- [ ] Skill-router selects appropriate model
- [ ] Agent scaffolding exists (base class + run-log + report)
- [ ] Triage enrichment agent deployed and tested
- [ ] Agent creation pattern documented

## Log

**2026-03-09** — Created, consolidating plans 0046 (fragment-specific
agent training and escalation), 0052 (local model content gap filling),
0053 (model capability requirements in skill specs, was active), and
0054 (local models as autonomous day-to-day agents, was active). The
capability taxonomy and autonomous agent infrastructure are one body of
work.
