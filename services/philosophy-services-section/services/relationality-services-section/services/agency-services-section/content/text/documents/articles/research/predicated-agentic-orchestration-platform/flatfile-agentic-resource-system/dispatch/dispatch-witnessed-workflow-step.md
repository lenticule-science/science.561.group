---
name: dispatch-witnessed-workflow-step
description: "A dispatch-witnessed workflow step is one numbered step of a multi-step procedure whose execution emits a single bilattice-valued Witness on the dispatch channel."
kind: concept
type: concept
title: "Dispatch-witnessed workflow step"
status: draft
depends-on:
  - concept:bilattice-valued-witness
  - concept:bilattice-graded-hook-intercept
realizes:
  - "harness:cline-workflows"
references:
  - "governance/skills/_index.md"
---


## Primary intension

A *dispatch-witnessed workflow step* is one numbered step of a multi-step procedure whose execution emits a single bilattice-valued `Witness` on the `dispatch` channel.
The workflow as a whole becomes a *chain* of such witnesses — one per step — so the substrate event log contains the full trajectory of one workflow execution as a sequence of `(operator, truth, evidence, timestamp)` cells, not a single opaque "the workflow ran" record.

The two axes carry distinct claims:

- **truth** — *did the step's acceptance condition hold?* `1.0` for met, `0.0` for failed, `0.5` for partial.
  This is the predicate's truth value in the bilattice's truth axis.
- **evidence** — *do we have the step's artifact in hand?* `1.0` for verified (file written, command exit 0, output captured), `0.5` for ran-but-unverified, `0.0` for no observation.
  This is the bilattice's evidence axis.

A step can hold under truth-weighting and not under evidence-weighting (a "successful" step whose artifact was never checked); the inverse is also possible (a step whose artifact is on disk but whose assertion failed).
Standard "did the workflow succeed?" accounting collapses both into a single boolean.
The dispatch-witnessed-step decomposition keeps them separate, which is exactly the discrimination Belnap-Dunn / Ginsberg's bilattice was designed to make and the discrimination the [PAM channels](pam-channels.md) theory keeps as canonical structure.

## Secondary intension

The contract has three pieces:

1. **The step itself** — owned by the substrate runbook (`governance/skills/<runbook>.md`), one `### N. <headline>` heading under `## Steps`.
  The runbook author writes prose; they don't write witness machinery.
2. **The witness emitter** — owned by the `cline-workflows` harness (shipped with PyFARS at `pyfars.harnesses:cline-workflows`).
  The harness installer projects the runbook into a runtime-specific workflow file (e.g. `.clinerules/workflows/<runbook>.md` for cline) with a per-step witness preamble baked in.
  The preamble instructs the runtime: "after every numbered step, call `.fars/cline-witness.sh <runbook> step-<N> <truth> <evidence>`."
3. **The chain reader** — `fars ledger tally --origin cline-workflow:<runbook>` walks the event log after the run, projecting truth-weighted and evidence-weighted views of the same chain.
  Divergence between the two views surfaces exactly the steps where the runbook's prose-level "this is done" diverges from the substrate's observable evidence.

## Why this matters

The [`bilattice-graded hook intercept`](../bilattice/bilattice-graded-hook-intercept/bilattice-graded-hook-intercept.md) concept already established that runtime events become bilattice-valued ledger postings; that's the *runtime-event* side — what happened to the agent's tools.
The dispatch-witnessed workflow step is the *procedural* side — what happened in the named procedure the agent was running.
Together they cover both columns of "what did the agent actually do this session": the tool-call column and the procedure-step column, both in the same bilattice-valued substrate.

This also keeps the integration runtime-agnostic.
Cline reads `.clinerules/workflows/`.
Aider reads `.aider.conf.yml` plus chat-mode prompts.
Claude Code reads `.claude/agents/` and slash-commands.
Each runtime gets its own harness, all projecting the same substrate runbooks with the same witness contract — so the same procedure run in three runtimes produces three indistinguishable witness chains in the event log, and the substrate's view of "what happened" is portable across runtime swaps.
That portability is the leverage the FARS substrate is supposed to provide; this concept is one of the load-bearing pieces.

## Realization

- `pyfars.harnesses:cline-workflows/_index.md` — the cline projection.
- `_install_cline_workflows` / `_walk_runbook_records` / `_cline_workflow_text` / `_cline_witness_helper_text` in `operations/engineering/fars/src/fars/cli/install_harness.py` — the projector.
- `governance/skills/*.md` — the substrate-side procedure records (existing).
