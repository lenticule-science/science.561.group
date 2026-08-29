---
name: progress-cell
description: A predication-cell specialized by its predicate being a progress-measurement morphism and its value being a progress measurement on a work or task target. Records advancement of a work-item along its trajectory toward completion.
specializing: predication-cell
predicate-class: progress-measurement
value-carrier: progress-value
---

A **progress-cell** is a [predication-cell](../../predication-cell.md) $(s, p, o)$ where $s$ is a [work](../../../../../object/library/thing/library/system/library/operating-system/library/computer-operating-system/library/work/work.md) or task target, $p$ is a progress-measurement morphism (`has-progress`, `is-at-stage`, `completes-fraction`), and $o$ is a progress value (a fraction in $[0, 1]$, a named stage, a Boolean done/not-done, or a richer progress structure).

## Why progress-cell is a sub-structure

The general predication-cell is value-blind — the cell is the (s, p, o) position; the value lives separately in the fiber algebra. A progress-cell carries the additional structural commitment that the predicate is one of the canonical progress-measurement morphisms and the value-position takes values in a progress-ordered set. This narrows the cell-form enough that the recording-a-progress-cell morphism (codomain = progress-cell) has invariants the general cell does not — e.g., monotonicity on the knowledge-axis: a progress-cell's value should not move backward without an accompanying revision cell.

The promotion to a sub-structure makes the recording-a-progress-cell morphism lawfully attachable here, with a codomain that knows its progress-cell-specific invariants.

## Distinguishing predication-shape

- `target(progress-cell, work-or-task)` — the subject of progress measurement.
- `measurement-kind(progress-cell, {fraction | stage | boolean | structured})` — which progress-value form.
- `value(progress-cell, progress-value)` — the measurement.
- `at-time(progress-cell, time)` — when the measurement was recorded.
- `measured-by(progress-cell, character)` — the agent that recorded the cell.
- `monotone-since(progress-cell, prior-progress-cell?)` — back-pointer to the prior measurement, asserting monotonicity (or explicitly naming a revision).
