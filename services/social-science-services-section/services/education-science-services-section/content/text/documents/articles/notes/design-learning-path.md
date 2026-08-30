---
description: Design a multi-skill learning path through the vault for a specific learning goal
id: design-learning-path
name: design-learning-path
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "design a learning path"
  - "create a learning path"
  - "plan a course of study"
inputs:
  goal: string
  starting_level: string?
outputs:
  path_document: string
  skills_required: number
  gaps_identified: number
region:
  reads: ["content/"]
  writes: ["content/education/"]
dependencies:
  - find-thing
scopes: []
part-of: education/specifications/educational-agential-semioverse-repository
---
Design a learning path for: $ARGUMENTS

## Instructions

1. Clarify the learning goal. What should the learner be able to DO after completing the path? Not "understand X" but "given Y, do Z." If the goal is vague, propose a specific, testable formulation and confirm with emsenn.

2. Identify existing learn skills relevant to the goal:

```bash
find content -path "*/skills/learn-*/SKILL.md" -type f | sort
```

3. Read each relevant skill's SKILL.md to understand:
   - What it teaches (completion criteria)
   - What it requires (prerequisite skills)
   - What lessons it points to
   - What it explicitly excludes

4. Map the dependency graph. Starting from the target skill(s), trace backward through prerequisites to find the full set of skills needed. Identify:
   - **Required skills**: must be completed to reach the goal
   - **Optional skills**: deepen understanding but are not strictly required
   - **Missing skills**: needed but do not exist yet (gaps)

5. For each missing skill, note:
   - What it would teach
   - What lessons would need to be written
   - Where it would live in the vault structure

6. Determine the learner's starting level. If `starting_level` is specified, identify which skills the learner already has. Otherwise, assume no prior skills.

7. Produce the learning path document:

### Learning path structure

```markdown
# Learning Path: [Goal]

## Goal
[Testable statement of what the learner can do after completing this path]

## Starting assumptions
[What the learner is assumed to already know/be able to do]

## Path

### Phase 1: [Foundation]
- **learn-X** — [what this provides toward the goal]
  - Lessons: [list]
  - Estimated scope: [brief]

### Phase 2: [Building]
- **learn-Y** (requires: learn-X) — [what this provides]
  - Lessons: [list]

[Continue phases as needed]

## Independent skills
[Skills that can be completed in any order, not dependent on each other]

## Gaps
[Skills or lessons that need to be created for this path to be complete]
- **learn-Z** (does not exist) — would teach [what], needed because [why]

## Scope
[What this learning path covers and what it does not]
[Whose knowledge it centers and what traditions it draws from]
```

### Rules

- Do not force linear order on independent skills. If skills A and B have no dependency, say they can be done in either order.
- Identify gaps explicitly. A learning path that pretends all its pieces exist when some do not is dishonest.
- State scope. Every learning path centers some knowledge and excludes other knowledge. Name what.
- The path is a dependency graph, not a numbered list. Present it as such.
- Each skill in the path should contribute something specific toward the goal. If a skill is included "for background" without a clear connection, justify its inclusion or remove it.
