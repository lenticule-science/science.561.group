---
type: theory
class: agentic-orchestration-platform
description: A general engineering theory of OpenClaw as an agent orchestration platform, covering its architecture, runtime, skill model, heartbeat/cron mechanism, and related operational concepts.
depends-on: []
---

# OpenClaw Theory

An engineering research program that treats **OpenClaw** as an instance of the broader class of *agentic orchestration platforms*.
This theory abstracts away from any specific mathematical substrate (such as predication categories) and focuses on the platform's architectural and operational concepts: the gateway, skills, agent turns, heartbeats, cron jobs, and the relationships among them.

The goal is to provide a shared conceptual vocabulary and set of invariants that can be used to reason about, extend, and compare different agent orchestration systems, with OpenClaw serving as a concrete realization.

## Convention

This research directory follows the spatiotemporal-knowledge research-directory convention.
Every note is a Markdown file with YAML frontmatter; one entity per file; filenames are stable lower-kebab-case slugs.

```yaml
---
type: concept | definition | morphism | theorem | conjecture | question | example | narrative | reference
class: substrate | operator | system | protocol | invariant | ...
status: draft | sketch | proved | open | refuted
depends-on: [...]
realizes: [...]
see-also: [...]
introduces: [...] | recaps: [...] | discusses: [...] | instantiates: [...] | explores: [...]
chapters: [...]
---
```

## Layout

- `concepts/` — engineering-semantic anchors that recur across the program (e.g., *gateway*, *skill*, *agent turn*, *heartbeat*).
- `objects/` — definitions of engineering structures (e.g., *OpenClaw node*, *skill repository*, *cron job*).
- `morphisms/` — the engineering moves: primitive operators (e.g., *spawn subagent*, *heartbeat poll*, *run skill*).
- `theorems/` — engineering claims about platform properties, operator guarantees, and invariants.
- `examples/` — concrete OpenClaw realizations or configurations.
- `narratives/` — short rhetorical documents that walk a path through the material.
- `questions/` — open engineering questions.
- `references/` — annotated bibliography.
- `tools/` — scripts for validation, dependency audit, monograph build.

## Status

Early.
The directory is being assembled to document OpenClaw as a general agent orchestration theory, independent of any specific mathematical foundation.
