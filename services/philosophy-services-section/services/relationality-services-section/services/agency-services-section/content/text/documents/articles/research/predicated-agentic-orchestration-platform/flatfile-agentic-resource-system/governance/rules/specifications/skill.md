---
name: skill
description: Specification of skill entities in a filestore — what frontmatter is required, what the body must contain, and how scripts relate to the skill entity that wraps them.
title: skill
---

A skill entity describes one executable capability the substrate makes available to agents.

## File location

Skill entities live at `<theory>/governance/staff/skills/<skill-slug>.md` for flat skills, or at `<theory>/governance/staff/skills/<skill-slug>/<skill-slug>.md` for skills that include scripts.
Skills belonging to a specific character agent live under `<theory>/governance/staff/characters/<character-slug>/skills/<skill-slug>/`.

## Frontmatter

### `name`

The slug naming this skill.
Required.
Must match the filename stem.

### `description`

One-sentence statement of what this skill does — what capability it provides to an invoking agent.
Required.

No additional frontmatter keys are permitted unless they are [transformer](../../../structures/transformer.md) slugs per R7 of the theory-encoding specification.

## Body

The body describes:

- **What the skill does**: the goal, the substrate state it targets, the outcome it produces.
- **Inputs**: arguments the skill takes at invocation — name, type, whether required or optional, what values are valid.
- **Output**: what the skill produces — new entities, modified predication cells, witnessed events, or exit status.
- **Witness**: what substrate-recorded events the skill emits on completion or failure.

## Scripts

A skill that includes executable scripts has a `scripts/` subdirectory alongside the skill's `.md` file.
Each script is a `.mjs` file (ESM Node).
Scripts are not substrate entities — they are not `.md` files and do not carry frontmatter.
The skill entity is the substrate record; the script is the implementation.

A skill entity must name its scripts in the body.
A script file without a corresponding skill entity violates the agential-self-generation invariant.

## What this specification does not pin

The structured frontmatter for a skill's required-capability, cost-estimate, and queuing agent is deferred to a future sub-spec once the AgOP scheduling algebra is stable enough to commit.
Until then, `name` + `description` + body are sufficient for conformance.
