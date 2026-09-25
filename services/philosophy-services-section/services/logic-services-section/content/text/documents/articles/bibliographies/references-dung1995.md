---
type: reference
authors: [Dung, Phan Minh]
year: 1995
title: "On the Acceptability of Arguments and its Fundamental Role in Nonmonotonic Reasoning, Logic Programming, and n-Person Games"
venue: "Artificial Intelligence 77(2), 321–357"
description: P.
---

## Full citation

P. M. Dung. "On the acceptability of arguments and its fundamental role in nonmonotonic reasoning, logic programming, and n-person games." *Artificial Intelligence* 77(2), 321–357, 1995.

## Status

Pending direct access. Cited via secondary literature on argumentation frameworks.

## Annotation

Founding paper of **abstract argumentation frameworks** (AAF). An argumentation framework is a pair $(A, R)$ where $A$ is a set of *arguments* and $R \subseteq A \times A$ is an *attack relation*: $(a, b) \in R$ means argument $a$ attacks (defeats) argument $b$. Dung defines several semantics for *acceptability* — *grounded*, *preferred*, *stable*, *complete* extensions — each characterizing which subsets of $A$ are jointly acceptable as a coherent position despite the attack structure. The framework unifies and abstracts the semantics of nonmonotonic reasoning systems (default logic, autoepistemic logic, logic programming), and recasts $n$-person game-theoretic equilibrium concepts as argumentation semantics.

For the corpus, this is the standard literature for **multi-agent argumentative reasoning where agents make defeating arguments** — relevant to the agentic-swarm-theory study plan's **Direction 4 (paraconsistent multi-agent epistemic logic)**. The natural correspondence:

- Dung's **arguments** $\leftrightarrow$ corpus's bilattice-valued cell judgments.
- Dung's **attack relation** $\leftrightarrow$ corpus's bilattice $\mathbf t / \mathbf f$ disagreement (an argument's $\mathbf t$-judgment attacks another's $\mathbf f$-judgment on the same cell).
- Dung's **acceptable extensions** $\leftrightarrow$ corpus's [d-frame consensus](../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/theorems/bilattice-network-sheaf-consensus.md) sections (subsets of agents whose joint $\mathrm{con}$-relation is consistent).
- Dung's **paraconsistent / inconsistent positions** $\leftrightarrow$ corpus's $\top$-witnesses (con-failure cells in the d-frame join).

The correspondence has not been formalized in the corpus; the natural deliverable would be a translation theorem showing that abstract-argumentation acceptability semantics is recovered from the bilattice / d-frame settling on a multi-observer system whose observers are arguments and whose settling-morphisms encode the attack relation.

Dung's work also predates the modern bilattice / paraconsistent-logic literature in addressing the same conceptual ground — his "complete extensions" semantics is structurally close to Belnap's four-valued logic on the lattice of acceptable positions.

## Where used

- [Toward agentic swarm theory narrative](../notes/undated/toward-agentic-swarm-theory.md) — Direction 4 literature reference for argumentation frameworks.
