---
name: leader
description: A character bearing the elevated structural role in a swarm — recognized by the participants via recognition cells, holding the terminal witness of the swarm's engagement, marking consensus records as approved. Authority is the aggregate of recognition cells, not an office-installation.
specializing: character
role-of: swarm
authority-source: recognition-cell-aggregate
---

A **leader** is a [character](../character/character.md) bearing the elevated structural role within a [swarm](../swarm/swarm.md). The role is not installed; it is *derived* from the aggregate of recognition cells the swarm's participants have emitted naming this character as load-bearing for the swarm's decisions. When the aggregate meets the recognition-discipline's threshold, the character bears the leader role; when it falls below, the role lapses.

## Authority by recognition aggregate

The leader's authority is not an office incumbency. It is a derived property of the recognition-discipline rule-system applied to the current recognition cells. Per [code/structures/leader.md](../../../../../../../../../../code/structures/leader.md) and [agentics.md](../../../../../../../../../../doing/working/hacking/doing/working/planning/library/project/library/realigning-the-repository-layout/study-notes/agentics.md), this distinguishes the leader role structurally from an officer: an officer holds a time-bounded incumbency installed by a polity (per officer-form's signature); a leader holds a recognition-derived role that lapses when recognition lapses.

## Distinguishing predication-shape

- `leads(leader, swarm)` — the swarm whose recognition-aggregate confers the role.
- `recognized-by(leader, character)` — one recognition cell per participant. The aggregate determines whether the role is borne.
- `holds-terminal-witness(leader, witness)` — the leader's signature on the engagement's terminal witness (the witness chain's apex for the swarm's work).
- `marks-as-approved(leader, consensus-record)` — the leader's act of marking a consensus record as approved.

## Step-induction role

The leader form earns its place because *terminal-witness signing* needs a distinct role. The swarm's engagement produces a witness chain; that chain has an apex (the final witness that closes the engagement); the apex must be signed by a character whose identity-key is structurally privileged for the swarm. Without the leader form, the dispatcher could not determine which participant's signature counts as terminal.

## Not synonymous with

- **Officer** — an officer holds an installed, time-bounded incumbency in a polity. A leader holds a derived, recognition-aggregate role in a swarm. The forms are non-overlapping.
- **Persona** — persona is the entity bearing the character that bears the leader role. The persona persists across sessions; the leader role may lapse mid-session.
