---
type: object
class: classical
status: active
depends-on: []
see-also:
  - utility-function.md
  - prior-belief.md
  - teaching/explanations/decision-theory.md
references:
  - references/savage1954.md
title: Decision problem
description: This is Savage's (1954) formulation.
---

# Decision problem

A **decision problem** is the formal tuple

$$ \mathcal{D} = (A, S, O, o, \succeq) $$

consisting of:

- **$A$** — a set of *acts* available to the agent.
- **$S$** — a set of *states of the world*, exhaustive and exclusive.
- **$O$** — a set of *outcomes*.
- **$o : A \times S \to O$** — the outcome function: which outcome results from a given act in a given state.
- **$\succeq$** — a *preference relation* over outcomes (or, in some formulations, over acts directly).

This is Savage's (1954) formulation.
Von Neumann-Morgenstern (1944) instead takes the primitive to be a preference relation over *lotteries* — probability distributions over outcomes — and Jeffrey (1965) takes preferences over *propositions*.

## What the formal tuple does and does not include

The tuple specifies *what* the agent must choose between and *what* the agent prefers, but not how the agent reasons about which states are likely.
In Savage's framework, probabilities are *derived* from the preference relation (via the Sure-Thing Principle and other axioms).
In von Neumann-Morgenstern, probabilities are *given* as part of the lottery structure.

## What an agent does with it

A decision problem is what a [decision-theory](../../../../glossary/concepts/decision-theory.md) takes as input.
The output is a chosen act (or a preference ranking over acts).
The classical answer is expected-utility maximization; variant decision theories (CDT, EDT, FDT) differ on what counts as the relevant expectation.
See [cdt-edt-divergence-newcomb](cdt-edt-divergence-newcomb.md).

## Where the formalism breaks

The decision-problem tuple presupposes: - A clean separation between $A$ (what the agent does) and $S$ (what the world does).
For Newcomblike scenarios this is unclear: when the agent's act and the predictor's prediction are correlated, is the prediction part of $A$ or part of $S$? - A clean outcome function.
For [embedded-agency](../../../../glossary/concepts/embedded-agency.md) scenarios where the agent's choice changes its own future computational structure, the outcome function is ill-defined.

These breakdowns motivate the contemporary variants studied by [functional decision theory](fdt-newcomb-resolution.md) and the [embedded-agency](../../../../glossary/concepts/embedded-agency.md) program.

## Where it appears

- The MDP studied in [reinforcement-learning](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/deciding/content/reinforcement-learning/_index.md) is a decision problem extended over time, with state transitions specifying how acts in earlier rounds affect later states.
- The base-objective specification of [alignment](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/deciding/content/alignment/_index.md) is a decision problem whose acts are policies and whose preferences are over long-run trajectories.
