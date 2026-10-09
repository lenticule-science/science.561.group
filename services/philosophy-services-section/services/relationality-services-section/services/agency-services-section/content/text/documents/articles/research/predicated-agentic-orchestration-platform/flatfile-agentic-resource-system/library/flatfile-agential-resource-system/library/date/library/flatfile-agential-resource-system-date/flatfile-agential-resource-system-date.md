---
id: flatfile-agential-resource-system-date
description: "The FARS date system: every entity carries date-created and date-modified in frontmatter, maintained by colocated skills and scripts."
date-created: 2026-03-18
date-modified: 2026-03-18
title: Flatfile Agential Resource System Date
---

# Flatfile Agential Resource System Date

## What this is

Every entity in the [FlatfileAgentialResourceSystem](../../../../flatfile-agential-resource-system.md) carries its own temporal record in frontmatter.
An entity is not just what it says — it is also when it said it.

## Required on every entity file

Every entity file MUST carry:

```yaml
date-created: 2026-03-18
date-modified: 2026-03-18
```

`date-created` ([date-created](../../../../../../../../../../../glossary/terms/date-created.md)) — set once at creation, never changed.

`date-modified` ([date-modified](../../../../../../../../../../../glossary/terms/date-modified.md)) — updated each time the entity changes substantively.

Both are [Date](../../date.md) values: `YYYY-MM-DD`.

## When to set dates

| Event | date-created | date-modified |
|---|---|---|
| Writing a new entity | today | today |
| Editing an existing entity | unchanged | today |
| Mechanical fix (whitespace, line endings) | unchanged | unchanged |
| Renaming or moving | unchanged | unchanged |

## Skills and scripts

The skills and scripts for stamping, checking, and updating dates are colocated with this spec in `spec/flatfile-agential-resource-system-date/`.
