# RelMath tooling sidecar

Documentation / representation tooling that runs **over** the pure-math
`RelMath` library without touching its manifest. RelMath stays dependency-pure
(core-only, no math requires); everything here lives in this sidecar package,
which `require`s RelMath by relative path (`..`). The dependency arrow is
tooling → RelMath, so no tooling code is ever imported into a proof.

All pins are the **v4.31.0** tags, matching `../lean-toolchain`.

## Verified state (2026-06-21, Lean v4.31.0, Windows)

- `lake update` resolves cleanly; **doc-gen4 + RelMath both compile.**
- **import-graph: fully working end-to-end** (no native deps).
- **doc-gen4 HTML: partially blocked on Windows.** With a UCRT64 gcc installed as
  `cc` (below), the native deps build and doc-gen4 renders **every RelMath module
  page** — but its final `fromDb` step (sqlite-backed search index + `index.html` +
  static assets) **segfaults** (`0xC0000005`). The crash is in doc-gen4's *runtime*
  use of the gcc-built SQLite, not in this wiring. doc-gen4's index/search step is
  reliably exercised only on **Linux/CI**.
  - → For the full browseable HTML site, build the `:docs` facet under **WSL/Ubuntu**
    (present on this machine) or in CI. import-graph + the VS Code stack work natively.

## C toolchain (installed) — for doc-gen4's native deps

doc-gen4 v4.31.0 depends on `leansqlite` (SQLite C, search index) and `UnicodeBasic`'s
C library, which compile via `cc` and need **full libc headers**. The Lean-bundled
`clang` ships no libc, so a real toolchain is required.

Installed here: **MSYS2 UCRT64 gcc** (`pacman -S mingw-w64-ucrt-x86_64-gcc`, gives
`C:\msys64\ucrt64\bin\gcc.exe` + a `cc.exe` copy). UCRT chosen to match Lean's
`ucrtbase` linkage. To rebuild docs, put it on PATH first:

```sh
export PATH="/c/msys64/ucrt64/bin:$PATH"   # provides cc (gcc + libc)
lake build RelMath:docs                     # compiles fine; fromDb still segfaults on Windows
```

import-graph has **no** native deps and needs none of this.

## Building the full HTML site on Linux / WSL / CI (the reliable path)

doc-gen4's index/search step works on Linux. From a Linux shell (WSL Ubuntu is
installed on this machine) with the repo at `/mnt/c/Users/emsen/561-group`:

```sh
# one-time: Lean toolchain in Linux
curl https://elan.lean-lang.org/elan-init.sh -sSf | sh -s -- -y
source "$HOME/.elan/env"

cd /mnt/c/Users/emsen/561-group/lean/tooling
lake update
lake build RelMath:docs                     # cc/libc already present on Linux
python3 -m http.server 8080 --directory .lake/build/doc   # open http://localhost:8080
```

In CI, the `leanprover/lean4` Docker image (or any image with `build-essential`)
has `cc` + libc already; just `lake update && lake build RelMath:docs`.

## First-time setup (native, Windows)

From this directory (`lean/tooling/`):

```sh
lake update            # fetch doc-gen4 + import-graph (and their deps) into .lake/packages
```

This is the heavy step — it clones and builds doc-gen4's toolchain on first run.

## Browseable HTML API docs (doc-gen4 ≈ TypeDoc / doc-gen4 of Lean)

```sh
lake build RelMath:docs
```

Output lands under `.lake/build/doc/`. Serve it locally (no GitHub Pages):

```sh
# from lean/tooling/
python -m http.server 8080 --directory .lake/build/doc
# then open http://localhost:8080
```

> If the `:docs` facet name differs in this doc-gen4 build, the equivalent is
> `lake -R -Kenv=dev build RelMath:docs`; check `lake build --help` /
> doc-gen4's README for the exact facet.

## Module dependency graph + import lint (import-graph ≈ dependency-cruiser)

**Verified working** — this needs no C toolchain.

```sh
# import DAG of the RelMath library (--to scopes to RelMath's upstream)
lake exe graph --to RelMath RelMath-imports.dot      # produced 31 edges here
#   render it: dot -Tsvg RelMath-imports.dot -o RelMath-imports.svg   (needs graphviz)
# surface transitively-redundant imports (the cleanup signal):
lake exe graph --to RelMath --show-transitive RelMath-redundant.dot
```

Run `lake exe graph --help` for all flags (`--from`, `--exclude-meta`, …).

## Why a sidecar instead of env-gating

Mathlib keeps its core build clean by gating doc-gen4 behind `meta if env = dev`.
We go one better for a pure-math mandate: the tooling dependency is in a
*separate package*, so `lean/lakefile.toml` stays byte-for-byte pure and the
math build never even sees doc-gen4 in its manifest.
