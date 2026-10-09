---
description: Validate a skill against ASR quality standards
id: check-skill
version: [0, 1]
type: meta
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
name: check-skill
part-of: technology/specifications/agential-semioverse-repository
title: check-skill
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

## Additional material from the Google Drive library

Check skill: $ARGUMENTS

## Instructions

Run the checker script:

```bash
python content/technology/specifications/agential-semioverse-repository/skills/check-skill/check-skill.py $ARGUMENTS
```

Use `--all` to check all skills. Use `--json` for structured output.

The script validates each SKILL.md against six checks, organized by
the two-tier frontmatter system:

**Dispatch tier** (required for a functioning skill):
1. **dispatch-fields** — `description` present and specific enough for
   Claude Code prompt matching. At least one trigger phrase or a
   descriptive `description`.

**Analysis tier** (required for validation-complete manifests):
2. **manifest-analysis** — `id` matches directory name, `region` present,
   version/kind/runtime/inputs/outputs/dependencies/scopes well-formed.
3. **semantic-frontmatter** — at least one semantic relation field
   (defines, requires, part-of, etc.)
4. **colocated-code** — scripts alongside SKILL.md (required if
   `runtime: script`)
5. **registry-entry** — skill appears in `.claude/skills/registry.md`
6. **body-concreteness** — body references concrete files, commands, or
   skill invocations
