---
title: "Why Truth Comes in a Lattice"
description: "An explanation of why the values a claim can take form an ordered structure rather than a two-element switch — from partial order to Heyting algebra to the four-valued bilattice — and why this corpus settles claims into a lattice so that contradiction is a value rather than a breakdown."
date-created: 2026-06-19
date-modified: 2026-06-19
keywords: ["lattice", "heyting-algebra", "bilattice", "order-theory", "intuitionistic-logic", "four-valued", "paraconsistency", "truth-values", "settling"]
---

This is an explanation.
It does not give you a procedure; it tries to replace one picture of truth with a roomier one, because the cramped picture keeps forcing avoidable choices that the roomier one simply dissolves.
The cramped picture is the one nearly everyone starts with: a claim is true or it is false, two values, a switch.
The roomier picture is that the values a claim can take are **ordered** — they sit in a lattice — and that the two-valued switch is the smallest, flattest lattice there is, useful exactly when nothing more interesting is going on and misleading the moment something is.

## What an order buys before truth even enters

Strip the idea down to its bones. An **order** is a set with one relation, `≤`, read "is at least as much as," that is reflexive (everything `≤` itself), antisymmetric (if `a ≤ b` and `b ≤ a` then they are equal), and transitive (`≤` chains). That is all. It is the mathematics of comparison and nothing else.

Add one thing and you get a **lattice**: any two elements have a *greatest lower bound* (their **meet**, `a ∧ b` — the largest thing below both) and a *least upper bound* (their **join**, `a ∨ b` — the smallest thing above both). Meet is "what `a` and `b` both grant"; join is "what either of them grants." A lattice has a bottom `⊥` (granting nothing) and, when bounded, a top `⊤` (granting everything).

Now notice that you have described the logic of truth values without mentioning truth. Conjunction is meet: `A ∧ B` holds to the degree both do. Disjunction is join. `⊥` is falsity, `⊤` is truth. The two-element set `{false < true}` is the lattice with exactly a bottom and a top and nothing between — Boolean logic is not the foundation, it is the *degenerate case*, the lattice so small it has no room to record anything except the two extremes. The interesting question is never "true or false?" It is "what does this lattice look like?" — because the answer decides what you are able to say.

## Heyting: putting implication inside the order

Boolean logic has a feature people mistake for a law of thought: `¬¬A = A`, double negation is identity, and `A ∨ ¬A` always holds. A **Heyting algebra** is what you get when you keep the lattice and the bottom and top, and you add implication *as a piece of the order itself* — but you do **not** assume double negation collapses.

Concretely, a Heyting algebra is a lattice where, for each element `a`, the operation "meet with `a`" has a *best possible inverse*: an element `a → b` that is the largest `x` with `a ∧ x ≤ b`. That "largest `x`" is an adjunction — `a ∧ −` and `a → −` are adjoint — and it is exactly intuitionistic implication. Negation falls out as `¬a = (a → ⊥)`: the largest thing whose conjunction with `a` grants nothing.

In a Heyting algebra `a ∨ ¬a` need not reach the top, and `¬¬a` need not fall back to `a`. This is not a bug to be patched back to Boolean; it is the whole point. It is the same fact, viewed from the order side, that the [Curry–Howard correspondence](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/teaching-articles/explanations/propositions-as-types.md) shows from the proof side: a proof of `A ∨ ¬A` would be a program that decides every proposition, and there is none, so excluded middle is not free. The lattice of *constructive* truth values is a Heyting algebra, and it has structure strictly between `⊥` and `⊤` precisely where a claim is meaningful but not yet decided. This is why the corpus's truth values are Heyting and not Boolean: it refuses to pretend that "not yet refuted" is the same as "true."

## The second axis: when one order is not enough

A Heyting algebra still measures one thing — how *true* a claim is, from `⊥` up to `⊤`. But real evidence answers two questions at once, and they are independent: *how much is known* about a claim, and *which way the known evidence leans*. A rumour leaning true and a theorem leaning true are both "leaning true" on the truth axis, yet they are nothing alike, because they sit at opposite ends of a second, orthogonal order: the **information** order, from "nothing known" up to "too much known — both supported and refuted."

Cross the two orders and you get a **bilattice**: a set carrying *two* lattice structures at once, a truth order and a knowledge order, each with its own meet and join. The smallest interesting one is Belnap and Dunn's **FOUR**, with four values that the corpus names as charges:

- **absurd** — nothing is known (the bottom of the knowledge order); the cell is not yet in play.
- **potential** — leaning one way on truth but lightly held in knowledge.
- **active** — leaning the other way, likewise.
- **stable** — both supported *and* refuted at once (the top of the knowledge order): a genuine contradiction, recorded as a value instead of an explosion.

The decisive move is that last one. In Boolean logic a contradiction is `⊥` reached from both sides, and from `⊥` everything follows — the system explodes into triviality (this is *ex falso quodlibet*). On a bilattice, "supported and refuted" is just a point with high knowledge and neutral lean; it sits there, visible, contributing what it can, poisoning nothing. Contradiction stops being a breakdown and becomes data. This is **paraconsistency**, and it is an order-theoretic fact before it is a logical doctrine: it is what the second axis was *for*.

## Why the corpus settles into a lattice

All of this is why settling, in this corpus, does not return a verdict. It returns a *position in a lattice*.

When a claim is articulated, predicated, posited, and settled, the result is a cell carrying a charge from the FOUR bilattice — and the settling process climbs an order: the closure-ordinal tower, where each stage is `≤` the next and no cell a stage has designated is ever dropped by a later one. Monotone ascent to a fixed point is the order-theoretic skeleton under the whole "articulate → predicate → posit → settle" generator. The fixed points are the destinations of classification; reaching one is a least-upper-bound computation, not a coin flip.

And because the corpus's research fixes one four-valued bilattice and *reads* it everywhere — the four agent charges absurd/potential/active/stable are the same FOUR, one base up, as are the four illocutionary force-classes of a speech act — the corpus never hand-rolls a notion of "partly true" or "in conflict." It inherits them from the order. A cell that enters or leaves the field shifts *to or from* absurd — absence is recorded as the bottom of the knowledge order, never as a silent gap — which is only sayable because truth was put in a lattice in the first place.

## The thing to carry away

Truth is not a switch with two positions; it is a position in an ordered structure, and which structure you are in decides what you can honestly say. Flatten it to two values and you lose the room to distinguish "unknown" from "false," "rumour" from "theorem," and "contradiction" from "catastrophe" — and you will pay for the loss in torn-apart cases the flat model cannot hold. Keep the order, internalize implication and you have constructive truth (a Heyting algebra); add the second, orthogonal axis of *how much is known* and you have evidence that survives its own contradictions (a bilattice). The corpus settles claims into a lattice for the same reason it files documents by their arrows: because the honest structure of the thing was never flat, and pretending otherwise only moves the damage somewhere harder to see.
