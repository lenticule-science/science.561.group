---

description: Encode a learning from the current session into a persistent vault artifact
name: encode-learning
version: [0, 1]
runtime: inference
triggers:
  - "encode learning"
  - "remember this"
  - "save this pattern"
inputs:
  learning: string
outputs:
  artifact_path: string
region:
  reads: ["content/", ".claude/"]
  writes: [".claude/", "content/technology/specifications/"]
dependencies: []
scopes: []
part-of: technology/specifications/agential-semioverse-repository
aliases:
  - triage
enables-capabilities:
  - pattern-detection
udc-id:
  - "004.8"
arxiv-id:
  - cs.MA
title: encode-learning
---
Encode: $ARGUMENTS

## Instructions

Something was learned during this session that should persist. Determine
where it belongs:

1. **Operational rule** (how the vault works) → update CLAUDE.md
2. **Skill improvement** (a skill should work differently) → edit the
   SKILL.md directly
3. **Agent memory** (project state, conventions, patterns) → update
   the appropriate file in `memory/`
4. **Policy from emsenn** (constraint on agent behavior) →
   update `memory/policies.md`
5. **Interaction pattern** (how to parse emsenn's signals) →
   update `memory/interaction-patterns.md`
6. **ASR specification** (formal operational rule) → update the
   relevant spec in `content/technology/specifications/agential-semioverse-repository/`
7. **New skill** (a recurring operation needs its own skill) →
   create a new SKILL.md in `.claude/skills/`

Write the encoding. Keep it minimal — one fact, one rule, one pattern.
Don't duplicate what's already encoded elsewhere.

Report what was encoded and where.
