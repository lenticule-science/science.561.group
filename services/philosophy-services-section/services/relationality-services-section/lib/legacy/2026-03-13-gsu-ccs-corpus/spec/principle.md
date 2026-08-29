---
id: principle
description: >
  A Principle is a named, stable constraint in a department's SOUL.md that
  defines what the department is and what it must never compromise. Principles
  are not plans or rules — they are identity claims that bound every decision
  made in the department.
defines: Principle
---

# Principle

*Spec-domain object*

## What it is

A Principle is the atomic element of a department's `SOUL.md`. It is a named
constraint that states what the department exists to do and what must never
be violated in pursuit of other goals. Principles are not instructions to
agents — they are the ground that instructions stand on.

The distinction matters: a WorkItem tells an agent what to do next; a
Principle tells an agent what it is, so it can judge what to do in situations
no WorkItem anticipated. When a compliance rule and a discovered shortcut
conflict, the Principle determines which wins.

## Required fields

Every Principle MUST have:

- **A name**: a short noun phrase (kebab-case or natural prose heading) that
  uniquely identifies the principle within the department
- **Statement**: one to three sentences stating the principle as a positive
  claim about what the department does or values
- **Failure mode**: one sentence describing what goes wrong when this
  principle is violated — the problem it exists to prevent

A Principle SHOULD have:

- **Implication**: one or two sentences on what the principle requires in
  practice — how it shows up in daily decisions

## Canonical format

```markdown
## {name}

{statement: one to three sentences stating the principle positively}

**Failure mode:** what goes wrong when this is violated.

**Implication:** (optional) what this requires in practice.
```

## Stability

Principles change rarely. A SOUL.md that is updated on every pass is a sign
that it contains plans or rules, not principles. The test: if the principle
could be derived from PLANS.md or AGENTS.md rather than from the department's
telos, it is probably a rule, not a principle, and belongs elsewhere.

When a Principle is revised, the old version MUST be preserved with a comment
noting the date and reason for change. Principles are load-bearing — other
departments read them to understand what they can rely on from this department.

## What SOUL.md is NOT

- Not a plan (those are WorkItems in PLANS.md)
- Not a rule list (those are in AGENTS.md under "Hard rules" or permissions)
- Not a memory (those are MemoryEntries in MEMORY.md)
- Not a description of current state (it describes what always must be true)

The root-level `SOUL.md` states the principles of the repository as a whole.
Each department's `SOUL.md` states the principles specific to that department.
Department principles MUST NOT contradict the root-level principles.

## Relationship to other types

- Principles are written by: humans, during the foundational design of a
  department. The improvement skill does not add Principles.
- Principles are read by: every agent at session start, before any plans or
  inbox items are processed.
- A Principle that is repeatedly violated SHOULD trigger a WorkItem to
  investigate why — either the Principle is wrong (update it) or the
  department is drifting (fix the behavior).
