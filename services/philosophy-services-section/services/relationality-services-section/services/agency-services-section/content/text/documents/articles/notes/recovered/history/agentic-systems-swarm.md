---
name: swarm
description: A collection of characters running in parallel against a shared cell-graph under a recognition discipline where coordination happens through cell reads and writes rather than direct messaging.
specializing: agentic-systems
coordination-medium: shared-cell-graph
---

A **swarm** is a parallel collection of [characters](../character/character.md) running against a shared cell-graph. Mathematically the swarm is a [multi-observer system](../../../../../../../../../../doing/working/hacking/doing/working/planning/library/project/library/realigning-the-repository-layout/study-notes/agentics.md) $V : O \to \mathrm{Settlings}_B$, with the observer category $O$ enumerating the participant characters, the base $B$ being the shared cell-graph, and the functor $V$ delivering each character's local settling of $B$. Consensus across the swarm is the categorical limit of $V$; disagreement is the first sheaf cohomology $H^1$ of the associated network sheaf.

## Coordination through cells, not messages

A swarm's participants do not message each other directly. Coordination happens entirely through reads and writes against the shared cell-graph: each character emits witnesses (stratum-1 and stratum-2 atoms with `deps`-chains pointing into the shared graph), and other characters see those witnesses by reading the same cell positions. The CRDT-convergence theorem (proved in the corpus via three independent routes per [agentics.md](../../../../../../../../../../doing/working/hacking/doing/working/planning/library/project/library/realigning-the-repository-layout/study-notes/agentics.md)) guarantees that cellwise $\vee_k$-merges of the participants' settlings converge to a unique fixed point without explicit inter-character coordination.

## Recognition discipline

A swarm's coordination is governed by a *recognition discipline*: characters emit recognition cells naming which other characters they treat as load-bearing for which decisions. The aggregate of recognition cells over a participant determines that participant's structural role — including whether they bear the [leader](../leader/leader.md) role. Authority in a swarm is the aggregate of recognition; it is not installed by office.

## Distinguishing predication-shape

- `has-participant(swarm, character)` — the multi-set of characters running in the swarm. Members may join and leave; the cell records when.
- `coordinates-via(swarm, cell-graph)` — names the shared base $B$.
- `recognition-discipline(swarm, discipline-spec)` — the rule-system the aggregator runs against recognition cells to compute roles.
- `has-leader(swarm, character?)` — derived from `recognition-discipline` applied to the current recognition cells; absent when no character holds sufficient recognition.

## Not synonymous with

- **Agent-community** — every swarm is an agent-community (member-set + governance-process + governing-soul + community-acts), but not every agent-community is a swarm. An agent-community organized by direct messaging or by office-installation is not a swarm. The swarm signature additionally requires shared-cell-graph coordination and recognition-discipline authority.
- **Polity** — a polity bears a charter, offices, and a personnel roster. A swarm has none of these; its authority is recognition, not office.
