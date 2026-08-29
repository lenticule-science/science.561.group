---
id: date
description: "A point in calendar time, represented as an ISO 8601 date string. The general concept underlying date-created and date-modified relations."
defines: Date
related: DateCreated, DateModified
params:
  representation: iso8601-string
output: relational-universe
ast:
  calendar-point:
    - representation
---

# Date

## What this is

A **date** is a point in calendar time.
In this system dates are always represented as ISO 8601 strings (`YYYY-MM-DD`).
A date is not a timestamp — it carries day-level precision, not sub-second.
It is not a history in the mathematical sense ([history](./history.md)) — it is a human-readable label for when something happened, not an element of the history monoid T.
A Date MUST be a valid ISO 8601 date string in `YYYY-MM-DD` format.
It MUST be in UTC — no timezone offsets.

## Open questions

- Whether a full datetime (`YYYY-MM-DDTHH:MM:SSZ`) should be an alternative
  or replacement for cases where day-level precision is insufficient.
