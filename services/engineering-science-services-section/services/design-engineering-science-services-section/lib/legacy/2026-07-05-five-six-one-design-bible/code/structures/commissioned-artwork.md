---
type: definition
class: figure
status: current
realizes: [two-registers]
depends-on: [ink, alarm-red, witness-blue]
see-also: [photograph-treatment, two-registers, caption-block]
---

# Commissioned artwork — reproduction

Hand-cut or hand-drawn imagery commissioned from a credited artist.
The human register of the bible's [two registers](teaching/explanations/two-registers.md) of imagery.

## Form

Hand-cut or hand-drawn.
Visible tool marks are the medium speaking and are not corrected.
Reproduced at no more than two inks.
Permitted ink combinations:

- [ink](ink.md) + paper ([bone](bone.md)).
- [ink](ink.md) + [alarm-red](alarm-red.md).
- [ink](ink.md) + [witness-blue](witness-blue.md).

Three-ink artwork is rejected at proofing.

## Source files

Retain the artist's full-resolution scan or vector.
Reproduction artifacts (halftone, line-screen, dot-screen) are applied at layout time, not baked into the source.
The source file is what travels to the next edition or the next artifact; the layout-time reproduction is what travels to plate.

## When permitted

- As marginalia inside long-form artifacts (woodcut floret beside a section opener).
- As a full-bleed figure inside a [pamphlet](../examples/field-instruction-pamphlet.md) or zine.
- On the cover of a publication where the subject is best carried by a hand-made image.
- In a [colophon](colophon-stamp.md) when the artist's mark is part of the work's signature.

## When forbidden

- As a background for display type.
  See [no-type-set-over-photography theorem](../theorems/no-type-set-over-photography.md) for the related rule on photography (the bible extends this discipline to commissioned artwork).
- In any combination using more than two inks.
- As a substitute for the [primary mark](five-six-one-mark.md).

## Caption

Every commissioned artwork carries a [caption-block](caption-block.md) naming the artist (the *who* field) and the medium (the *what* field — woodcut, linocut, ink wash, etc.).
The artist credit is non-optional.
Anonymous commissioned artwork is a defect.

## Reproduction at scale

Commissioned artwork crops to the [grid](document-grid-print.md)'s columns.
Photographs and commissioned artwork share the same crop discipline; both must crop to grid columns and neither may bleed past the artifact's margin without an explicit grid-break (see [grid-break morphism](../morphisms/grid-break.md)).

## Forbidden

- AI-assisted illustration that produces final pixels without a credited artist's hand.
  See [no-ai-generated-imagery theorem](../theorems/no-ai-generated-imagery.md).
- Stock illustration purchased from a marketplace.
  The bible's commissioned-artwork register is *commissioned*; if the work was not commissioned, it is not in this register.
