---
id: flatfile-agential-resource-system-skill-result
description: "The output type of any skill invocation: either a success value or a structured error. Error is first-class state, not an exception."
returns: Success, SkillError
component-of: Skill
date-modified: 2026-03-19
params:
  skill-invocation: relational-universe-morphism
output: relational-universe
ast:
  coproduct-success-error:
    - skill-invocation
    - success:
        - declared-codomain
    - skill-error:
        - error-class
        - error-message
        - context
title: Flatfile Agential Resource System Skill Result
---

# Flatfile Agential Resource System Skill Result

## What this is

A **FlatfileAgentialResourceSystemSkillResult** is the complete output of any skill invocation.
Every skill produces either a success value (its declared codomain) or a **SkillError**.
Error is not an exceptional case — it is a named output type that the calling skill MUST handle.
A skill that fails silently, halts with no output, or produces garbage rather than a structured error has not completed; it has abandoned its caller.
Every skill MUST emit a SkillError rather than failing silently when it cannot produce its codomain output.
A skill CANNOT return null as its primary output without a SkillError explaining why.

## SkillError structure

A SkillError MUST contain: - `error_class` — one of: `MissingInput`, `ValidationFailure`, `UnexpectedState`, `SkillNotFound`, `Unresolvable` - `error_message` — one sentence describing what went wrong - `context` — what was being attempted (the skill name and the input that triggered it)

A SkillError MAY contain: - `recovery_hint` — one sentence on what might resolve it (e.g., "run X first", "add Y to PLANS")

## Error classes

| Class | Meaning |
|-------|---------|
| `MissingInput` | A required domain input was absent or null |
| `ValidationFailure` | An input was present but did not satisfy a stated constraint |
| `UnexpectedState` | The world did not match what the skill assumed (e.g., file missing, field absent) |
| `SkillNotFound` | A called sub-skill does not exist or cannot be located |
| `Unresolvable` | The skill applied all its rules and reached no output; the territory is empty or inaccessible |

## Skill-kind obligations

A Process MUST emit `UnexpectedState` if a step assumes a condition that is not met.
A Process has no branches but can still discover that the world is not what it expected.
A Procedure MUST propagate SkillErrors from any skill it calls — either by handling the error in a branch or by re-emitting it as its own output.
A Procedure CANNOT silently discard a SkillError returned by a called skill.
A Derivation MUST emit `Unresolvable` if its inference rules produce no judgment given the inputs.
An Inquiry MUST emit `Unresolvable` if the territory is inaccessible or empty.
"Nothing found" is a valid, named output — use `Unresolvable` only when the inquiry could not even be conducted.

## Error routing

SkillErrors that are not handled locally MUST propagate to the calling improvement skill ([flatfile-agential-resource-system-improving](../flatfile-agential-resource-system-improving/flatfile-agential-resource-system-improving.md)).
The improvement skill routes them via `skills/post-work-update.md`: - `UnexpectedState` / `ValidationFailure` → "Fix needed" finding → PLANS - `SkillNotFound` → "Gap" finding → IDEAS - `Unresolvable` → noted as outcome; no PLANS item unless it reveals a gap

## Open questions

- Formal typing of FlatfileAgentialResourceSystemSkillResult as a coproduct type in the skill algebra — blocked by: skill-algebra construction
