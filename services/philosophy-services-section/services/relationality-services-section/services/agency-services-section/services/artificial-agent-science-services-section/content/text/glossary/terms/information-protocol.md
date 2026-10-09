---
name: "Information Protocol"
description: "An interaction protocol specified by the information each message carries and the causal dependencies among that information, rather than by a fixed ordering of messages. A party may send a message whenever it knows the message's inputs, so the protocol is enacted asynchronously and without a central coordinator; whose move it is is derived from what is known, never assigned."
date-created: 2026-10-02
aliases:
  - "information protocol"
  - "BSPL"
  - "Blindingly Simple Protocol Language"
  - "protocol as data"
instance-of: coordination-protocol
---

Classical interaction protocols — FIPA interaction protocols, the [contract net protocol](contract-net-protocol.md), finite-state conversation policies — fix the order in which messages may be sent. Munindar Singh's information protocols, introduced with BSPL in ["Information-Driven Interaction-Oriented Programming: BSPL, the Blindingly Simple Protocol Language"](https://dl.acm.org/doi/10.5555/2031678.2031687) (AAMAS 2011, pp. 491–498), drop the ordering. A protocol declares roles, and for each message its sender and receiver and its parameters, each adorned **in** (the sender must already know it), **out** (the message binds it) or **nil** (it must not yet be bound). A message is enabled for a role exactly when its in-parameters are known to that role and its out-parameters are not yet bound. Everything a party may do next is thus *read from the information it holds*.

This has three consequences that ordering-based protocols lack. Enactment needs no coordinator: each party decides locally from its own history. Ordering arises only where information depends on information, so independent moves commute (the coordination-free reading of the CALM theorem). And the protocol is **data**: a table of roles, messages and parameters that any party can consult, rather than control flow written into each party's program.

The lineage runs from Winograd and Flores's *conversation for action* (*Understanding Computers and Cognition*, 1986) — request, promise, deliver, declare complete, each a step of one conversation whose next move is known from its state — through Singh's commitment protocols ([conditional commitment](../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/governance-services-section/content/text/glossary/terms/conditional-commitment.md)), where a message's meaning is the commitments it creates or detaches.

## In the house

The work arena states its protocol as data (`PROTOCOL`): for each kind of thread and each step it can stand at, which roles' moves it awaits and which roles may also move. The step is read from the thread, and the roles — opener, assayer, addressee, takers, novated debtors, home or market — are filled from the board, so whose turn it is (`duesOf`, `owesOf`, `awaitsOf`) and a player's agenda (`agendaOf`) are derived. No opener names who will do the work or which model will; the protocol and the board decide whose move it is, and the taker decides its own hands.
