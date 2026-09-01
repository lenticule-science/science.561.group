---
name: 2026-05-03-commit-witness-bridge-session
introduces: session-note
date: 2026-05-03
participants: [emsenn, replit-agent]
model: sonnet
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

The captain asked me to look at recent agent work, read it through our
own theory of work and predicated work, see what FARS would need to
carry that work better, look at how upstream agentic-orchestration
platforms handle the same problem, and compare to our own theory.
Then implement.

## What recent agent work looks like

Last ~30 commits cluster cleanly into four streams plus checkpoint
noise:

1. **Math-grounding** — theorem and concept additions binding
   operational notions to predication-categories
   (`failure-detection-as-bilattice-modal-suspicion`,
   `consensus-as-h0-construction`,
   `model-supersession-as-forward-migration-corollary`,
   the deformation-obstruction commits, etc.). Strict-regime work:
   each commit a bounded increment.
2. **Substrate-bridge tooling** — `audit-commits` and the
   `commit-as-witness` concept it realizes, built today
   (`d3b25882c`, `f80080040`, `3dff1895b`). Scott-continuous work:
   the analyzer iteratively deepens its binding rules toward
   coverage in the limit.
3. **Harness regeneration** — generated agent skill files,
   `.claude/agents/*`, `.agents/skills/*`, the `install-harness`
   plumbing (`a790af827`, `09173dc5b`, `5248b5073`, `79432187c`).
   Recurrent-practice work: the cadence is "regenerate every time
   the templates change."
4. **PyPredComp dev-docs enrichment** — the Task #76 rounds.
   Transfinite-bounded work: each round quantifies across the prior
   rounds' outputs.

Plus the Replit auto-checkpoint commits (`Saved your changes before
starting work`), which carry no operational evidence beyond
*something happened*.

## What predicated-work says about it

Each substantive commit is a `witness-as-increment` against the
operations-settling. The work-regime varies stream to stream, and
the dispatch readiness of *who took which work* was never actually
evaluated by the substrate — agents just acted on file paths
directly. This is fine for now: we don't yet have a runtime
enforcing dispatch, and the captain dispatches by hand.

## What FARS already carries

- `fars audit-commits` (today) reads `git log`, classifies
  each commit (substantive | snapshot | merge), and binds
  substantive commits to task slugs and library entity slugs by
  *message* and by *diff*. Per the concept, the diff is the
  load-bearing witness; the message is a candidate.
- `fars next` answers "what should I work on?" by walking task
  records and matching capabilities against an agent identity.
- `.fars/event-log/` accumulates `Witness` records for every
  in-process operator call (`fars fm`, `fars move`, etc.).

## What it does not carry — the gap

`audit-commits` produces the binding partition but throws it away.
The witness-chain that every other operator flows through is
*missing the largest source of operational evidence in the
substrate* — the commit history itself. The
[commit-as-witness](../../../../../../../library/theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/concepts/commit-as-witness.md)
concept names this exact bridge but no realization wrote into the
log. The audit was read-only; the concept demands write-back.

## How upstream platforms handle it

- **Anthropic** (Building Effective Agents, Tool Use docs) treats
  the tool-call → tool-result iteration as the witness unit.
  Witnesses are *first-class* in the agent loop — the model emits a
  tool-use block, the application returns a tool-result, the chain
  continues. They can assume this because they own the loop.
- **OpenAI** (Assistants API, Run Steps) does the same thing at a
  higher level of structure: a `Run` is a sequence of `RunStep`s,
  each step is a witness of either model-thinking or tool-use, and
  the thread accumulates them.

Both treat the action+observation as the unit of evidence and own
the chain. We don't own the chain — agents edit files in the host
environment and commit, bypassing every FARS operator. The bridge
has to read commits *back* into the chain.

## What our theory has that they don't

- **Bilattice-valued increments.** A commit doesn't just "happen";
  it drafts (added file), refines (modified file), or retracts
  (deleted file) — three distinct increment-cell predicates from
  one diff observation, not a single boolean.
- **The four-state separation of claim vs observation.** The
  message is the agent's claim; the diff is the substrate's
  observation. Per `witness-as-increment`, observation is the
  stronger witness. Our binding rules surface both sources.
- **Closure-driven propagation.** Witnesses landing in the log can
  drive downstream cells via the closure-rule system; upstream
  agentic platforms have no analog. We aren't using this yet, but
  the substrate is shaped for it.

## What I built

A new verb, `fars witness-commits`, that walks
`audit-commits`'s analyzer output and appends one `Witness` per
substantive bound commit into `<root>/.fars/event-log/`:

- `operator = "commit"`, `target = sha`, `after_hash = sha`,
  `agent = author`, `timestamp = commit's authored date`.
- `details` carries the binding kind (`task` / `entity` /
  `unbound`), the message refs, and the per-change-kind diff
  bindings (`drafted` / `refined` / `retracted`) split between
  entity slugs and task slugs.
- Snapshot and merge commits are not written.
- Idempotent: reads existing `commit`-operator witnesses and skips
  any SHA already in the log.
- `--dry-run` previews; default writes.

Tests cover the witness shape, idempotency, dry-run, and the
snapshot/merge skip discipline.

This closes the loop the `commit-as-witness` concept specified.
The next time `audit-commits` runs, the witnessed commits are no
longer external — they're substrate cells the closure-rule system
can fire on. The "dark matter" gap (commits the substrate didn't
see) is now a populated worklist.

## What I did not build

- Closure rules that consume `commit`-operator witnesses and
  propagate them into goal-cell settlements (`completion-as-quiescence`
  is still not firable from a commit).
- Write-back into the affected entity records as
  `drafted-by` / `refined-by` / `retracted-by` frontmatter relations.
  The concept lists this as a realization possibility; building it
  would require deciding the writeback discipline (frontmatter vs
  separate index, idempotency strategy, conflict policy).
- A `fars dispatch-claim <task>` verb that lets an agent
  programmatically take a task before working it. The captain
  still dispatches by hand; building dispatch enforcement before
  the captain asks for it would be premature.

These are the next steps if the loop turns out to want closing
further. For now, the witness chain is complete enough that
`fars witness-log --tail` will start showing commit history
alongside operator calls — which is what the substrate-bridge
concept demanded.
