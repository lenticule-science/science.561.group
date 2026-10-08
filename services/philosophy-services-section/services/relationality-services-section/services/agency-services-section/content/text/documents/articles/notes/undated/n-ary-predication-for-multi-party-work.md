---
type: question
status: open
explores: [operations-base, task-cell-system, operations-settling, workflow]
title: Which multi-party work relations require n-ary predication?
description: The operations settling uses binary (subject, predicate, object) triples as its predication cells.
---

# Which multi-party work relations require n-ary predication?

The operations settling uses binary (subject, predicate, object) triples as its predication cells.
Multi-party work relations — joint task assignments, collective obligations, multi-stakeholder contracts, quorum decisions — are currently encoded by decomposing them into multiple binary cells.
The question is which decompositions are lossless and which lose structural content that [n-ary predication](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/humanities/theories/math/theories/categories/theories/predication-categories/objects/n-ary-predication.md) would preserve.

## The binary decomposition and its limits

A joint task assignment to agents $A_1, A_2$ can be represented as two binary cells:

$$\langle T, \texttt{assigned-to}, A_1\rangle = \mathbf{t} \;\;\wedge\;\; \langle T, \texttt{assigned-to}, A_2\rangle = \mathbf{t}$$

But this encoding loses the *joint* character: it represents individual assignments, not a joint one.
The joint assignment has normative content that neither individual assignment alone carries — the two agents are co-responsible, each agent's authority over the task is conditioned on the other's, and the task's completion condition is jointly held.
Two binary cells do not record this interdependence.

## Candidate relations requiring n-ary predication

### Joint task assignment

A joint assignment $(T, \{A_1, A_2\}, \texttt{co-assigned})$ is a ternary (or higher) relation: the task $T$, the team $\{A_1, A_2\}$, and the assignment relation all participate in a single normative act.
Binary decomposition separates them; n-ary predication would preserve the joint character as a single normative cell.

### Quorum decisions

A quorum decision requires the simultaneous assent of $n$ agents out of $m$ eligible voters.
The relation is $(\text{proposal}, \{A_{i_1}, \ldots, A_{i_n}\}, \texttt{quorum-approved})$ — an $n$-ary relation between the proposal and the assenting agents.
Binary decomposition (each agent's assent as a binary vote cell) loses the simultaneity condition: the binary encoding can check that $n$ votes are recorded but cannot express that the assents must co-occur in a single normative act.

### Multi-party contracts

A contract $\kappa = (\text{terms}, A_1, \ldots, A_n)$ creates mutual obligations among all $n$ parties simultaneously.
Binary decomposition into pairwise obligations $\langle A_i, \texttt{obligated-to}, A_j\rangle$ loses the $n$-way coherence: the contract's obligations are inter-defined (each party's obligation is conditioned on the others' performance), which the binary cells cannot represent.

### Collective capability requirements

A task that requires *joint* capability (two agents must both be present and each contribute a different capability to a single indivisible action) cannot be expressed as a conjunction of individual capability requirements: the joint capability is irreducibly relational.

## Sub-questions

### (a) Which decompositions are lossless?

For which multi-party relations does binary decomposition preserve all structural content?
The individual-assignment case (multiple agents each independently assigned to the same task, with no joint responsibility) is a candidate for lossless decomposition.
Characterizing the lossless cases would tell us when n-ary predication is *necessary* vs. merely a notational convenience.

### (b) What closure-rule language extensions does n-ary predication require?

The current closure-rule language has rules with antecedents and consequents expressed as binary triples.
N-ary predication would require rule antecedents of the form "if n-ary cell $(s_1, p, s_2, \ldots, s_n)$ is at $\mathbf{t}$..."
The question is whether this extension is within the existing fragment hierarchy or requires a new fragment.
If it requires a new fragment, what is its regime class?

### (c) Does n-ary predication affect CRDT convergence?

The [multi-agent-work-with-local-rules-as-crdt theorem](multi-agent-work-with-local-rules-as-crdt.md) establishes convergence for binary-cell systems.
Does it extend to n-ary predication?
The key question: is the merge operation for n-ary cells still a lattice join (preserving the convergence proof), or does the n-ary structure require a new merge semantics?
