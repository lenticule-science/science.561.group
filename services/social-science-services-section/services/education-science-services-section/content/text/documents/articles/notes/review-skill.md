---
description: Review a learn-* skill against structural criteria — completion criteria, prerequisites, scope, and pedagogical soundness
id: review-skill
name: review-skill
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "review skill"
  - "check skill page"
  - "audit learn skill"
inputs:
  path: string
outputs:
  report: object
region:
  reads: ["content/"]
  writes: []
dependencies: []
scopes: []
part-of: education/specifications/educational-agential-semioverse-repository
title: review-skill
---
Review the skill at: $ARGUMENTS

## Instructions

1. Read the skill file at the specified path.
2. Read all lessons and prerequisite skills it references.
3. Check against each criterion below.

## Structural criteria

### Completion criteria

- **Present**: Does the skill have a "What you will be able to do" section (or equivalent)?
- **Testable**: Are the criteria stated as concrete actions ("given Y, do Z") rather than vague understanding ("understand X", "be familiar with Y")?
- **Aligned with lessons**: Do the lessons actually teach what the completion criteria claim? Read the lessons and check.
- **Appropriately scoped**: Are the criteria achievable from the listed lessons, or do they require knowledge not covered?

### Prerequisites

- **Stated**: Does the skill list prerequisites (or explicitly say "none")?
- **Specific**: For each prerequisite, does it state what specifically is needed from it?
- **Exist**: Do the referenced prerequisite skills actually exist in the vault?
- **Sufficient**: Do the prerequisites provide everything the skill's lessons assume?

### Lessons

- **Linked**: Does the skill link to actual lesson pages that exist?
- **Complete**: Do the listed lessons cover the completion criteria? Are there gaps?
- **Ordered correctly**: If lessons are presented in sequence, does the dependency structure support that order?
- **Independence noted**: If lessons are independent of each other, does the skill say so?

### Scope

- **Present**: Does the skill have a scope section?
- **Honest**: Does it state what the skill does NOT cover?
- **Reasoned**: Does it explain why exclusions are excluded (not just "out of scope")?

### Verification

- **Present**: Does the skill include a verification section?
- **Concrete**: Is the verification task specific enough that a learner can actually do it?
- **Aligned**: Does the verification test the completion criteria?

## Dependency graph check

Trace the skill's place in the broader dependency graph:

```bash
grep -rl "learn-$(basename $(dirname $PATH))" content/ | grep SKILL.md
```

- What skills depend on this one?
- Is this skill a dead end (nothing depends on it) or a hub (many things depend on it)?
- If it is a dead end, is that intentional or a gap?

## Output format

For each criterion, report:
- **Pass** / **Partial** / **Fail**
- Specific evidence
- Suggestions for improvement

Summary: what the skill does well and what needs the most work.

Do not rewrite the skill. Report only.
