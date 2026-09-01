---
type: morphism
class: exception
status: current
realizes: [refusal-as-design-method, grid-system]
depends-on: [grid-system, document-grid-web, document-grid-print, colophon-stamp]
see-also: [grid-fitting, grid-break-once, refusal-as-design-method]
---

# Grid break

Once per document, maximum.
To mark a refusal, a death, or an act of state that the grid cannot contain.
The grid break is the bible's deliberate exception to its own [grid-fitting](grid-fitting.md) discipline; everywhere else, the [grid](teaching/explanations/grid-system.md) holds.

## When permitted

A grid break is permitted when *the structure of the artifact would mute what the artifact has to say*.
Three canonical cases:

1. **A refusal.** The artifact is rejecting a thing the grid cannot encode — a partner the council voted not to credit, a request the confederacy did not accept, a frame the artifact will not enter.
  The break is the visual mark of that refusal.
2. **A death.** A person who was part of the work has died.
  The break is the page-level acknowledgment.
3. **An act of state.** An eviction, a deportation, a court order, a police action against the work.
  The break marks that the grid (which presumes ongoing operation) cannot describe what happened.

A grid break for any other reason is a defect; it reads as decoration, which is exactly what the bible refuses.

## Procedure

1. Identify the page on which the break will appear.
  The break is a page-level event, not a sub-page event.
2. Render the page off-grid: full bleed, off-axis, larger or smaller type than the [type-scale](teaching/explanations/type-scale.md), an unsupported color combination, an overlapping figure — whatever the artifact requires to mark what it is marking.
3. Document the break in the [colophon](../objects/colophon-stamp.md):
   - Page number where the break appears.
   - Reason: *refusal*, *death*, or *state action* (one word; the artifact's subject carries the rest).
   - Who approved: the editor's name, or "council" if the council voted.

## Hard limit

One grid break per document, full stop.
A document with two grid breaks is malformed; either the first break was not actually load-bearing, or the second was decorative.
The bible's [grid-break-once theorem](../theorems/grid-break-once.md) is the proof-time check.

## Conflicts

- A grid break does not exempt the artifact from the [color-budget](teaching/explanations/color-budget.md).
  Even off-grid, alarm and witness coverage caps hold.
- A grid break does not exempt the artifact from the [refusals](../theorems/) of § 09.
  A grid break that introduces a third-party tracker, a gradient, a foil simulation, or AI-generated imagery is still a defect.
- A grid break overrides the [grid-fitting morphism](grid-fitting.md) on the page where it appears.
  It does not override the morphism on adjacent pages.

## Failure mode

The most common failure is the *unintentional* grid break: a sidebar that drifted off-baseline, a photograph that was bled past the column edge to "make it pop."
This is not a grid break; it is a grid violation, and the fix is to re-fit, not to document.
