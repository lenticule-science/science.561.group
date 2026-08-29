---
id: date-created
description: "The date an entity was first written into the system. Set once at creation; never updated."
defines: DateCreated
extends: Relation
uses: Date
date-modified: 2026-03-19
params:
  entity: relational-universe
  date: relational-universe
output: relational-universe-morphism
ast:
  creation-timestamp:
    - entity
    - date
---

# Date Created

## What this is

`date-created` is a [relation](relation.md) declaring when an entity was first written into the system.
It is set at the moment of creation and never changed thereafter.
It is the entity's own record of its origin — independent of any version control system.

`date-created` MUST be a valid [Date](date.md): `YYYY-MM-DD` in UTC.
It MUST be set at creation and never subsequently modified.
It MUST reflect the date the entity was written, not the date it was committed or deployed.
It MUST NOT be updated when the entity's content changes — that is [date-modified](date-modified.md).
It MUST NOT be inferred retroactively from git history — if an entity lacks `date-created`, add it with today's date.

## Open questions

