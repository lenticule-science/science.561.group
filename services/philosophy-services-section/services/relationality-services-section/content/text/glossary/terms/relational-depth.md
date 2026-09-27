---
id: da83f4bf-0192-4c46-b9ed-ef145e86c5c7
name: relational depth
description: "How many reflexes separate a structure from its start: a structure at depth n relates to itself to give one at depth n + 1. Composites hold their parts at one shared depth, so structures of different depths are first aligned to the greater depth before they are related."
aliases: [reflexive depth, depth alignment, cross-depth relation]
date-created: 2025-09-03
---
**Relational depth** counts reflexes. A structure at depth $n$ relates to itself ([reflexive sequencing](reflexive-sequencing.md)) to give a structure at depth $n + 1$, and depth $0$ is where a sequence starts.

## Depth alignment

A [composite](composition.md) holds its parts at one shared depth. When two structures at different depths are related, each is first deepened by reflexes until both reach the greater depth:

$$n_T = \max(n_A, n_B), \qquad \mathrm{align}(A, n_A; n_T) = A \text{ deepened } n_T - n_A \text{ times}.$$

The aligned pair can then be held in [tension](tension.md) at depth $n_T$, and a sequence of structures at mixed depths becomes an ordinary [chain](chain.md) at the greatest depth among them. Alignment only applies reflexes, so it adds no act beyond relating and keeps the type of everything it touches.

Because any two structures can be aligned, any two structures can be related, whatever their depths: the relational field is closed across depth.

## Alignment is itself a structure

Alignment is not a procedure outside the relational field. An alignment is a relational structure in its own right: the structure aligned, its starting depth, the target depth, and the aligned result. So it can be related and deepened like any other structure, and the drafts call this meta-reflexivity. Deepening a structure changes the alignments that involve it, and changing an alignment changes the tensions built from it. Coherence requires every tension to be built from the latest state of both, at the greatest depth among them.

## Equivalence up to alignment

Two structures at different depths are equivalent when aligning both to some common depth gives the same structure. Equivalence is therefore depth-independent: a structure and its reflexes are recognized as the same form at different depths, and identity is settled by agreement once both are brought to one depth rather than by the depth each was found at.

## Related

- [Reflexive sequencing](reflexive-sequencing.md)
- [Composition](composition.md), [Tension](tension.md), [Chain](chain.md)
