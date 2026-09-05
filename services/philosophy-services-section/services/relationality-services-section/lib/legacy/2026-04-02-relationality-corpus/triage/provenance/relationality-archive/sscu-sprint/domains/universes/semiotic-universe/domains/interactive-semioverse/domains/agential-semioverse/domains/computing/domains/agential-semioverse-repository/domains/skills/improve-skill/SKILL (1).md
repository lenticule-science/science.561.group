---
name: SKILL (1)

description: Improve an existing skill based on what was learned during execution
version: [0, 2]
runtime: inference
triggers:
  - "improve skill"
  - "fix skill"
  - "update skill"
inputs:
  skill_id: string
  improvement: string?
outputs:
  changes: string[]
region:
  reads: ["content/**/skills/"]
  writes: ["content/**/skills/", ".claude/skills/registry.md"]
dependencies:
  - find-thing
  - check-skill
scopes: []
---

Improve skill: $ARGUMENTS

## Instructions

1. **Find the skill.** Use `/find-thing` or search `content/**/skills/{id}/SKILL.md`.

2. **Read the SKILL.md** and any colocated scripts.

3. **Identify what needs to change** from $ARGUMENTS or from the current
   session's experience using the skill.

4. **Make the improvement.** Follow these best practices:

   - **Prefer scripts over prose.** A skill should move toward typed scripts
     that take structured input and produce structured output. Prose
     instructions are a starting point, not a goal. If a skill's operation
     can be expressed as a script (Python, bash), write the script and set
     `runtime: script`.
   - **Type the inputs and outputs.** Use specific types (`string`, `path`,
     `string[]`, `number`), not vague descriptions.
   - **Preserve frontmatter structure.** Keep id, version, kind, runtime,
     triggers, inputs, outputs, region, dependencies, scopes.
   - **Bump the minor version** when adding fields or narrowing scope.
     Bump the major version when changing types or breaking compatibility.

5. **If the skill needs a new script**, write it alongside SKILL.md or in
   a `scripts/` subdirectory.

6. **Run `/check-skill`** on the updated skill to verify it passes.

7. **Update the registry** at `.claude/skills/registry.md` if description,
   triggers, or path changed.

8. **Report** what changed and why.
