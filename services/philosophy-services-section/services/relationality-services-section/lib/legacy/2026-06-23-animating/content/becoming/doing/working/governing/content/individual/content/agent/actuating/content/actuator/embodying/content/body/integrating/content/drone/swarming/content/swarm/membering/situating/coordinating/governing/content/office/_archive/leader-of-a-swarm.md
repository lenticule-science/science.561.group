---
name: leader-of-a-swarm
description: A leader specialized by having a swarm as its witnessing structure. The recognition-cell aggregate that confers the role is held by the swarm's participants.
specializing: leader
witnessed-by: swarm
---

A **leader-of-a-swarm** is a [leader](../../leader.md) whose recognition-cell aggregate is held specifically by a [swarm](../../../../swarm/swarm.md)'s participants.
The specialization narrows the general leader form (which abstractly admits any recognition-aggregate structure) to the case the recognition-discipline rule-system is the swarm's, and the participants emitting recognition cells are the swarm's members.

The morphisms recognizing-a-character-as-leader-of-a-swarm and withdrawing-recognition-of-a-character-as-leader-of-a-swarm both operate on the leader-of-a-swarm codomain; their lawful position is `leader-of-a-swarm/recognizing-a-character-as-leader-of-a-swarm/` and `.../withdrawing-recognition-of-a-character-as-leader-of-a-swarm/`.

## Why a sub-structure rather than a frontmatter cell on leader

A leader specialized by witnessing-structure could in principle be modeled as a cell on the leader record.
Promoting it to its own sub-structure earns its place because the morphisms acting specifically on swarm-leaders (the recognizing/withdrawing pair above) have it as their codomain; per the [object/morphism path grammar](../../../../../../../../../../../../doing/working/hacking/doing/working/planning/library/project/library/realigning-the-repository-layout/study-notes/layout-map.md), they must attach to an object directory, not a frontmatter-cell.
Future specializations (leader-of-a-polity, leader-of-an-agent-community-non-swarm) would each warrant their own sub-structure under leader/library/.

## Distinguishing predication-shape

- `is-leader-of(leader-of-a-swarm, swarm)` — the specific swarm whose recognition confers the role.
- `recognized-by-participants(leader-of-a-swarm, [character])` — the participants emitting recognition cells (the swarm's members).
- `holds-terminal-witness-for(leader-of-a-swarm, engagement)` — the engagement whose terminal witness this leader signs.

(All other characteristic cells of the parent leader form apply by inheritance.)
