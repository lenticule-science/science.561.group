---
title: "Date Modified"
type: "page"
description: The date an entity was last substantively changed.
---

The date an entity was last substantively changed. Updated whenever the entity's content changes.

# Date Modified

## What this is

`date-modified` is a [relation](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/archive/relation.md) declaring when an entity was last substantively changed.
It is updated each time the entity&rsquo;s content is edited.
Together with [date-created](date-created.md), it gives an agent reading an entity a complete picture of its temporal position — without consulting git.

`date-modified` MUST be a valid [Date](../../documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/library/flatfile-agential-resource-system/library/date/date.md): `YYYY-MM-DD` in UTC.
It MUST be updated whenever the entity&rsquo;s content changes substantively.
It MUST equal `date-created` when the entity has never been modified since creation.
It MUST NOT be updated for purely mechanical changes (whitespace normalization, line ending fixes) that do not change the entity&rsquo;s meaning.

## Open questions
