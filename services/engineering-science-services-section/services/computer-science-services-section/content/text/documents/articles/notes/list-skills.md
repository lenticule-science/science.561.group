---
description: List skills, optionally scoped to a thing
id: list-skills
version: [0, 1]
type: meta
runtime: inference
triggers:
  - "list skills"
  - "what skills"
  - "show skills"
inputs:
  thing_path: string?
outputs:
  skills: string[]
region:
  reads: ["content/**/skills/", ".claude/skills/registry.md"]
  writes: []
dependencies: []
scopes: []
name: list-skills
part-of: technology/specifications/agential-semioverse-repository
title: list-skills
---

List skills: $ARGUMENTS

## Instructions

1. **If a thing path is given**, list skills under that thing:
   ```bash
   find content/{path}/skills -name "SKILL.md" 2>/dev/null
   ```

2. **If no path is given**, list all skills in the vault:
   ```bash
   find content -path "*/skills/*/SKILL.md" | sort
   ```

3. **For each skill found**, show: id, description, runtime, and path.

4. **Also check the registry** at `.claude/skills/registry.md` for any
   skills listed there but not found on disk (stale entries).
