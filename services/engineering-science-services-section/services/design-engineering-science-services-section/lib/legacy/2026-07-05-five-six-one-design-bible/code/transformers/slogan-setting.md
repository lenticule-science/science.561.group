---
type: morphism
class: setting
status: current
realizes: [slogan-as-argument, type-as-mass]
depends-on: [type-stack, type-scale, ink, bone, alarm-red]
see-also: [mark-clearspace-application, type-pairing, alarm-saturation-check]
---

# Slogan setting

Set the [slogan](teaching/explanations/slogan-as-argument.md) — Land · Water · Language · Culture — at the geometry the bible specifies, in one of three permitted variants.

## Stacked variant (default)

Used in every page-level masthead, every poster, banner, and pamphlet cover, and the first folio of every printed long-form artifact (≥ 4 pages).

- **Family.** [Space Grotesk 700](../objects/type-stack.md), uppercase, period after each word.
- **Size.** [Type-scale D1](teaching/explanations/type-scale.md) (128 px screen / 96 pt print) at the artifact's primary scale; step down to D2 (76 px / 54 pt) only when artifact width < 480 px / 100 mm.
- **Leading.** D1 leading 0.85.
- **Tracking.** −4 % (D1 tracking).
- **Word baseline interval.** Cap-height + (cap-height × 0.05).
  At 128 px, that is 96 px between baselines, ±1 px.
- **Optical alignment.** Left edge of every word flush to a single vertical line.
  The word "Water." typically requires +1 px optical pull-left to compensate for the round W counter.
  Verify on output.
- **Bracketing rules.** `--ems-rule-bar` (8 px / 2 mm) above the first word and below the last, full slogan width, color [ink](../objects/ink.md).
  Top rule offset `--ems-u4` above the first word's cap-line.
  Bottom rule offset `--ems-u4` below the last word's baseline.

## Inline variant

Set as a single line: `Land.
Water.
Language.
Culture.
` Family Space Grotesk 700, size D3 (48 px / 36 pt) or smaller down to B1 (16 px / 10.5 pt).
Tracking D3 (−2 %).

Permitted in: colophons, sign-offs, footers, file metadata, body prose.
Forbidden in mastheads.

## Contracted variant

Permitted only at sticker / stamp scale (≤ 50 mm trim).
Set as four periods on a baseline: `. . . .
` (one period per word, in original order, tracking +0.4 em).
The [primary mark](../objects/five-six-one-mark.md) must accompany; readers infer the slogan from the dot count.

Forbidden above sticker scale.

## Color

[Ink](../objects/ink.md) on [bone](../objects/bone.md), or [bone](../objects/bone.md) on [ink](../objects/ink.md).
No third ground.

One word may be set in [alarm-red](../objects/alarm-red.md) when that word is the artifact's specific subject — e.g., a poster about language sovereignty sets "Language." in alarm.
The alarm word must change weight and color but not size; same D1 size, same tracking.
Never two alarm words in the same instance.
Never alarm in the colophon variant.

## Conflicts

- If the slogan would render within `--ems-u5` (48 px / 12 mm) of the [mark](../objects/five-six-one-mark.md), the mark suppresses; only the slogan renders.
  The mark recurs in the colophon.
- If a photograph or woodcut would overlap the slogan's bracketing rules, the imagery crops to clear them.
  Imagery never crosses an `--ems-rule-bar`.

## Check

At D1 on a 30 cm reading distance, the alarm word must visibly differ from the ink words.
If it does not, the alarm ink is under-saturated — reject the proof.
See [alarm-saturation-check theorem](../theorems/alarm-saturation-check.md).

## Forbidden variants

Centered set.
Italicized set.
Mixed-case set ("Land.
Water.
Language.
Culture.").
Any set without periods.
Any set in a serif.
Any set in alarm without a specific subject.
Any rotation other than 0°.
Any abbreviation: "L.W.L.C.", "LWLC", and "Land/Water/Lang/Cult" are all defects.
