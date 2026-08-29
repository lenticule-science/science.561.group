---
type: question
status: open
explores: [operations-settling, adjudication-modes-and-h1, audit-as-cech-resolution-of-operations-settling, witness-as-increment]
---

# What does $H^1$ of the operations settling measure in work terms?

The [adjudication-modes-and-h1](../theorems/adjudication-modes-and-h1.md) theorem establishes a correspondence between adjudication modes and the first cohomology group $H^1$ of the operations settling.
The [audit-as-cech-resolution](../theorems/audit-as-cech-resolution-of-operations-settling.md) theorem shows that auditing is a Čech resolution of the settling.
Together these place $H^1$ at the center of the witness-conflict picture.
But the work-practice interpretation of a non-trivial $H^1$ class — what it means for an organization doing actual work — has not been stated.

## The Čech picture

The operations settling $\mathcal{E}_{\mathrm{op}}$ is covered by local witness patches — each agent $A_i$'s view of the cells, and each time-slice $\tau$'s record of what fired.
A Čech 1-cocycle is a collection of local disagreements that are consistent: each pair of patches agrees on their overlap.
A coboundary is a disagreement that arises entirely from a single patch's local discrepancy. $H^1 = Z^1 / B^1$ measures the disagreements that are globally consistent but not locally explainable — patterns of conflict that no single agent's view can account for.

## What a non-trivial $H^1$ class means operationally

A trivial $H^1$ means all witness conflicts can be resolved by local adjudication: each conflict is confined to a single patch (a single agent or time-slice), and adjudicating that patch resolves the conflict globally.
An organization with $H^1 = 0$ has no structural witness conflicts — only local ones.

A non-trivial $H^1$ class represents a persistent, globally consistent pattern of disagreement that survives all local adjudication.
No agent, working locally, can resolve it; the conflict recurs after each local fix because it is structural, not accidental.
The $H^1$ class is the equivalence class of such patterns.

## Sub-questions

### (a) Does each $H^1$ generator correspond to a distinct conflict type?

The free generators of $H^1$ (if $H^1$ is free abelian) would correspond to independent, irresolvable conflict patterns.
Do these generators have work-practice interpretations — e.g., one generator per structural contradiction in the closure-rule system?

### (b) Is there a decision procedure for non-trivial $H^1$ from local cell data?

An auditor with access to all local cell data can compute $H^1$ via the Čech complex.
Is this computation tractable?
For large settling systems (many agents, many cells), is there a polynomial-time procedure, or does non-trivial $H^1$ detection require exponential search?

### (c) What governance operations reduce $H^1$?

A [visible automorphism](../theorems/restructure-as-visible-automorphism.md) (structural reform) changes the closure-rule system and may eliminate the source of a non-trivial $H^1$ class.
A charter amendment is the governance-specific case — see [charter-amendment-as-visible-automorphism](../theories/predicated-governance/theorems/charter-amendment-as-visible-automorphism.md).
Does every non-trivial $H^1$ class have a corresponding charter amendment that eliminates it, or are there classes whose elimination requires more than governance reform?

### (d) The accumulation of $H^1$ over time

If $H^1$ is non-trivial and no governance reform addresses it, does $H^1$ grow?
The accumulation of unresolved conflicts could cause the $H^1$ group to grow, increasing the organization's structural disorder.
Is there a dynamics of $H^1$ accumulation — an analog of entropy growth — that predicts organizational breakdown?
