---
type: morphism
class: selection
status: current
realizes: [mark-as-numeral]
depends-on: [five-six-one-mark, group-wordmark, stamp-mark, contracted-mark]
see-also: [mark-clearspace-application]
---

# Lockup selection

Choose which lockup of the [561 mark](../objects/five-six-one-mark.md) to use for a given artifact and surface.
Five lockups are permitted; a sixth is the [contracted](../objects/contracted-mark.md) variant for sub-minimum scale.

## Procedure

1. Identify the artifact's surface.
2. Apply the table below.
3. If the surface is at sub-minimum scale ([contracted-mark](../objects/contracted-mark.md)'s minimums apply), use the contracted variant regardless.

| Surface                                                | Lockup                                            |
|--------------------------------------------------------|----------------------------------------------------|
| Masthead of a publication, poster, pamphlet cover      | Vertical (A) — [group-wordmark](../objects/group-wordmark.md) |
| Letterhead, document footer, web header < 96 px tall, sign-off | Inline (B) — [group-wordmark](../objects/group-wordmark.md) |
| Artifact foot, page-numbered colophon, single-line signage, embroidered label | Foot (C) — [group-wordmark](../objects/group-wordmark.md) |
| Hand-stamped envelope, shipped crate, supply box, distributed pamphlet cover, doors of held space | Stamp — [stamp-mark](../objects/stamp-mark.md) |
| Favicon, app icon, embroidered tag, stamped hardware (sub-minimum scale) | Contracted — [contracted-mark](../objects/contracted-mark.md) |
| Banner, stencil, wheatpaste at numeral-scale           | Numeral only (no wordmark) — see [numeral-banner example](../examples/numeral-banner.md) |

## Single-instance rule

Only one lockup of the mark per page-level surface, except in [colophons](../objects/colophon-stamp.md), where a small inline lockup may repeat.
A second instance of the mark at masthead scale on the same artifact is a defect.
The exception is the bible itself, which carries the masthead lockup on folio 001 and a small inline lockup in the running folio bar — the running lockup is permitted because its scale is sub-D4 and it functions as a folio mark, not a masthead.

## Wordmark availability

The [GROUP wordmark](../objects/group-wordmark.md) is *not* part of the primary mark; it is a permitted lockup partner.
The mark may appear without "GROUP" (banners, stencils, stamps).
"GROUP" never appears without the mark.
Three lockups carry the wordmark (A, B, C); two do not (stamp, contracted).

## Translation

Translation of "GROUP" is permitted in the inline (B) and foot (C) lockups; the vertical (A) lockup retains the English wordmark to keep the geometric block consistent.
See the [translation morphism](translation.md).

## Conflicts

- If the chosen lockup's clearspace cannot be honored, drop to the next-down lockup (A → B → C → contracted) and re-apply [mark-clearspace-application](mark-clearspace-application.md).
- If the surface is digital and dark-mode, use the bone-on-ink color state of the chosen lockup.
- If the surface is single-color print (riso, screen) and the chosen lockup has more than one color, drop to the foot (C) variant.
