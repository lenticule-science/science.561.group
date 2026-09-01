---
type: definition
class: palette-entry
status: current
realizes: [color-budget]
depends-on: []
see-also: [ink, alarm-red, witness-blue, color-budget]
---

# Bone

The bible's paper color.
Token `--bone`.
Hex `#F2EAD8`.
RGB 242 · 234 · 216.
CMYK 2 · 5 · 15 · 0.
Pantone Warm Gray 1 U / paper.

Bone is *the ground*, not an ink.
On uncoated cream offset stock or on newsprint, bone is what the paper itself looks like — the bible specifies the digital and CMYK values for the cases where bone has to be printed (e.g., on a coated stock, in a digital surface, on a screen) but does not consider the printed bone equivalent to the paper.
Where the paper is bone (uncoated cream offset, newsprint), bone is not printed; the paper carries it.

There is no coverage cap on bone — bone is uncapped because it is the ground.
See [color-budget](teaching/explanations/color-budget.md).

## Derived token

`--bone-deep` `#E8DEC4` — bone at 90 %.
Used for the inner ground of [spec-blocks](spec-block.md) and tinted cards inside the bible itself, where a bone-on-bone separation needs to be visible without breaking the [color-budget](teaching/explanations/color-budget.md) for [alarm-red](alarm-red.md) or [witness-blue](witness-blue.md).
Use sparingly; the bible refuses other bone tints.

## When bone is paper

- Uncoated 100 gsm cream offset (the bible's default body stock).
- Newsprint 55 gsm (street runs, [numeral-banner](../examples/numeral-banner.md), [slogan-poster](../examples/slogan-poster.md)).
- Uncoated cover stock 160 gsm (when reverse-type ground requires it, e.g., [assembly-call](../examples/assembly-call.md)).

## When bone is printed

- Reverse type on an [ink](ink.md) ground (every dark-section page in the bible itself).
- Digital surfaces (`background: var(--bone)` in the [web-static-site](../examples/web-static-site.md)).
- Coated stock printing (where the paper is not naturally cream).

## Forbidden

No tinted bone (no 50 % bone "subtle" ground); only `--bone` and `--bone-deep` exist.
No third neutral introduced — no warm gray, no cool gray, no off-white.
Bone is the only ground.
