---
type: definition
class: frame
status: current
realizes: [caption-as-evidence, glance-direction]
depends-on: [type-stack, type-scale, ink, witness-blue]
see-also: [caption-as-evidence, two-registers, spec-block]
---

# Caption block

The unit attached to every figure in a 561 artifact.
Holds a `FIG ##.#` label and the five-field caption.

## Geometry

- Set in [Roboto Slab](type-stack.md), M1 (11 / 14, color `--ink-soft`).
- `FIG ##.#` set in the same family at the same size, weight 700.
- Left-aligned to the figure's left edge.
- Max width equals the figure's width.
- Spacing: 8 px below the figure's bottom edge.

## Form

```
FIG ##.# — [what]. [who]. [where]. [when]. [source / rights].
```

Periods between fields.
Empty fields drop.
See [caption-as-evidence](teaching/explanations/caption-as-evidence.md) and the [caption-setting morphism](../morphisms/caption-setting.md).

## Numbering

`FIG ##.#` numbering follows the bible's section numbering: a figure inside § 03 is `FIG 03.1`, the next is `FIG 03.2`, and so on.
Figures in sub-sections inherit the parent section's two-digit prefix (a figure in § 03.2 is still `FIG 03.x`, not `FIG 03.2.x`).
The decimal counter resets per section.

## Color

Captions are set in `--ink-soft` (60 % [ink](ink.md)).
When a caption points to a quantity or a date that is the artifact's evidentiary claim, that quantity or date may be set in [witness-blue](witness-blue.md) — but only the quantity, not the surrounding caption text.
The default is ink-soft.

The `FIG ##.#` label itself is also `--ink-soft`, weight 700.
It is never set in [alarm-red](alarm-red.md) or [witness-blue](witness-blue.md).

## Conflicts

- A caption never sits *over* a figure.
  It sits beneath.
  See [no-type-set-over-photography theorem](../theorems/no-type-set-over-photography.md) for the related rule.
- A caption never spans a column wider than the figure it labels.
  If the figure is 3 columns wide, the caption is 3 columns wide.
- A figure with no caption is a defect at proofing.
  If the figure is purely decorative (rare in 561 work), set a `FIG ##.#` with `decorative; no source` so the figure is still accounted for.
