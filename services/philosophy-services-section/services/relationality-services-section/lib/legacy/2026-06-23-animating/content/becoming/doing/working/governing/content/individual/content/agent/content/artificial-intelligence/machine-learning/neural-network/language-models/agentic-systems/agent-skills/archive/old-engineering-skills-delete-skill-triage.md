---

description: Delete a skill and remove it from the registry
name: triage
enables-capabilities: [harness-config, code-edit]
version: [0, 1]
runtime: inference
triggers:
  - "delete skill"
  - "remove skill"
inputs:
  skill_id: string
outputs:
  deleted_path: string
region:
  reads: ["content/**/skills/"]
  writes: ["content/**/skills/", ".claude/skills/registry.md"]
dependencies:
  - find-thing
part-of: agential-relations-system
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

Delete skill: $ARGUMENTS

## Instructions

1. **Find the skill** using `/find-thing` or search for its SKILL.md.

2. **Confirm with emsenn** before deleting. State the skill path and
   what it does.

3. **Remove the skill directory** (SKILL.md and any colocated scripts).

4. **Remove the entry** from `.claude/skills/registry.md`.

5. **Report** what was deleted.
