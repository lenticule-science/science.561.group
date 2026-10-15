---
name: "Prime Event Structure"
identity: prime-event-structure
description: "A prime event structure is a set of events E with a causal order and a conflict relation, written (E, <=, #)."
date-created: 2026-10-15
see-also:
  - arena
  - reachability
  - sheaf-laplacian
  - causal-set
  - settlement
target: lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/content/text/glossary/terms/
provenance:
  sources:
    - "Arena sheaf-Laplacian note (`A1`) `lib/emsenn/services/561-group/services/public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/documents/articles/notes/2026/06/25/2026-06-25-research-on-the-arena-sheaf-laplacian-and-best-response-reachability.md`, section "The reading""
    - "Arena sheaf-Laplacian note, Science Services Section copy under `lib/emsenn/services/561-group/services/science-services-section/services/engineering-science-services-section/services/computer-science-services-section/content/text/documents/articles/notes/2026/06/25/2026-06-25-arena-sheaf-laplacian-and-reachability.md` (computer-science-services-section, 2026-06-25)"
    - "Read whole from `561-group/bare-cedar-fog` at d7cda6a4 (blob-less clone) by the 2026-10-15 reader reports in `content/research/`."
---
The held notes define the structure in one clause: "gaming's arena is a prime event structure `(E, <=, #)` — events with a causal order `<=` and a conflict relation `#`" (`A1`). The source gives no further axioms. Two events related by `<=` are ordered; two related by `#` are in conflict.

## Use in the held notes
The arena note reads the arena of a concurrent game as such a structure and claims that `(<=, #)` define a Grothendieck topology on the event poset, so that the arena's event-stalk values form a sheaf and a `sheaf-laplacian` acts on them. It lists proving that topology, that sheaf and the continuity of the operator as "concrete builds", so those claims are goals and not results. Its headline, that best-response `reachability` is the kernel fixed point of the arena operator, is a conjecture.

## Not this
A causal set or Lorentzian settling has an order and no conflict relation: spacelike pairs are concurrent there (see `causal-set`). The two readings of "not related" differ, and the theorems about apex and void suit only conflict-free structures. See `arena` for the concurrent-game arena.

## Target
Target path: `lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/content/text/glossary/terms/` in `561-group/bare-cedar-fog`, the Mathematics Services Section glossary terms directory.
