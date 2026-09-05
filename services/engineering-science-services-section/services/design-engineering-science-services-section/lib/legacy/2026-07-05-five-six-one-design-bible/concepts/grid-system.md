---
type: concept
class: structural-claim
realizes: [glance-direction, non-linear-reading]
instantiates: [closed-geometry-set]
depends-on: []
see-also: [baseline-grid, type-as-mass]
---

# Grid system

The bible's grid system is the substrate on which every artifact is laid out.
There is one screen grid and one print grid, both column-and-baseline, both 12 / 14 columns wide.

**Web — 12-column.** 1320 px container, 14 px gutter, baseline 8 px.
Column ratios used in the bible: 5 / 7 (text + figure, default), 7 / 4 (primary + marginalia, with 1 column blank between), 6 / 6 (symmetric, comparison only), 8 / 4 (long-form text + sidebar), 12 (full bleed, slogan only).
Collapses to 6 / 4 / 2 columns at 960 / 640 / 380 px.

**Print — per-format.** Trim, margin, columns, gutter, baseline, and measure are specified per artifact format ([slogan-poster](../examples/slogan-poster.md), [numeral-banner](../examples/numeral-banner.md), [field-instruction-pamphlet](../examples/field-instruction-pamphlet.md), tabloid newspaper, half-letter zine, sticker).
See [document-grid-print](../objects/document-grid-print.md) for the full table.

The grid does five things at once: it bounds the column measure (50–70 ch, hard cap 75); it positions the [section heads](../objects/section-head.md) (folio bar cols 1–12, § number cols 1–2, section title cols 3–12); it locks photographs to column edges so they crop to the grid rather than to mood; it hosts the [baseline grid](baseline-grid.md) for text-bearing matter; and it provides the once-per-document break point (see [grid-break morphism](../morphisms/grid-break.md)).

The grid realizes [glance direction](../../../terms/glance-direction.md) (the eye is told where to look first by the column structure) and [non-linear reading](../../../terms/non-linear-reading.md) (a column-grid page can be read by entry-point — masthead, sidebar, body — rather than top-to-bottom).
