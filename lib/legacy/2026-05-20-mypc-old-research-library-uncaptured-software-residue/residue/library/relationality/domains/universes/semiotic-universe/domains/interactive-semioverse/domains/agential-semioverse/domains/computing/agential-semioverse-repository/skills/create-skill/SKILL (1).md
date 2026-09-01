---
description: Create a new skill under the appropriate thing
id: create-skill
version: [0, 1]
type: meta
runtime: inference
triggers:
  - "create skill"
  - "new skill"
  - "write skill"
inputs:
  name: string
  parent_thing: string
  description: string?
outputs:
  path: string
region:
  reads: ["content/"]
  writes: ["content/**/skills/", ".claude/skills/registry.md"]
dependencies:
  - find-thing
scopes: []
---
Create skill: $ARGUMENTS

## Instructions

1. **Determine the parent thing.** Every skill lives under a thing in the
   content hierarchy, in a `skills/{skill-name}/` directory. Use `/find-thing`
   to locate the parent.

   Examples:
   - A skill for editing markdown → `semiotic-markdown/skills/`
   - A skill for auditing the vault → `agential-semioverse-repository/skills/`
   - A skill for learning topology → `mathematics/disciplines/topology/skills/`

2. **Create the directory** at `content/{parent}/skills/{skill-name}/`.

3. **Write SKILL.md** with this frontmatter structure:

   ```yaml
   ---
   description: {what the skill does}
   id: {kebab-case-name}
   version: [0, 1]
   kind: {operational | learn | meta}
   runtime: {inference | script | manual | documentation}
   triggers:
     - "{trigger phrase}"
   inputs:
     {name}: {type}
   outputs:
     {name}: {type}
   region:
     reads: ["{paths}"]
     writes: ["{paths}"]
   dependencies: []
   scopes: []
   ---
   ```

4. **Write the body.** Best practices:

   - **Prefer scripts over prose.** If the operation can be a Python or bash
     script, write the script and set `runtime: script`. Prose instructions
     are a starting point — the goal is typed, deterministic operations.
   - **Type the inputs and outputs.** Use specific types: `string`, `path`,
     `string[]`, `number`, `object`.
   - **Reference concrete files.** The body should name specific files,
     commands, or skill invocations — not vague descriptions.
   - **Keep it short.** A skill that needs more than ~30 lines of instructions
     probably needs to be split or scripted.

5. **Add to the registry** at `.claude/skills/registry.md` with the skill's
   path, triggers, and input description.

6. **Report** the path created.
