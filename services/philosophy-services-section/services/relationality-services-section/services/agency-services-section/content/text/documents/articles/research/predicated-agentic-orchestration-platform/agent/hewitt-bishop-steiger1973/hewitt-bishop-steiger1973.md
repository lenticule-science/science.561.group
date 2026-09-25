---
type: reference
class: academic
status: cited
authors: [Hewitt, Carl, Bishop, Peter, Steiger, Richard]
year: 1973
title: "A Universal Modular Actor Formalism for Artificial Intelligence"
venue: "Proceedings of the 3rd International Joint Conference on Artificial Intelligence (IJCAI-73), 235–245"
description: C.
---

## Source

C.
Hewitt, P.
Bishop, R.
Steiger.
"A Universal Modular Actor Formalism for Artificial Intelligence."
In *Proceedings of the 3rd International Joint Conference on Artificial Intelligence (IJCAI-73)*, 235–245, 1973.

## Form

Conference paper.
The founding paper of the *actor model* of concurrent computation.

## Content summary

Introduces the *actor model*: a formalism for concurrent computation in which the universal primitive is the *actor* — a computational entity that, on receipt of a message, can (1) send a finite number of messages to other actors, (2) create a finite number of new actors, and (3) designate the behavior to apply to the next message it receives.
There is no shared memory; communication is by asynchronous message-passing.
Actors have an address; messages name their recipient by address.
The model is *universal* in the sense that it can encode lambda calculus, Turing machines, and other computational primitives within the actor formalism.
The paper argues that the actor model is the right primitive for AI because intelligent agents are naturally modeled as actors exchanging messages, with the no-shared-memory discipline preventing the coordination pathologies of imperative shared-state programming.
The follow-up work — Hewitt's later papers, Agha's textbook (see [agha1986](../agha1986/agha1986.md)) — develops the model's mathematical semantics and engineering implementations (Erlang, Akka, Pony, Pony, ABCL).
