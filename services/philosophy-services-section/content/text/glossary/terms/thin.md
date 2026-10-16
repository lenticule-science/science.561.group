---
name: "Thin"
identity: thin
description: "A structure is thin relative to a richer structure when it is the image of a forgetful map that discards information-bearing components. A thin value domain keeps only the accumulation order of knowledge and discards denial, contention, the truth order and the residuated operations."
date-created: 2026-10-15
aliases:
  - "thin value domain"
  - "thinness"
contrasts-with: thick
see-also:
  - bilattice
  - thin-approximate-prototype-simulacra
  - approximate
target: lib/emsenn/services/561-group/services/science-services-section/services/philosophy-services-section/content/text/glossary/terms/
provenance:
  sources:
    - "emsenn, 2026-10-15: \"i know thin and approximate as precise terms, and prototype from engineering: four precise terms, assembled into one precise term, each should be precisely notated, formalized, schematized, related\""
    - "logic-services-section glossary concept thin-value-domain"
    - "engineering-services-section note on the driver as a thin pump (2026-03-21)"
    - "logic-services-section note exploiting-thin-rules-record"
---
**Thin** is a relation between two structures. A structure `T` is thin relative to a structure `R` when `T` is the image of a forgetful map `U : R → T` that discards components of `R` that carry information. `R` is then a thickening of `T`, and thickening is the work of restoring what `U` discards.

## The thin value domain
The substrate's value domain is `L^⋈`, the twist product of a residuated lattice `L` with itself. It is a bilattice with a knowledge order `≤_k` and a truth order `≤_t`; over the two-element `L` it is the Belnap–Dunn four `{⊥, t, f, ⊤}`. It carries fusion `·` and residual `→`.

A **thin value domain** forgets four things:

| Discarded | What its absence costs |
|---|---|
| `f` (told false) | a denial has no witness at the cell; a failure is recorded outside the value |
| `⊤` (told both) | disagreement between sources is an exception, not a value to repair |
| `≤_t` (truth order) | no negation that is monotone in `≤_k` and antitone in `≤_t` |
| `·` and `→` | evidence cannot be combined or restricted compositionally |

What remains is a partial order of accumulation, for example `⊥ ≤ recipe-known ≤ realized`, raised monotonically. A Nix store path is the worked example in the logic-services-section concept `thin-value-domain`.

## Thin rule
A rule fiber is thin when its value domain is thin: the rule holds or does not hold, with no denial witness and no contention. A thin rule cannot suppress a move that composes lawful moves into an unanticipated one; the cell `exploiting-thin-rules-record` flags that case: `respond` produces `t` while the rule fiber was too thin to suppress the move.

## Not this
A **thin pump** (engineering note, 2026-03-21) is a driver that carries no program logic and pumps bytes between boundaries and the substrate's admission and read primitives. It is thin by the same map, since the driver is the image of the program-carrying runtime under a map forgetting program logic, and that thinness is the design. A thin value domain and a thin rule are deficient. The two uses share the definition above and differ in whether the discarded components were owed.
