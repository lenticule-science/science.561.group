---
type: definition
class: grid
status: current
realizes: [grid-system, baseline-grid]
depends-on: []
see-also: [grid-system, baseline-grid, document-grid-print]
---

# Document grid — web

The bible's web grid is **12 columns**, 1320 px container, 14 px gutter, 8 px baseline.
Used for every 561 web surface (see [web-static-site example](../examples/web-static-site.md)).

## Container

| Field        | Value                                              |
|--------------|----------------------------------------------------|
| Max width    | 1320 px                                             |
| Columns      | 12                                                  |
| Gutter       | 14 px                                               |
| Baseline     | 8 px (everything text-bearing snaps to a multiple)  |
| Side margin  | 32 px desktop / 24 px tablet / 16 px mobile         |

## Breakpoints

The 12-column grid collapses at three breakpoints, each preserving the column-and-gutter discipline:

- **≥ 960 px** — 12 columns.
- **640–959 px** — 6 columns.
- **380–639 px** — 4 columns.
- **< 380 px** — 2 columns.

Layout patterns that depend on a 12-column form (5 / 7, 7 / 4, 8 / 4) collapse to single-column stacks below 960 px; patterns that depend on a 6 / 6 split collapse to stacks below 640 px.
The collapse is not a continuous reflow; it is a discrete switch.

## Column ratios

Used in the bible itself:

- **5 / 7** — text + figure (default body layout).
- **7 / 4** — primary + marginalia (1 column blank between).
- **6 / 6** — symmetric, comparison only.
- **8 / 4** — long-form text + sidebar.
- **12** — full bleed, slogan only.

Choose a ratio per page; do not vary mid-page.

## Section-head positioning

| Element              | Columns      | Set                                                 |
|----------------------|--------------|-----------------------------------------------------|
| [Folio bar](folio-bar.md) | 1–12       | Dashed underline, 11 px mono caps, right-aligned.   |
| § number             | 1–2          | 13 px mono, 8 px ink rule above.                    |
| [Section title](section-head.md) | 3–12 | D2 sans 700, max 4 words.                            |

48 px below the section-head before content.
Section bottom margin: 80 px (one space-step up from default).

## Forbidden

- Frameworks (Bootstrap, Tailwind, etc.).
  The 12-column grid is implemented in CSS Grid directly.
  See [no-third-party-on-web](teaching/explanations/no-third-party-on-web.md).
- Off-grid widths (e.g., a sidebar that is 3.5 columns wide).
  Round to the nearest column.
- Variable gutters.
  The 14 px gutter holds across the page.
