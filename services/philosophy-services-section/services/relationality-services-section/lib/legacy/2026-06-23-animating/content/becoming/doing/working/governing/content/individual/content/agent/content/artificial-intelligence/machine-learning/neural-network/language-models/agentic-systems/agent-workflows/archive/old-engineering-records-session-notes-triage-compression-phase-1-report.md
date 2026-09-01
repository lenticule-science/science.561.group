---
name: compression-phase-1-report
date-created: 2026-04-05
serves: record-shape-refactor
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

All ten target plans compressed to < 3KB with frontmatter-only structure + ≤ 2 body paragraphs. 10 analysis extractions, 5 milestone records created. All files parse under fars-core.

## Before/after byte counts

| plan | before | after | reduction |
|---|---|---|---|
| foundational-ontology-research.md | 51,413 | 1,849 | -96% |
| charter-and-organizational-infrastructure.md | 34,453 | 1,558 | -95% |
| command-domain-extraction.md | 27,082 | 1,607 | -94% |
| fars-core-extraction.md | 26,729 | 2,216 | -92% |
| agentic-orchestration.md | 24,529 | 2,717 | -89% |
| work-domain-layer-separation.md | 22,272 | 1,947 | -91% |
| charter-predication-library-enrichment.md | 19,628 | 2,155 | -89% |
| planning-infrastructure.md | 16,048 | 1,540 | -90% |
| sunday-funday-sprint.md | 15,264 | 2,376 | -84% |
| ops-research-foundations.md | 13,904 | 1,745 | -87% |
| **total** | **251,322** | **19,710** | **-92%** |

## Extractions performed

### New analysis records (10 files in records/analyses/)

All extracted prose preserved; each plan now references its context via `depends-on:`.

| analysis file | source plan | approx lines |
|---|---|---|
| foundational-ontology-research-brief.md | foundational-ontology-research | ~220 |
| charter-infrastructure-context.md | charter-and-organizational-infrastructure | ~95 |
| command-domain-extraction-context.md | command-domain-extraction | ~120 |
| fars-core-extraction-context.md | fars-core-extraction | ~100 |
| agentic-orchestration-context.md | agentic-orchestration | ~100 |
| work-domain-layer-separation-context.md | work-domain-layer-separation | ~120 |
| planning-infrastructure-context.md | planning-infrastructure | ~85 |
| sunday-funday-sprint-context.md | sunday-funday-sprint | ~140 |
| ops-research-foundations-context.md | ops-research-foundations | ~85 |

(charter-predication-library-enrichment was completed 2026-04-01; its brief mutation log was kept inline since the work is already reflected in library terms.)

### New milestone records (5 files in records/milestones/)

Created milestones/ directory; extracted nested-map milestones from fars-core-extraction:

- fars-core-m1-fars-core-extracted.md (gate: proceed to M2 only after verification passes; at: verify-fars-core-extraction)
- fars-core-m2-docs-complete.md (gate: docs reviewable before plugin scaffold; at: design-doc-bundle-mechanism)
- fars-core-m3-plugin-builds.md (gate: plugin must load test vault; at: verify-plugin-in-obsidian)
- fars-core-m4-features-work.md (gate: all features work against clone of this repo; at: implement-create-with-template)
- fars-core-m5-published.md (gate: final; at: submit-to-obsidian-community)

## Keys removed / renamed per file

All files had these generic cleanups: removed leading blank line from frontmatter, added explicit `id:` where missing, removed empty `blocked-by: []` / `ordering: []` lists, consolidated list frontmatter to inline format.

Specific:
- **foundational-ontology-research** — renamed `unblocks:` → `blocks:`; removed empty `blocked-by`, `ordering`
- **charter-and-organizational-infrastructure** — no nested structures; prose-heavy extraction
- **command-domain-extraction** — no nested structures; prose-heavy extraction
- **fars-core-extraction** — removed `ordering:` (list-of-lists DAG, preserved in analysis); removed nested `milestones:` map (extracted to 5 milestone records)
- **agentic-orchestration** — removed `ordering:` (list-of-lists DAG, preserved in analysis); removed `objectives-served:` (redundant with plan-level `serves:`); kept `supersedes:` as flat list
- **work-domain-layer-separation** — no nested structures; prose-heavy extraction
- **charter-predication-library-enrichment** — COMPLETED plan; kept mutation log inline in body, no separate analysis
- **planning-infrastructure** — removed `ordering:` (list-of-lists DAG, captured in context "Parallel groups" section)
- **sunday-funday-sprint** — converted multi-line `serves:` to inline list; preserved `theory-sources:` as inline list
- **ops-research-foundations** — removed empty `ordering: []`

## DAG preservation

`ordering:` list-of-list edges were removed from three plan frontmatters (fars-core-extraction, agentic-orchestration, planning-infrastructure). The per-plan dependency graphs are preserved in the corresponding analysis files. Per instructions, the tasks/ directory was not modified — when task records get `depends-on:` edges added in a future pass, the edges should come from these preserved analyses.

## Parse verifications

All 10 compressed plans + 5 new milestone records verified to parse via `fars-core.parseFrontmatter()`:

```
OK foundational-ontology-research.md (10 keys)
OK charter-and-organizational-infrastructure.md (11)
OK command-domain-extraction.md (11)
OK fars-core-extraction.md (10)
OK agentic-orchestration.md (13)
OK work-domain-layer-separation.md (11)
OK charter-predication-library-enrichment.md (11)
OK planning-infrastructure.md (12)
OK sunday-funday-sprint.md (13)
OK ops-research-foundations.md (12)
OK fars-core-m1-fars-core-extracted.md (7)
OK fars-core-m2-docs-complete.md (7)
OK fars-core-m3-plugin-builds.md (7)
OK fars-core-m4-features-work.md (7)
OK fars-core-m5-published.md (7)
```

## Files skipped

None — all 10 targets processed.

## Observations for future phases

1. **Heavy prose-extraction pattern.** 9 of 10 plans had prose bodies that were either (a) research-source lists per task, (b) step-by-step implementation briefs, or (c) narrative context/rationale. All three categories belong in analyses/, not in the plan body. Pattern should replicate across remaining plans.

2. **Completed plans with mutation logs** (charter-predication-library-enrichment, planning-infrastructure, ops-research-foundations) can be compressed most aggressively — the library itself holds the output. For completed plans, consider whether an analysis file is needed at all, or whether a terse inline summary suffices.

3. **List-of-list `ordering:` appears in multiple plans.** These DAGs should eventually live as `depends-on:` edges on task records. For now preserved in analyses. A future mechanical pass can read the analyses and patch tasks.

4. **Nested `milestones:` maps** — only fars-core-extraction used this pattern. Future phases should audit remaining plans for nested milestone structures and extract them uniformly.

5. **Canonical key hygiene.** Most plans had a leading blank line inside the frontmatter block (e.g., `---\n\ntitle: ...`). The fars-core parser handled this, but removing it is cleaner. Standard order adopted: id, title, type, status, date-created, part-of, serves, goal, department, cross-cuts, tasks, blocks, blocked-by, depends-on, horizon, work-type, priority, owner, theory-sources.

## Total context reduction

251,322 → 19,710 bytes: **231,612 bytes removed** from the 156-record plan corpus' largest contributors. Analyses that absorbed extractions are ~30KB combined (not in the plan-corpus budget). Net corpus savings: roughly 200KB against the 293K-token target.
