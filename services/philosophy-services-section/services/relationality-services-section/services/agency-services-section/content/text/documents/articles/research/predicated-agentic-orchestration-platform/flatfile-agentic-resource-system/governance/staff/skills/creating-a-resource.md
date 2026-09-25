---
name: creating-a-resource
description: Skill for creating a new entity file in a FARS theory in conformance with theory-encoding.md R1-R13.
title: creating-a-resource
---

## Determine kind from directory

Kind is determined entirely by directory path (R2 of theory-encoding.md).
Choose the directory first, then name the file.

| Directory | Kind |
|---|---|
| `structures/` | structure |
| `transformers/` | transformer |
| `concepts/` | concept |
| `governance/rules/specifications/` | specification |
| `governance/staff/skills/` | skill |

The slug is the filename without `.md`.
It must be lower-kebab-case.

## Name the entity

**Transformers** must be named as present-participle gerunds: `negating`, `truth-preceding`, `assembling-kit`, `dispatching`.
The gerund names the action the predicate performs, not a noun form of the relationship.
A name like `dispatch`, `has-type`, or `assemble-kit` is wrong; `dispatching`, `typing`, `assembling-kit` are correct.

**Structures** are singular nouns: `entity`, `transformer`, `predication-cell`.

**Concepts** are noun phrases naming the role: `true`, `false`, `bilattice-value`.

## Scaffold the frontmatter

Every resource needs exactly two keys: `name` and `description`.
No other keys are valid unless they are slugs of transformers in Ob(C) — files that exist in some `transformers/` directory of this substrate (R7, R10).

```
---
name: <slug>
description: <one declarative sentence stating what this entity is>
---
```

There is no `source:`, `target:`, `type:`, `class:`, `realizes:`, `depends-on:`, `see-also:`, or any other metadata key.
Those are all R7 violations.

If you want to encode a relationship between two entities as a predication cell, the key must be the slug of an existing transformer in Ob(C).
If no such transformer exists yet, the relationship lives in the body as prose only until the right transformer is derived and filed.

## Write the body

The body is human-readable prose.
It may express the same data encoded in frontmatter cells.
It must not be the *only* location of data that could be expressed as a predication cell (R12).

The body must not contain a level-1 heading (`# ...
`).
The `name:` frontmatter key is the canonical label (R13).
H2 and deeper headings are fine.

## After creation

Run the audit script to confirm conformance:

```
node governance/staff/skills/auditing-theory-conformance/scripts/audit-theory.mjs --root <theory-root>
```

The new file should not introduce R7, R9, R10, or R13 violations.
