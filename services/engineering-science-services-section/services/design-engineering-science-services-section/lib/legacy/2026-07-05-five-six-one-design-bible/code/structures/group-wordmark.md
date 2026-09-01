---
type: definition
class: wordmark
status: current
realizes: [mark-as-numeral]
depends-on: [five-six-one-mark, type-stack]
see-also: [five-six-one-mark, stamp-mark]
---

# GROUP wordmark

The wordmark "GROUP" set in [Space Grotesk 500](type-stack.md), uppercase, positive tracking.
"GROUP" is *not* part of the [primary mark](five-six-one-mark.md); it is a permitted lockup partner.
The mark may appear without "GROUP" (banners, stencils, stamps).
"GROUP" never appears without the mark.

## Three lockups

**Vertical (A) — primary lockup.** Numeral at *H*; "GROUP" beneath, right-aligned to the numeral's right edge.
"GROUP" cap-height = 0.18 *H*.
"GROUP" tracking +0.22 em.
Vertical interval between numeral baseline and "GROUP" cap-line: 0.08 *H*.
Use as the primary lockup for all artifacts where the mark needs to assert authorship.

**Inline (B) — letterheads, footers, sign-offs.** Numeral and "GROUP" share a baseline.
Separator: a vertical rule of weight `--ems-rule-hair` (1 px / 0.25 mm) at height equal to numeral cap-height, offset `--ems-u3` (14 px / 3.5 mm) from each side.
"GROUP" cap-height = 0.21 *H*, tracking +0.20 em.
Use in letterheads, document footers, web headers below 96 px tall, and sign-offs at the close of long-form text.

**Foot (C) — single line, monoweight.** Single line: `561 · GROUP`.
Family Space Grotesk 500 (not 700), tracking +0.16 em, separator middle-dot (U+00B7) padded by single space on each side.
No bracket rule.
Use only in artifact feet, page-numbered colophons, and on objects where the vertical lockup will not survive the medium (single-color stamps, single-line signage, embroidered labels).

The lockup choice is made via the [lockup-selection morphism](../morphisms/lockup-selection.md).

## Translation

Translation of "GROUP" is permitted in the inline and foot lockups; the vertical lockup retains the English wordmark to keep the geometric block consistent.
Translated wordmarks at the same metrics:

- "GRUPO" (es)
- "GWOUP" (ht)
- "GROUPE" (fr)

The [translation morphism](../morphisms/translation.md) governs the procedure and the colophon credit.

## Forbidden

No taglines beneath the wordmark.
No "EST.
2024" or other date stamps.
No registered trademark or copyright symbols adjacent to "GROUP".
No co-marks beside the numeral — see [no-co-marks-beside-the-numeral theorem](../theorems/no-co-marks-beside-the-numeral.md).
