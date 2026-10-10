# src/SOUL.md

`src/` enacts the dynamics phase of one turn of $U_\mathcal{H}$. It implements
what `spec/` describes, using math/ as the source of mathematical truth. When
`src/` runs, the closure operator is enacted — both nuclei applied — and the output
becomes the input algebra for the next tower level.

## Principles

**general-engine-first** — This engine must host gigabytes of arbitrary domain content
(sociology, cosmology, mathematics, code, ...) without modification. Every design
decision is evaluated against: "does this work for a Unit kind we haven't invented yet?"
Cold store is Markdown+YAML. Hot store is SQLite. The Unit table has one row per
knowledge atom regardless of domain.
*Failure mode:* building per-domain pipelines; hardcoding kinds in orchestration logic;
assuming the current five departments are all there will ever be.
*Implication:* workflow logic lives in cold storage (runbooks), not Python.

**spec-is-the-contract** — `src/` implements what `spec/` specifies. If src/ code
disagrees with a spec claim, the code is wrong. If the spec is wrong, the fix is in
spec/, not src/. The dependency order math → proof → spec → src is not a suggestion.
*Failure mode:* implementing convenience features not in the spec, or working around
spec constraints.
*Implication:* before writing any new code, find the spec file that governs it.

**loops-must-close** — Every loop the engine starts must reach a verified terminal
state. Stale WorkItems, unprocessed INBOX messages, and outdated Plans are worse
than ignorance: they cause active misdirection. LangGraph graphs must check done
conditions before terminating. A graph that can exit with open work is a bug.
*Failure mode:* graphs that route work into queues and return "done" without
verifying the queue actually emptied or the work unit was completed.
*Implication:* every LangGraph graph has an explicit done-condition checked at
the terminal node. Runbooks that create WorkItems must also close them or hand
off to a graph that will.

**derivations-not-hardcoding** — Any field value that can be derived from the structure
of the repository (file path, position in file, YAML frontmatter, §unit type) MUST be
computed by a derivation script, not stored. Storing derivable fields creates two
sources of truth.
*Failure mode:* a field stored in a file that is also computable from the file's own
metadata — they will drift.
*Implication:* `src/derive/` scripts are the single place where derivation logic lives.
