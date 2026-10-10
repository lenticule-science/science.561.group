---
title: Status Vocabulary
description: A reference for the maturity and regime labels used when documenting Obsmetrologia claim-sites without overclaiming.
date-created: 2026-06-30
keywords:
  - obsmetrologia
  - reference
  - status
  - maturity
  - frontier
---

# Status Vocabulary

Use these labels in `.agents/docs` and concept references.

## Maturity Status

| Status | Meaning | Documentation Voice |
| --- | --- | --- |
| foundation | Part of the generative base or early derived spine. | Explain as local foundation, but still name the carrier. |
| proved | Lean declaration and Blueprint green status support the claim. | Say "proved by" or "settled by" with declaration names. |
| recovery | Familiar mathematics appears as a generated comparison or specialization. | Name the Obsmetrologia generator first, comparison second. |
| frontier | Precise but unsettled obligation, often Blueprint `\notready`. | Say "states", "obligation", "frontier", not "proved". |
| provenance | Source, note, archive, or corpus pressure not yet promoted. | Say "records" or "source note", not "the manual establishes". |
| archived | Reference material outside active build input. | Use only as history or comparison unless promoted. |
| computational witness | Finite, executable, enumerated, or checked carrier supporting a reading. | Keep finite witness distinct from analytic/general theorem. |
| unknown | Not enough live evidence opened. | Mark unknown and continue reading. |

## Regime Labels

Use only when the local source supports them:

- strict finite;
- Scott continuous;
- transfinite bounded;
- aperiodic.

Regime labels should be connected to the relevant closure, ordinal, cohomology,
or persistence carrier.

## Blueprint Status

| Blueprint Mark | Meaning |
| --- | --- |
| `\lean{...}` | Intended or actual Lean declaration link. |
| `\leanok` | Claim-site is marked settled by the named Lean declaration. |
| `\notready` | Claim-site is stated but unsettled frontier. |
| `\uses{...}` | Dependency edges for the claim-site. |

Always check the surrounding Blueprint section before summarizing a node.

## Lean Trust Status

For proof work:

- exported or green results should be axiom-clean under the project's
  verification discipline;
- hard trust surfaces such as `axiom`, `constant`, `opaque`, and
  `native_decide` are not allowed past the permitted primitive boundary;
- use Lean LSP verification before relying on a declaration.

For documentation-only work:

- do not claim axiom cleanliness unless verified in the current turn;
- it is enough to say a declaration is named by Blueprint or present in a module
  if that is what you checked.

