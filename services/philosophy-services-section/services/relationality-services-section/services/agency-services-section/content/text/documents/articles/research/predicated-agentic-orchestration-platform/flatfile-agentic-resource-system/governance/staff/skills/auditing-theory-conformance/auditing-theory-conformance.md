---
name: auditing-theory-conformance
description: Skill for running a full conformance audit of a FARS theory against theory-encoding.md R7, R9, R10, R13, and the transformer naming convention.
title: auditing-theory-conformance
---

## When to use

- After creating or editing any entity in the theory.
- After changing any specification (theory-encoding.md or per-kind specs) — the audit surfaces which existing entities now violate the updated rule.
- After renaming or deleting a transformer — the audit will flag any file that still references the old slug as a frontmatter key.
- Before committing changes to the theory submodule.
- As the baseline read before starting any migration or cleanup pass.

## How to use

From any directory, pass the theory root:

```
node governance/staff/skills/auditing-theory-conformance/scripts/audit-theory.mjs --root <theory-root>
```

To also audit sub-theories in `theories/`:

```
node governance/staff/skills/auditing-theory-conformance/scripts/audit-theory.mjs --root <theory-root> --recurse
```

For machine-readable output (pipe into other tools or scripts):

```
node governance/staff/skills/auditing-theory-conformance/scripts/audit-theory.mjs --root <theory-root> --json
```

## What it checks

| Rule | Description |
|---|---|
| R9 | Every entity has `name:` and `description:` with non-empty string values |
| R7/R10 | Every frontmatter key other than `name` and `description` is a slug in Ob(C) — a file under some `transformers/` directory |
| R13 | No entity body contains a level-1 heading (`# ...`) |
| naming | Every file in `transformers/` has a slug ending in `-ing` (gerund); non-gerund transformer names are reported as warnings |

## What it does not check

- R8 (entity reference resolution) — whether frontmatter values name existing `.md` files.
  That is a separate audit: `auditing-entity-references`.
- R12 (data not only in prose) — whether meaningful relationships are in frontmatter.
  This requires semantic judgment and is not automatable by a structural scanner.
- R11 (self-application correctness) — whether the theory's own structure is internally consistent.
  This requires theory-level reasoning beyond frontmatter scanning.

## Interpreting output

Each finding is:
```
<relative-path>
  [<rule>] <message>
```

`R7` findings mean a frontmatter key needs to be either removed or replaced with a call to derive the corresponding transformer first.
Do not remove data — move it to the body prose if no transformer exists yet.

`R9` findings are blockers: an entity without `name` or `description` is not properly formed.

`R13` findings are H1 headings in the body — remove the `# Title` line; the `name:` frontmatter is the title.

`naming` warnings are transformer files whose slug does not end in `-ing`.
Investigate whether the name should be refactored to the gerund form before fixing anything — see the `deriving-a-transformer` skill.

## Relationship to other audit skills

This skill is the entry point for a full audit.
For focused work on one concern, use the atomic audit skills:

- `auditing-frontmatter-keys` — explains R7/R10 in detail
- `auditing-frontmatter-presence` — explains R9 in detail
- `auditing-body-headings` — explains R13 in detail
- `auditing-transformer-names` — explains the gerund naming convention in detail
