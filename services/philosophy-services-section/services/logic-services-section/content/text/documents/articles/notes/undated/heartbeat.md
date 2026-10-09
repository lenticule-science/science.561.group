---
name: heartbeat
description: A short, mutable checklist of standing awareness items a thing should hold across sessions — rendered to the thing's surface as HEARTBEAT.md on install.
specializing: thing
is-surface-file: true
realizes: standing-orientation
title: heartbeat
---

A **heartbeat** is a thing's standing-orientation file. It is the short checklist a session reads before acting, distinct from longer-form surface files (`MEMORY.md` for project context, `SOUL.md` for values, `DREAMS.md` for goals). Items in a heartbeat are *standing* — recurring or opportunistic awareness tasks the thing holds across sessions — not in-flight task records (those live under `doing/working/hacking/doing/working/planning/library/task/library/`).

## Why heartbeat lives at thing/

Heartbeat is one of the consumer-surface files declared in [the layout specification](../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/semiotic-computer-system-services-section/lib/legacy/2026-07-05-doing/working/hacking/teaching/explaining/the-operators-prescribed-thing-directory-layout.md) — every recursive-template $thing carries it. Per [the layout-map study notes line 20–21](../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/semiotic-computer-system-services-section/lib/legacy/2026-07-05-doing/working/hacking/doing/working/planning/library/project/library/realigning-the-repository-layout/study-notes/layout-map.md), the surface set is `README, AGENTS, SOUL, HEARTBEAT, …`. Because the surface is universal across the polysemy bracket, the heartbeat structure lives at the apex (thing/library/) rather than at any specific sub-system's library.

## Mutability discipline

A heartbeat is mutable *by principal direction*. A character or operator may strike completed items and may add items when a captain directs or a completed task reveals a follow-on; a session does not invent heartbeat items from its own inference. The discipline keeps the heartbeat anchored to operator-validated standing items rather than letting it drift into a personal todo-list.

## Characteristic predication-shape

- `belongs-to(heartbeat, thing)` — the thing whose standing orientation this is. Often a character but not exclusively — any thing-directory may bear a heartbeat.
- `has-item(heartbeat, item)` — one cell per checklist entry.
- `has-item-state(item, {open | done})` — markdown `- [ ]` vs `- [x]`.
- `renders-to(heartbeat, surface-path)` — the path the heartbeat is copied to on install (typically `HEARTBEAT.md` at the install root).

## Constraints

- A heartbeat SHOULD carry no more than 20 items. Above that, items are moved to `work/` records or struck.
- Items MUST be actionable and readable by a session that did not see the prior session's chat.
- A heartbeat MUST NOT carry identity-disclosure content, values or behavioral constraints (which live in SOUL.md), project context (MEMORY.md), or goals (DREAMS.md).
