---
type: morphism
class: setting
status: current
realizes: [grid-system, baseline-grid]
depends-on: [document-grid-web, document-grid-print]
see-also: [grid-break, type-pairing]
---

# Grid fitting

Place every element of an artifact on the [grid](teaching/explanations/grid-system.md), and place every text-bearing element on the [baseline grid](teaching/explanations/baseline-grid.md).
The morphism is the operative procedure for laying out a page.

## Procedure

1. Choose the format.
  Use the [document-grid-web](../objects/document-grid-web.md) for digital surfaces, the matching format from [document-grid-print](../objects/document-grid-print.md) for print.
2. Choose the column ratio per page: 5 / 7, 7 / 4, 6 / 6, 8 / 4, or 12 (full bleed).
  Do not vary the ratio mid-page.
3. Lay the [section head](../objects/section-head.md) and [folio bar](../objects/folio-bar.md) per their geometry specs (folio cols 1–12, § number cols 1–2, section title cols 3–12).
4. Place text-bearing elements on the baseline grid.
  Body, captions, list items, table rows, sidebars, folio bars all snap.
5. Place photographs and [commissioned artwork](../objects/commissioned-artwork.md) on column edges; they do *not* snap to baseline.
  The figure floats vertically within its columns.
6. Captions under figures snap to baseline (the figure does not, the caption does).

## What snaps

| Element                              | Snap to baseline? | Snap to columns? |
|--------------------------------------|--------------------|---------------------|
| Body copy                            | Yes                | Yes                 |
| Captions                             | Yes                | Yes                 |
| List items, table rows               | Yes                | Yes                 |
| Sidebar text                         | Yes                | Yes                 |
| [Folio bars](../objects/folio-bar.md) | Yes              | Yes                 |
| Section heads                        | Yes                | Yes                 |
| Photographs                          | No                 | Yes                 |
| [Commissioned artwork](../objects/commissioned-artwork.md) | No                 | Yes                 |
| Display type (D1–D4)                 | Yes (cap-line)     | Yes                 |
| Rules (decorative)                   | Yes                | Yes                 |
| The [primary mark](../objects/five-six-one-mark.md) | Yes (bracket-rule) | Yes      |

## Cross-column baseline alignment

When two columns of body copy share a spread, their baselines must align horizontally.
A reader scanning across the spread should not see one column's ascenders climbing while the other's stay flat.
Cross-column alignment is a check at proof time: hold a straight-edge across the spread; baselines should sit on the same line.

## When the grid will not hold

Once per document, maximum, the grid may break — to mark a refusal, a death, or an act of state.
See the [grid-break morphism](grid-break.md) and the [grid-break-once theorem](../theorems/grid-break-once.md).
Document the break in the [colophon](../objects/colophon-stamp.md): page, reason, who approved.

## Failure modes

- **Off-baseline body copy.** Usually because a paragraph was hand-tracked or the body family was substituted.
  Reset to standard tracking and the [type-stack](../objects/type-stack.md) family.
- **Photograph snapped to baseline.** Distorts proportions for no gain.
  Unsnap; align to columns only.
- **Cross-column drift.** One column has a section head that pushes the body down; the other does not.
  Fix: align the spread, not the columns individually.
