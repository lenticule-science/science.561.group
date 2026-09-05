---
type: definition
class: mark
status: current
realizes: [mark-as-numeral, refusal-as-design-method]
depends-on: [type-stack, ink, bone]
see-also: [group-wordmark, stamp-mark, contracted-mark, photocopy-survival]
---

# 561 mark — primary

The numeral **561** set in [Space Grotesk 700](type-stack.md), with a single 8-px [bracket rule](#geometry) above it.
There is no seal, no monogram, no figurative emblem.

## When required

Every artifact 561 publishes.
Letterhead, posters, pamphlets, the bible itself, the website, every public surface.
Signage where 561 holds physical space.

## When permitted

Once per page-level surface.
Multiple instances on a single artifact are forbidden except in colophons (§ 11) where a small inline lockup may repeat.
The mark is not used to credit individuals; individual contributors are credited by name in the [colophon](teaching/explanations/colophon.md), not by the mark.

## Geometry

Cap-height of the "5" defines unit *H*.
All other measurements derive from *H*.

- Numeral baseline-to-cap-line: *H*.
- Numeral-to-numeral interval: 0.06 *H* (negative tracking, optical not metric).
- Bracket rule offset: `--ems-u2` (8 px / 2 mm) above the cap-line.
- Bracket rule weight: `--ems-rule-bar` (8 px / 2 mm).
- Bracket rule width: equals numeral block width, ±1 px.

Optical adjustments: the "1" sits 0.04 *H* right of metric center to balance the 6's overhang.
Verify on every output medium; do not bake into the SVG source.

## Clearspace

Minimum clearspace on all four sides: *H* (one cap-height of the numeral).
No type, no rule, no figure, no other mark may enter the clearspace box.
The bracket rule above the numeral counts as part of the mark, not a violation of clearspace.
Trim or fold lines may pass through clearspace; nothing inked.

The clearspace discipline is enforced by the [mark-clearspace-application morphism](../morphisms/mark-clearspace-application.md).

## Color

Three permitted color states:

- [ink](ink.md) on [bone](bone.md) — default, 95 % of usage.
- [bone](bone.md) on [ink](ink.md) — dark surfaces, signage, second-color print runs.
- [alarm-red](alarm-red.md) on [bone](bone.md) — [stamp variant](stamp-mark.md) only.

Forbidden: alarm on ink, [witness-blue](witness-blue.md) on anything, the mark on a witness ground, the mark in any tint or screen of ink (no 50 % gray "subtle" mark).

## Minimum size

- Screen: *H* ≥ 32 px (numeral cap-height).
  Below 32 px the bracket rule disappears below sub-pixel rendering — use the [contracted variant](contracted-mark.md).
- Print: *H* ≥ 8 mm.
- Embroidery, debossing, fabrication: *H* ≥ 24 mm; bracket rule weight floors at 1.5 mm regardless of the spec.

## Conflicts

- The mark and the [slogan](teaching/explanations/slogan-as-argument.md) never share a horizontal axis at masthead scale.
  If they would, the mark drops to the artifact's foot.
  The slogan owns the masthead.
- If a photographic figure must occupy the same column as the mark, the mark moves to the opposite column or the foot.
  The mark never sits over a photo (see [no-type-set-over-photography theorem](../theorems/no-type-set-over-photography.md) for the related rule on display type).
- If the artifact carries a co-organizing partner's logo, the partner logo sits in the foot at `--ems-u4` (24 px / 6 mm) right of the 561 mark, separated by an `--ems-rule-hair` vertical, equal cap-heights.

## Check

Photocopy at default settings.
The mark must remain legible after one generation; the bracket rule must not break.
See [photocopy-survival theorem](../theorems/photocopy-survival.md).
