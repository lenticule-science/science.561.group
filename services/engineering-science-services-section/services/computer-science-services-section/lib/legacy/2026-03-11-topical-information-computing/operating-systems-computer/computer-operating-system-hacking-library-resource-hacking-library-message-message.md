---
title: "Message"
date-created: 2026-04-07
description: "A discrete communication from one entity to another — carrying content through a channel, transforming the recipient's state. The atomic unit of interaction in distributed and concurrent systems."
defines: message
related: [channel, event, actor, agent]
references:
  shannon1948:
    authors: ["Claude E. Shannon"]
    title: "A Mathematical Theory of Communication"
    publication: "Bell System Technical Journal, 27(3)"
    year: 1948
  hewitt1973:
    authors: ["Carl Hewitt", "Peter Bishop", "Richard Steiger"]
    title: "A Universal Modular ACTOR Formalism for Artificial Intelligence"
    publication: "IJCAI"
    year: 1973
  austin1962:
    authors: ["J. L. Austin"]
    title: "How to Do Things with Words"
    publication: "Oxford University Press"
    year: 1962
  jakobson1960:
    authors: ["Roman Jakobson"]
    title: "Closing Statement: Linguistics and Poetics"
    publication: "Style in Language, MIT Press"
    year: 1960
---

A message is a discrete communication from one entity to another, carrying content through a [channel](../../../science/theories/information/terms/channel.md) and potentially transforming the recipient's state.

Four disciplinary traditions converge on what a message is:

**Information theory** (Shannon 1948): A message is a selection from a set of possible signals.
The information content of a message is measured by how much it narrows the recipient's uncertainty.
A message that tells you what you already know carries no information.
A message that surprises you carries maximum information.
The channel constrains which messages can pass — capacity, bandwidth, noise.

**Actor model** (Hewitt et al. 1973): Actors communicate exclusively through messages.
An actor receiving a message can: create new actors, send further messages, and determine its behavior for the next message it receives.
Messages are the ONLY way one actor affects another.
There is no shared state — all coordination is through message passing.
Messages are asynchronous — the sender does not wait for a response.

**Speech act theory** (Austin 1962): A message is not merely informational — it is an act.
Austin distinguishes the locutionary act (what is said), the illocutionary act (what is done in saying it — asserting, requesting, promising, declaring), and the perlocutionary act (what effect saying it has on the recipient).
A message that says "status: completed" performs an assertion (illocutionary) that may change a plan's progress (perlocutionary).

**Communication functions** (Jakobson 1960): Every message involves six factors — addresser, addressee, context, message-form, contact (channel), and code.
Each factor produces a communication function: emotive (addresser's attitude), conative (effect on addressee), referential (context), poetic (message form), phatic (maintaining contact), metalingual (about the code).
A frontmatter key-value pair is primarily referential.
A governance directive is primarily conative.

Messages are immutable once sent.
Corrections are new messages that reference the original.
The sequence of messages IS the history — in an actor system, in an event log, in a conversation.
