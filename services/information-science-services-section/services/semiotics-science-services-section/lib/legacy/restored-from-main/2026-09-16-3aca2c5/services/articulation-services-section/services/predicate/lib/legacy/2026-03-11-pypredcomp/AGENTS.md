# AGENTS.md — pypredcomp

You are working on a **runnable operating-system substrate**, not a library, not a script, not a research artifact.
The math (predication-categories, bilattice closure, Lawvere quantale cost, sheaf-of-fibers) and the engineering theory (predicated-computing, agential-orchestration, FARS) **already exist** under `theories/...
` and the normative specs under `docs/dev/specs/`.
Implementation is **behind** the theory; the job is to close the gap.

Frame: you are Linus shipping Linux 0.x.
The design papers are already on the desk.
Ship kernel features.

## Hard scope rules

1. **Minimum unit of work is a substrate-level capability that didn't exist before** — something the OS can newly *do*: accept an event, schedule a rule, dispatch to a driver, fire an `await`, replicate a witness, enforce a capability check.
  Wiring an existing function into another surface (REPL, HTTP, MCP) is **not** a capability.
  Adding tests to an already-implemented module is **not** a capability.
  Doc enrichment is **not** a capability — and is owned by another agent anyway.

2. **Cross-cutting work is the work.** If a feature touches `respond.py` + `runtime.py` + `stdlib.py` + a new module, that's the *signal you found the load-bearing thing*, not a reason to defer.
  The reflex "this is too big, let me ship a slice" is the failure mode the project keeps hitting.
  Take the whole arc in one landing.

3. **Pick work top-down from the active plan, not bottom-up from `TODO`/`NotImplementedError`.** The captain's plan is authoritative — read it before choosing what to build:
   - **Active: [v0.2a — multi-user single-node](docs/dev/milestones/v0.2a-multi-user-single-node.md)** (~3 weeks). Goal: ship kernel surfaces, multi-user authoring, and boot completeness on a single node. The ship targets ARE the capability list:
     1. All kernel specs (respond, σ/Δ passes, projection-naturality, fuel-composition, inconsistency-repair, binary-cell-emission, computational-model §9 cost) normative and source-cited.
     2. All paired `t02-NNf` fixtures pass against `src/` per [decisions/fixture-authoring-paired-task.md](docs/dev/decisions/fixture-authoring-paired-task.md).
     3. `bootstrap_users` + `fiber_reconcile` boot phases exist and reconcile divergence-free against a ≥3-user manifest (per [boot-sequence.md §4.1, §4.2](docs/dev/specs/init-boot/boot-sequence.md)).
     4. Multi-user respond fixtures pass (admin asserts, member retracts, observer reads) per [multi-regime-session.md](docs/dev/specs/process/multi-regime-session.md).
     5. H¹ audit pass returns regime-appropriate cohomology surface ([sigma-delta-passes.md §9](docs/dev/specs/kernel/sigma-delta-passes.md)).
     6. Fuel-composition gate: a `respond` with explicit top-level `F` produces byte-identical replay across two fresh boot cycles.
     v0.2a task IDs: `t02-e1…e4` (stratum), `t02-30…34` (multi-user authoring), `t02-40…43` (capability fibers), `t02-110…115` (per-stratum projection materialisation), `t02-120…125` (inconsistency-repair), `t02-140…145` (bootstrap-users + fiber-cache reconcile), plus paired `t02-NNf` fixture-authoring tasks.
   - **Next: [v0.2b — drivers, observability, packaging-prep](docs/dev/milestones/v0.2b-drivers-observability-packaging.md)** — picks up after v0.2a ships.
   - **Deferred (do not start unprompted):** federation/network wire formats (until implementer named, per [decisions/network-spec-defer-until-implementer-named.md](docs/dev/decisions/network-spec-defer-until-implementer-named.md)); self-hosting + trusting-trust machinery (v0.3, per [decisions/trusting-trust-bootstrap-path.md](docs/dev/decisions/trusting-trust-bootstrap-path.md)).

When in doubt about which v0.2a ship target to advance: ask the captain to point at a task ID.
Do not pick yourself.

4. **Deferral requires evidence, not vibes.** "Touches multiple modules" is not evidence — it is the definition of the work.
  Legitimate reasons to defer: a normative spec contradicts itself and the captain must arbitrate; the work depends on an external integration that isn't provisioned; the captain explicitly scoped you smaller.
  Otherwise: do the load-bearing thing.

5. **If you genuinely don't know what to build, ASK the captain — don't pick a small thing and ship it as cover.** 30 seconds of asking beats 2 hours of test-coverage theatre.

## Anti-patterns — do not repeat

- **Test-coverage nibbling.** Adding tests to an already-tested module, or shipping a 50-line verb plus 200 lines of tests for it.
  Test count is not progress.
- **Reflexive full-suite runs.** Running the entire pytest sweep after every micro-change.
  Run targeted tests for what you touched.
  Full suite at most once at the end of a real landing.
- **Reflexive deferral by complexity.** "This touches the runtime, deferring to v0.3."
  If it touches the runtime, that *is* the runtime work — do it.
- **Surface wiring as a session.** Exposing an already-implemented function in REPL/HTTP/MCP.
  Useful as the *last 5 minutes* of a real landing.
  Never the whole session.
- **Doc assessment / re-orientation as a session.** Specs are normative.
  Reading them is preparation, not output.
- **"Architect review" of trivial change as ceremony.** Reserve the architect for genuinely cross-cutting landings.

## Discipline

- **Knuth/Dijkstra/Apollo-11 rigor applies to *quality of code*, not *size of code*.** The bigger the landing, the more it has to be correct on the first try.
  That's an argument for thinking harder before writing, not for shipping smaller.
- **Determinism is gospel.** Gate-9 byte-identity across runs and implementations is non-negotiable.
  Sort iteration order.
  Pin canonicalization.
  No wall-clock or non-deterministic iteration in any code path that produces a cell, an event, or an audit report.
- **Specs are normative.** Cite them as `specs/<area>/<file>.md §N` in code comments.
  Spec defects go to the captain — don't silently diverge.
- **Errors use `SubstrateError` with codes from `error_codes.py`.** Add new codes there; don't invent strings inline.
- **No commits unless explicitly asked.** The captain stages.

## Session shape

1. Read the captain's request literally.
  If it says "continue", default to the next load-bearing item per rule 3 — don't regress to a smaller item.
2. Read the relevant spec(s).
  One pass; don't re-orient.
3. Sketch the arc: which modules, which new files, which spec citations, which conformance check proves it works end-to-end.
  Write `.local/session_plan.md` only if 3+ ordered steps; otherwise begin.
4. Build.
  Targeted test runs (`pytest <one_file>`) as you go.
  One full-suite run before declaring done, only if you touched substrate-level code.
5. Stop when the capability *works end-to-end*, not when the first sub-task passes its tests.

## Captain

emsenn (BDFL).
Decisions on scope, scheduling, and merge belong to the captain.
When in doubt, ask.
