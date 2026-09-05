---
name: heartbeat
description: A short, mutable checklist of standing awareness items a character should hold across sessions — the per-character `HEARTBEAT.md` file rendered at the repository root on install.
---

A heartbeat is a character's standing-orientation file.
It is the short checklist a session reads before acting, distinct from longer-form character surface files (`MEMORY.md` for project context, `SOUL.md` for values, `IDENTITY.md` for disclosure rules, `DREAMS.md` for goals).
Items in a heartbeat are *standing* — recurring or opportunistic awareness tasks the character holds across sessions — not in-flight task records (those live under `doing/working/hacking/doing/working/planning/library/task/library/`).

A heartbeat is mutable by principal direction.
A character may strike completed items and may add items when a captain directs or a completed task reveals a follow-on; a character does not invent heartbeat items from its own inference.

A heartbeat is rendered to the repository root as `HEARTBEAT.md` when a character is installed via `installing-a-character-as-a-claude-configuration`.
The authoritative source lives in the character store at `doing/governing/characters/<slug>/HEARTBEAT.md`.

## Characteristic predication-shape

- `belongs-to(heartbeat, character)` — the character whose standing orientation this is.
- `has-item(heartbeat, item)` — for each checklist entry; one cell per item.
- `has-item-state(item, {open | done})` — markdown `- [ ]` vs `- [x]`.
- `renders-to(heartbeat, surface-path)` — the path the heartbeat is copied to on install (typically `HEARTBEAT.md` at the repository root).

## Constraints

- A heartbeat SHOULD carry no more than 20 items.
  Above that, items are moved to `work/` records or struck.
- Items MUST be actionable and readable by a session that did not see the prior session's chat.
- A heartbeat MUST NOT carry identity-disclosure content (that lives in `IDENTITY.md`), values or behavioral constraints (`SOUL.md`), project context or key-path inventories (`MEMORY.md`), or goals (`DREAMS.md`).

## Provenance

The heartbeat concept enters this catalog from the survey at `prose/learning/surveys/survey-of-ai-characters-may-2026.md` (the OpenClaw-style filesystem-substrate character pattern, where `HEARTBEAT.md` is one of the rendered surface files) and the specification at `doing/governing/characters/rom-keldar/governance/rules/specifications/heartbeat-file.md` (the existing per-character spec carried under Rom Keldar's character store).
The shape pinned here is grown from those two records and the present working observation that calder-underhill's `HEARTBEAT.md` already exists and is read at session start by the per-character `CLAUDE.md`.
