---
name: linting-a-theory
description: Skill for running a conformance audit of a FARS theory to surface violations of theory-encoding.md — the entry point for "is this theory valid?"
title: linting-a-theory
---

## When to use

- Before editing a theory: establish the baseline so you know what was already wrong before your changes.
- After any edit: confirm you did not introduce new violations and confirm intended violations are gone.
- After changing theory-encoding.md or any per-kind specification: the audit surfaces which existing entities are now newly non-conformant.
- After adding or removing a transformer: R7 violations may appear or disappear across many files.

## How to use

Run the audit script from the theory root or pass `--root` explicitly:

```
node governance/staff/skills/auditing-theory-conformance/scripts/audit-theory.mjs --root <theory-root>
```

To include sub-theories in `theories/`:

```
node governance/staff/skills/auditing-theory-conformance/scripts/audit-theory.mjs --root <theory-root> --recurse
```

For JSON output (pipe into other tools):

```
node governance/staff/skills/auditing-theory-conformance/scripts/audit-theory.mjs --root <theory-root> --json
```

## What the audit checks

| Rule | What it checks |
|---|---|
| R9 | Every entity has `name:` and `description:` with non-empty string values |
| R7/R10 | Every frontmatter key other than `name` and `description` names a transformer in Ob(C) |
| R13 | No entity body contains a level-1 heading |
| naming | Every transformer slug ends in `-ing` (gerund convention) — warning only |

## What the audit does not check

- R8 (entity reference resolution) — whether frontmatter values name existing `.md` files.
  Deferred; no script exists yet.
- R12 (data not only in prose) — whether meaningful relationships are expressed as cells.
  Requires semantic judgment; not automatable by structural scanning.
- R11 (self-application) — whether the theory encodes itself correctly at the theory level.
- Whether transformer names are mathematically correct (only whether they are gerunds).
  See `deriving-a-transformer` for the correctness question.

## Interpreting findings

Each finding names a rule and a file.
Group by rule to understand what kind of problem you have:

- Many R7 findings on the same set of keys across many files → those keys are metadata that need to be removed from frontmatter or replaced by derived transformers.
  Use `auditing-frontmatter-keys` to understand the remediation.
- R9 findings → missing or empty `name`/`description`.
  Use `auditing-frontmatter-presence`.
- R13 findings → H1 headings in bodies.
  Use `auditing-body-headings`.
- naming warnings → transformer slugs that are not gerunds.
  Use `auditing-transformer-names` before acting.

## Related skills

- `auditing-frontmatter-keys` — R7/R10 in depth
- `auditing-frontmatter-presence` — R9 in depth
- `auditing-body-headings` — R13 in depth
- `auditing-transformer-names` — naming convention in depth
- `deriving-a-transformer` — how to correctly add a new transformer when R7 findings indicate one is missing
- `creating-a-resource` — how to create a new entity that passes the audit from the start
