---
type: definition
class: palette-entry
status: current
realizes: [color-budget]
depends-on: []
see-also: [bone, alarm-red, witness-blue, color-budget]
---

# Ink

The bible's primary mark-bearing color.
Token `--ink`.
Hex `#0A0A0A`.
RGB 10 · 10 · 10.
CMYK 0 · 0 · 0 · 100 (rich black: 40 · 30 · 30 · 100).
Pantone Black 6 U.

Ink is *structural*, not functional.
It carries no symbolic job; it is what the bible is made of.
All type, all rules, all hand-cut artwork is ink unless explicitly assigned to another color.
There is no coverage cap on ink (see [color-budget](teaching/explanations/color-budget.md)).

## Derived token

`--ink-soft` `#5A5A5A` — ink at 60 %.
Used for recessive type that still needs to read but should not compete with primary type.
Use it once per page, sparingly.
Caption text outside the figure-evidentiary register is the canonical home for ink-soft.
The bible refuses other gray tints — `--ink` and `--ink-soft` are the only two ink values.

## Contrast pairs

| Pair                                            | Ratio    | WCAG                  |
|-------------------------------------------------|----------|------------------------|
| Ink on [bone](bone.md)                          | 16.8 : 1 | AAA all sizes          |
| [bone](bone.md) on ink                          | 16.8 : 1 | AAA all sizes          |
| [alarm-red](alarm-red.md) on [bone](bone.md)    | 4.1 : 1  | AA large only (≥ 18 pt / 14 pt bold) |
| [witness-blue](witness-blue.md) on [bone](bone.md) | 7.6 : 1 | AAA                    |
| [alarm-red](alarm-red.md) on ink                | 4.1 : 1  | AA large only          |

Ink on bone (and bone on ink) carries the bible's primary reading load and is the only pair permitted at body sizes (B1 / B2 of the [type-scale](teaching/explanations/type-scale.md)).

## Print notes

- **Riso:** Pure black is straightforward.
  Print ink first, then color over.
- **Newsprint:** Bone is the paper itself.
  Don't print bone as ink; use uncoated newsprint stock and let it be the ground.
- **Photocopy:** Ink reproduces faithfully on all B&W copiers.
  Design so the page still reads when the [alarm-red](alarm-red.md) drops out (which it does on most B&W copiers).

## Forbidden

No tinted gray (no 25 %, 50 %, or 75 % screens of ink as a "subtle" device).
Ink at any percentage other than 100 % or 60 % is a defect.
No ink on a [witness-blue](witness-blue.md) ground, no ink on an [alarm-red](alarm-red.md) ground.
