---
name: Articulation Cell
description: "Articulating's codomain: an utterance with a slot for each position of the predication it opens, subject and object. Which positions are filled gives exactly four corners: absurd, potential, active, stable."
aliases: [articulation cells, corner, corners, four corners, absurd, potential, active, stable]
---
An **articulation cell** is an [utterance](utterance.md) together with a slot for each position of the predication articulating opens: a **subject** slot and an **object** slot, each holding the token [witnesses](witness.md) that fill it ([`Articulation/Articulating/Cell.lean`](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Articulation/Articulating/Cell.lean)). The claim is the relation between subject and object, not a third position. A position is filled when its slot holds a witness. Slots only grow and nothing is removed, so a cell keeps every witness it was given.

Two positions, each filled or empty, give exactly four **corners** (`Articulating.Corner.card_eq_four`, proved, not postulated):

| Corner | subject | object |
|---|---|---|
| absurd | empty | empty |
| potential | filled | empty |
| active | empty | filled |
| stable | filled | filled |

These are articulation's names for its corners. Articulation reads nothing as true or false. Value enters at [positing](positing.md), which introduces value and its two orders; there the same four points become values, and the truth order reads them with Belnap's names ([`Positing/FourCorner.lean`](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Language/Positing/FourCorner.lean)).

**How cells move.** Articulating puts the utterance's own token in the subject slot, so a freshly articulated cell is potential. Engaging puts a token in the object slot, reaching stable: an utterance articulated over another takes the token of the utterance beneath it as its object, so a relation between two different tokens is stable by construction, a complete predication. Merging two cells joins their slots. *Absurd* and *active* are never articulating's output: absurd is the position a cell would hold before any articulation reaches it, and active, an object with no subject, is reached only downstream.

## Related

- [Articulating](articulating.md)
- [Witness](witness.md)
- [Positing](positing.md)
- [Predication cell](predication-cell.md)
