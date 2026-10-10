---
name: scheduling-a-work-item
description: Asserts (target, has-deadline, <iso-date>) on a work-item. Writes to the has-deadline characteristic cell.
specializing: asserting-positing-morphism
---

A **scheduling-a-work-item** call is the asserting positing that writes (target, has-deadline, <iso-date>) — one of the 9 characteristic cells of the work-item predication-shape.
The deadline is a single-valued optional cell; later reschedulings overwrite (contesting) rather than asserting fresh.
