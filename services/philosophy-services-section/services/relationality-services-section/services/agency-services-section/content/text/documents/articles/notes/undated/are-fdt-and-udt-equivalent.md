---
type: question
status: open
see-also:
  - ../theorems/fdt-newcomb-resolution.md
  - ../objects/decision-algorithm.md
references:
  - references/soares-fallenstein2015.md
title: Are FDT and UDT equivalent?
description: Functional Decision Theory (FDT) takes the agent's decision algorithm as the choice variable.
---

# Are FDT and UDT equivalent?

## The question

Functional Decision Theory (FDT) takes the agent's *decision algorithm* as the choice variable.
Updateless Decision Theory (UDT) takes the agent's *policy* (mapping from observations to acts) as the choice variable, evaluated under the *prior* rather than under the post-observation posterior.
Both are proposed as alternatives to CDT/EDT for handling Newcomblike and embedded-agency scenarios.
Are they extensionally the same theory?

## What's known

- FDT and UDT agree on the standard test cases (Newcomb, Smoking Lesion, Parfit's Hitchhiker, Prisoner's Dilemma against a copy, Counterfactual Mugging).
- They have *different* informal motivations: FDT motivates by algorithmic-instance counterfactuals; UDT motivates by refusing to update on observations that the agent's prior could have foreseen.
- Some Newcomblike variants (e.g. with imperfect predictors) may distinguish them, but no canonical example has been agreed.
- The two frameworks share the dependence on *logical counterfactuals*, which neither has formalized.

## Why it matters

If FDT and UDT are equivalent, the field has converged on a single replacement for CDT/EDT.
If they differ, the field has two candidate successors and must choose.
The status affects which framework downstream alignment work should target.

## Relation to other theories

The question is internal to agent-foundations but bears on [alignment](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/deciding/content/alignment/_index.md) (which decision theory the AI is to be deceptively-misaligned against, etc.) and on [reinforcement-learning](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/deciding/content/reinforcement-learning/_index.md) (specifically, what the policy-as-choice-variable framework implies for training procedures).
