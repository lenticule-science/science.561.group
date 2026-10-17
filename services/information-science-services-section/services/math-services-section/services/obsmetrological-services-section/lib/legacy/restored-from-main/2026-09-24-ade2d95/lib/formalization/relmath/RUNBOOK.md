# RUNBOOK — how to do anything in this repo

**Read this before touching the toolchain. Every procedure is one `make` target. Do not
re-derive paths, PATH exports, `vcvars`, or WSL routing — they are encoded in the
[Makefile](Makefile). If a procedure breaks, fix it *in the Makefile* so the fix is
permanent. The whole point of this file is that no agent ever again spends tokens figuring
out *how*.**

Run `make` (or `make help`) to list every target. Run `make doctor` if something looks off.

## The procedures

| Command | Does | When |
|---|---|---|
| `make build` | `lake build` the RelMath library | after editing any `.lean` |
| `make check` | honesty gate: every `\lean{}` in the blueprint names a real, compiling decl (regenerates `lean_decls`, runs `checkdecls`) | after editing proofs or blueprint nodes |
| `make blueprint` | render the frontier dependency graph → `blueprint/web/` (also emits `blueprint/lean_decls`) | after editing `blueprint/src/*.tex` |
| `make verso` | build + render the Verso manual → `verso-docs/_rendered/` | after editing `verso-docs/*.lean` |
| `make imports` | module import graph → `tooling/imports.svg` | rarely (structure changed) |
| `make api` | doc-gen4 API docs **via WSL** → `docs-site/api/` (slow first run) | when you want fresh API reference |
| `make docs` | build blueprint+verso+imports and assemble the cockpit → `docs-site/` | to refresh the site |
| `make serve` | serve the cockpit at http://localhost:8000 (frees the port first) | to view |
| `make watch` | autosync: rebuild on `.tex`/`.lean` change | while authoring |

## Daily loops

- **Editing a proof:** `make build` → `make check`. Green build = proved (RelMath bans
  `sorry`/`axiom`), `checkdecls` green = the blueprint points at the real thing.
- **Editing blueprint prose:** `make watch` in one terminal, `make serve` in another, edit
  `blueprint/src/content.tex`, refresh the browser.
- **Showing the docs:** `make docs && make serve` → http://localhost:8000.

## Gotchas already solved (do NOT re-discover these)

- **The C toolchain is installed** (MSVC Build Tools + Graphviz + MiKTeX + MSYS2 gcc). That
  is what makes `pygraphviz`/`plastex`/`checkdecls` run natively on Windows. See
  [blueprint/README.md](blueprint/README.md) for the install commands if a fresh machine needs them.
- **doc-gen4 segfaults on Windows** (`0xC0000005` in its `fromDb` step — a runtime bug, *not*
  a missing compiler). `make api` routes it to WSL automatically, into a *separate* WSL-side
  checkout (`~/relmath-lean`) so Linux oleans never collide with the Windows `.lake`.
- **Verso's HTML renders;** only its search-widget static asset is missing — non-fatal,
  swallowed by `make verso`.
- **Stale server squatting on :8000** — `make serve` kills it first. Don't hunt the PID by hand.
- **`lean/` is dependency-pure by mandate.** All tooling (doc-gen4, import-graph, checkdecls,
  Verso) lives in sidecar projects (`tooling/`, `verso-docs/`) that `require RelMath` by path.
  Never add a `[[require]]` to `lean/lakefile.toml`.

## Where things live

- `RelMath/` — the library (one module per file); `RelMath.lean` imports all in dep order.
- `blueprint/` — the prose→proof frontier graph (`src/content.tex` is the source).
- `verso-docs/` — the Verso manual (isolated lake project).
- `tooling/` — doc-gen4 + import-graph + checkdecls sidecar (isolated lake project).
- `docs-site/` — the assembled cockpit served at :8000 (`index.html` tracked; surfaces generated).
- `Makefile` — every procedure. `RUNBOOK.md` — this file.
- The agent loop for *proving* is the **lean-lsp MCP** (goal state, diagnostics, lemma search) —
  use it, not a homegrown REPL.
