---
type: theorem
status: established
depends-on: [norm-conflict, normative-system, operations-settling, charter-as-closure-system, adjudication-modes-and-h1]
proves: [norm-conflict produces top-valued cells; top cells are conflict witnesses]
title: Norm conflict as $\top$-valued cell
description: A synchronic norm conflict within a governance pattern's normative system $N$ produces a $\top$-valued cell in the operations settling.
---

# Norm conflict as $\top$-valued cell

A synchronic norm conflict within a governance pattern's normative system $N$ produces a $\top$-valued cell in the operations settling. The $\top$ cell is a substrate-detectable witness to the conflict.

## Statement

Let $N$ be a normative system over operations settling $\mathcal{E}_{\mathrm{op}}$, with closure-rule subsystem $\mathcal{S}_N \subseteq \mathcal{S}_{\mathrm{charter}}$. Let $n_1, n_2 \in \mathcal{S}_N$ be two norms such that:

- $n_1$: if antecedent $A_1$ holds (cells $A_1 \subseteq \mathcal{E}_{\mathrm{op}}$ at $\mathbf{t}$) then $\langle s, p, o\rangle \to \mathbf{t}$.
- $n_2$: if antecedent $A_2$ holds (cells $A_2 \subseteq \mathcal{E}_{\mathrm{op}}$ at $\mathbf{t}$) then $\langle s, p, o\rangle \to \mathbf{f}$.

Suppose both $A_1$ and $A_2$ hold simultaneously in the settling. Then:

$$\langle s, p, o\rangle = \mathbf{t} \vee_K \mathbf{f} = \top$$

where $\vee_K$ is the join in the knowledge order of $\mathbf{FOUR}$.

## Proof

By settling monotonicity, the operations settling applies all firing closure rules. When $A_1$ holds, $n_1$ fires and installs the increment $\langle s, p, o\rangle \geq_K \mathbf{t}$. When $A_2$ holds, $n_2$ fires and installs the increment $\langle s, p, o\rangle \geq_K \mathbf{f}$. Both increments are applied by the settling's closure operator. The join of both increments in the knowledge order is $\mathbf{t} \vee_K \mathbf{f} = \top$, since $\mathbf{t}$ and $\mathbf{f}$ are the two elements immediately below $\top$ in the knowledge order of $\mathbf{FOUR}$. The settling takes the knowledge-order join, so $\langle s, p, o\rangle = \top$. $\square$

## The $\top$ cell as conflict witness

$\top$ in the four-bilattice encodes *overdetermined*: the settling has received both positive and negative evidence for the cell, and neither dominates. A $\top$-valued cell in $\mathcal{S}_{\mathrm{charter}}$ is therefore a norm-conflict witness: its $\top$ value records that two norms fired with incompatible consequents.

Auditing for norm conflicts reduces to auditing for $\top$-valued cells in $\mathcal{S}_{\mathrm{charter}}$. The [audit-as-cech-resolution](../../../../../../../../../social-theory-science-services-section/content/text/documents/articles/notes/undated/audit-as-cech-resolution-of-operations-settling.md) morphism performs this audit as part of its Čech resolution.

## Corollary: persistent conflicts and $H^1$

If the norm conflict is not resolved by adjudication — if neither $n_1$ nor $n_2$ is revised, and no authority-gate act resolves the $\top$ cell — the $\top$-valued cell persists in the settling. Because settling is monotone in the knowledge order, the cell cannot retract from $\top$: once overdetermined, it stays overdetermined unless a visible automorphism restructures the settling. The persistent $\top$ cell contributes a non-trivial class to $H^1$ of the operations settling, as established in [adjudication-modes-and-h1](../../../../../../../../../social-theory-science-services-section/content/text/documents/articles/notes/undated/adjudication-modes-and-h1.md). Governance reform (charter amendment) is required to eliminate it.

## Connection to [norm-conflict](../../../../triage/teaching/explanations/norm-conflict.md)

This theorem supplies the formal structure underlying the norm-conflict concept: the concept identifies the phenomenon (two norms in contrariety); this theorem establishes the substrate representation (a $\top$-valued cell) and the persistence consequence ($H^1$ growth). The three resolution paths from the concept — adjudication, norm revision, visible automorphism — correspond to three ways of removing the $\top$ cell: overriding it (adjudication, provisional), rewriting the norm system (norm revision, irreversible), or restructuring the settling (visible automorphism, irreversible).
