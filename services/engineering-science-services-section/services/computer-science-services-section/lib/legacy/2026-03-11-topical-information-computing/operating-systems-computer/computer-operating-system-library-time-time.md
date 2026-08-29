---
name: time
description: A point in the host's wall-clock and monotonic-clock pair, rendered as an ISO-8601 string for use as the t-field of EAVT rows. Realized via POSIX clock_gettime against CLOCK_REALTIME and CLOCK_MONOTONIC.
specializing: computer-operating-system
realizes-standard: iso-8601
clock-source: posix-clock-gettime
---

A **time** instance is one point on the host's clocks, rendered as a string in ISO-8601 format (`YYYY-MM-DDTHH:MM:SS.sssZ`, UTC) for use as the `t` field of every EAVT row in the witness log [layout-map.md:48–58](../../../../../../../../../../doing/working/hacking/doing/working/planning/library/project/library/realigning-the-repository-layout/study-notes/layout-map.md).
The host produces the value by calling POSIX `clock_gettime(2)` against `CLOCK_REALTIME` (for the wall-clock string) and optionally `CLOCK_MONOTONIC` (for elapsed-duration calculations); the value is then formatted per ISO 8601-1:2019.

## Why time is a structure and not just a primitive

The math forces time to be a $\mathcal{P}$-object rather than an unstructured datum because every EAVT row's `t` field content-addresses the row together with its `e` field [layout-map.md:48–58].
The content-address contract requires the time field's interpretation to be unambiguous across the federation — same clock-source convention, same string format, same precision.
Promoting time to its own structure record locks those interpretations into one place all producers and consumers reference.

The morphism `getting-the-current-time` is a $\mathcal{P}$-morphism whose codomain is time; it lives at `time/doing/working/getting-the-current-time/` once relocated.

## Distinguishing predication-shape

- `has-value(time, iso8601-string)` — the rendered string.
- `clock-source(time, {realtime | monotonic})` — which POSIX clock produced it.
- `precision(time, {seconds | milliseconds | microseconds | nanoseconds})` — the precision of the rendering.
- `host(time, host-identifier)` — the machine whose clock produced it (federation-relevant).

## Not synonymous with

- **Duration** — a duration is a difference between two time instances; the difference is monoidal under addition.
  The time structure carries instances; the duration structure (when created) would carry differences.
- **Date** — a date is a coarser projection of time (day granularity, no clock-time).
  A date is derivable from a time by projecting to its day component.
