---
type: concept
class: discipline
realizes: [felt-weight, glance-direction]
instantiates: [rhythm-unit-system]
depends-on: [grid-system]
see-also: [grid-system, type-scale]
---

# Baseline grid

Inside the [grid system](grid-system.md) sits the *baseline grid* — a horizontal-rule cadence to which text-bearing matter snaps.
On web that's 8 px; in print it's pt-based and matches the body leading.

**Snap to baseline:** body copy, captions, table rows, list items, sidebar text, folio bars, and any rule weight that meets type.
When two adjacent columns of body copy share a spread, their baselines must align horizontally — a reader scanning across the spread should not see one column's ascenders climbing while the other's stay flat.

**Do not snap to baseline:** photographs, woodcuts, and other non-textual figures.
These crop to the [grid](grid-system.md)'s columns but float vertically within them; forcing a photograph to baseline distorts its proportions for no visible gain.
Captions *under* a photograph snap to baseline; the photograph itself does not.

The baseline grid is the silent reason a 561 page reads as quiet rather than busy.
Even when a spread holds three or four typographic registers (display, lede, body, mono caption), they all land on the same horizontal cadence, and the eye reads the spread as one organized block rather than as four overlapping organisms.

When the baseline grid is broken — usually because a piece of body copy has been hand-tracked or a sidebar has been set in a non-standard size — the violation propagates downward through the page.
The bible's convention is to fix the cause (return to the [type-scale](type-scale.md) token, return to the standard tracking) rather than to compensate downstream.
