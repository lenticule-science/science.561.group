---
type: narrative
status: active
see-also:
  - ../teaching/explanations/embedded-agency.md
  - ../objects/decision-algorithm.md
  - ../theorems/reflective-stability-impossibility-loeb.md
---

# The five-and-ten problem

The **five-and-ten problem** is a deceptively simple toy that exposes how badly classical decision-theoretic reasoning fails for an agent that takes seriously the fact that its decisions are computed.

## The setup

You are offered a choice: take $5 or take $10.
You prefer more money to less.
What do you do?

The classical answer is immediate: take $10.

## The naive embedded reasoning

Now suppose the agent is a proof-based reasoner that decides by searching for proofs of the form "$a$ is the utility-maximizing act."
It reasons:

> Let me consider the act "take $5".
> If I were to take $5, I would receive $5.
> If I were to take $10, I would receive $10.
> Hence taking $10 is the utility-maximizing act, and I shall take $10.

So far so good.
But the reasoner can also consider:

> Let me consider the act "take $10".
> To verify this is the utility-maximizing act, I should check what happens under the alternative.
> If I were to take $5 — but wait, I am not going to take $5 (I am proof-based and have not proved $5 is utility-maximizing).
> So "I take $5" is impossible.
> By the principle of explosion, anything follows from an impossibility.
> In particular, "if I take $5, I get $1{,}000{,}000".
> So $5 dominates $10.
> Take $5.

The reasoner takes $5.

## What just happened

The reasoner used a *spurious counterfactual*.
Because the reasoner is proof-based, the conditional "if I take $5" is, in classical logic, a counterpossible: a conditional with an impossible antecedent.
Classical logic makes such conditionals trivially true, so the reasoner can conclude *anything* about what happens under the alternative — including arbitrarily favorable outcomes.
The agent fails to take the obviously correct $10.

## Why this matters

The five-and-ten problem is trivially solved by a CDT-with-real- counterfactuals reasoner who can simulate the alternative.
It is also trivially solved by an EDT reasoner who looks at historical data on people taking $5 vs $10.
But for an *embedded* reasoner whose decisions are *literally computed by proof search over its own behavior*, the spurious-counterfactual problem is real and is not easy to fix without specifying what "counterfactual" means for an algorithmic agent.

This is precisely the gap that **logical counterfactuals** in [Functional Decision Theory](../theorems/fdt-newcomb-resolution.md) are supposed to fill.
FDT says: the relevant counterfactual is "what if my decision algorithm outputs $5 instead of $10".
But specifying that counterfactual rigorously requires a theory of *logical counterfactuals* — counterfactual reasoning over mathematical or algorithmic facts, where standard possible-world semantics breaks down.

## What the literature has

The agent-foundations literature has:

- **Diagnoses** of the spurious-counterfactual problem in proof-based agents.
- **Partial fixes** using bounded proof search, modal logic (Barasz et al.), or logical induction.
- **No fully satisfactory account** of logical counterfactuals.

The five-and-ten problem persists as a *test case* for proposed substrates: any new framework for decision-theoretic reasoning over algorithms is checked first against five-and-ten, because any framework that mishandles five-and-ten will mishandle harder cases.

## Why this is in the library

The five-and-ten problem belongs in this section because it demonstrates two things at once: that the embedded-agency program is not abstract philosophy (the problem is concrete and the failure mode is concrete), and that the classical toolkit really does not suffice (the failure is in the most elementary decision possible).
It motivates the rest of the agent-foundations apparatus by example.
