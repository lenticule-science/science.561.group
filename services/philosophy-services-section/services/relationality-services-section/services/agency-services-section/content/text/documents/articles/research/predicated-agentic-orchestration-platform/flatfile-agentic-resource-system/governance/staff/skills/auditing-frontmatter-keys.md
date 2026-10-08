---
name: auditing-frontmatter-keys
description: Skill for auditing whether every frontmatter key in every entity (other than name and description) names a transformer in Ob(C) — checking theory-encoding.md R7 and R10.
title: auditing-frontmatter-keys
---

## What this checks

R7 and R10 of theory-encoding.md: every frontmatter key other than `name` and `description` must be the slug of a transformer — a `.md` file in some `transformers/` directory of the substrate.

A key that is not a transformer slug is a lint violation.
There are no approved exceptions, metadata categories, or bootstrap exemptions (R10).

## Why this matters

A frontmatter entry `q: e2` in file `e1` asserts the predication cell $(e_1, q, e_2)$ at true.
If `q` is not a transformer, the cell has no predicate in $\mathrm{Ob}(\mathcal{C})$ — it is not a valid predication in the FARS fibration.
It is metadata: an informal annotation that the substrate cannot reason about categorically.

The rule is binary: either a key names a transformer or it does not.
There is no "informal" or "temporary" category of frontmatter key.

## How to fix a violation

1. Determine what the key is expressing.
2. Ask: does a transformer already exist in Ob(C) that names this predicate?
  If yes, rename the key to that transformer's slug.
3. If no transformer exists yet: the relationship cannot be in frontmatter.
  Move it to the body as prose.
  Note it as a future transformer to derive.

Do not delete the data.
Move it to the body or derive the transformer first.

## Common violations and their causes

- `source:`, `target:` — legacy type-signature metadata from before the theory-encoding spec.
  Move to body prose.
  No transformer for encoding type signatures has been derived yet.
- `type:`, `class:`, `transformer-class:` — classification metadata.
  Move to body prose.
- `depends-on:`, `see-also:`, `realizes:`, `instantiates:` — relationship metadata encoded without a corresponding transformer.
  Move to body prose or derive the transformer.
- `status:`, `slug:`, `aliases:` — bookkeeping metadata.
  Remove entirely (slug is the filename; status and aliases have no substrate meaning under theory-encoding).

## How to run

The `auditing-theory-conformance` skill's script checks R7/R10 as part of its full audit:

```
node governance/staff/skills/auditing-theory-conformance/scripts/audit-theory.mjs --root <theory-root>
```

Filter to R7 findings only:

```
node governance/staff/skills/auditing-theory-conformance/scripts/audit-theory.mjs --root <theory-root> | grep R7
```

## When to re-run

- After editing any entity's frontmatter.
- After adding a new transformer to Ob(C) — new transformer slugs become valid keys.
- After removing a transformer — any file that used that slug as a key now has a new R7 violation.
- After changing theory-encoding.md — to see whether any existing files are newly affected.
