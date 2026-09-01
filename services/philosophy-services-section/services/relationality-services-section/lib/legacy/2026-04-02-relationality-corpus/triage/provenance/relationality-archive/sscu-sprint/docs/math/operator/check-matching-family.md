---
name: check-matching-family
role: operator
inputs:
- id: coverage-site
  alias: site
- id: matching-family
  alias: family
outputs:
- id: matching-family
  alias: validated
transformation:
- call
- validate-matching-family
- site
- family
proof_refs:
- coverage-site
- matching-family
- validate-matching-family
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Verifies that a family of sections over a cover is matching (agrees on overlaps)
inside the [Coverage Site](../structure/coverage-site.md) so it can be glued by a
[Sheaf](../structure/sheaf.md).

## Definition
- Inputs: a cover `{Ui → U}` in the coverage site and candidate sections over
  each `Ui`.
- Outputs: a [Matching Family](../structure/matching-family.md) witness if
  overlap conditions hold.
- Behaviour: checks pairwise overlaps and triple coherences; if all match,
  packages the family with its cover so gluing operators can construct a global
  section.

## Preconditions
- Restriction maps for the cover are defined and coherent on the coverage site.
- Sections are well-typed presheaf assignments over each patch.

## Postconditions
- Produced matching-family data is active under further restriction/refinement.
- Failure to match is explicit: the operator refuses to produce the structure.

## Proof
- Uses: coverage/overlap data from the [Coverage Site](../structure/coverage-site.md)
  and restriction maps encoded by the [Sheaf](../structure/sheaf.md).
- Shows that: matching families can be validated as inputs to sheaf gluing,
  ensuring the sheaf condition operates on explicit compatibility data earned
  from the coverage site (objects/covers/restrictions/overlaps).
