---
type: definition
class: frame
status: current
realizes: [glance-direction, type-as-mass]
depends-on: [type-stack, type-scale, document-grid-web, document-grid-print]
see-also: [folio-bar, spec-block]
---

# Section head

The boxed unit at the top of every numbered section in a 561 long-form artifact: § number, section title, dashed underline.

## Geometry

- **§ number** — cols 1–2 of the [grid](document-grid-web.md).
  13 px [JetBrains Mono](type-stack.md).
  Format `§ NN<br>NAME` where `NN` is the two-digit section number and `NAME` is a one-word UPPERCASE label (`SLOGAN`, `MARK`, `COLOR`, `TYPE`, `GRID`, `VOICE`, `IMAGERY`, `TEMPLATES`, `REFUSALS`, `LINEAGE`, `COLOPHON`).
- **Section title** — cols 3–12.
  D2 ([Space Grotesk 700](type-stack.md), 76 px / 54 pt, leading 0.88, tracking −4 %).
  Maximum four words.
  The title is a complete declarative phrase ("Land.
  Water.
  Language.
  Culture.", "Two Inks.
  One Surface.", "Sans & Slab.", "Plain.
  Specific.", "Two Registers.", "Five Starting Files.", "Visual Moves We Don't Make.", "Two Practices.
  Cited.", "Edits Welcome.").
- **Top rule** — 8 px [ink](ink.md) rule above the § number, full grid width.
- **Spacing** — 48 px below the section-head before content.
  80 px below the section's last content before the next section-head.

## Why

The section head's geometry serves a single purpose: *the reader, scanning the artifact, can identify which section they are in within one glance, by the § number and the rule weight, before reading any title*.
The title then confirms in one beat.
Type-scale step D2 was chosen specifically so the title sits at the boundary between display and body — heavy enough to anchor the page, not so heavy it overpowers the section's own [section heads](section-head.md) within (sub-section spec-block titles).

## Conflicts

- The section head and the [folio bar](folio-bar.md) share a top-of-page anchor.
  The folio bar sits at the top of the page; the section head opens the section, which may be on the same page as the folio bar (first section of a folio) or below it.
- A section head never sits in the middle of body copy.
  If a section break would fall mid-page, push the new section to the top of the next page.
- A section head never carries a figure or a [caption](caption-block.md).
  The section is the next page's structure, not a figure host.
