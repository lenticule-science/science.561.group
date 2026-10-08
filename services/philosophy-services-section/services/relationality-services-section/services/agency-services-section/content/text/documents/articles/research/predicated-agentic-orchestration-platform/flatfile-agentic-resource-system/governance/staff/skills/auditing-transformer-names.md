---
name: auditing-transformer-names
description: Skill for auditing whether every file in a transformers/ directory is named as a present-participle gerund, consistent with the transformer naming convention.
title: auditing-transformer-names
---

## What this checks

The transformer naming convention: every file in a `transformers/` directory must have a slug that is a present-participle gerund — a word or phrase ending in `-ing` that names the action the predicate performs.

This is not one of the R1–R13 rules in theory-encoding.md, which specify structural validity.
The gerund convention is a naming discipline that makes the predicate set readable and unambiguous: a gerund names what the predicate *does*, not a noun that names what it *is*.

## Why gerunds

Predicates are relations.
The word that best names a relation is the present participle of its verb: `negating`, `specializing`, `conversing`, `projecting-to-subject`.
The gerund communicates: "the predicate whose cells record the act of X-ing between entities."

A noun like `negation` names the abstract concept, not the predicate.
A third-person singular like `negates` implies an agent.
A noun phrase like `has-type` names a possession relation without committing to the directional reading a gerund would make explicit.

## Common violations and corrections

| Wrong slug | Gerund form | Reason |
|---|---|---|
| `specializes` | `specializing` | Third-person singular, not gerund |
| `has-type` | `typing` or `classifying-as` | Possession form; needs derivation |
| `has-slug` | investigate — slug is filename | Probably not needed as a transformer |
| `consolidate` | `consolidating` | Base form, not gerund |
| `dispatch` | `dispatching` | Base form, not gerund |
| `settle` | `settling` | Base form, not gerund |
| `compose` | `composing` | Base form, not gerund |

## The naming question requires derivation, not just renaming

Renaming a transformer is not only a file rename — it changes every frontmatter key across the substrate that uses that transformer.
Before renaming, confirm:

1. The new gerund name accurately describes what the predicate records.
2. The predicate is properly derived from the theory (see `deriving-a-transformer`).
3. All files using the old slug as a frontmatter key are updated.

Do not rename transformers to their gerund form mechanically without verifying the predicate is correctly derived.
A badly-named-but-correctly-derived transformer is less harmful than a gerund-named transformer that encodes the wrong mathematical relationship.

## How to run

The `auditing-theory-conformance` script reports naming warnings:

```
node governance/staff/skills/auditing-theory-conformance/scripts/audit-theory.mjs --root <theory-root> | grep naming
```

Warnings (not errors) are reported for non-`-ing` transformer slugs because some correct gerunds might not end in `-ing` in all languages.
Investigate each warning before acting.

## When to re-run

- When adding a new transformer: confirm its name before writing frontmatter cells that use it as a key.
- During a migration that renames transformers: verify all renamed transformers are correct gerunds.
