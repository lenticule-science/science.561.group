---
name: commit-as-witness
description: "The bridge between a git substrate's commit events and a FARS substrate's witness chain."
type: concept
class: substrate-bridge
status: draft
depends-on:
  - event-sourcing
  - frontmatter-as-presentation
realizes:
  - witness
instantiates:
  - witness-as-increment
see-also:
  - completion-as-quiescence
  - operations-settling
title: commit-as-witness
---

# Commit as witness

The bridge between a git substrate's *commit events* and a FARS substrate's *witness chain*.
A commit is the canonical externally-recorded operational event in a flatfile substrate that lives inside a git working tree; the predicated-work [witness-as-increment correspondence](../../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/text/glossary/terms/witness-as-increment.md) demands that every such operational event correspond to an [increment](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/increment-sequence.md) cell in the [operations settling](../../../../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/operations-settling.md).
This concept names the correspondence at the FARS substrate.

## The correspondence

Each git commit $c$ at stage $\tau_c$ is a witness $w_c$ whose increment cell shape depends on the commit's *class* and its *binding* to in-substrate records.

### Commit class

Before binding is considered, every commit is classified into one of three operational kinds:

- **Substantive** — the commit records a real agent action: file edits the agent intentionally made.
- **Snapshot** — a substrate-snapshot commit injected by the runtime (e.g. Replit's "Saved your changes before starting work" auto-checkpoints, identifiable by the `Replit-Commit-Checkpoint-Type: full_checkpoint` trailer).
  These are not operational evidence of agent action; they are substrate metadata.
  The increment cell is at most $\langle \texttt{substrate}, \texttt{snapshotted-at}, \tau_c\rangle = \mathbf{t}$ on the substrate object, never on a work record.
- **Merge** — a branch-merge commit.
  Carries no new operational evidence beyond the commits it reconciles.
  The increment cell is at most $\langle \texttt{branch}, \texttt{merged-at}, \tau_c\rangle = \mathbf{t}$.

Only substantive commits enter the binding analysis.
Snapshot and merge commits are accounted for in their own buckets so the worklist is not diluted by substrate noise.

### Binding (substantive commits only)

A substantive commit's increment cell shape is determined by *two complementary witness sources* — the **message** (the agent's claim about what the commit does) and the **diff** (the substrate's observation of what files changed).
Per [witness-as-increment](../../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/text/glossary/terms/witness-as-increment.md), the agent's claim is a witness candidate but the substrate-observed event is the stronger witness; this concept therefore treats both as load-bearing rather than treating the message as authoritative and the diff as auxiliary.

**Source 1 — message bindings.** Slugs named in the commit's subject + body, parsed under the four reference rules in the next section.

**Source 2 — diff bindings.** Path stems of files added, modified, or deleted by the commit, matched against the task-record path-shape (rule 3 below) and the entity-slug index (rule 4 below).
Diff bindings carry an additional change-kind dimension that determines the predicate of the increment cell:

- *Added* (`A` in `git --name-status`) → $\langle E, \texttt{drafted-by}, A_c\rangle = \mathbf{t}$.
- *Modified* (`M`, `T`, `C`) → $\langle E, \texttt{refined-by}, A_c\rangle = \mathbf{t}$.
- *Deleted* (`D`) → $\langle E, \texttt{retracted-by}, A_c\rangle = \mathbf{t}$.

A commit is then classified by the **union** of the two sources:

- **Task-bound** — message OR diff binds at least one task slug.
  The increment cell is $\langle T, \texttt{advanced-by}, c\rangle = \mathbf{t}$, and (when the diff adds the task record itself) $\langle T, \texttt{drafted-by}, A_c\rangle = \mathbf{t}$, or (when the diff settles a goal cell of $T$) $\langle T, \texttt{settled-by}, A_c\rangle = \mathbf{t}$.
- **Entity-bound** — message OR diff binds at least one *library entity* slug (theorems, concepts, morphisms, objects, definitions) discoverable under the corpus's entity roots (default: `library/`, `operations/command/`).
  Entity-bound commits witness the *aim-generative* layer of work (research, theorem-proving, concept-drafting) that the work-orchestration spec's task records do not natively cover.
- **Unbound** — neither source binds anything.
  The increment cell is the degenerate $\langle \texttt{commit-record}, c, \texttt{exists}\rangle = \mathbf{t}$ only; the commit attests that *something happened* but contributes no closure-rule antecedent.
  Unbound substantive commits are the operational worklist for closing the dark-matter gap.

A commit may be simultaneously task-bound and entity-bound; the two classifications are orthogonal.
A commit may also be bound by both sources for the same slug (the strongest case — agent claim corroborated by substrate observation), by message only (claim without observation — the realization should treat the binding as candidate-only and a closure rule may downgrade it), or by diff only (observation without claim — by far the most common case in practice, since commit messages tend to be human-readable prose rather than slug-laden).

## Why the bridge is load-bearing

FARS already records witnesses for every in-process operator invocation (`fars fm`, `fars move`, etc.) via [event-sourcing](event-sourcing.md) into `<root>/.fars/event-log/`.
But the largest source of operational evidence in a flatfile substrate that lives in git — the commit history — is *external* to the operator surface.
Without this bridge:

- [completion-as-quiescence](../../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/glossary/concepts/completion-as-quiescence.md) cannot fire: the goal cell $\langle T, \texttt{completed-by}, A\rangle$ never receives the commit-witness that should drive it.
- The operations event log is *missing increments*: replaying `<root>/.fars/event-log/` regenerates only operator-driven state, not the agent-driven file edits that constitute most of the substrate's actual evolution.
- The agent's contract under predicated-work — "an agent's claim to have completed a task must be a witness, not a derived value" — is silently violated whenever an agent edits files via a non-`fars` path (which is nearly always, for content authoring).

## Realization shape

A FARS realization satisfies *commit-as-witness* if, for every commit reachable from `HEAD`, it can produce a `Witness` record whose `target` is the commit SHA (or, more granularly, the per-file diff target), `operator` is `commit`, `timestamp` is the commit's authored date, `agent` is the commit's author, and `details` carries *both* the parsed task/entity references from the message *and* the changed-files manifest decomposed into added / modified / deleted by stem.
The realization is *coverage-complete* if every commit reachable from `HEAD` is bound by at least one of the two sources whenever its diff touches an indexed entity-root path, regardless of whether the message names the corresponding slug.
(Coverage measured against the message alone is fragile because commit-message authors write prose; coverage measured against the diff is robust because the diff is the substrate-recorded event.)

The reference parsing rules for this corpus:

1. `Task #(\d+)` — the captain's project-task numbering, mapping to `task-<N>` records by index when one exists.
2. `task-([a-z0-9-]+)` — explicit task-slug reference, mapping to `<sprint>/tasks/<slug>.md` (or `.local/tasks/<slug>.md`).
3. Paths matching `\.local/tasks/[a-z0-9-]+\.md` or `operations/.+/tasks/[a-z0-9-]+\.md` — direct path references to task records.
4. Backticked slugs (`` `consensus-as-h0-construction` ``) and bare multi-token kebab slugs (`commit-as-witness`, `cluster-as-replica-cover`) that resolve against the entity-slug index (filename stems under the entity roots).
  Single-token tokens are excluded by default to avoid false positives from common nouns that happen to be filename stems (`system`, `agent`, `true`).

Rules 1–3 produce *task* bindings; rule 4 produces *entity* bindings.
A substantive commit matching at least one rule is *bound*; otherwise *unbound*.

## Inspection surface

The verb [`pyfars audit-commits`](../../../../../../../../../../../../operations/engineering/fars/src/fars/cli/audit_commits.py) walks `git log` for the corpus root and reports the bound/unbound partition plus the inverse (tasks under `.local/tasks/` that have no commit witness).
Output is the operational worklist for closing the gap.

## Realization surface

The verb [`fars witness-commits`](../../../../../../../../../../../../operations/engineering/fars/src/fars/cli/witness_commits.py) is the write-back counterpart: it walks the same analyzer output and appends one `Witness` per substantive commit into `<root>/.fars/event-log/`.
With this verb the bridge is realized end-to-end — the commit history stops bypassing the audit primitive and the witness chain becomes complete with respect to the substrate's actual evolution.
Snapshot and merge commits are not written; they carry no operational evidence beyond *something happened*.
The verb is idempotent — commits whose SHA already appears as a `commit`-operator witness target are skipped — so it is safe to run on every session start.

## Open questions

The full scope of which external events should become substrate witnesses (commits, CI runs, MCP tool invocations from outside FARS, agent-inbox messages) is open — see [`external-event-witness-binding`](../../external-event-witness-binding/external-event-witness-binding.md).
