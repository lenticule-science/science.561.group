---
name: getting-a-predication-cell
description: Returns a predication cell — the oriented triple (subject, predicate, object) — given its coordinates. Validates that the coordinates are well-formed and returns the cell as a structured object conforming to the predication-cell schema. The cell IS its three coordinates; this skill does not consult the substrate, does not compute a value, and does not attach provenance.
title: getting-a-predication-cell
---

## Requirements

- A `subject` argument: a kebab-case slug.
- A `predicate` argument: a kebab-case slug.
- An `object` argument: either a kebab-case slug or a literal value (string, number, boolean, array, object, null).

## Steps

1. Validate that `subject` is a string matching the kebab-case slug pattern `^[a-z0-9](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predication-cell/doing/working/getting-a-predication-cell/[a-z0-9-]*[a-z0-9])?$`. If not, fail with a structured error.
2. Validate that `predicate` is a string matching the same pattern. If not, fail.
3. Validate that `object` is present (not undefined). The object's type beyond presence is the concern of the predicate's codomain, not this skill.
4. Run `scripts/get.mjs` with the validated arguments to perform steps 1–3 mechanically and produce the return.
5. Return the JSON object `{subject, predicate, object}` — the predication cell.

## Outcomes

- A JSON object `{subject, predicate, object}` is returned, the predication cell as a mathematical object. It conforms to the predication-cell schema at `work/governance/rules/specifications/predication-cell/schema.json`.
- The substrate is unchanged (no read, no write).

Failure outcomes:

- Malformed arguments (not kebab-case for `subject` or `predicate`, missing `object`) result in a structured error response.

## What this skill is not

This skill *constructs and returns* a predication cell — it does not evaluate, look up, audit, or otherwise interrogate the substrate. In particular:

- It does **not** check whether the cell is "in the substrate." A predication cell is the triple $(s, p, o)$ regardless of what any valuation has assigned to it.
- It does **not** return a bilattice value. The cell's value under any valuation lives in the [predication-fiber-algebra](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/code/structures/predication-fiber-algebra.md) $A_p$, not in the cell. Returning a value would conflate the cell-as-position with one valuation's image at that position.
- It does **not** attach provenance, witness data, or source records. Those belong to apparatus (a witness fibration or similar) that has not yet been earned at this substrate.

Operations that *evaluate* a cell against a valuation, or that check the cell's membership in some substrate-defined subset, are separate skills on separate transformers, gated on earning the [predication-valuation](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predication-valuation.md) apparatus.
