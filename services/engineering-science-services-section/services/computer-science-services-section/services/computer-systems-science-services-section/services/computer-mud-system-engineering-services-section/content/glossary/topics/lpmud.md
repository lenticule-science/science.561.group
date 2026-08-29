---
title: "LPMud"
date-created: 2026-03-02
type: topic
aliases:
  - "LPMud"
  - "LP-MUD"
  - "LPC"
tags: []
description: "The MUD architecture introduced by Lars Pensjö in 1989 that separated the driver (engine) from the mudlib (game content), pioneering a pattern that became standard in game engines and web frameworks."
---

LPMud is a MUD system created by Lars Pensjö at Chalmers University of Technology in Gothenburg, Sweden, in 1989. Its defining innovation was the clean separation of driver and [mudlib](/technology/disciplines/computing/topics/multi-user-dungeons/mud-libraries.md): the driver provides a C-like interpreted programming language (LPC), object lifecycle management, network handling, and a virtual machine; the mudlib — written entirely in LPC — provides the game world, mechanics, and player experience.

LPC (Lars Pensjö C) is the programming language of the LPMud ecosystem. It is object-oriented, garbage-collected, and designed to be written by world builders who may not be professional programmers. Objects in LPC inherit from base classes defined in the mudlib (room, weapon, monster, player) and override or extend behavior. The language supports closures, mappings (associative arrays), and a permission system that controls what code can access what resources — anticipating the security models of later sandboxed environments.

The driver lineage runs from the original LPMud driver through **MudOS** (developed by the MudOS group in the early 1990s, with significant performance and feature improvements) to **FluffOS** (the currently maintained fork). Each generation improved performance, added language features, and refined the security model, but maintained backward compatibility with existing mudlibs.

LPMud's architectural insight — that the engine should provide infrastructure and a programming language, while the game world is an application written in that language — is the same insight that drives modern game engines, web application frameworks, and application platforms. The pattern was not borrowed from LPMud by these later systems (they developed independently), but LPMud arrived at it first in the context of virtual world construction.

## Related

- [MUD](/technology/disciplines/computing/topics/multi-user-dungeons/mud.md)
- [MUD libraries](/technology/disciplines/computing/topics/multi-user-dungeons/mud-libraries.md)
- [World-building as programming](/technology/disciplines/computing/topics/multi-user-dungeons/world-building-as-programming.md)
