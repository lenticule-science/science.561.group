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

## Related

- [Reflexive sequencing](reflexive-sequencing.md)
- [Composition](composition.md), [Tension](tension.md), [Chain](chain.md)
