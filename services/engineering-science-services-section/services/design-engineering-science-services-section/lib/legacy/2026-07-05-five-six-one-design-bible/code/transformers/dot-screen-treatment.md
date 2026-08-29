---
type: morphism
class: reproduction
status: current
realizes: [two-registers]
depends-on: [photograph-treatment, ink]
see-also: [duotone-treatment, line-screen-treatment, photograph-treatment]
---

# Dot-screen treatment — reproduction

Reproduce a photograph in a single ink with a coarse dot screen.
Treatment C of three permitted [photograph treatments](../objects/photograph-treatment.md).

## Procedure

1. Confirm the photograph will be viewed at distance — poster scale and above, where the dot itself is part of the read.
2. Convert to grayscale at the source.
3. Apply a dot screen at **20–35 lines per inch**.
  Coarser than [line-screen treatment](line-screen-treatment.md), but with circular cells instead of lines.
4. Set the ink: [ink](../objects/ink.md) on [bone](../objects/bone.md) (default).

## Why dot-screen

The dot at 20–35 lpi is large enough to see at arm's length and small enough to resolve into a photograph at the artifact's viewing distance (typically 3–10 meters for poster work).
The dot itself becomes part of the photograph's surface — it declares the image as a *printed picture*, the same discipline as [line-screen treatment](line-screen-treatment.md), but with a different visual texture appropriate to poster scale.

The dot-screen treatment is what the bible recommends for photographs going into wheatpaste runs, gallery posters, exhibition signage, and other poster-scale documentary work.
It is also the treatment for any documentary photograph reproduced as a single-color silkscreen.

## Source files

The full-resolution grayscale source travels with the artifact.
The dot-screen pattern is generated at layout time at the press's preferred angle (typically 45° for offset, 22.5° for silkscreen) and not baked into the source.

## When not to use dot-screen

- At body scale.
  The 20–35 lpi dot is too coarse for body-size photographs; use [duotone treatment](duotone-treatment.md) at 100 lpi or [line-screen treatment](line-screen-treatment.md) at 35–45 lpi.
- For photographs reproduced in [alarm-red](../objects/alarm-red.md).
  Alarm dots become illegible at any frequency; use [line-screen treatment](line-screen-treatment.md) instead.
- For photographs that carry tonal subtlety as their argument.
  The coarse dot loses mid-tone detail.
  If the subtlety matters, use [duotone treatment](duotone-treatment.md).

## Color states

Single-ink only.
The bible refuses two-ink dot-screens — they fall outside the documentary register's discipline of *one ink, one screen*.

| Ink            | Use                                                |
|----------------|----------------------------------------------------|
| ink on bone    | Default. Poster-scale documentary photography.     |
| bone on ink    | Reverse-ground dot-screen, for dark-section posters. |

## Failure modes

- **Dot too fine.** A 50-lpi dot at poster scale loses the read at distance — the photograph muddies into mid-gray.
  Drop to 30 lpi.
- **Dot too coarse.** A 15-lpi dot on a body-size photograph reads as a pixel pattern, not as a photograph.
  Increase to 25 lpi or switch to [line-screen treatment](line-screen-treatment.md).
- **Mismatched angle.** A 45° angle on a silkscreen press creates moiré with the screen mesh.
  Confirm the press's preferred angle before separating.

## Check

Print a press proof at the artifact's intended scale and view at the intended viewing distance.
The dot must resolve into a photograph at viewing distance and be visible as a dot at arm's length.
