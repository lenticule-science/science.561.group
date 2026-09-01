# RelMath blueprint (prose → formal dependency graph)

`leanblueprint` is the single most valuable tool for a corpus-driven, massive
formalization: it builds a web **dependency graph** where every informal statement
(`\begin{theorem}…`) links to its formal Lean declaration and is colored by whether
it's been *stated* (`\lean{}`) and *proven* (`\leanok`). It's how you turn a pile of
sloppy prose into a navigable frontier of "what's left to formalize."

It is mostly a **Python tool** (plasTeX-based) plus a tiny Lean-side decl checker, so
it adds **no math dependency** to RelMath. We build locally only — **no GitHub Pages**.

## Verified state (2026-06-22) — the web graph BUILDS **natively on Windows**

- **The site renders, on Windows.** The whole pipeline — `plastex` web build emitting
  `lean_decls`, and `lake exe checkdecls` verifying every `\lean{}` against compiled
  RelMath — now runs natively, no WSL. Verified: `PLASTEX_EXIT=0`, `checkdecls` EXIT 0
  on all 171 named decls (and it correctly *rejects* a missing decl).
- **What unblocked it (installed 2026-06-22):**
  - **MSVC Build Tools** (`winget install Microsoft.VisualStudio.2022.BuildTools` with the
    `VCTools` workload) → `cl.exe` + Windows SDK. `pygraphviz` now *compiles* against it.
  - **Graphviz** (`winget install Graphviz.Graphviz`) → `dot` + the `cgraph`/`gvc` C libs
    pygraphviz links; its `bin/` is on the user PATH so `_graphviz.pyd` loads at runtime.
  - **MiKTeX** (`winget install MiKTeX.MiKTeX`) → `kpsewhich`, which plasTeX needs to
    locate `web.tex`/packages.
  - `pip install leanblueprint` (run inside `vcvars64` with Graphviz's `include`/`lib`
    appended to `INCLUDE`/`LIB`) builds `pygraphviz` cleanly.
- **Authoring needs nothing** — `content.tex` is plain text, editable anywhere.

## How the web graph is built (Windows, native) — reproducible

```powershell
# one-time installs (see "What unblocked it" above): MSVC BuildTools, Graphviz, MiKTeX,
# then `pip install leanblueprint` inside a vcvars64 shell.
$scripts = "$env:LOCALAPPDATA\Packages\PythonSoftwareFoundation.Python.3.12_qbz5n2kfra8p0\LocalCache\local-packages\Python312\Scripts"
$env:Path = "C:\Users\emsen\AppData\Local\Programs\MiKTeX\miktex\bin\x64;$env:Path;C:\Program Files\Graphviz\bin"
cd C:\Users\emsen\561-group\lean\blueprint\src
& "$scripts\plastex.exe" -c plastex.cfg web.tex      # -> ../web/ , emits ../lean_decls

cd ..\..\tooling
lake exe checkdecls ..\blueprint\lean_decls          # honesty gate: every \lean{} is real
```

## How the web graph is built (WSL) — also works

One-time install (the `sudo apt` line is what previously blocked — sudo needs a password):

```sh
sudo apt-get install -y graphviz libgraphviz-dev      # graphviz CLI + dev headers
python3 -m venv ~/.venvs/blueprint
~/.venvs/blueprint/bin/pip install leanblueprint        # compiles pygraphviz
```

Build. **Do not use `leanblueprint web` directly**: its CLI finds the project via the
git toplevel (the repo root), which has no lakefile (ours is in `lean/`), so it errors.
The `web` command just runs plasTeX, so call plasTeX directly from `blueprint/src/`:

```sh
cd lean/blueprint/src
~/.venvs/blueprint/bin/plastex -c plastex.cfg web.tex   # -> ../web/
```

Serve it over HTTP (the d3-graphviz renderer fetches a `.wasm`, which browsers block
over `file://`):

```sh
cd lean/blueprint/web && python3 -m http.server 8765
# open http://127.0.0.1:8765/dep_graph_document.html
```

> Do **not** run `leanblueprint new` over the existing scaffold — it would overwrite
> the authored `content.tex` / `macros/common.tex`. The scaffold here already matches
> leanblueprint's canonical template (theorem envs in `macros/common.tex`, no-op
> dependency macros in `macros/print.tex`, the `blueprint` plugin loaded by `web.tex`).

The scaffold links prose to Lean like this:

```latex
\begin{definition}\label{def:concept}\lean{RelMath.Concept}\leanok
  A concept is ...                      % \lean{} = the formal name; \leanok = proven/defined
\end{definition}
\begin{theorem}\label{thm:settling}\uses{def:concept}\lean{RelMath.settles}
  Every act settles.                    % no \leanok yet  => shows RED in the graph
\end{theorem}
```

## checkdecls — validating `\lean{}` names against the real library

`checkdecls` confirms every `\lean{}` name actually exists in the compiled RelMath. It
needs a Lake-side helper and builds against RelMath's output, so route it through the
`lean/tooling/` sidecar — **never** add it to `lean/lakefile.toml`. Until that's wired,
the same guarantee is enforced by the authoring workflow's adversarial verify pass
(every node re-checked against its module), and a quick offline check is just grepping
each `\lean{RelMath.X}` against `lean/RelMath/*.lean`.

The PDF build (`plastex` is HTML-only) needs a TeX distribution; run `latexmk` on
`src/print.tex` in WSL with `texlive` installed if you want `print.pdf`.

> The blueprint is also the natural seam for the **Lean ↔ Node fusion**: each
> `\lean{}` node already names a formal declaration; mapping those to the Node
> `@emsenn/*` capabilities that implement them is the cross-reference index that
> ties proofs (Lean) to programs (Node).
