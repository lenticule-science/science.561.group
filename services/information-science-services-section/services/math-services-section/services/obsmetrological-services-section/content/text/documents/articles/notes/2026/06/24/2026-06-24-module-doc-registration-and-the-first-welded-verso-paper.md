---
title: Module-doc registration, and the first proof-welded Verso paper
date-created: 2026-06-24
description: 2026-06-24.
keywords:
  - RMN
  - structure
  - organizing
  - communicating
  - closure
  - witness
---
# Module-doc registration, and the first proof-welded Verso paper

_2026-06-24.
Documentation pass on `lean/`: make the existing exposition visible to tooling, and establish the 2026-best-practice form for a result paper._

## The finding: written but unregistered

The library was not under-documented in the sense of missing prose.
It was under-*registered*.
A scan of the 108 `RelMath/` modules found:

- **99 of 108** opened their mathematical overview with a plain `/- … -/` block comment, not a `/-! … -/` module docstring;
- only **1** opened with `/-!
  `;
- per-declaration `/-- … -/` docstrings were already dense (~2400 across the tree).

In Lean 4 only `/-! … -/` registers as a *module docstring*.
A `/- … -/` header is stripped: doc-gen4 does not render it, Verso `{moduleDocs}` cannot ingest it, and LSP hover shows nothing.
This was confirmed empirically against the built doc-gen4 HTML — header-only phrases (`"intentionally small"`, `"base morphism of the whole library"`) were **absent** from `Mark.html` / `Articulating.html`, while declaration-docstring text was present.

So the project's own Mathlib-grade headers (e.g. the Jeandel–Rao module's full Main-definitions/results/References block) were reaching no reader.

## The fix

Convert each top-of-file `/-` header to `/-!
`.
Two facts make this non-trivial:

1. `/-!
  ` is a *command*, so it is a parse error before `import` (`invalid 'import' command, it must be used in the beginning of the file`).
  The old `/-` plain comment was legal there; the new `/-!
  ` is not.
2. The Mathlib-legal shape is therefore: `import …` first, blank line, then `/-! … -/`, then `namespace …`.

A two-pass script (convert leading `/-`→`/-!
`; then relocate the header block to just below the import lines) fixed all 97 import-bearing files; 3 import-free files (primitives) keep the header at the top. **Whole library still green: 111 jobs.**

The rule is now codified in `lean/CLAUDE.md` (House style) so the drift cannot silently recur.

## The first proof-welded paper: the keystone

`verso-docs/RelMathManual/PartIII/QuartetRecurrence.lean` is the first manual section written to genuine 2026 Verso practice rather than the in-house "prose + backtick module list" pattern.
It documents the keystone — `quartet_recurrence` and `twistoring_eq_commutating` — and every claim is *welded* to the library:

- `{docstring RelMath.
  X}` splices the declaration's own signature + docstring at build time (single source of truth; cannot drift);
- `{name RelMath.
  X}` is a build-failing reference (rename/move the decl → manual goes red);
- every worked example is an elaborated `lean` block (a re-checked proof, not an illustration).

It is `{include 1 …}`-mounted under Part III ("The recurring four"), which was a stub explicitly waiting for exactly this exposition.
The division of labour is now clean and confirmed: **blueprint = claim graph** (already best-practice, `\lean`/`\leanok`/`\uses` on every node), **Verso = exposition** (welded prose), **doc-gen4 = API**.

### What the welding caught (the point of welding)

The build failed three times, each time on a *real* defect the welding surfaced:

1. 2026 Verso markup: bold is `*x*` (single asterisk), emphasis is `_x_`; Markdown `**x**` is rejected.
2. Verso code examples are capped at **60 columns** (mobile rendering); two `lean` lines were wrapped.
3. `{docstring RelMath.
  Corner}` refused to render because `Corner`'s four constructors (`potential`/`active`/`absurd`/`stable`) were undocumented.
  Fixed the right way — by **documenting the constructors** (Mathlib standard), not by setting `verso.docstring.allowMissing`.

That third one is the lesson in miniature: a welded document does not let you describe a thing the library leaves blank.
It converts "the docs look fine" into "the docs are the docs."

A fourth failure was infrastructural, not authorial: once the clean errors were gone, elaboration reached the heavy `{docstring}` blocks and the Lean process **segfaulted** (`exit 3221225477` = `0xC0000005`, a native access violation — *not* a Lean diagnostic).
This is the same wall the repo already documents for doc-gen4 ("segfaults on Windows → build via WSL").
Cause: `{docstring X}` *delaborates* `X`'s full elaborated signature back to surface syntax in compiled Lean code that does not check `maxRecDepth`, so a heavy signature runs off Windows' ~1 MB thread stack instead of raising a clean error (Linux/WSL gives ~8 MB and survives).
Bisection result: light signatures render fine on Windows (`Corner`, `FourCorner`, `Modal` — simple inductives/abbrev); structures-with-∀-fields, theorems with function-typed goals, and type-class-bundled signatures (`commutatingPair` over `HeytingAlgebra`/`CommutingNuclei`) overflow.

The reusable lesson — the two welds are **not** equal in cost:

* `{name X}` resolves a name and emits a link.
  Cheap, Windows-native-safe.
  Use it as the *primary* weld everywhere.
* an elaborated `lean` example is type-checked, Windows-native-safe, and stronger evidence than a signature splice (it is a re-run proof).
  Use it for the load-bearing claims.
* `{docstring X}` is the richest but the most fragile: keep it for light signatures; for heavy ones it renders on the same WSL/CI plane as doc-gen4.

The keystone paper therefore ships green on the Windows cockpit with: `{docstring}` for the three core objects, `{name}` welding on every cited declaration, and elaborated `lean` witnesses for the keystone term (`quartet_recurrence`) and the concrete twistoring coherence square.
Nothing in it is unchecked.

The correctness gate is `lake build` (it elaborates the whole manual — every `{name}`, `{docstring}`, and `lean` block — and is green at 732 jobs).
The separate HTML *render* step (`lake exe relmath-docs --output _rendered`) currently throws on a Windows path-handling bug in Verso's search-asset stage (`static-web/search/domain-mappers.d.ts`), manual-wide and unrelated to document content — which is exactly why `make verso` wraps the render in `|| true` and treats the build as the gate.
HTML rendering, like doc-gen4, belongs on the WSL/CI plane.

## Next

- Roll the same welded form across the other Part VII theory overviews (currently thin prose + uncheckable backtick lists).
- Upgrade the foundational primitive-spine headers (`Mark`/`Utterance`/`Articulating`/ `ArticulationCell`/`FourCornerCell`) to the full Mathlib section structure now that they are registered.
- Consider a lint that fails review when a module header is `/-` rather than `/-!
  `.
