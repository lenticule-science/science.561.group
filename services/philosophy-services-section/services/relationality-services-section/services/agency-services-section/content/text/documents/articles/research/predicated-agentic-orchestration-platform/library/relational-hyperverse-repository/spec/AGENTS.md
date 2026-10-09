---
title: spec/AGENTS.md
description: The spec/ directory defines the concepts, conventions, and constraints that govern encoding across the repository.
---
# spec/AGENTS.md

The `spec/` directory defines the concepts, conventions, and constraints that govern encoding across the repository.

**Dependency order: math → proof → spec → src.**

- `math/` establishes mathematical objects and their properties.
  It is the upstream source of truth for any claim about what is mathematically true.
- `proof/` formalizes results from `math/`.
  A proof unit MUST have a corresponding math unit; nothing in `proof/` may contradict `math/`.
- `spec/` encodes formatting rules, naming conventions, and implementation details.
  Spec claims about mathematical objects MUST be backed by links to `math/` units.
  Spec may also define concepts (AgentLoop, Working, Improving) that have no `math/` counterpart — these are spec-domain objects and need no math backing.
- `src/` implements what `spec/` describes.
  It may depend on spec and math but does not override either.

Nothing anywhere may contradict `math/`.
Spec and src may contain objects not yet in math; proof may not.

---

## What spec/ owns

The set of concepts this department specifies is exactly the set of `spec/*.md` files with a `defines:` frontmatter field.
The set of skills is exactly the `spec/skills/*.md` files.
Read those files directly to discover what exists — do not rely on hardcoded lists here.

---

## Skill types

Every skill in this repo declares `skill-closure-kind` frontmatter.
The four valid types (process, procedure, derivation, inquiry) are defined in [skills](skills.md).
`skill-closure-kind` is the single source of truth for the skill's type.

---

## Living documents

These files are maintained by `spec/skills/improve-specs.md` and must never be allowed to drift:

- `spec/AGENTS.md` — this file.
  Current orientation for any agent working in spec/.
  Updated whenever the department's scope or structure changes.
- `spec/PLANS.md` — ordered work plan for spec/.
  Open items only; completed items are deleted (git history is the record).
- `spec/IDEAS.md` — raw ideas not yet ready to plan.
  Mined into PLANS by `improve-specs` whenever blockers are resolved.

---

## What the spec agent does NOT do

- Does not touch `math/` unit content (spec constrains frontmatter; does not author math).
- Does not write Lean code.
- Does not produce RDF or run pipeline tools.
