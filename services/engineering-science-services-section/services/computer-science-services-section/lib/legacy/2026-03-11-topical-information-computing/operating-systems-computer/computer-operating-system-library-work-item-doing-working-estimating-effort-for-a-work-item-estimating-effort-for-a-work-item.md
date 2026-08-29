---
name: estimating-effort-for-a-work-item
description: Asserts (target, has-estimated-effort, <value>) on a work-item. Effort is recorded as a free-form string for now.
specializing: asserting-positing-morphism
---

An **estimating-effort-for-a-work-item** call is the asserting positing that writes (target, has-estimated-effort, <value>) — a new workflow predicate not in the original 9-cell shape but available as an optional refinement.
The value is currently a free-form string (e.g., 'small', '2h', '0.5d'); future work may formalize an effort ordering.
