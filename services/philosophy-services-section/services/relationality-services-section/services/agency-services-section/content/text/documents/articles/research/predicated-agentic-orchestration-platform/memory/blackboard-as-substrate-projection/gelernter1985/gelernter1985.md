---
type: reference
class: academic
status: cited
authors: [Gelernter, David]
year: 1985
title: "Generative Communication in Linda"
venue: "ACM Transactions on Programming Languages and Systems 7(1), 80–112"
description: D.
---

## Source

D.
Gelernter.
"Generative Communication in Linda." *ACM Transactions on Programming Languages and Systems*, 7(1), 80–112, 1985.

## Form

Journal paper.
The founding paper of the *Linda coordination language* and the *tuple-space coordination model*.

## Content summary

Introduces *Linda*: a coordination model in which a process accesses a shared *tuple space* through four primitives — `out(t)` (place tuple $t$ in the space), `in(t)` (atomically remove a tuple matching pattern $t$, blocking if none present), `rd(t)` (read a matching tuple non-destructively), and `eval(p)` (place an active tuple, evaluated by a new process).
Tuples are typed value-vectors; pattern-matching uses formals (typed wildcards) that bind on retrieval.
The tuple space is *associative* (retrieval is by content, not address), *generative* (a tuple's lifetime is independent of its producer), and *persistent* (tuples remain until consumed).
The paper argues that this minimal vocabulary suffices for a wide range of coordination patterns — pipelines, work farms, replicated workers, master-slave — and that the Linda primitives factor the coordination concern out of the host language, giving a clean separation between sequential computation (in any host language) and concurrent coordination (via Linda over a tuple space).
Linda became the load-bearing reference for *coordination languages* as a distinct field from concurrent programming languages.
