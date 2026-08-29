---
name: 0077-recognize-value
act: RecognizeValue
index: 77
slug: recognize-value
top: TailTrace
bottom: SeedValue
summary: >-
  Seeds alone do not collect all values, so the act *Tail Trace* witnesses the
  act *Seed Value*.
strata:
  - term
phase: free
keywords:
  - act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

Seeds alone do not collect all values, so the act *Tail Trace* witnesses the act *Seed Value*.

In `(TailTrace SeedValue)` the tail aggregates every value seed, thereby producing the recognition *Recognize Value*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
