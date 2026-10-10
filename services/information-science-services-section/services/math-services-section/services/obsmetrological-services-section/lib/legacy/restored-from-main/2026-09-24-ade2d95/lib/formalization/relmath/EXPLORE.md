# Writing & exploring the RelMath proof — the whole workflow

This is the operator's manual *and* the explanation of why it's built this way. You
know math; you don't (yet) know the dev tooling. So every command here comes with the
reason it exists. Nothing is a magic switch.

The mental model is two loops:

```
  COCKPIT — "is it proved?"                 BROWSER — "what's the shape?"
  ─────────────────────────                 ────────────────────────────
  VS Code, on Windows.                      A website you build, then read.
  Edit .lean, watch the goal state,         The dependency graph of the whole
  ask an agent to prove things.             library: every statement a node.
  `lake build` is the source of truth.      Green = proved, red = just stated.
```

You live in the cockpit. You glance at the browser to see where the frontier is.

---

## Loop 1 — the cockpit (VS Code)

Open the repo in VS Code. Everything below is already configured; you just use it.

### The pieces and what each is *for*

- **The Lean server** (`leanprover.lean4` extension). When you open a `.lean` file, a
  background process *elaborates* it — runs the type-checker as you type. The payoff is
  the **InfoView** (a panel on the right): put your cursor inside a proof and it shows the
  **goal state** — the hypotheses you have and the thing you still must prove. This is the
  single most important thing on screen. A proof is done exactly when the InfoView says
  *"no goals."* Think of it as the running state of the sequent you're discharging.

- **Paperproof** (`paperproof.paperproof`). Renders the *current* proof as a little tree
  — each tactic is a step, branches are sub-goals. Good for seeing the structure of a
  proof you're in the middle of, vs. the InfoView's textual state.

- **The agent (me), via `lean-lsp` MCP.** This is the "agentic" part. The Model Context
  Protocol server in [.mcp.json](../.mcp.json) gives me programmatic access to the *same*
  Lean server you're looking at: I can read the goal state at any line, read compiler
  errors, search for existing lemmas, and try tactics — all against the real proof state,
  not a guess. So you can say *"prove the next lemma"* or *"why is line 40 red?"* and I
  work against ground truth. **I don't edit files through the MCP** — I read proof state
  through it and write code with normal file edits, then we both watch the InfoView agree.

  *This is the cockpit you asked for.* Not a separate app — it's VS Code, plus a checker
  that both you and an agent can interrogate, plus conversation.

### The one command that matters

```sh
cd lean && lake build      #  or: make lean-build   (same thing)
```

`lake` is Lean's build tool (like `cabal`/`cargo`/`make` for Lean). `lake build`
type-checks the *entire* library. **Green build = every proof holds.** Because this
library bans `sorry`/`axiom` past the two primitives (see [CLAUDE.md](CLAUDE.md)), "green"
genuinely means "proved," not "compiles." This is your source of truth — trust it over
anything else in this document.

---

## Loop 2 — the browser (explore the proof tree)

The thing you wanted: *see the proof tree, click around, read each element.* That's the
**blueprint** — a website whose centerpiece is the **dependency graph**: every formal
statement is a node, an arrow `A → B` means "B's proof uses A," and color tells you
status (green = formalized, red = stated-but-open). It's the live frontier of the project.

It's a *static website* — just HTML/JS/CSS files in [blueprint/web/](blueprint/web/). To
look at it you do two things: **build** it, then **serve** it.

### Why two different machines (the non-obvious bit)

- **Building** the site uses `leanblueprint` → `plasTeX` (LaTeX→HTML) and graphviz (graph
  layout). Those are C programs that need a proper C toolchain + libc. Windows doesn't
  have that out of the box, but **WSL (your Linux-in-Windows) does.** So we build in WSL.
- **Serving** the site is trivial — hand static files to a browser over HTTP. We do that
  **natively on Windows** with Python's built-in server, because (a) it's dead simple and
  (b) serving *from* WSL means relying on WSL→Windows network forwarding, which is flaky
  on this machine. Build where the tools are happy; serve where the browser is.

### Build it (WSL)

```sh
make lean-web
# which is exactly:
#   wsl.exe bash -c 'source ~/.venvs/blueprint/bin/activate && cd lean && leanblueprint web'
```

Unpacking that one-liner, because it teaches three real concepts:
- `wsl.exe bash -c '…'` — run a command inside your Linux environment from Windows.
- `source ~/.venvs/blueprint/bin/activate` — activate a **Python virtual environment**. A
  venv is a sandboxed folder holding one project's Python tools (here: `leanblueprint`,
  `plastex`) so they don't collide with the system Python. "Activating" just puts that
  folder's programs first on `PATH`. Skip it and you get `plastex: not found`.
- `leanblueprint web` — the standard CLI compiles `blueprint/src/content.tex` into the
  website under `blueprint/web/`.

### Serve it (Windows)

```sh
make lean-serve
# which is exactly:
#   python -m http.server 8000 --directory lean/blueprint/web
```

This starts a tiny web server and **keeps running until you press Ctrl-C** — that's the
point, and it's why the old setup looked "broken": a server only answers while it's
running. Leave this terminal open, then visit:

> **http://localhost:8000/** — chapters + statements
> **http://localhost:8000/dep_graph_document.html** — the dependency graph

(The graph fetches a `.wasm` file to lay itself out, which browsers refuse to load from a
`file://` page — that's the whole reason a server is needed instead of double-clicking the
HTML.)

In VS Code you can skip the terminal entirely: **Terminal → Run Task → "Blueprint: serve
(browser)"** (see [.vscode/tasks.json](../.vscode/tasks.json)).

---

## The honesty gate: `make lean-check`

A blueprint can lie two ways: claim a `\lean{}` declaration that doesn't exist, or mark a
node green (`\leanok`) that was never proved. The gate against the first is **`checkdecls`**
(Patrick Massot's tiny Lean executable): it loads the compiled RelMath environment and
verifies that **every declaration the blueprint names actually exists**.

```sh
make lean-check      # cd lean/tooling && lake exe checkdecls ../blueprint/lean_decls
```

Exit 0 = every claim corresponds to a real declaration. It runs **natively on Windows**
(Lean-only — no C toolchain), and lives in the `tooling/` sidecar so RelMath's lakefile
stays pure. Run `make lean-web` first if you edited `content.tex` (that regenerates the
declaration list the gate reads).

Two honest things to understand about its scope:
- `checkdecls` verifies a named declaration **exists**; it does not itself re-check the
  proof. Soundness comes from the pair: a **green `lake build`** (RelMath bans `sorry`/
  `axiom` past the two primitives, so "builds" means "proved") **plus** `checkdecls`
  (so "the blueprint points at the real thing"). Together they make green honest.
- The `\leanok` flags themselves are still author-set. The discipline that keeps *them*
  honest is running `make lean-build` + `make lean-check` and trusting those over the
  prose. The CI plane (below) runs exactly this pair on every push as the referee.

To a mathematician: `lake build` proves the lemmas; `checkdecls` proves the blueprint is
*about* those lemmas. Neither alone is enough; together they close the loop.

---

## Good practices this setup is teaching you

- **One source of truth.** `lake build` decides what's proved. Docs/colors/notes can drift;
  the checker can't. When something disagrees, the checker wins.
- **A command catalog beats memorized incantations.** The [Makefile](../Makefile) targets
  and [tasks.json](../.vscode/tasks.json) exist so the *real* commands are written down,
  named, and explained — not retyped from memory. Read them; they're short.
- **Use the standard tool, not a bespoke one.** We deleted a hand-rolled web server in
  favor of `python -m http.server` and `leanblueprint`. Custom glue is one more thing that
  rots; standard tools are documented, updated, and understood by everyone.
- **Right environment for the job.** Build (C toolchain) → WSL/Linux. Serve + edit →
  Windows. Knowing *which* machine a task belongs on removes most "why is this broken" pain.
- **Reproducibility.** The Lean toolchain is pinned in [lean-toolchain](lean-toolchain);
  the Python tools in a venv. Anyone (including future-you, or CI) recreates the exact
  environment from those files.

---

## Command card

| I want to… | Command (or VS Code task) |
|---|---|
| Check the proof | `make lean-build` · task "Lean: build (proof checker)" |
| Verify the blueprint isn't lying | `make lean-check` · task "Blueprint: check (honesty gate)" |
| See live goal state | open the `.lean` file → InfoView panel |
| Have an agent prove something | just ask in chat — I drive Lean via the MCP |
| Rebuild the proof-tree website | `make lean-web` · task "Blueprint: rebuild (WSL)" |
| View the proof-tree website | `make lean-serve` → http://localhost:8000 |
| Verify before trusting a green node | `make lean-build && make lean-check` |
