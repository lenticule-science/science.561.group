---
type: definition
class: grid
status: current
realizes: [grid-system, baseline-grid]
depends-on: []
see-also: [grid-system, baseline-grid, document-grid-web]
---

# Document grid — print

The bible's print grids are specified per artifact format.
Each format gives trim, margin, columns, gutter, baseline, and measure.

| Format               | Trim                                  | Margin                              | Cols | Gutter   | Baseline | Measure         |
|----------------------|---------------------------------------|-------------------------------------|------|----------|----------|-----------------|
| Letterhead           | 8.5 × 11 in                           | 0.75 / 0.75 / 1.0 / 0.75 in         | 6    | 0.25 in  | 12 pt    | 60–70 ch        |
| Pamphlet, half-letter | 5.5 × 8.5 in                         | 0.5 in all                          | 4    | 0.125 in | 11 pt    | 50–60 ch        |
| Poster, slogan       | 18 × 24 in                            | 0.75 / 0.75 / 1.0 / 0.75 in         | —    | —        | 0.25 in  | n/a, display only |
| Poster, manual       | 18 × 24 in                            | 0.75 in all                         | 4    | 0.25 in  | 0.125 in | 50–60 ch        |
| Pamphlet, tri-fold   | 11 × 8.5 in (3 panels of 3.67)        | 0.5 in all, +0.25 fold gutter       | 1 per panel | — | 4 pt    | 40–48 ch        |
| Newspaper / tabloid  | 11 × 17 in                            | 0.5 in all                          | 8    | 1 pc (12 pt) | 11 pt | 50–60 ch        |
| Zine, half-letter    | 5.5 × 8.5 in                          | 0.4 in all                          | 2    | 0.2 in   | 11 pt    | 40–55 ch        |
| Sticker / stamp      | 2 × 2 in                              | 0.125 in                            | —    | —        | —        | n/a             |

## Conventions

- **Baseline:** the document baseline grid (everything text-bearing snaps to a multiple).
  On print it is pt-based and matches the body leading.
  See [baseline-grid](teaching/explanations/baseline-grid.md).
  Don't snap photographs to baseline; do snap captions.
- **Margins:** Where four values are listed, order is top / right / bottom / left.
  The bottom margin is generally larger to accommodate the [folio bar](folio-bar.md) and the foot lockup.
- **Folds:** Tri-fold pamphlets add a 0.25 in fold gutter to the inside-fold side of each panel.
  Letter-fold (Z or roll) is supported; panels of equal width.
- **Bleed:** 3 mm all sides for poster and pamphlet stock; 10 mm for banner-scale (36 × 48 in and above).

## Section-head positioning (print)

The print grid uses the same section-head positioning as the [web grid](document-grid-web.md): folio bar across all columns, § number in cols 1–2, [section title](section-head.md) in the remaining columns at D2.

## Forbidden

- Off-grid trims that do not match a listed format.
  If a new format is needed, add a row to this table — see [template-fork morphism](../morphisms/template-fork.md).
- Variable margins within a single artifact.
  The margin holds across the whole document.
- Photographs cropped off-grid.
  Photographs crop to the column edges.
