---
name: write-learn-skill
description: Write a learn-* skill that defines a node in a curriculum's dependency graph — a learning result, prerequisite skills, lesson references, scope, and verification.
---

# Write Learn Skill

A `learn-*` skill is a node in a dependency graph: one set of competencies a learner can acquire, with edges to prerequisite skills and a verification criterion that says when the node is completed.

## When to use

You are about to add a new node to a curriculum's dependency graph — a named competence the learner can complete, distinct from the lessons that teach it. Do *not* use this for an individual lesson (see `write-lesson`).

## How it works

### Before writing

1. Identify the subject and the library domain it lives in.
2. Survey existing lessons and terms in that domain.
3. Identify the prerequisite `learn-*` skills already in the graph. Each prerequisite edge needs to state what specifically is needed from the prerequisite, not just that it's needed.
4. Sketch the proposal before writing: skill name (`learn-<subject>`), location (under the subject's `skills/` directory), terminal learning result (what the learner can *do* after), prerequisite skills with edge annotations, lessons the skill points at, what the skill does *not* cover, and any lessons that need to be written.

### Required structure

```yaml
---
name: learn-<subject>
description: <one sentence: what the learner can do after completing this skill>
---
```

Body sections:

- **What you will be able to do** — 2–4 specific, testable completion criteria. Not "understand X" but "given Y, do Z."
- **Prerequisites** — Each prerequisite `learn-*` skill, with edge annotation: "**`learn-<prereq>`** — the definition of X and the ability to do Y."
- **Lessons** — Linked lessons. Do *not* impose linear order on independent lessons; if multiple lessons can be done in any order, say so.
- **Scope** — What the skill covers and what it does not. Be honest about gaps.
- **Verification** — How the learner (or agent) checks completion. Point at self-check exercises in the lessons or state a concrete task the learner should be able to perform.

### Rules

- Each learn skill is a graph node with edges (prerequisites) and a completion criterion.
- Prerequisites point at other learn skills, not at lessons. The skill handles the indirection.
- Completion criteria are specific and testable. "Understand X" is not a criterion.
- Scope is stated explicitly. Every skill excludes things; say what.
- Do not force linear order on independent lessons.
- If a needed lesson does not exist yet, mark it as a gap explicitly: "[Gap: no lesson on X yet. This skill is incomplete until one is written.]"

### After writing

Verify that all referenced lessons and prerequisite skills exist. Report any gaps.

## Prerequisites

- `learn-curriculum-design` — the dependency-graph framing the skill format embodies.
- `write-lesson` — needed because a learn skill points at lessons, and you need to be able to recognize whether the lessons it points at actually teach.
