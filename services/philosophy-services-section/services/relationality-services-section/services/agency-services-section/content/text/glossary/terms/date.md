---
name: "Date"
type: "page"
description: A point in calendar time, represented as an ISO 8601 date string.
---

A point in calendar time, represented as an ISO 8601 date string. The general concept underlying date-created and date-modified relations.

# Date

## What this is

A **date** is a point in calendar time.
In this system dates are always represented as ISO 8601 strings (`YYYY-MM-DD`).
A date is not a timestamp — it carries day-level precision, not sub-second.
It is not a history in the mathematical sense ([history](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/archive/history.md)) — it is a human-readable label for when something happened, not an element of the history monoid T.
A Date MUST be a valid ISO 8601 date string in `YYYY-MM-DD` format.
It MUST be in UTC — no timezone offsets.

## Open questions

- Whether a full datetime (`YYYY-MM-DDTHH:MM:SSZ`) should be an alternative
or replacement for cases where day-level precision is insufficient.
