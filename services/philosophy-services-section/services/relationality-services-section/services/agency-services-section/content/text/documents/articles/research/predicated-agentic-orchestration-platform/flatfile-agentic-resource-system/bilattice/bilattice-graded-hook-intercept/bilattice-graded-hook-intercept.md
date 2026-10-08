---
name: bilattice-graded-hook-intercept
description: "A bilattice-graded hook intercept is a substrate-recorded contract that turns one event from an external agent runtime (Claude Code's PostToolUse, Cursor's edit-completion event, Aider's coder-finish, …) into a Witness on the FARS event log with explicit (truth, evidence) coordinates the substrate chooses, not the runtime."
kind: concept
type: concept
title: "Bilattice-graded hook intercept"
status: draft
depends-on:
  - concept:bilattice-valued-witness
  - concept:continuous-learning-loop
realizes:
  - "harness:claude-code-hooks"
references:
  - "tools/hooks/_index.md"
---


## Primary intension

A *bilattice-graded hook intercept* is a substrate-recorded contract that turns one event from an external agent runtime (Claude Code's `PostToolUse`, Cursor's edit-completion event, Aider's coder-finish, …) into a `Witness` on the FARS event log with explicit (truth, evidence) coordinates the substrate chooses, not the runtime.

Vanilla hook protocols treat every intercept the same — the runtime fires a shell command, gets a 0/non-0 exit code, moves on.
That collapses the two axes PAM (predication algebra model) keeps separate: *truth* (did the underlying thing succeed?) and *evidence* (how strong is our claim about it?).
The hook intercept *did happen*; that's a fact at full evidence.
But what it tells us about the world depends on which event fired:

- `PostToolUse` → the tool reportedly succeeded and we observed the post-event ourselves: `(truth=1.0, evidence=1.0)`.
- `PostToolUseFailure` → the tool reportedly failed and we observed the failure: `(truth=0.0, evidence=1.0)`.
- `PreToolUse` → the tool is about to run; we have no evidence of its outcome yet: `(truth=1.0, evidence=0.5)` — bilattice-undetermined-but-predicted.
- `SessionStart` → the session exists; nothing yet about session content: `(truth=1.0, evidence=0.5)`.

Each hook record names the (truth, evidence) point its emitted witness should land at, so downstream `fars ledger tally --weight-by truth` and `--weight-by evidence` give *different* views of the same intercept stream — exactly the discrimination Belnap-Dunn / Ginsberg's bilattice was designed to make.

## Secondary intension

The intercept is a *contract* between substrate and runtime.
The substrate side is a flat frontmatter record under `tools/hooks/<slug>.md` declaring `event`, optional `matcher`, witness `operator`, and the bilattice axes.
The runtime side is whatever shape the runtime expects — for Claude Code, an entry in `.claude/settings.json` plus a script under `.claude/hooks/`.
A harness installer projects the substrate record into the runtime envelope; the substrate record stays canonical across runtime swaps.

The leverage is twofold:

- **Easy** — the witness substrate already exists.
  A new runtime is one new harness installer, not new accounting machinery.
  Adding Cursor support is reading Cursor's hook protocol and writing a `_install_cursor_hooks` function that walks the same records and writes Cursor's envelope.
- **Weird** — every runtime's opaque hook-as-shell-call becomes a structured, evidence-graded ledger posting.
  A failing tool burns 1.0 evidence at truth 0.0; under truth-weighting it's invisible, under evidence-weighting it's loud.
  That asymmetry is the discrimination Claude Code's vanilla protocol cannot produce because it lacks the bilattice.

## Why this matters

Without graded hooks, "session activity" is a flat count: 47 tool calls.
With graded hooks, "session activity" is a vector: 47 tool calls observed, 38 succeeded, 9 failed, weighted-evidence sum 47.0, weighted-truth sum 38.0, ratio 0.81.
The 0.81 *is* a measurement of session quality the substrate can learn from — exactly the kind of signal `fars ledger learn` distills into a lesson when the ratio drops persistently below threshold.
Hooks become observation channels into the substrate's own continuous-learning loop, not just notification points.

## Truncation as graded evidence

The dispatcher imposes a 1 MB cap on the runtime's stdin payload — anything above is the runtime telling us about an event whose content we cannot fully see.
This is exactly the situation the bilattice's *evidence* axis was designed for: the event happened (truth unchanged) but our claim about it is now partial (evidence lower).

Each hook record names its `on-truncation` policy as a substrate-level decision, not a runtime accident:

- `warn` (default) — emit the witness with `evidence` capped at min(declared, 0.5).
  The intercept lands at a literally graded point: same truth, halved evidence.
  A downstream `--weight-by evidence` view sees the truncation discount; a `--weight-by truth` view does not.
  That's exactly the discrimination Belnap-Dunn / Ginsberg's bilattice was designed to make: *what happened* and *how much we know about what happened* travel on independent axes.
- `block` — emit the witness AND return the runtime's "refuse this operation" exit code.
  Used when the substrate's claim cannot survive partial knowledge — credentials-leak detection over a megabyte+ payload, for instance: a secret hidden past the cap is something this hook cannot rule out, so the only honest move is to refuse the operation rather than emit a misleading low-evidence witness.
- `passthrough` — emit with the declared evidence regardless.
  Used when the caller already knows the payload may be large and *the substrate's claim does not depend on payload visibility* (a session-start ping, say, where the payload is incidental).

The truncation flag itself is recorded structurally in `details.truncated` + `details.truncation-policy` so an audit can reconstruct *why* an evidence reading was discounted, not just *that* it was.
Truncation becomes a first-class bilattice phenomenon, not a logging edge case.

## Sentinel via patterns

A second optional field on the substrate record — `patterns:` — turns a counting hook into a *sentinel* hook.
With patterns declared, the dispatcher emits a witness only when at least one regex matches the runtime payload.
The matched labels are recorded structurally on the witness as `details.matched-patterns`.

This shape is what the `governance` channel runs on.
A governance hook record sits at `(truth=0.0, evidence=1.0)` — "the world is in a bad state about this and we are sure" — and only books to the ledger when the bad state is actually present.
Two consequences:

- The ledger does not have to carry a no-event-happened entry for every Bash/Edit/Write the captain runs.
  `fars ledger tally --channel governance` is the violation count directly, not a filter over the dispatch firehose.
- Severity becomes a coordinate, not a categorical field.
  A different governance hook can land at `(truth=0.5, evidence=1.0)` for "informational, not a violation but worth noting."
  `--weight-by truth` gives a severity-weighted picture that a categorical `severity:` field cannot.

The raw regex strings stay on the substrate record (where they are visible, version-controlled, and reviewable); only the labels travel on the wire so the witness chain itself does not become a secret-leak vector.

## Realization

- `pyfars.harnesses:claude-code-hooks/_index.md` — the Claude Code projection.
- `tools/hooks/{tool-use-success,tool-use-failure,session-start}.md` — three default records covering the three demonstrated bilattice corners.
- `tools/hooks/governance-secret-scan.md` — the sentinel exemplar: `(truth=0.0, evidence=1.0)`, `on-truncation: block`, seven secret-shape patterns.
- `_install_claude_code_hooks` + `_dispatcher_script_text` in `operations/engineering/fars/src/fars/cli/install_harness.py` — the single-shim projector.
- `operations/engineering/fars/src/fars/cli/hook_dispatch.py` — the runtime dispatcher (`fars hook-dispatch <slug>`) that reads the record, applies the truncation + sentinel policies, and emits the bilattice-graded witness.
