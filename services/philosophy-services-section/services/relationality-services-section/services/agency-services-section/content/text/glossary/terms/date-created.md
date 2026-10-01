---
name: "Date Created"
type: "page"
description: The date an entity was first written into the system.
---

The date an entity was first written into the system. Set once at creation; never updated.

# Date Created

## What this is

`date-created` is a [relation](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/archive/relation.md) declaring when an entity was first written into the system.
It is set at the moment of creation and never changed thereafter.
It is the entity&rsquo;s own record of its origin — independent of any version control system.

`date-created` MUST be a valid [Date](../../documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/library/flatfile-agential-resource-system/library/date/date.md): `YYYY-MM-DD` in UTC.
It MUST be set at creation and never subsequently modified.
It MUST reflect the date the entity was written, not the date it was committed or deployed.
It MUST NOT be updated when the entity&rsquo;s content changes — that is [date-modified](date-modified.md).
It MUST NOT be inferred retroactively from git history — if an entity lacks `date-created`, add it with today&rsquo;s date.

## Open questions
