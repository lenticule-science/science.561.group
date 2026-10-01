---
name: Container
description: "Anything that holds something else inside it."
aliases: [ containers ]
extends: thing
contains: [vessel, box, bag, room, envelope]
has: [boundary, inside, outside]
can-contain: thing
nests-into: container
date-created: 2026-03-29
date-modified: 2026-04-06
visibility: public
id: container
---

A container is anything that holds something else inside it. A box is a container. A bag is a container. A room, a drawer, a pocket, a folder, a cell, a shipping container, a zip file — all containers.

The defining feature is an inside and an outside with a boundary between them. The boundary can be rigid (a box), flexible (a bag), permeable (a net), virtual (a directory on a filesystem), or conceptual (a category). What matters is that the boundary creates a distinction between what is in and what is not in.

Containers differ from each other in how they manage the boundary:

| Property | Examples |
|---|---|
| **Rigid vs. flexible** | Box vs. bag |
| **Sealed vs. open** | Jar with lid vs. bowl |
| **Opaque vs. transparent** | Safe vs. glass case |
| **Fixed vs. portable** | Room vs. suitcase |
| **One thing vs. many** | Envelope vs. drawer |

A [vessel](./vessel.md) is a container shaped to hold liquids or loose material — the inside is a cavity with a specific form. A box is a container shaped to hold solid objects — the inside is a rectangular void. A bag is a container that takes the shape of its contents. These are all containers; they differ in what they're good at holding and how.

Containers nest. A letter goes in an envelope. The envelope goes in a mailbag. The mailbag goes in a truck. At each level, the outer thing is the container and the inner thing is the contents. Every container can be contents of a larger container. There is no natural stopping point — containment goes as deep as you want to look.

The most important thing about containers: the container and its contents are separate things. Taking something out of a box does not damage the box. Putting something into a bag does not change what a bag is. The container exists independently of what it holds. This separability is what makes containers useful — you can reuse them, empty them, fill them with something different.

## See also

- [Containment in Philosophy and Formal Ontology](../domains/western/domains/metaphysics/texts/containment-in-philosophy-and-formal-ontology.md) — the philosophical and formal-ontological sources behind the container concept
