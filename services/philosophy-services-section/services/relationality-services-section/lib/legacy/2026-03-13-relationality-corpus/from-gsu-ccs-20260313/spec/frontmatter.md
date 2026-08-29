---
name: frontmatter

description: "YAML block at the top of every .md file; declarative identity and metadata for that file."
defines: Frontmatter
---

## What it is

Frontmatter is the YAML block between `---` delimiters at the top of a `.md` file.
Every key in frontmatter MUST be defined by a spec, which states what the key means,
its required type, and when it is required or optional.

## Required on every unit file

`id` and `description` are required on every unit file — every `.md` in `math/`,
`spec/`, or a `skills/` directory. Context files (`INBOX.md`, `PLANS.md`, `MEMORY.md`,
`IDEAS.md`, `SOUL.md`, `AGENTS.md`) are exempt.

## The `id` field

kebab-case, unique within the department directory. The filename MUST be `<id>.md`.
The CamelCase display form is derived as CamelCase(`id`) and MUST NOT be stored.

## The `description` field

Plain prose, ≤200 characters, no LaTeX. Describes what the file is about — not its
epistemic status (that is `kind`) and not a restatement of what it defines (that is
`defines`).

## Additional fields by file type

- [`spec/math-unit.md`](math-unit.md) — `kind`, `defines`, `describes`, `domain`, `codomain`, `math_symbol`, `lean_file`
- [`spec/skill-file-format.md`](skill-file-format.md) — `skill-closure-kind`
- [`spec/specs.md`](specs.md) — `defines`, `describes`, `domain`, `codomain`

## Open questions

- `domain` and `codomain` appear in both math unit frontmatter (morphism types) and
  spec files (skill chain types). Whether these are the same field with two uses or
  two distinct fields sharing a name is unresolved.
