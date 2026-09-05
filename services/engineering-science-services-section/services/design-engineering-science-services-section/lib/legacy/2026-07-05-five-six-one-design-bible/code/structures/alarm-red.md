---
type: definition
class: palette-entry
status: current
realizes: [color-budget, hazard-evidence-pair]
depends-on: []
see-also: [witness-blue, ink, bone, color-budget, hazard-evidence-pair]
---

# Alarm red

The bible's hazard / urgency color.
Token `--red` (also called *alarm*).
Hex `#FF4530`.
RGB 255 · 69 · 48.
CMYK 0 · 85 · 85 · 0.
Pantone 805 U (fluorescent).

Alarm flags hazard or urgency.
It is *functional*, not decorative — it carries one job and is rationed.

## Use

- Deadlines.
- Refusals (the strikethrough in § 06 voice; see [voice-substitution morphism](../morphisms/voice-substitution.md)).
- The single word in the [slogan](teaching/explanations/slogan-as-argument.md) that is currently most at stake on a given artifact.
- Step numerals in the [field-instruction-pamphlet](../examples/field-instruction-pamphlet.md).
- Date and time on the [assembly-call](../examples/assembly-call.md).
- The [stamp-mark](stamp-mark.md) variant.

## Don't

- For emphasis.
- For headers.
- For "look here."
- For ornament.
- For more than one word in any block of text.

## Coverage cap

≤ 6 % of inked area per page or per spread.
Sum the bounding boxes of red marks; divide by trim area.
If unsure, halve it.
See [color-budget](teaching/explanations/color-budget.md) and the [color-budget-application morphism](../morphisms/color-budget-application.md).

## Print notes

- **Riso:** Fluorescent Pink (F) gets you closest to alarm.
  Print red second so it sits on top.
- **Misregistration up to 1.5 mm** on riso / screen is acceptable; treat it as evidence of process.
  Above 1.5 mm, reprint.
- **Photocopy:** Red drops out on most B&W copiers.
  Design so the page still reads without it; do not load the artifact's primary information into alarm.
- **Digital:** sRGB hex value directly.
  No P3, no glows, no gradients.

## Saturation check

At [type-scale D1](teaching/explanations/type-scale.md) on a 30 cm reading distance, the alarm word in the [slogan](teaching/explanations/slogan-as-argument.md) must visibly differ from the [ink](ink.md) words.
If it does not, the alarm ink is under-saturated — reject the proof.
See [alarm-saturation-check theorem](../theorems/alarm-saturation-check.md).

## Forbidden

- Alarm on [ink](ink.md) at body sizes (the contrast ratio is AA-large only — display use only).
- Alarm halftones (they become illegible — use [line-screen-treatment](../morphisms/line-screen-treatment.md) instead).
- Two alarm words in the same [slogan](teaching/explanations/slogan-as-argument.md) instance.
- Alarm in the colophon variant of the slogan.
