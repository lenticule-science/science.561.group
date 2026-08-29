---
type: morphism
class: reproduction
status: current
realizes: [two-registers]
depends-on: [photograph-treatment, ink, witness-blue, alarm-red, bone]
see-also: [line-screen-treatment, dot-screen-treatment, photograph-treatment]
---

# Duotone treatment — reproduction

Reproduce a photograph as a two-ink duotone, ground in [bone](../objects/bone.md).
Treatment A of three permitted [photograph treatments](../objects/photograph-treatment.md).

## Procedure

1. Confirm the photograph belongs in the documentary register (see [two-registers](teaching/explanations/two-registers.md)).
  The duotone treatment is for evidence, not for atmosphere.
2. Convert to grayscale at the source.
  Compress the tonal range to the medium — do not chase shadow detail the press cannot hold.
3. Choose the second ink by argument:
   - [ink](../objects/ink.md) + [witness-blue](../objects/witness-blue.md) — default for documentary subjects.
   - [ink](../objects/ink.md) + [alarm-red](../objects/alarm-red.md) — only when alarm reading is part of the photograph's argument (a photograph of a deadline notice, an evacuation order, a crisis).
4. Apply halftone screen at the line-per-inch matched to the press:
   - **65 lpi** for newsprint.
   - **100 lpi** for offset.
   - **133 lpi** for fine offset.
5. Confirm the second-ink coverage does not violate the [color-budget](teaching/explanations/color-budget.md).
  A duotone using witness can easily push the page over its 3 % witness cap; in that case, switch to the [line-screen treatment](line-screen-treatment.md) (single ink).

## Source files

The full-resolution grayscale source travels with the artifact's source files.
The duotone separation (the two-ink rendering) is generated at layout time.
Do not bake the halftone into the source — different presses ask for different screens.

## Color states

| State                              | Use                                                |
|------------------------------------|----------------------------------------------------|
| ink + witness on bone              | Default. Documentary subjects, archival photographs, portraits where the subject is named. |
| ink + alarm on bone                | Crisis photography only. Evacuations, deadlines, public-emergency subjects. |
| bone + witness on ink              | Reverse-ground duotone, for dark sections.         |

The bible refuses three-ink duotones (ink + witness + alarm) — that is a tritone and falls outside the [color-budget](teaching/explanations/color-budget.md).

## Failure modes

- **Crushed shadows.** The grayscale source has full shadow detail; the press cannot hold it; the duotone reads as a black blob in the lower tonal range.
  Fix: compress the source's tonal range with a curve before separating.
- **Witness over-coverage.** A 5-column duotone exceeds the page's witness budget alone.
  Reduce the duotone's witness contribution (curve the witness plate to mid-tones only) or fall back to the [line-screen treatment](line-screen-treatment.md).
- **Alarm halftone illegibility.** Alarm cannot hold a halftone — the dots become illegible.
  If the photograph needs alarm, use the [line-screen treatment](line-screen-treatment.md), single-ink alarm only.

## Check

Print a press proof and view at arm's length.
The photograph must read as a photograph, not as an atmosphere.
The second ink must contribute information (mid-tone separation, color recognition where the subject is in alarm), not mood.
