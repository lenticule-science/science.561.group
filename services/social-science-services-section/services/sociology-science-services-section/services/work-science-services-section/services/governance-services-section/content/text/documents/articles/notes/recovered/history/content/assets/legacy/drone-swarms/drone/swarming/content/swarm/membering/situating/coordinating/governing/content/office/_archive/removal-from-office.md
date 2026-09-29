---
type: question
status: open
explores: [office-as-double-settlement, installation, succession-as-handoff-cobordism, estoppel-as-monotone-coalgebra-fixed-point, authority-gate]
---

# What is the substrate formal structure of forced removal from office?

An office $O$ is a double-settlement entity: it requires two predications — recognition ($\langle O, \texttt{recognized-as-legitimate}\rangle = \mathbf{t}$) and induction ($\langle A, \texttt{inducted-into}, O\rangle = \mathbf{t}$ for the current holder $A$) — as established in [recognition-as-bigraded-common-knowledge](../theorems/recognition-as-bigraded-common-knowledge.md).
The officeholder's authority flows through these two settled cells.

[Succession-as-handoff-cobordism](../morphisms/succession-as-handoff-cobordism.md) handles the willing transfer of office: the outgoing holder's induction cell is superseded by the incoming holder's induction cell via a cobordism.
[Estoppel-as-monotone-coalgebra-fixed-point](../theorems/estoppel-as-monotone-coalgebra-fixed-point.md) handles prospective closure: the holder is prevented from acting as-if they hold on specific acts, without terminating the office.
Neither mechanism covers the involuntary case: an officeholder who does not consent to vacate, and who must be removed by an authority external to the holder.

## The settling-monotonicity tension

The core difficulty: the induction cell $\langle A, \texttt{inducted-into}, O\rangle = \mathbf{t}$ has settled to $\mathbf{t}$.
Under settling monotonicity, this cell cannot retract — it cannot return to $\bot$ or advance to $\mathbf{f}$ from $\mathbf{t}$ (knowledge order: $\mathbf{t}$ is maximal among non-$\top$ positive values).
Forced removal cannot be a retraction of the induction cell.

One candidate: removal is represented not as retraction of the induction cell, but as installation of a *removal cell* $\langle A, \texttt{removed-from}, O\rangle = \mathbf{t}$.
The charter contains closure rules that fire on this removal cell to block $A$'s authority-gate — preventing $A$ from exercising office-based authority even as the induction cell remains at $\mathbf{t}$.
The induction cell records the historical fact that $A$ was inducted; the removal cell records the subsequent fact that $A$ was removed.
Both cells settle monotonically; neither contradicts the other in the knowledge order.

If both the induction cell and the removal cell are at $\mathbf{t}$, the office history is: inducted, then removed.
The authority-gate fires based on the most recent relevant cell — the removal cell's $\mathbf{t}$ value blocks the induction cell's authority grant.

## Sub-questions

### (a) Who holds the removal right?

The authority-gate for the removal act — the cell $\langle P, \texttt{removal-right}, O\rangle = \mathbf{t}$ that authorizes $P$ to install the removal cell — must itself be settled.
Who holds this right?
Three candidates: (i) the principal who originally installed $A$ (installation and removal held by the same authority); (ii) a quorum of the governed community (removal requires collective assent — parallel to [quorum-as-colimit-of-voter-fibers](../theorems/quorum-as-colimit-of-voter-fibers.md)); (iii) a distinct removal office (an officer whose sole authority is removing other officers).
Different governance patterns assign this right differently.

### (b) Does forced removal require a visible automorphism?

[Charter-amendment-as-visible-automorphism](../theorems/charter-amendment-as-visible-automorphism.md) shows that structural changes to the normative system require a publicly recognized restructuring act.
Does forced removal of an officeholder — which changes the office's effective holding without changing the normative system's structure — require a visible automorphism?
Or is it a routine application of existing charter rules (installation of the removal cell by an authorized principal)?

### (c) The gap between removal and succession

Succession is a cobordism with two cooperative endpoints; forced removal has only one cooperative endpoint (the removing authority), not two.
Is there a one-ended cobordism formalism for removal — a morphism that takes the outgoing holder's state as input without requiring their cooperation?
Or does removal require a different categorical structure than succession?

### (d) Vacancy after removal

When $A$ is removed and no successor is immediately installed, the office $O$ enters a vacancy state.
In the substrate: the recognition cell remains at $\mathbf{t}$ (the office is still recognized as legitimate), the induction cell $\langle A, \texttt{inducted-into}, O\rangle$ remains at $\mathbf{t}$ (historical fact), and the removal cell $\langle A, \texttt{removed-from}, O\rangle$ is at $\mathbf{t}$, but no $\langle A', \texttt{inducted-into}, O\rangle$ exists for a new holder $A'$.
What authority-gate behavior applies during vacancy?
Charter rules may specify interim holding, automatic succession, or mandatory quorum action to fill the vacancy.
