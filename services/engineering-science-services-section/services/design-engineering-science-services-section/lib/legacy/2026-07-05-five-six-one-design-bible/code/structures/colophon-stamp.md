---
type: definition
class: stamp
status: current
realizes: [memetic-repeatability]
depends-on: [group-wordmark, type-stack, bone]
see-also: [five-six-one-mark, group-wordmark]
---

# Colophon stamp

The closing block at the foot of every 561 artifact.
Carries the [GROUP wordmark](group-wordmark.md) (foot lockup), the artifact's edition, drafting date, method, and the bible's signature line "NO TRACKERS · NO ADS · STATIC" (web) or its print equivalent.

## Geometry — print colophon

The print colophon sits on the artifact's last folio and uses the [grid](document-grid-print.md).
Three blocks across cols 1–4, 5–8, 9–12:

- **cols 1–4** — `561 / GROUP` foot lockup ([group-wordmark](group-wordmark.md), foot variant) over a 4 px [bone](bone.md) rule.
- **cols 5–8** — Artifact edition: `[ARTIFACT NAME]`, `v.
  0.
  X · Living document`, `Drafted YYYY · MM · DD`, `Edits welcome`.
  Set in [JetBrains Mono](type-stack.md) M1.
- **cols 9–12** — Method credit: `METHOD`, `Visual Engineering`, `— emsenn, 2024`, `Brutalism · Tufte`.
  Set in JetBrains Mono M1, right-aligned.

## Geometry — web colophon

The web colophon sits in the page's `<footer>` element and matches the print structure but uses the [12-column web grid](document-grid-web.md).
The middle block carries the artifact's edition and the right block the method credit.
A horizontal rule (`--bone` weight 4 px on `--ink` ground) separates the colophon from the page body.

## Why

The colophon stamp is the bible's signature.
Every 561 artifact closes with the same three blocks, so a reader who has seen one 561 colophon recognizes the next one without reading.
The stamp realizes [memetic repeatability](../../../terms/memetic-repeatability.md): a single, recognizable closing pattern.

## What goes here

- Edition number (e.g. `v.
  0.3`), `Living document` if it is.
- Drafting date in `YYYY · MM · DD` form.
  The middle dot separator is the bible's date-separator convention.
- Method credit (`Visual Engineering — emsenn, 2024`) when the bible's own colophon.
- Lineages cited (`Brutalism · Tufte`) when the bible's own colophon.
- Translator credit (translator's name and language pair) when the artifact carries a translated [slogan](teaching/explanations/slogan-as-argument.md) or [GROUP wordmark](group-wordmark.md) (see [translation morphism](../morphisms/translation.md)).
- Partner credits — coalition partners, co-publishers — at body weight, never beside the [primary mark](five-six-one-mark.md).
  See [no-co-marks-beside-the-numeral theorem](../theorems/no-co-marks-beside-the-numeral.md).
- Documented [grid breaks](../morphisms/grid-break.md), if the artifact carries one — page, reason, who approved.

## Forbidden

- Sponsor logos.
  Sponsorship is an organizational concern; if it must appear, it appears as a body-weight credit line, not as a logo.
- Certification badges or third-party verification marks.
- Awards, prizes, "best of" notices.
