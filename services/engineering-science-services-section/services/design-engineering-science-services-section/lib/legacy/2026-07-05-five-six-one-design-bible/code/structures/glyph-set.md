---
type: definition
class: glyph-system
status: current
realizes: [memetic-repeatability]
depends-on: []
see-also: [five-six-one-mark, refusal-as-design-method]
---

# Glyph set — secondary marks

A set of sixteen secondary glyphs constructed on a 64 × 64 grid with 4 px stroke discipline.
Each glyph names a concept from the political vocabulary of the confederacy.
The glyph set is *secondary* — it complements the [primary mark](five-six-one-mark.md), it does not replace it.

The source SVGs live under [tools/glyphs/](../tools/glyphs/) (one file per glyph) and are also held inline in [tools/bible-source/glyphs.js](../tools/bible-source/glyphs.js).

## Inventory

| Glyph        | Name        | Notes                                                 |
|--------------|-------------|-------------------------------------------------------|
| `seed`       | SEED        | Pointed oval with center stroke.                      |
| `soil`       | SOIL        | Four horizontal rules, dashed at decreasing density.  |
| `sovereignty`| SOVEREIGNTY | Outer square, filled inner square.                    |
| `refusal`    | REFUSAL     | Circle with diagonal slash — the prohibition glyph.   |
| `rotation`   | ROTATION    | Curved arrow returning to a corner.                   |
| `frame`      | FRAME       | Four corner brackets, no body.                        |
| `witness`    | WITNESS     | Eye-shape with filled pupil.                          |
| `ration`     | RATION      | Box with handle — measured portion.                   |
| `confederacy`| CONFEDERACY | Three circles in a triangle, dashed connector.        |
| `return`     | RETURN      | Horizontal arrow pointing left.                       |
| `fire`       | FIRE        | Flame outline.                                        |
| `water`      | WATER       | Two stacked wave rules.                               |
| `grain`      | GRAIN       | Vertical stem with paired florets.                    |
| `border`     | BORDER      | Vertical dashed line crossed by a horizontal.         |
| `council`    | COUNCIL     | Circle with cross and saltire — eight-spoke wheel.    |
| `archive`    | ARCHIVE     | Filing-cabinet outline with internal rules.           |

## Construction discipline

- 64 × 64 grid, all stroke endpoints on the grid.
- 4 px stroke width default, 2 px for secondary internal strokes (e.g., the `seed` center line).
- `currentColor` stroke; the glyph inherits the surrounding text color.
- `square` linecaps; no rounded ends.
- No fills except where called out (`sovereignty`'s inner square, `witness`'s pupil — both `currentColor`).

## When permitted

- As marginalia inside long-form artifacts to flag a recurring concept (a `seed` glyph beside a paragraph about seed banks).
- On the cover of a [field-instruction-pamphlet](../examples/field-instruction-pamphlet.md) where the manual's subject can be named with a glyph.
- In the [colophon-stamp](colophon-stamp.md) of an artifact whose subject the glyph names.

## Forbidden

- A glyph as a substitute for the [561 mark](five-six-one-mark.md).
  The mark is the mark.
- A glyph in a [slogan](teaching/explanations/slogan-as-argument.md) instance.
- Glyphs at sizes other than the 64 × 64 grid's integer multiples (16, 24, 32, 48, 64, 96 …).
- Glyphs in [alarm-red](alarm-red.md) or [witness-blue](witness-blue.md) when the surrounding text is in [ink](ink.md).
  Use the surrounding text's color (`currentColor`).
- Inventing new glyphs without council approval.
  The set is sixteen; new entries follow the [template-fork](../morphisms/template-fork.md) procedure.

## Open question

The bible has not yet ruled on when a glyph may appear *without* the [primary mark](five-six-one-mark.md) on the same artifact.
See the [secondary-glyphs-in-the-wild question](questions/secondary-glyphs-in-the-wild.md).
