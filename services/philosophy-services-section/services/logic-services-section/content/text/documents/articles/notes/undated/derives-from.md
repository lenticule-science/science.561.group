---
name: derives from
description: "The derivation morphism. Maps a record to the structure or transformer in code/ whose content grounds it. Domain: any record. Codomain: code/structures/ or code/transformers/."
title: derives from
---

Domain: any record (spec, concept, skill, claim, etc.)
Codomain: `code/structures/<slug>.md` or `code/transformers/<slug>.md`

A record R `derives-from` structure S means: the content of R is grounded in S's predication-shape. The transformer is one-directional: S constrains R, not the reverse. Multiple `derives-from` edges are permitted; each names a distinct grounding structure.

`derives-from` is not inheritance and not dependency. It is the mathematical derivation relation: R's claims are consistent with and constrained by S's signature.
