---

description: Validate a skill against ASR quality standards
version: [0, 1]
runtime: script
triggers:
  - "check skill"
  - "validate skill"
inputs:
  skill_id: string?
  all: boolean?
outputs:
  results: object[]
region:
  reads: ["content/**/skills/"]
  writes: []
dependencies: []
scopes: []
---
Check skill: $ARGUMENTS

## Instructions

Run the checker script:

```bash
python content/technology/specifications/agential-semioverse-repository/skills/check-skill/check-skill.py $ARGUMENTS
```

Use `--all` to check all skills. Use `--json` for structured output.

The script validates each SKILL.md against six checks:

1. **manifest-required** — id, description, region present
2. **manifest-optional** — version, kind, runtime, triggers, inputs, outputs, dependencies, scopes
3. **semantic-frontmatter** — at least one semantic relation field (defines, requires, part-of, etc.)
4. **colocated-code** — scripts alongside SKILL.md (required if `runtime: script`)
5. **registry-entry** — skill appears in `.claude/skills/registry.md`
6. **body-concreteness** — body references concrete files, commands, or skill invocations
