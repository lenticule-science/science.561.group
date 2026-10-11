---
type: reference
class: academic
status: cited
authors: [Reiter, Raymond]
year: 2001
title: "Knowledge in Action: Logical Foundations for Specifying and Implementing Dynamical Systems"
venue: "MIT Press"
---

## Source

R. Reiter. *Knowledge in Action: Logical Foundations for Specifying and Implementing Dynamical Systems*. MIT Press, 2001.

## Form

Textbook. The mature treatment of the *situation calculus* for representing actions, change, and reasoning about dynamic worlds, building on McCarthy and Hayes's 1969 introduction ([mccarthy-hayes1969](mccarthy-hayes1969.md)).

## Content summary

Develops the situation calculus as a formal language for actions and change: the world has a sequence of *situations* $S_0, do(a_1, S_0), do(a_2, do(a_1, S_0)), \ldots$; *fluents* are predicates whose truth depends on the situation; *actions* are first-class terms whose preconditions and effects are axiomatized in successor-state axioms (Reiter's solution to the frame problem). The textbook covers the full apparatus: the regression operator for reasoning backwards through action sequences; the GOLOG family (GOLOG, ConGolog, IndiGolog) of agent programming languages whose primitive is the situation-calculus action; sensing actions and knowledge-producing actions; concurrent action; reasoning about time and continuous change. The result is a framework for specifying agent programs whose semantics is given by the situation calculus, with execution traces that are first-order logical terms.
