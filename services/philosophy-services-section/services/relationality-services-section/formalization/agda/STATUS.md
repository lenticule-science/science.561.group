---
title: "Semiotic Universe Agda Formalization — status"
date-created: 2026-09-10
tags: []
description: Recovered from lib/legacy/2026-08-17-windows-library/ (a copy of the same Agda source also existed, unpromoted, in lib/legacy/2026-08-17-emsenn-google-drive-library-artifacts/, deleted as a duplicate once this copy was promoted).
---

Recovered from `lib/legacy/2026-08-17-windows-library/` (a copy of the same Agda source also existed, unpromoted, in `lib/legacy/2026-08-17-emsenn-google-drive-library-artifacts/`, deleted as a duplicate once this copy was promoted). Corrected the same archival directory-flattening defect found and fixed in the sibling `../lean/` promotion (files were nested under `domains/SemioticUniverse/...`; the `.agda-lib`'s `include: .` expects `SemioticUniverse/...` directly).

This is the "synthetic" companion to `../lean/` (which axiomatizes the same [semiotic universe](../../content/text/documents/articles/notes/semiotic-universe.md) specification; this one builds it from categorical primitives — see [the Agda formalization note](../../content/text/documents/articles/notes/semiotic-universe-agda-formalization.md) for the intended construction chain). 985 lines across 9 modules (Category, Everything, Fragment, Fusion, Interpretation, LawvereTierney, SubobjectLattice, Syntax, Topos), two of which (`LawvereTierney.agda`, `SubobjectLattice.agda`) contain explicit `postulate` blocks — visible, auditable axioms, not hidden incompleteness — and none contain an unresolved `{!!}` goal.

**Not build-verified.** No Agda compiler was available in the environment this was recovered in, so `agda SemioticUniverse/Everything.agda` has not actually been run against this source (unlike `../lean/`, which was verified compiling via `lake build`, 381/381 jobs). The tracking note's own module table additionally lists `TraceComonad.agda` and `Ambient.agda` as intended modules; neither exists in this archive (only their `.lean` counterparts do, in `../lean/`), and `Everything.agda`'s own import list does not reference them — so this Agda formalization is, as recovered, an honest subset of its own stated plan, not a complete mirror of the Lean side.
