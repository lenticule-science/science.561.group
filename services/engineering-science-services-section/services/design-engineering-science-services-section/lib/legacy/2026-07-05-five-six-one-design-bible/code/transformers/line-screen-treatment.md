---
type: morphism
class: reproduction
status: current
realizes: [two-registers]
depends-on: [photograph-treatment, ink, alarm-red]
see-also: [duotone-treatment, dot-screen-treatment, photograph-treatment]
---

# Line-screen treatment — reproduction

Reproduce a photograph in a single ink with a horizontal or vertical line screen.
Treatment B of three permitted [photograph treatments](../objects/photograph-treatment.md).

## Procedure

1. Confirm the photograph is best read at the medium and scale.
  Line-screen is the default for newsprint at small scale, and the only treatment for any photograph reproduced in [alarm-red](../objects/alarm-red.md) (alarm halftones are illegible).
2. Convert to grayscale at the source.
3. Choose the screen:
   - **Horizontal lines** — default.
     Reads as a documentary photograph.
   - **Vertical lines** — when the photograph's subject has a strong horizontal axis the lines need to cross.
4. Set the line frequency: **25–45 lines per inch**.
  Lower frequencies (25 lpi) are for poster scale or for newsprint at large scale; higher frequencies (45 lpi) are for letterpress and offset at body scale.
5. Set the ink: [ink](../objects/ink.md) on [bone](../objects/bone.md) (default) or [alarm-red](../objects/alarm-red.md) on [bone](../objects/bone.md) (when alarm reading is part of the argument and the [color-budget](teaching/explanations/color-budget.md) permits).

## Why line-screen

Three reasons.

1. **Legibility in alarm.** Alarm halftones become illegible because the dot frequency falls below the perception threshold of the warm-red ink.
  Line-screen at 25–45 lpi keeps the photograph readable.
2. **Newsprint discipline.** Newsprint cannot hold a fine halftone — the dot gain exceeds 30 % and the photograph reads as a smear.
  Line-screen at low frequencies (25–35 lpi) is what the medium can hold.
3. **Visible process.** The line-screen reads as a *reproduction*, not as a transparent window onto the subject.
  Line-screen is the bible's discipline for photographs that need to declare themselves as printed pictures.

## Source files

The full-resolution grayscale source travels with the artifact.
The line-screen pattern is generated at layout time and not baked into the source.

## Color states

| Ink                                  | Use                                              |
|--------------------------------------|--------------------------------------------------|
| ink on bone                          | Default. Documentary photography at small scale, newsprint. |
| alarm-red on bone                    | Crisis photography. The photograph's argument is the urgency itself. |
| bone on ink                          | Reverse-ground line-screen, for dark sections.   |

## Failure modes

- **Line frequency too high.** A 60-lpi line screen on newsprint reads as a smear.
  Drop to 30 lpi.
- **Vertical lines on a horizontal subject.** A landscape with a strong horizon set with vertical lines reads as scratch marks.
  Switch to horizontal.
- **Alarm with halftone.** A halftone in alarm — illegible.
  Switch to line-screen.

## Check

Print a press proof at the artifact's intended scale.
View at arm's length, then at the artifact's intended viewing distance ([assembly-call](../examples/assembly-call.md): 6 m; [numeral-banner](../examples/numeral-banner.md): 20 m).
The photograph must read as a photograph at the intended viewing distance, not only at arm's length.
