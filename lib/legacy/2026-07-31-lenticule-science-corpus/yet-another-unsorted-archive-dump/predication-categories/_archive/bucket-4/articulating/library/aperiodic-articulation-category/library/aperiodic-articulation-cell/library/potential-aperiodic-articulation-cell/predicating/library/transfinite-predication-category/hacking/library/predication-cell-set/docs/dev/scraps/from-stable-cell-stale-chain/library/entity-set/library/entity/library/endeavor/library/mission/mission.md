---
name: mission
description: An externally-commissioned endeavor with a defined end-state. An entity-form whose characteristic predication-shape names a sender, a defined end-state, and a commissioned committing agent.
---

## Pure form

A mission is an [endeavor](endeavor.md) with two restrictions: it is *externally commissioned* (there is a sender distinct from the committing agent), and it has a *defined end-state* (the conditions under which the mission is fulfilled are specified in the mission order, not discovered in the striving).

The defining predication: `(mission, commissioned-by, sender)` together with `(mission, has-end-state, end-state-description)`. The sender is structurally distinct from the executor — a mission issued is structurally an endeavor.

## Characteristic predication-shape

- `commissioned-by(mission, sender)` — the external authority issuing the mission; the individuating predication that distinguishes mission from endeavor.
- `has-end-state(mission, end-state-description)` — the conditions under which the mission is fulfilled.
- `executed-by(mission, ship | crew | agent)` — who carries the mission.
- `has-milestone(mission, milestone)` — recognizable states of the mission's progress; gate review points.
- `serves(mission, goal)` — the higher direction the mission advances, when one is named.
- `has-status(mission, {commissioned | active | fulfilled | failed | recalled})` — current lifecycle state.

## Mission vs endeavor

The two distinguishing predications:

| Property | Endeavor | Mission |
|---|---|---|
| Commissioner | Self | External sender |
| End-state | May be aim-open; discovered in striving | Specified in mission order |

A mission can be *recalled* — the sender can release the executor before the end-state is reached. An endeavor cannot be recalled (only abandoned by the committing agent), because there is no external sender to do the recalling.

## Founding-time exception

A polity's founding work is structurally an [endeavor](endeavor.md) of the founding agents, *not* a mission, until the polity exists to commission missions. After founding, the polity can commission missions to its ships and crews. A file at `doing/planning/missions/<slug>.md` for pre-founding work either (a) is a mission commissioned by some other already-existing sender (e.g., a confederacy chartering the founding), or (b) is misclassified and should be modeled as an endeavor. The disambiguation is not automatic — the file's `commissioned-by:` cell must name the sender or the file fails the mission spec.
