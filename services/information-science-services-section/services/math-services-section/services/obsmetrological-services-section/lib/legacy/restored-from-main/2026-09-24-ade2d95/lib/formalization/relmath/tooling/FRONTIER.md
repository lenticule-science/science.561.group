# Frontier Lean tooling — and how it fits the pure-math mandate

The hard constraint: **a RelMath proof file may import core only.** Any tool that
works by being `import`ed into a proof file therefore *cannot run inside RelMath*
without polluting it. That single rule sorts every frontier tool into one of two
buckets: **safe** (runs outside RelMath, over it or alongside it) vs **scratch-only**
(must live in an experimental package, with proof terms ported back pure).

## Safe — runs over/alongside RelMath, no pollution

- **Verso** (`leanprover/verso`) — the Lean FRO's live-checked authoring system;
  the official language reference and books are built with it. This is "documentation
  and representation," which the mandate explicitly blesses. Use it for the *book*
  (prose with code blocks that are elaborated and checked), with doc-gen4 for the
  API reference. Lives in this sidecar or its own package; never imported by RelMath.
- **import-graph** — already wired in `lakefile.lean`. Module DAG + unused-import lint.
- **doc-gen4** — already wired in. Browseable API reference.
- **Lean REPL** (`leanprover-community/repl`) — see `tools/repl/`. The substrate for
  agent-driven formalization: drive RelMath programmatically, get goal state as JSON.
  This is the most relevant frontier piece for an agentic prose→formal pipeline.
- **local Loogle** — see `tools/loogle/`. Type-signature search over RelMath. The
  public leansearch/loogle index Mathlib only and will never see RelMath.
- **Alectryon / LeanInk** — render proofs with inline goal states for the web/book.
  A representation layer; safe.

## Scratch-only — would pollute RelMath if imported into a proof

- **LeanCopilot** (`lean-dojo/LeanCopilot`) — LLM tactic suggestion + premise
  selection via local models. Powerful, but `import LeanCopilot` in a file makes
  that file depend on it (and its native CTranslate2 libs), and its premise DB is
  trained on Mathlib. Use it in an experimental package to *discover* a proof, then
  hand-port the resulting proof term into RelMath with core-only imports.
- **Duper / lean-auto** (`leanprover-community/duper`) — a superposition "hammer."
  Same story: `import Duper` pollutes. Use in scratch to *find* a term; port it pure.
  (And Duper/auto typically pull Std/Batteries, which RelMath also forbids.)
- **premise-search / leansearch / Moogle** — Mathlib-only corpora; they cannot see a
  private dependency-free library. Local Loogle is the substitute.

## Suggested workflow at Grothendieck scale

1. **Blueprint first** (`lean/blueprint/`): turn sloppy prose into a dependency graph
   of stated-but-unproven decls. Red/green tells you the frontier.
2. **Discover in scratch**: a separate experimental package *may* import Copilot/Duper.
   Agents drive it via the REPL bridge to search for proofs.
3. **Port pure**: move the finished proof term into RelMath, core-imports only;
   `lake build` (the pure manifest) is the gate that proves you stayed clean.
4. **Publish**: doc-gen4 for the reference, Verso for the book, Loogle for search.
