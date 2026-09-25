---
type: reference
class: engineering-system
status: cited
authors: [Foundation for Intelligent Physical Agents]
year: 2002
title: "FIPA ACL Message Structure Specification"
venue: "FIPA Standard SC00061G"
description: Foundation for Intelligent Physical Agents.
---

## Source

Foundation for Intelligent Physical Agents. *FIPA ACL Message Structure Specification*, SC00061G.
FIPA, 2002. <http://www.fipa.org/specs/fipa00061/>.
Companion specs: *Communicative Act Library Specification* (SC00037J) and *Interaction Protocol Library Specification* (SC00025).

## Form

Standards specification.
The mature standard for the *agent communication language* in the FIPA family, succeeding KQML ([finin-et-al1994](../finin-et-al1994/finin-et-al1994.md)) and adopted as IEEE 1855 (2014, retired 2024).

## Content summary

Specifies the FIPA Agent Communication Language: messages between agents are *communicative acts* with a *performative* (the speech-act type — `inform`, `request`, `propose`, `accept`, `refuse`, `query-if`, etc., from a standardized library), a sender, a receiver, content (in a content language like FIPA-SL or KIF), an ontology (naming the vocabulary the content references), a conversation identifier, and reply-to / in-reply-to threading metadata.
The performatives have a *formal semantics* in terms of the sender's mental states (a `request` performative implies the sender intends the receiver to perform an action; an `inform` performative implies the sender believes the content and intends the receiver to come to believe it).
Companion FIPA specs define standard *interaction protocols* — patterns of communicative-act exchange (request, contract-net, English auction, subscribe, query) that compose into multi-agent coordination patterns.
