---
title: Agent-skill interaction in the agential semioverse
aliases:
  - "Agent-skill interaction in the agential semioverse"
  - "agent-skill interaction in the agential semioverse"
date-created: 2026-03-03T00:00:00
---

## The skill-first principle

An agent operating within an Agential Semioverse Repository interacts with the repository primarily through skills. A skill is a named, typed operation with declared inputs, outputs, dependencies, and a runtime. Skills are the [interaction surfaces](../../../../mathematics/objects/universes/interactive-semioverse/terms/interaction-surface.md) of the agent profile: they define what the agent can do and how it does it.

The skill-first principle: before performing any operation on the repository, the agent checks whether a skill exists for that operation. If one exists, the agent uses it. If it exists but does not match the current need, the agent improves the skill before proceeding. If no skill exists and the operation is likely to recur, the agent creates one.

This principle has a formal motivation. In the [agential semioverse](../../../../mathematics/objects/universes/agential-semioverse/index.md), an agent's capabilities are defined by its skill set. An operation performed outside the skill set is invisible to the formal model — it has no manifest entry, no typed inputs/outputs, no audit trail. By routing operations through skills, the agent ensures that its actions are legible to the repository: they produce [footprints](../../../../mathematics/objects/universes/interactive-semioverse/terms/footprint.md), they compose with other skills in chains, and they can be verified.

## Skill improvement as closure

Improving a skill in response to a gap between the skill's current specification and the operation needed is itself a closure operation. The seed is the existing skill plus the new requirement. The law is: the skill must handle all cases it has encountered. The [fixed point](../../../../mathematics/concepts/fixed-point/index.md) is a skill that covers the current case and all prior cases.

This means skill improvement is monotone (skills accumulate coverage), inflationary (the improved skill is at least as capable as the prior version), and idempotent (improving a skill that already handles the case is a no-op). These are the properties of a [closure operator](../../../../mathematics/concepts/closure-operator/index.md) on the space of skill specifications.

## Knowledge accretion

Agent sessions generate information about how the repository should work — placement rules, naming conventions, linking patterns, domain relationships, stylistic constraints. This information is valuable but ephemeral: it exists in a conversation context that will be discarded.

The accretion principle: information about repository operations that surfaces during agent work should be encoded into durable artifacts within the repository itself. The appropriate artifact depends on the kind of information:

- **Operational rules** (how to organize directories, what frontmatter to use, when to create index files) belong in specification documents within the ASR spec.
- **Recurring operations** (how to audit references, how to restructure a discipline, how to evaluate draft content) belong in SKILL.md files.
- **Executable tooling** (scripts that automate audits, generate indexes, validate structure) belong in a `scripts/` directory.
- **Formal specifications** (mathematical properties that operations must satisfy) belong in proof assistant code (Lean, Agda) once the mathematics is stable.

The goal is progressive formalization: knowledge moves from conversation → specification → skill → script → formal proof, with each stage making it more durable and more machine-actionable.

## Relationship to other ASR concepts

- **Skill manifests** describe the static interface of a skill. The skill-first principle ensures that manifests stay current by requiring agents to update them when they encounter mismatches.
- **Work units and chains** compose skills into sequences. The skill-first principle ensures that each unit in a chain has a well-defined manifest, making chain validation possible.
- **Error envelopes** describe failure semantics. Skills that follow the skill-first principle produce predictable error envelopes because their failure modes are declared in the manifest.
- **Closure operators as API contracts** describe the mathematical structure of skill execution. Each skill invocation computes a closure; the skill-first principle ensures that the [closure operator](../../../../mathematics/concepts/closure-operator/index.md) itself is maintained as a first-class artifact.
