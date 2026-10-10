---
title: "Note on the driver, the library, and the quest that is not a room"
date-created: 2026-10-10
description: "What a MUD driver owns, what a mudlib owns, and what the Leader said FeltOS and MetroPlat are, with the facts of real MUDs the house has to work from."
provenance:
  authors:
    - 561 Group office agent (Lenticule Science Senior and Red Cup Engineer Senior), pass games-engines
  basis: Leader utterances, cited by address
  utterances:
    - "ni:///sha-256;pcqW3bR74LQXtwsW2pB8VZBFzkWrfoSe54McvAsyJNI"
    - "ni:///sha-256;oD1GujcheXvRwYh9T3DMcZN06LbjklQLZukz6YVdh4w"
    - "ni:///sha-256;L_WOVbZYSPjh_ecn3xu0ABph79AK5LVxCDbxU_iZemo"
    - "ni:///sha-256;80dvXWN4e2dWrEPUl8zOeRLia2MwyKC9jaWNhTNDR1k"
    - "ni:///sha-256;Ve4ktalw8uj13rfRkJjxFuhRWF_TrVsuReYebnB1od4"
    - "ni:///sha-256;oTA5TIAvncE6yCvRPa_DVPhrrQXAUhrorm5csRZ-bQU"
    - "ni:///sha-256;d3fzxN-ttC_npH7mk1yboABcnyo7VAmZ1iud5aXsEGk"
    - "ni:///sha-256;L-AngZiVZHmEalhHsLj70nguGpoH8ofUK9QaDL9OCbA"
    - "ni:///sha-256;BdtprsTEtwj91bMxS0prYfVS2i5_UCL3ld2gVjPA25g"
    - "ni:///sha-256;DfMP7J4hqz1WRKtlTf2TPk5Nv5JFyCGLFTmvbZ-vQFA"
    - "ni:///sha-256;Dh3UA0W6HuV07V8m-DLHjqLuYsZAQQzChZUFqo6M7Oc"
    - "ni:///sha-256;Tu3vfAPf8R_hoOQV9cXAhbvmzveY9c_0xMk4_ssZokE"
    - "ni:///sha-256;3mVvBGB50en10xUzR4rGEEKjPWllmyBGVA7sm3Y3VHE"
    - "ni:///sha-256;V09sC_7ujb612pC-t6g_oo650U1K-RUC-Vtu5oCpMt0"
    - "ni:///sha-256;PukvBC69qtA_dsYer8Dj30OI8NETN2ZDlIsfZ3w2CFs"
    - "ni:///sha-256;LeItNe2jyqzoxZ4-Y1b9wMV7hRR0V0W1ggne1xCJR1I"
    - "ni:///sha-256;lMb5zQy0nXSgTrOfnCk6hxlmTTHeru0oNSiEsT3DBDE"
keywords:
  - mud
  - driver
  - mudlib
  - feltos
  - metroplat
  - moose
  - marsh
see-also:
  - engineering-services-section/content/text/glossary/terms/feltos.md
  - engineering-services-section/content/text/glossary/terms/metroplat.md
  - engineering-services-section/content/text/glossary/terms/moose.md
---

# The driver, the library, and the quest that is not a room

## The Leader's statements, taken as theory

1. FeltOS is a MUD engine and is only a MUD engine (Leader, 2026-09-11 20:00; 2026-09-21 03:18). It carries no functionality except what it needs as a MUD server. A consumer that uses FeltOS for something else is cut over to the actual upstream provider of that capability. FeltOS is not "some hodgepodge".
2. MetroPlat is a MUD library for FeltOS (2026-09-26 20:21: "picture FeltOS as a MUD engine. And MetroPlat as our library. EVERYTHING you're doing needs to be part of that MUD"). On 2026-09-11 15:00 and 18:13 the Leader said MetroPlat is "a MARSH UX, that is, an UX for a smartchain MUD engine". MARSH builds on FeltOS, so the two statements name one layering: FeltOS the driver, MARSH the smartchain MUD engine over it, MetroPlat the library and user experience that world runs.
3. MetroPlat is a MUD. It does not have a MUD as something it provides (2026-10-04 21:19). A file `mud.mjs` inside a MUD library of a different MUD engine is wrong, and the correct alarm is that the file should not exist at all, because the whole is early alpha vibeslop to be treated as such, not renamed by substitution (the Leader: "we do not need to s/metroplex/MUD/", 2026-10-04 21:24).
4. MetroPlat has no clock (2026-10-04 21:57). The timer belongs to the driver. Asked which of "FluffOS or the Discordl Mudlib" owns it, the one-word answer is the driver: FluffOS in the Leader's analogy, FeltOS in the house.
5. FeltOS and MetroPlat need not know about the articulating capability at all; it is the wrong app for them, and if removing it eats the entire MetroPlat package until the package is gone, that is acceptable (2026-09-11 15:00).
6. All agents route through a local MUD server (2026-09-11 20:09). A line saying only one agent may mutate is wrong, and was meant to refer to Groq, not to the agent reading it.
7. Agents that connect to MetroPlat are associated with specific accounts, with permissions, offices, duties and skills, so that they can work in the house coherently. The capabilities of the house are made available to them through MetroPlat as those skills, duties and offices (2026-09-26 13:45). The way to get there is to move every capability to its most proper owner first, aggressively, because the code and the research on how to code are spread across several registers of nomenclature and that spread is what confuses agents about what to build.
8. A real-world MUD does not turn quests into rooms merely because MUDs have rooms (2026-09-26 18:51). The repository holds more research on MUDs than anywhere else on the planet and every MUD decision is made from it, never from the prompt alone (2026-09-26 18:53).
9. The control plane for a Linux machine is not what was built. What is wanted is an interface for agents to the machine's resources and operations that speaks ActivityPub, A2A, CloudEvents and OCAP (the house's ActivityPub++ stack, composed as MOOSE). Its capabilities belong in the persistent-linux-machine engineering section (2026-09-11 20:57, 21:01).
10. The agentic relation engine is protocol blind. It works over the Sign family, which is itself agnostic. FeltOS or MOOSE are the software that care about protocols. An organizing capability that appears to depend on a chain protocol such as Ethereum is a design error to be resolved by making it work differently so the case does not arise (2026-09-22 17:42).
11. The `info` tree on Bare Cedar Fog is the machine snapshot. An agent lives in it like a MUD and is able to move through it with grep and sed. Calling it cluttered is a misreading (2026-10-08 16:58).

## What real MUDs and their drivers hold

External knowledge, from the LPMud lineage the house already glosses (`computer-mud-system-engineering-services-section/content/glossary/topics/mud-libraries.md`):

- LPMud (Lars Pensjö, 1989) separated a driver from a mudlib. The driver was later reimplemented as MudOS and then forked as FluffOS. The Discworld MUD's mudlib runs on FluffOS.
- The driver owns the process, network connections, the interpreter for the library language (LPC), object lifecycle and memory, persistence of objects (`save_object` and `restore_object`), the heartbeat that invokes `heart_beat` on objects at a fixed interval, delayed calls (`call_out`), and the external functions (efuns) that touch the host.
- The mudlib owns the world: rooms, objects, NPCs, guilds, skills, combat, command verbs and the quest handler. A quest in an LPMud-family mudlib is a named record of what a character has done or must do, kept by the lib's quest handler and pursued across rooms, objects and NPCs. A quest is a task state of characters. A room is a place. The two are different kinds, and a design that converts a quest into a room has misread the object model of the thing it claims to copy.
- Other families (Diku, MOO) differ: MOO has one object database programmed from inside. A claim to follow "real MUDs" names the family.
- The unrelated on-chain MUD framework of Lattice (an ECS for autonomous worlds, the thing MARSH is to meet then beat) is already analysed at `mud-framework-autonomous-worlds-analysis.md` in this section's notes.

## What the house theory adds

The house chain (`engineering-services-section/content/text/documents/articles/notes/2026/09/22/2026-09-22-the-relational-chain-and-what-feltos-is.md`) already puts the heartbeat, the connections, persistence and federation in FeltOS, and the nine faculties below it as pure functions without clock or socket. The software ecosystem note of 2026-09-23 lists FeltOS as the multi-agent server and MetroPlat as the platform requiring it. This note adds the reading of each Leader statement above against those documents: no statement contradicts them, and the repository's code contradicts them in the places the engineering requirement `feltos-is-the-mud-driver-and-metroplat-its-library` names.

## Open questions

- Whether MetroPlat is best described as the library of FeltOS or as a MARSH user experience when both a smartchain world and a plain world are served. The Leader's two phrasings are both held above.
- Which MUD family's quest model the Group's worlds follow, and how a quest record is addressed as a content-addressed cell.
- Whether the "agents are characters" mapping of accounts, offices, duties and skills should follow the Discworld wizard and creator permission ladder or the house's own office model.
