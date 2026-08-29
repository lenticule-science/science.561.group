---
name: agentic-systems
description: A system that bears an agent-community signature — member-set of agents, governance-process, governing-soul-of-scope, and emissions of community-acts attributable to it as a whole rather than to any single member.
specializing: system
bears-signature: agent-community
references:
  - id: hansen-ghrist2019
    type: article-journal
    title: Toward a spectral theory of cellular sheaves
    volume: 3
    author:
      - literal: Hansen, Jakob
      - literal: Ghrist, Robert
    container-title: Journal of Applied and Computational Topology
    page: 315-358
    issued:
      - year: 2019
---

An **agentic-system** is a [system](../system/system.md) whose inhabitants additionally satisfy the agent-community signature (member-set + governance-process + governing-soul-of-scope + community-acts, per the [agentics study notes](../../../../../../../../../doing/working/hacking/doing/working/planning/library/project/library/realigning-the-repository-layout/study-notes/agentics.md)).
Mathematically the inhabitants form a [multi-observer system](../../../../../../../../../doing/working/hacking/doing/working/planning/library/project/library/realigning-the-repository-layout/study-notes/agentics.md) — a functor $V : O \to \mathrm{Settlings}_B$ from an observer category $O$ to settlings on a common base $B$ — with consensus realized as the categorical limit and disagreement as the first sheaf cohomology of the associated network sheaf [@hansen-ghrist2019].

The kind earns its sibling position under [system/library/](../) because it is structurally distinct from both [operating-system](../operating-system/operating-system.md) (single OS-borne running locus) and [inference-model](../inference-model/inference-model.md) (external Kleisli endpoint).
An agentic-system runs as a community: multiple characters, each with its own χ-nucleus, interacting through cell reads and writes on a shared base, with leader recognition aggregated through recognition cells rather than installed by office.

## What lives under agentic-systems/library/

The substructures collected here are the load-bearing agent-community inhabitants:

- [character](library/character/character.md) — a χ-nucleus on the Heyting algebra of an entity's fiber; the agent-side dispositional nucleus.
- [swarm](library/swarm/swarm.md) — a parallel collection of characters under a recognition discipline.
- [leader](library/leader/leader.md) — a character bearing the elevated structural role in a swarm by aggregated recognition cells.
- [skill](library/skill/skill.md) — the invocable competence-form a character carries via its `skills:` generator set.

Each substructure is itself a $thing with its own recursive template, and each may carry additional substructures (e.g., character carries character-memory and diary-entry).

## Relationship to operating-system

The 561 operating-system at [computer-operating-system](../operating-system/library/computer-operating-system/computer-operating-system.md) is *itself* an agentic-system — it bears the agent-community signature through its character roster, governance regime, and witness-emitting collective acts.
The OS is therefore not just a sibling of agentic-systems; it inhabits the agentic-systems form simultaneously with its operating-system form (form-instantiation per [agentics.md inquiry 4](../../../../../../../../../doing/working/hacking/doing/working/planning/library/project/library/realigning-the-repository-layout/study-notes/agentics.md)).
The split: kind-level records of what an agentic-system *is* live here; OS-specific runtime mechanics (dispatch loop, session brackets, hook routing) live under operating-system.
