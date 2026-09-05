---
title: "AGENTS.md routing chain to file-location skill"
date-created: 2026-03-09T00:00:00
authors:
  - emsenn
  - claude
type: plan
status: active
priority: high
keywords:
  - AgentsChain
  - FileLocation
  - Routing
  - KnowingSemioverse
goal: "002"
depends-on: []
supersedes: [1, 11]
---

## Goal

An agent in a fresh session, given a file to place, should be routed through a chain of AGENTS.md files to a skill that procedurally answers: is there ONE correct location (MUST) or multiple plausible locations (SHOULD)?
SHOULD answers signal an opportunity to make the decision more deterministic.

## The routing chain (target state)

```
AGENTS.md (parent repo)
  → personal/projects/emsdeavor/AGENTS.md
    → personal/projects/emsdeavor/emsemioverse/AGENTS.md
      → math/.../agential-semioverse/practices/AGENTS.md
        → ./standards/directory-and-file-locations/
             practices/skills/
             locate-file/SKILL.md
```

Each level specializes the previous.
The emsemioverse AGENTS.md explicitly states which agential-semioverse practices it supersedes.

## The locate-file skill (target behavior)

Given a file description, the skill: 1.
Uses existing repo skills (find-thing, list-thing-contents, etc.) to gather context 2.
Applies the placement procedure from the knowing-semioverse standard and semiotic-directory-layout specification 3.
Returns one of: - **MUST**: one correct location — deterministic, no ambiguity - **SHOULD**: a ranked list of candidate locations — ambiguous 4.
When it returns SHOULD: flags the decision as a candidate for making more deterministic (new ADR, new rule, or frontmatter convention)

The SHOULD→MUST feedback loop is the progressive automation principle (policy 001) applied to file placement specifically.

## Phases

### Phase 1 — Audit and fix the AGENTS.md chain

- Verify each AGENTS.md in the chain exists and points forward correctly
- `personal/projects/emsdeavor/AGENTS.md` — exists?
- `personal/projects/emsdeavor/emsemioverse/AGENTS.md` — exists?
- `math/.../agential-semioverse/practices/AGENTS.md` — exists?
- Create missing links; add forward-pointer language to each

### Phase 2 — Create directory-and-file-locations standard

At `math/.../agential-semioverse/standards/directory-and-file-locations/` (or under knowledge-systems/standards/): - index.md: what this standard governs - practices/specification.md: the placement rules (consolidates semiotic-directory-layout and knowing-semioverse placement procedure) - decisions/: ADRs for placement decisions

### Phase 3 — Write locate-file skill

At `standards/directory-and-file-locations/practices/skills/locate-file/SKILL.md`

Inference skill initially.
Uses: - find-thing (check if a Thing already exists) - list-thing-contents (see what's near the candidate location) - The placement procedure from the standard

Returns MUST or SHOULD with reasons.

### Phase 4 — Mine triage for file-location content

Run mine-triage against keywords: file location, placement, directory, where does X go, content organization.
Promote relevant triage content to the directory-and-file-locations standard.

### Phase 5 — Progressively harden SHOULDs to MUSTs

After running the skill on real cases, collect SHOULD outcomes.
For each: write an ADR explaining why one location is better, or write a frontmatter convention that makes the decision deterministic.

## Success criteria

- Fresh agent, given "where does Python that parses JSON-LD into TTL go?", reaches the locate-file skill via AGENTS.md chain
- Skill returns MUST: one location with clear reasoning
- OR returns SHOULD: candidate locations with the ambiguity flagged for resolution

## Log

2026-03-09 — Plan created from emsenn's vibe-encoded architectural vision.
Phase 1 is the immediate next step.
