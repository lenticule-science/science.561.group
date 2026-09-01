---
type: morphism
class: check
status: current
realizes: [mark-as-numeral]
depends-on: [five-six-one-mark]
see-also: [lockup-selection, no-co-marks-beside-the-numeral]
---

# Mark clearspace application

Apply the [561 mark](../objects/five-six-one-mark.md)'s clearspace rule to a proof and reject anything that enters the clearspace box.

## Procedure

1. Locate the [mark](../objects/five-six-one-mark.md) on the artifact.
  Identify the numeral cap-height *H* (the cap-height of the "5").
2. Construct the clearspace box: a rectangle extending *H* from each of the four edges of the mark (the bracket rule above the numeral counts as part of the mark, not a violation of clearspace).
3. Inspect the clearspace box.
  Reject the proof if any of the following appears inside it:
   - Any type, including the [GROUP wordmark](../objects/group-wordmark.md) when used as an inline lockup adjacent to the mark (the inline lockup is one composite mark with its own clearspace, not the primary mark plus a separate wordmark).
   - Any rule, including section-head rules and folio-bar dashed underlines.
   - Any figure (photograph, [commissioned artwork](../objects/commissioned-artwork.md), [glyph](../objects/glyph-set.md)).
   - Any other mark — partner logo, certification badge, funder lockup, social-media icon.
     See [no-co-marks-beside-the-numeral theorem](../theorems/no-co-marks-beside-the-numeral.md).
4. Trim or fold lines may pass through clearspace; nothing inked.

## When the clearspace overlaps the page edge

If the mark's natural placement puts its clearspace box past the page trim, move the mark inward — the clearspace is part of the mark's spec and cannot be omitted.
The mark and the page edge each demand their own clear cut.

## When a partner logo must accompany

If the artifact carries a co-organizing partner's logo, the partner logo sits in the foot at `--ems-u4` (24 px / 6 mm) right of the 561 mark, separated by an `--ems-rule-hair` vertical, equal cap-heights.
The partner logo's own clearspace is the partner's concern; the bible only specifies its placement relative to the 561 mark.

## Edge case — inline lockup

The [inline lockup](../objects/group-wordmark.md) (B variant) is a single composite mark: numeral, vertical separator rule, "GROUP" wordmark.
Its clearspace is *H* around the composite, not around the numeral alone.
The separator rule and the wordmark are inside the composite, not violations of the numeral's individual clearspace.

## Failure mode

The most common failure is a section-head rule running through the clearspace because the mark sits at the head of a long-form artifact's first page and the section-head's top rule was not offset.
Fix: drop the mark to the [colophon](../objects/colophon-stamp.md) on this page; the slogan owns the masthead anyway.

## Check

Print the artifact at 100 %.
Place a piece of tracing paper over the mark and draw the clearspace rectangle in pencil.
Anything inked inside the rectangle is a violation; revise the layout.
