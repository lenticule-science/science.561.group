---
id: prompt-unit
description: "Transient typed object produced by interpret-prompt and consumed by route-prompt-units; lives only in the skill chain between do-work's two steps, not in any context file."
---

# PromptUnit

## What it is

A PromptUnit is an intermediate object in the `do-work` skill chain. It is produced
by `interpret-prompt` (§interpret-prompt) and consumed by `route-prompt-units`
(§route-prompt-units). It is not stored anywhere permanently — it is translated
into the appropriate context-file Unit type during routing.

This makes PromptUnit a skill object type (cf. §proof-skill-object-types), not a
Unit (§unit).

## Required fields

Every PromptUnit has:

- `type` — one of: `Principle`, `Idea`, `WorkItem`, `Conjecture`, `Question`, `Gap`
- `department` — one of: `math`, `proof`, `spec`, `src`, `root`
- `text` — the content extracted from the operator prompt

## Type-specific fields

| Type | Additional required fields |
|------|---------------------------|
| `Principle` | (none beyond required) |
| `Idea` | `problem` — the gap or need the idea addresses |
| `WorkItem` | `action` — one-sentence deliverable |
| `Conjecture` | `evidence` — supporting reasoning from the prompt, or empty string |
| `Question` | (none beyond required) |
| `Gap` | `location` — file or skill where the gap was found, or empty string |

## Routing targets

`route-prompt-units` maps each PromptUnit to a context-file Unit as follows:

| PromptUnit type | Becomes | Placed in |
|----------------|---------|-----------|
| `Principle` | Principle | `{department}/SOUL.md` |
| `Idea` | Idea | `{department}/IDEAS.md` |
| `WorkItem` | WorkItem | `{department}/PLANS.md` |
| `Conjecture` | Idea | `math/IDEAS.md` |
| `Question` | Message | `{department}/INBOX.md` |
| `Gap` | WorkItem or Idea | `{department}/PLANS.md` or `{department}/IDEAS.md` |
