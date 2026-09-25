---
title: Amalgamate Matching Family
id: amalgamate-matching-family
role: operator
status: plan
inputs:
- id: matching-family
  alias: family
outputs:
- id: hypertensor-section
  alias: section
transformation:
- return
- family
proof_refs:
- matching-family
- hypertensor-section
description: Primitive witness that produces the glued Hypertensor Section from a Matching Family.
---

# Proof
- Uses: compatibility data in the matching family to define section values on
  the covered window.
- Shows that: an amalgamated section can be produced when matching holds; this
  stands in until the constructive amalgamation is fully derived.
---

Primitive witness that produces the glued [Hypertensor Section](./hypertensor-section.md)
from a [Matching Family](./matching-family.md).

## Proof
- Uses: the compatibility data in the matching family to define section values
  on the covered window, respecting overlaps.
- Shows that: an amalgam exists when matching holds; the primitive stands in
  for the constructive amalgamation until fully derived.

## Earlier material

Primitive witness that produces the glued [Hypertensor Section](hypertensor-section.md)
from a [Matching Family](matching-family.md).
