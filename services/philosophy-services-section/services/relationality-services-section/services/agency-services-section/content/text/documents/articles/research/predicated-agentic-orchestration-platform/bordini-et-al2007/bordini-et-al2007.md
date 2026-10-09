---
type: reference
class: academic
status: cited
authors: [Bordini, Rafael H., Hübner, Jomi Fred, Wooldridge, Michael]
year: 2007
title: "Programming Multi-Agent Systems in AgentSpeak using Jason"
venue: "Wiley"
description: R.H.
---

## Source

R.H. Bordini, J.F. Hübner, M.
Wooldridge. *Programming Multi-Agent Systems in AgentSpeak using Jason*.
Wiley, 2007.

## Form

Textbook.
The mature reference for the *AgentSpeak* agent programming language (Rao 1996) and its *Jason* interpreter, the most widely-deployed BDI-architecture realization in the academic and educational MAS communities.

## Content summary

Develops AgentSpeak/Jason: a logic-programming-style language for BDI agents in which agent programs consist of *initial beliefs* (a set of ground atoms), *initial goals* (atoms tagged with achievement or test goal markers), and *plans* (Prolog-like rules of the form `triggering-event : context <- body`, where the triggering event is the addition or deletion of a belief or goal, the context is a belief-base query that must hold, and the body is a sequence of actions, sub-goal additions, and belief updates).
The Jason interpreter implements the BDI reasoning cycle: percept update → event generation → applicable-plan computation → option selection → intention selection → step execution.
The textbook covers the language's syntax and semantics; the interpreter's architecture; speech-act-based inter-agent communication; environment models; the Jason / CArtAgO / MOISE+ stack for organizational structuring (artifacts, organizations, scopes); and case studies.
AgentSpeak/Jason is the canonical practical realization of the BDI architecture for academic use.
