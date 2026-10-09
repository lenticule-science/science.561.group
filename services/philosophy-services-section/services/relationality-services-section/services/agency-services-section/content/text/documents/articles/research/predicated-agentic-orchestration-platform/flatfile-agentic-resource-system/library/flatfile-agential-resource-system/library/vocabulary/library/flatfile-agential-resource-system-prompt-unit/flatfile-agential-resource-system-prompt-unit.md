---
id: flatfile-agential-resource-system-prompt-unit
description: "Transient typed object produced by interpret-prompt and consumed by route-prompt-units; lives only in the skill chain between do-work's two steps, not in any context file."
date-modified: 2026-03-19
params:
  type: relational-universe
  locale: relational-universe
  text: relational-universe
output: relational-universe
ast:
  transient-skill-object:
    - type:
        - principle
        - idea
        - operation-item
        - conjecture
        - question
        - gap
    - locale
    - text
title: Flatfile Agential Resource System Prompt Unit
---

# Flatfile Agential Resource System Prompt Unit

## What it is

A FlatfileAgentialResourceSystemPromptUnit is an intermediate object in the `do-work` skill chain.
It is produced by `interpret-prompt` ([interpret-prompt](../../../../../../../library/relational-hyperverse-repository/skills/interpret-prompt.md)) and consumed by `route-prompt-units` ([route-prompt-units](../../../../../../../library/relational-hyperverse-repository/skills/route-prompt-units.md)).
It is not stored anywhere permanently — it is translated into the appropriate context-file Unit type during routing.

This makes FlatfileAgentialResourceSystemPromptUnit a skill object type (cf. [flatfile-agential-resource-system-proof-skill-object-types](../flatfile-agential-resource-system-proof-skill-object-types/flatfile-agential-resource-system-proof-skill-object-types.md)), not a FlatfileAgentialResourceSystemContextEntry ([flatfile-agential-resource-system-context-entry](../flatfile-agential-resource-system-context-entry/flatfile-agential-resource-system-context-entry.md)).

## Required fields

Every FlatfileAgentialResourceSystemPromptUnit has:

- `type` — one of: `Principle`, `Idea`, `OperationItem`, `Conjecture`, `Question`, `Gap`
- `locale` — the `id` of the locale this unit belongs to
- `text` — the content extracted from the operator prompt

## Type-specific fields

| Type | Additional required fields |
|------|---------------------------|
| `Principle` | (none beyond required) |
| `Idea` | `problem` — the gap or need the idea addresses |
| `OperationItem` | `action` — one-sentence deliverable |
| `Conjecture` | `evidence` — supporting reasoning from the prompt, or empty string |
| `Question` | (none beyond required) |
| `Gap` | `location` — file or skill where the gap was found, or empty string |

## Routing targets

`route-prompt-units` maps each FlatfileAgentialResourceSystemPromptUnit to a context-file Unit as follows:

| FlatfileAgentialResourceSystemPromptUnit type | Becomes | Placed in |
|----------------|---------|-----------|
| `Principle` | Principle | `{locale}/SOUL.md` |
| `Idea` | Idea | `{locale}/IDEAS.md` |
| `OperationItem` | OperationItem | `{locale}/PLANS.md` |
| `Conjecture` | Idea | `math/IDEAS.md` |
| `Question` | Message | `{locale}/INBOX.md` |
| `Gap` | OperationItem or Idea | `{locale}/PLANS.md` or `{locale}/IDEAS.md` |

## Open questions
