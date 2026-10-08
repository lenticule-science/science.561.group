---

description: Create a new skill under the appropriate thing
name: create-skill
version: [0, 3]
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
part-of: technology/specifications/agential-semioverse-repository
aliases:
  - triage
enables-capabilities:
  - harness-config
  - code-edit
udc-id:
  - "004.8"
arxiv-id:
  - cs.MA
title: create-skill
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

3. **Write SKILL.md.** The frontmatter has two tiers.

   **Dispatch fields** — what Claude Code reads to find and run the skill:

   ```yaml
   ---
   description: {what the skill does — write this for Claude Code to match against prompts}
   triggers:
     - "{trigger phrase}"
     - "{another phrase}"
   ---
   ```

   The `description` is the most important field. Claude Code matches user
   prompts against it by semantic similarity. Write it as a clear, specific
   statement of what the skill does. The SKILL.md body is the instructions
   Claude Code follows when the skill is invoked.

   **Analysis fields** — for validation tooling, not read by Claude Code:

   ```yaml
   ---
   description: {what the skill does}
   id: {kebab-case-name, must match directory name}
   version: [0, 1]
   kind: {operational | learn | meta}
   runtime: {inference | script | mcp | manual | documentation}
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
   part-of: {parent thing path}
   ---
   ```

   Include analysis fields for skills that should pass `check-skill`
   validation. For quick operational skills, `description` + `triggers` is
   enough to be functional.

4. **Choose the right runtime.**

   - **`inference`** — Claude Code reads the body and executes it as
     instructions. Use for operations that need judgment, context reading,
     or natural language generation.
   - **`script`** — Claude Code runs a colocated Python/bash script. Use
     for deterministic, repeatable operations.

     **Script colocation requirement**: Scripts MUST live in the same
     directory as the SKILL.md that uses them, or in a `scripts/`
     subdirectory of that skill directory. Do NOT place scripts in the
     repo-root `scripts/` directory — that separates the script from
     the skill that gives it meaning, breaking the one-concept-per-file
     principle (policy 002). The skill directory is the unit of
     composition: SKILL.md (instructions) + script (implementation) +
     any supporting files belong together.
   - **`mcp`** — backed by an MCP server configured in `.claude/settings.json`.
     Use for operations that need persistent state, external APIs, or
     database access.
   - **`manual`** — requires a human. The body describes what the human
     should do.
   - **`documentation`** — reference-only, cannot be invoked.

   **Prefer scripts over prose.** If the operation can be a Python script,
   write the script. Prose instructions are a starting point — the goal is
   typed, deterministic operations.

5. **Write the body.** Best practices:

   - **Type the inputs and outputs.** Use specific types: `string`, `path`,
     `string[]`, `number`, `object`.
   - **Reference concrete files.** Name specific files, commands, or skill
     invocations — not vague descriptions.
   - **Keep it short.** A skill that needs more than ~30 lines of instructions
     probably needs to be split or scripted.

6. **Check directive compliance.** Read the policies at
   `personal/projects/emsemioverse/policies/` and verify the skill
   follows all relevant directives. Key policies to check:

   - **001 (progressive automation):** Does the skill move work toward
     being accomplishable by less capable agents? Does it encode
     knowledge that would otherwise require high-capability inference?
   - **002 (one concept per file):** Does the skill produce atomic
     outputs? Or does it generate monolithic files?
   - **003 (ground in discipline practice):** Does the skill draw on
     established methods, or invent ad hoc practices?
   - **004 (constructive reasoning):** Are instructions constructive
     (describe what to do) rather than negative (describe what to avoid)?
   - **005 (accrete, don't replace):** Does the skill add to existing
     content rather than overwriting?
   - **006 (research produces texts):** If the skill does research, does
     it produce a text file as output?
   - **007 (build, then fill gaps):** Does the skill handle gap
     discovery (pause, fill, resume)?
   - **008 (prompts become artifacts):** Does the skill produce repo
     artifacts, not just conversation output?

   Add a `follows-policies` field to frontmatter listing which policies
   the skill implements. Example: `follows-policies: [1, 4, 6, 8]`

7. **Consider hooks.** If the skill should run automatically after certain
   events (e.g., validate frontmatter after every file write), note this in
   the body. Hooks are configured in `.claude/settings.json` under `hooks`
   with events like `PostToolUse`.

8. **Add to the registry** at `.claude/skills/registry.md` with the skill's
   path, triggers, and input description.

9. **Report** the path created.
