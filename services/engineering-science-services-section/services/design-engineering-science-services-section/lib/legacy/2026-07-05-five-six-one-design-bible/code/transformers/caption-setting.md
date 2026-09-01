---
type: morphism
class: setting
status: current
realizes: [caption-as-evidence, type-as-mass]
depends-on: [caption-block, type-stack, type-scale, ink, witness-blue]
see-also: [caption-as-evidence, two-registers, type-pairing]
---

# Caption setting

Set every figure's caption at the geometry the bible specifies.
Captions are uniform across the artifact so a reader can scan them and reconstruct the artifact's evidentiary spine without reading the body.

## Form

```
FIG ##.# — [what]. [who]. [where]. [when]. [source / rights].
```

Periods between fields.
Empty fields drop.
The five fields are the bare minimum to satisfy the bible's voice-as-specificity rule: every figure announces *what it is, who is in it or made it, where it was taken or made, when, and where the source / rights live*.

## Geometry

- **Family.** [Roboto Slab 400](../objects/type-stack.md), color `--ink-soft` (60 % [ink](../objects/ink.md)).
- **Size.** [Type-scale M1](teaching/explanations/type-scale.md) (11 / 14 px screen, 8 / 10.4 pt print, leading 1.3, tracking +5 %).
- **`FIG ##.#` label.** Same family at the same size, weight 700.
- **Alignment.** Left-aligned to the figure's left edge.
  Max width equals the figure's width.
- **Spacing.** 8 px below the figure's bottom edge.

## Numbering

`FIG ##.#` follows the bible's section numbering — a figure inside § 03 is `FIG 03.1`, the next is `FIG 03.2`, and so on.
Figures in sub-sections inherit the parent section's two-digit prefix (a figure in § 03.2 is still `FIG 03.x`).
The decimal counter resets per section.

## When witness applies

When a caption points to a quantity or a date that is the artifact's evidentiary claim, that quantity or date may be set in [witness-blue](../objects/witness-blue.md) — *only* the quantity, not the surrounding caption text.
The default is `--ink-soft`.

The `FIG ##.#` label itself is `--ink-soft` weight 700.
It is never set in [alarm-red](../objects/alarm-red.md) or [witness-blue](../objects/witness-blue.md).

## Field discipline

- **`[what]`** — the noun phrase that names the figure ("Stamp variant", "Type stack specimen", "Tri-fold pamphlet template").
  Not a description ("a beautiful stamp"); a name.
- **`[who]`** — the people in the figure or who made it.
  Cite the artist for [commissioned artwork](../objects/commissioned-artwork.md), the photographer for photography, the people pictured when consent and safety permit.
- **`[where]`** — the location where the figure was taken or made.
  A place name beats a region; a county beats "the South."
- **`[when]`** — the date in `YYYY · MM · DD` form (the bible's convention).
- **`[source / rights]`** — where the source file lives, what the rights are.
  For [commissioned artwork](../objects/commissioned-artwork.md): the artist's name and license.
  For photography: the photographer's name and license or the archive cite.

## Conflicts

- A caption never sits over a figure.
  It sits beneath.
  See [no-type-set-over-photography theorem](../theorems/no-type-set-over-photography.md).
- A caption never spans a column wider than the figure it labels.
- A figure with no caption is a defect at proofing.

## Check

Cover the body copy.
Read only the captions.
The artifact's evidentiary spine should be reconstructible from the captions alone — what each figure asserts, who made or appears in it, where, when, where the source lives.
