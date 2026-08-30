---
title: Capability Vocabulary and Dictionary
description: Plans formal definition of capability as operational primitive with dictionary, library term, and mappings to skills, roles, and agents.
date-created: 2026-04-30
type: note
name: capability-vocabulary-and-dictionary
keywords:
  - capability-definition
  - capability-dictionary
  - capability-mapping
  - agent-dispatch
  - operational-vocabulary
specialization: plan
horizon: week
work-type: derivation
serves: [operations-loop, dispatch, library-as-knowledge-base]
depends-on: [dispatch-graph-completion]
contributes-to: [agent-governance-enrichment]
produces: capability-as-library-term-plus-dictionary
status: draft
---

The work surfaced that "capability" is being used informally as a dispatch primitive but has no formal definition. The library defines `work-type`, `skill`, `role`, `office`, `duty` — but not capability. Capabilities are the *signature of action domain* an agent can act on: writing, review, code-edit, render, dispatch, etc. They are categorically distinct from work-types (settlement state) and skills (named operational primitives).

Without the term defined, the operational schema is using a fictive vocabulary. The dispatch script's capability filter is implementing a concept the library doesn't ground.

## Tasks

- `capability-write-library-term` — write `library/.../work/terms/capability.md` defining capability, distinguishing it from skill/role/work-type, citing prior art (e.g., Mintzberg's standardization-of-skills, Hohfeld's "powers", Searle's "directed-action ability")
- `capability-establish-dictionary` — produce a small dictionary (~15-20 entries) documenting each capability's meaning, examples, and the skills/roles that imply it. Place at `library/.../work/texts/capability-dictionary.md`
- `capability-link-skills-to-capabilities` — for each skill in `engineering/skills/<X>/triage/SKILL.md`, add `enables-capabilities: [<capability-id>]` derived from the skill's purpose
- `capability-add-provides-capabilities-to-agents` — for each agent, derive `provides-capabilities:` from declared `skills:` (via the skill→capability map) plus `role:` defaults
- `capability-validate-coverage` — every operational role in the agent set produces at least one capability; every capability is provided by at least one agent (no orphaned capabilities; no capability-less agents)

## Acceptance

- A library term defines capability with citations
- The dictionary lists ~15-20 capabilities with skill/role implications
- Every agent has `provides-capabilities:` populated
- The dispatch script can answer "which agents provide capability X" with a clean set query
