---
name: compression-phase-1-v2-report
date-created: 2026-04-05
description: "Compression report for 11 plans >5KB: extracted body content to context analyses and (where applicable) milestone records, leaving plan bodies as ≤2-paragraph summaries + open questions."
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: compression-phase-1-v2-report
---

All 11 target plans compressed via the axis-purity pattern (plan = work-axis, body extracted to observation-axis analyses). Every plan under 3 KB; every plan's parse verification passed.

## Before / after

| plan | before (B) | after (B) | ratio | parse |
|------|------------|-----------|-------|-------|
| local-service-architecture | 9270 | 1660 | 0.18 | OK |
| plaintext-accounting-operations | 8942 | 1703 | 0.19 | OK |
| ops-dispatch-stage | 8741 | 2335 | 0.27 | OK |
| office-vocabulary-overhaul | 6974 | 1998 | 0.29 | OK |
| mash-packaging | 6735 | 1994 | 0.30 | OK |
| composable-writing-guide | 6367 | 2178 | 0.34 | OK |
| subgraph-rendering | 6127 | 2076 | 0.34 | OK |
| ops-integration | 5864 | 1876 | 0.32 | OK |
| voidfleet-academy-plan | 5638 | 2208 | 0.39 | OK |
| temporality-coverage-enrichment | 5545 | 2241 | 0.40 | OK |
| cl-pipeline | 5487 | 2269 | 0.41 | OK |

Total: 75,690 → 22,538 bytes across plan bodies (70% reduction). No body content deleted — all extractions preserve content verbatim or near-verbatim in referenced records.

## Extractions created

One context analysis per plan:

- `analyses/local-service-architecture-context.md`
- `analyses/plaintext-accounting-operations-context.md`
- `analyses/ops-dispatch-stage-context.md`
- `analyses/office-vocabulary-overhaul-context.md`
- `analyses/mash-packaging-context.md`
- `analyses/composable-writing-guide-context.md`
- `analyses/subgraph-rendering-context.md`
- `analyses/ops-integration-context.md`
- `analyses/voidfleet-academy-plan-context.md`
- `analyses/temporality-coverage-enrichment-context.md`
- `analyses/cl-pipeline-context.md`

Milestone records (extracted from cl-pipeline's nested-map `milestones:` frontmatter):

- `milestones/cl-pipeline-failure-diagnosis.md`
- `milestones/cl-pipeline-closed-loop.md`

Flat-list `milestones:` reference on cl-pipeline plan now points at these records.

None of the other 10 plans carried a nested-map `milestones:` block, so no additional milestone records were extracted.

No `specs/{plan-id}-invariants.md` records were created — none of the 11 plans carried invariant/spec content distinct enough to warrant a standalone spec record. Architectural narratives all belonged on the observation axis.

## Frontmatter keys renamed / removed per file

- **local-service-architecture** — removed `ordering:` (redundant with per-task `depends-on`); added `depends-on: [local-service-architecture-context]`.
- **plaintext-accounting-operations** — no key changes beyond adding `depends-on`.
- **ops-dispatch-stage** — removed `ordering:`; added `depends-on`, `definition-of-done` (from the "Success Criteria" section of the body).
- **office-vocabulary-overhaul** — no removals; added `depends-on`.
- **mash-packaging** — no removals; added `depends-on`, `definition-of-done` (from "Success criteria" section).
- **composable-writing-guide** — no removals; added `depends-on`.
- **subgraph-rendering** — removed `ordering:`; added `depends-on`, `definition-of-done`.
- **ops-integration** — removed `ordering:`; added `depends-on`.
- **voidfleet-academy-plan** — removed `ordering:`; added `depends-on`.
- **temporality-coverage-enrichment** — removed `ordering:`, `also-serves:`, `advances:` (non-canonical per the canonical plan-keys list; content preserved in context analysis); added `depends-on`.
- **cl-pipeline** — removed `ordering:`; converted nested-map `milestones:` to flat-list; added `depends-on`. Kept `sources:`, `definition-of-done:`, `priority:`, `owner:`, `serves:` as list, `milestones:` as flat list.

All 11 preserved `status:`, `priority:` (where present), and `date-created:`.

## Parse verifications

All 11 plans + 2 extracted milestones: parsed OK via `require('operations/engineering/fars/agentic/tools/fars-core.js').parseFrontmatter(...)`. Every canonical key came through with the expected shape; no YAML parse errors.

## Files where <3KB was impossible

None. All 11 landed under 2.4 KB.

## Scope compliance

Only the 11 named files were touched. No tasks/ records modified. No files outside `operations/command/endeavor/records/{plans,analyses,milestones}/` modified.
