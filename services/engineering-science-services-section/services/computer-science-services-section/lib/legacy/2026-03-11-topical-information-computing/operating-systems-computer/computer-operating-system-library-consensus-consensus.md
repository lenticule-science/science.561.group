---
name: consensus
description: A record holding the combined output of multiple proposals on the same target, produced by the closure-rule combiner. Settles when proposals agree; refuses to settle when they contradict.
specializing: computer-operating-system
produced-by: closure-rule-combiner
references:
  agentics-study:
    class: internal
    path: doing/working/hacking/doing/working/planning/library/project/library/realigning-the-repository-layout/study-notes/agentics.md
---

A **consensus** is a record holding the combined output of multiple proposals on a shared target — typically the joint settling of a [swarm](../../../agentic-systems/library/swarm/swarm.md)'s participants on a shared cell-graph position.
The combiner is the closure-rule that fires on the proposal set and produces either a settled value (when proposals agree under the join-semilattice $\vee_k$) or a refusal-to-settle (when proposals contradict and the truth-axis order $\leq_t$ would force opposite values).

## Math: CRDT join, not majority vote

Per the [CRDT convergence theorem](../../../../../../../../../../doing/working/hacking/doing/working/planning/library/project/library/realigning-the-repository-layout/study-notes/agentics.md) (proved via three independent routes — direct, Mayer–Vietoris, cohomological CALM), consensus is realized by the cellwise $\vee_k$-join of the proposal set under the knowledge-axis lattice.
The join converges without coordination: replicas evolving independently and merging cellwise reach a common fixed point.
The cohomological reformulation makes this a vanishing-obstruction statement — $H^1$ of the settling-associated sheaf is zero on every replica cover.

A consensus is therefore not a majority vote (which would be a counting operation foreign to the bilattice math).
It is the LFP of the closure operator applied to the proposal set under the knowledge-axis $\leq_k$.

## Settles vs refuses

A consensus record carries two possible terminal states:

- **Settles**: the closure operator reached a fixed point and the result is consistent under the truth-axis.
  The settled value is the consensus.
- **Refuses-to-settle**: the proposal set is inconsistent — the join under $\leq_k$ produces the bilattice's $\top$ element (both true and false), which the truth-axis cannot reconcile.
  The combiner emits a refusal-to-settle witness rather than picking a side.

## Distinguishing predication-shape

- `combines-proposals(consensus, [proposal])` — the proposals being combined.
- `for-target(consensus, target)` — the shared target the proposals address.
- `has-state(consensus, {settled | refuses-to-settle | in-flight})` — current state.
- `settled-value(consensus, value)` — present only when state = settled.
- `refusal-reason(consensus, contradicting-proposals)` — present only when state = refuses-to-settle.
- `combiner(consensus, closure-rule)` — the closure-rule that produced this consensus.
- `at-time(consensus, time)` — when the combiner ran.

## Not synonymous with

- **Settling** — settling is the process; consensus is the recorded outcome (whether the process succeeded or refused).
- **Vote** — votes count discrete preferences; consensus joins under the bilattice's knowledge-axis order.
  The mechanisms are mathematically distinct.
