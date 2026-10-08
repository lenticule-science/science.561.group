---
type: reference
class: academic
status: cited
authors: [Finin, Tim, Fritzson, Richard, McKay, Don, McEntire, Robin]
year: 1994
title: "KQML as an Agent Communication Language"
venue: "Proceedings of the 3rd International Conference on Information and Knowledge Management (CIKM '94), 456–463"
description: T.
---

## Source

T.
Finin, R.
Fritzson, D.
McKay, R.
McEntire.
"KQML as an Agent Communication Language."
In *Proceedings of the 3rd International Conference on Information and Knowledge Management (CIKM '94)*, ACM Press, 1994, pp.
456–463.

## Form

Conference paper.
The canonical introduction of the *Knowledge Query and Manipulation Language* (KQML), the speech-act-based agent communication language that preceded FIPA-ACL ([fipa-acl2002](../fipa-acl2002/fipa-acl2002.md)) and pioneered the agent-communication-language field.

## Content summary

Introduces KQML: a message format and protocol for agent communication based on speech-act theory.
A KQML message has a *performative* (a verb naming the speech-act type — `tell`, `ask-if`, `subscribe`, `register`, `unregister`, `recommend`, `broker`, etc.), an *addressing* layer (sender, receiver, reply-with, in-reply-to), a *content* layer (the content's expression, typically in KIF or another knowledge representation language), and *coordination* metadata (language, ontology).
The paper argues that agent communication needs a layer above plain message-passing: agents that exchange opaque byte strings cannot coordinate on the *intent* of communication (is this an assertion? a query? a subscription?), and KQML's performative-typed messages make the intent explicit.
KQML also introduces *facilitator agents* — agents that mediate between requesters and providers, supporting recommend / broker performatives that delegate to other agents.
KQML influenced FIPA-ACL substantially; the FIPA family is the standardized successor.
