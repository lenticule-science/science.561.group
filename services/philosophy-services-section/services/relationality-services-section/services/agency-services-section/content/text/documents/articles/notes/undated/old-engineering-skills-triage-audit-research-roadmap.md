---
name: audit-research-roadmap
description: "Coverage view across the math substrate — proven frontier, blocked-on dependencies, orphan dependencies."
status: triage
owner-agent: mathematical-researcher
project: supporting-predcalc-research
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: audit-research-roadmap
---

Reports the state of the math substrate as a roadmap, not as individual entity status.

## Outputs

A markdown roadmap covering:

- **Proven frontier per theory** — for each theory in the predication-categories family, the set of `proved` entities at the leaves of the dependency graph (no proved descendant).
- **Blocked-on graph** — for each `draft` or `stated` entity, what other entities are blocked by it (i.e. cite it transitively).
- **Orphan dependencies** — entities cited in `depends-on:` that don't resolve to anything in the substrate.
- **Lean coverage delta** — count of `proved` entities with vs. without a `lean:` binding, per theory.

## Procedure

Walk the math substrate. Reuse [`audit-citation-graph`](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/skills/math/audit-citation-graph), [`audit-math-dependency-graph`](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/skills/math/audit-math-dependency-graph), and [`audit-lean-coverage`](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/skills/math/audit-lean-coverage) where they cover the underlying queries; assemble the roadmap from their outputs.

## Graduation criteria

Once it has run twice and the captain has approved the report shape.
