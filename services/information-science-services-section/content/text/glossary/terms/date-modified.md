---
id: date-modified
description: "The date an entity was last substantively changed. Updated whenever the entity's content changes."
defines: DateModified
extends: Relation
uses: Date
params:
  entity: relational-universe
  date: relational-universe
output: relational-universe-morphism
ast:
  modification-timestamp:
    - entity
    - date
---

# Date Modified

## What this is

`date-modified` is a [relation](relation.md) declaring when an entity was last substantively changed.
It is updated each time the entity's content is edited.
Together with [date-created](./date-created.md), it gives an agent reading an entity a complete picture of its temporal position — without consulting git.

`date-modified` MUST be a valid [Date](./date.md): `YYYY-MM-DD` in UTC.
It MUST be updated whenever the entity's content changes substantively.
It MUST equal `date-created` when the entity has never been modified since creation.
It MUST NOT be updated for purely mechanical changes (whitespace normalization, line ending fixes) that do not change the entity's meaning.

## Open questions
