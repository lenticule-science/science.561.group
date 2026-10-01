---
type: theorem
class: formal-claim
status: draft
depends-on: [conduct-teachings-as-evaluation-predicates, authority-gate, jural-relation, operations-settling, settling-monotonicity]
proved-by: [bilattice-truth-order-meet, authority-gate-conjunction-structure]
title: Teachings Loss as Authority-Gate Revision
description: "Formal statement of the structural consequence when a conduct-teachings discipline is in force: degradation of any single teaching-evaluation cell is sufficient to block the authority-gate for the teachings-governed agent — without any…"
---

# Teachings Loss as Authority-Gate Revision

Formal statement of the structural consequence when a [conduct-teachings](../../../../../../services/predicated-work-services-section/services/predicated-governance-services-section/content/text/glossary/terms/conduct-teachings-as-evaluation-predicates.md) discipline is in force: degradation of any single teaching-evaluation cell is sufficient to block the authority-gate for the teachings-governed agent — without any revocation act.

## Setup

Let $(\Theta, \varepsilon, J)$ be a conduct-teachings discipline on the operations-settling $\mathcal{E}_{\mathrm{op}}$, where:

- $\Theta = \{\theta_1, \ldots, \theta_n\}$ is the named set of teachings.
- $\varepsilon(A, \theta) \in \mathbf{FOUR}$ is the evaluation cell value for agent $A$ on teaching $\theta$, maintained by community-judgment witnesses.
- $J$ is the community-judgment recognition mechanism: a [consensus-closure](../../../../../../services/predicated-work-services-section/services/predicated-governance-services-section/content/text/glossary/terms/consensus-closure.md) over evaluation witnesses that resolves contested evaluations.

Let $\mathrm{gate}(A, X)$ denote the authority-gate cell for agent $A$ performing act $X$ under this discipline.

## Theorem

Under a conduct-teachings discipline, the closure rule for $\mathrm{gate}(A, X) = \mathbf{t}$ has antecedent:

$$\bigwedge_{t} \left\{ \varepsilon(A, \theta) = \mathbf{t} \;\middle|\; \theta \in \Theta \right\} \;\wedge\; \langle A, \texttt{jural-standing}, X\rangle = \mathbf{t}.$$

Therefore:

$$\left(\exists\, \theta_i \in \Theta \;\text{ s.t. }\; \varepsilon(A, \theta_i) \neq \mathbf{t}\right) \;\Longrightarrow\; \mathrm{gate}(A, X) \neq \mathbf{t} \;\text{ for all } X \text{ in the teachings-governed scope.}$$

## Proof

By the [authority-gate](../../../../triage/teaching/explanations/authority-gate.md) structure, the gate-cell fires to $\mathbf{t}$ only when all antecedents are at $\mathbf{t}$ in the truth order. The bilattice truth-order meet satisfies: if any conjunct is not $\mathbf{t}$, the meet is not $\mathbf{t}$. For any $\theta_i$ with $\varepsilon(A, \theta_i) \neq \mathbf{t}$:

- If $\varepsilon(A, \theta_i) = \mathbf{f}$: the antecedent meet is $\mathbf{f}$; the gate-closure rule's antecedent fails; $\mathrm{gate}(A, X) = \mathbf{f}$.
- If $\varepsilon(A, \theta_i) = \bot$: the antecedent meet is at most $\bot$; the gate-closure rule's antecedent is unsettled; $\mathrm{gate}(A, X) \neq \mathbf{t}$.
- If $\varepsilon(A, \theta_i) = \top$: the meet is $\top$ (overdetermined); the gate is contested, $\mathrm{gate}(A, X) = \top$. $\square$

## Endogeneity

This is an *endogenous* authority-gate revision: no external actor performs a revocation act. The gate fails because the evaluation-profile no longer satisfies the teaching-discipline's conjunction. Contrast with:

- [Revocation](../../../../../../services/predicated-work-services-section/services/predicated-governance-services-section/content/text/glossary/terms/revocation.md): a principal's explicit morphism that installs a revocation-witness cell.
- [Removal from office](../../../../triage/questions/removal-from-office.md): an external authority's decision that drives the recognition predicate.

In each of those, an agent acts to produce authority-gate failure. Here, authority-gate failure is a *structural consequence* of cell-value changes in the evaluation predicate — no separate act is required or performed.

The structural content: in a teachings-governed polity, authority is continuously earned by the incumbent's conduct, not permanently vested by installation. Installation places the agent in office; the teachings evaluation keeps them there. This is the substrate-algebraic content of the Anishinaabe Seven Grandfathers principle: leadership is continuously accountable to teachings, not a tenure.

## Monotonicity and the community-deliberation window

By [settling-monotonicity](../../../../../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), prior $\varepsilon(A, \theta) = \mathbf{t}$ cells are not retracted when new evaluation witnesses settle $\varepsilon(A, \theta_i) = \mathbf{f}$. The bilattice knowledge-order join of the historical $\mathbf{t}$ cell and the new $\mathbf{f}$ cell is $\top$: the evaluation is contested.

The community-judgment mechanism $J$ resolves the contest via its consensus-closure rule, ultimately settling the evaluation at $\mathbf{t}$ or $\mathbf{f}$. Until $J$ resolves:

- $\mathrm{gate}(A, X) = \top$: authority is contested rather than definitively present or absent.
- Acts performed by $A$ during this period produce $\top$-valued authorization cells — their legitimacy is disputed.

The $\top$-valued window between evaluation-challenge and community-judgment resolution is the substrate-algebraic representation of the deliberation period when a leader's conduct is under question.

## Installation and suspended authority

An agent installed into an office governed by a teachings discipline holds the office's deontic profile only while the teachings conjunction holds. Deterioration in $\varepsilon(A, \theta_i)$ does not invalidate the installation — historical cells persist, and the [recognition-as-bigraded-common-knowledge](../../../../theorems/recognition-as-bigraded-common-knowledge.md) structure remains intact — but blocks the authority-gate derivable from that installation.

The installation is intact; the gate is blocked. This is the structural form of "the office still recognizes you, but you cannot act from it" — a state of suspended authority that is distinct from vacancy (no incumbent) and from removal (recognition predicate driven to $\mathbf{f}$).

## Composition with rotational authority

When [rotational-authority](../../../../../../services/predicated-work-services-section/services/predicated-governance-services-section/content/text/glossary/terms/rotational-authority.md) is composed with a teachings discipline, the eligibility condition for the next-rotation incumbent requires:

$$\bigwedge_{\theta \in \Theta} \varepsilon(A, \theta) = \mathbf{t} \;\text{ at selection time.}$$

The rotation cycle and teachings evaluation run concurrently; their composition in the same [governance-pattern](../../../../triage/teaching/explanations/governance-pattern.md) coproduct produces a system where authority cycles through the population *and* is continuously accountable to teachings. An incumbent with degraded evaluations faces both the current-term authority block (this theorem) and ineligibility for re-selection (the rotation-selection rule).
