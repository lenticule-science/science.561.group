---
type: definition
class: frame
status: current
realizes: [glance-direction]
depends-on: [type-stack, type-scale, document-grid-web, document-grid-print]
see-also: [section-head, spec-block]
---

# Folio bar

The dashed-underlined strip at the head of every page in a 561 long-form artifact.
Carries the folio number ("FOLIO 011"), and on the bible, the running edition stamp.

## Geometry

- Cols 1–12 of the [grid](document-grid-web.md).
- [JetBrains Mono](type-stack.md), M2 (11 px / 7 pt, weight 500, tracking +18 %, uppercase).
- Dashed underline beneath the bar, weight `--ems-rule-hair` (1 px / 0.25 mm), color [ink](ink.md).
- Right-aligned by default; "FOLIO NNN" sits in cols 11–12.
- Spacing: 24 px above the bar from the page top trim; 48 px below the bar before the next [section-head](section-head.md) or body content.

## Variants

- **Single-folio bar** — just `FOLIO NNN`, right-aligned.
  The default for inside pages.
- **Edition-stamped bar** — `FOLIO NNN` right, edition stamp left (e.g. `561 / DESIGN BIBLE · v.
  0.3`).
  Used on the bible's own pages and on long-form artifacts where the edition is load-bearing.

## Folio numbering

Folio numbers are sequential across the artifact's printable surfaces.
The bible itself begins at FOLIO 001 (masthead), 002 (note on the document), 003 (§ 01), and so on.
Skipping numbers (or "this is folio iv, decorative") is a defect.

## Forbidden

- Decorative ornament on the bar (no rules, no glyphs from the [glyph set](glyph-set.md), no edition badges).
- Centered or left-aligned `FOLIO NNN` (right-aligned only).
- The bar in [alarm-red](alarm-red.md) or [witness-blue](witness-blue.md) (it is always [ink](ink.md) on [bone](bone.md), or [bone](bone.md) on [ink](ink.md) on dark sections).
- Replacing the dashed underline with a solid rule.
  The dashed weight is the bar's signature.
