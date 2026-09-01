---
type: concept
class: governance-pattern-component
depends-on: [authority-gate, governance-pattern, normative-system]
realizes: [governance-indicator, ordinal-society]
see-also: [deontic-hyperdoctrine, ordinal-society-as-governance-pattern]
---

# Score-governed authority gate

A **score-governed authority gate** is an [authority-gate](authority-gate.md) whose threshold predicate operates on *continuous-valued* score cells rather than bilattice-valued capability or duty cells.
It is the PredGov formalization of the governance-by-indicators and ordinal-society governance patterns: authority fires (grants access, assigns status, allocates opportunity) when an agent's aggregate score cell exceeds a threshold.

## Structure

In the standard [authority-gate](authority-gate.md) pattern, a residuation condition $a \Rightarrow g$ gates access — an authority cell $a$ and a grant specification $g$ determine whether the gate opens.
The score-governed variant replaces the discrete bilattice condition with a continuous threshold condition:

$$\mathrm{gate}(S, A, \theta) \;:\;\; v(\langle S, \texttt{score}\rangle) \geq \theta \;\Longrightarrow\; \langle S, \texttt{access-granted}, R\rangle = \mathbf{t}$$

where: - $S$ is the scored subject entity. - $v(\langle S, \texttt{score}\rangle) \in [0, 1]$ (or $\mathbb{R}$) is a continuous-valued score cell in a [continuous-valued-settling](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/continuous-valued-settling.md) extension of the operations settling. - $\theta$ is the threshold value. - $R$ is the resource, role, or opportunity to which access is granted.

## What this captures

Score-governed authority gates are the substrate pattern underlying:

- **Credit scores and housing/lending access** (if score ≥ 700, approve mortgage)
- **Platform reputation scores and job assignment** (if driver rating ≥ 4.5, eligible for premium rides)
- **Criminal risk scores and bail/parole decisions** (if risk score < threshold, grant release)
- **Academic rankings and institutional access** (if school rank ≥ $k$, admit applicant)

In each case, an aggregate numerical score gates a consequential normative outcome (access, assignment, freedom, admission).
The gate fires continuously as new behavioral data arrives and updates the score cell — the [continuous-valued settling](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/continuous-valued-settling.md) is re-run with each new data increment.

## Distinction from bilattice-valued authority gates

The standard authority-gate has a bilattice-valued grant cell: either the grant is at $\mathbf{t}$ (access granted), $\mathbf{f}$ (access denied), $\bot$ (not yet determined), or $\top$ (contested).
The score-governed gate has a continuous threshold: access is granted when the score exceeds $\theta$, with no explicit bilattice state for the grant condition itself — the gate is open or closed as a function of a real-valued comparison.

This makes the score-governed gate *non-monotone in the knowledge order* in a sense the standard gate is not: the standard gate can only open (move from $\bot$ to $\mathbf{t}$) via knowledge-order increments.
The score-governed gate can close again if the score drops below $\theta$ — the access-granted cell is re-computed at each settling step.
This is a structural difference from the settling-monotone character of standard bilattice settling.

## Governance consequences of the score pattern

The [ordinal-society](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/governance/terms/ordinal-society.md) analysis identifies three features of score-governed governance that the substrate can now make precise:

1. **Continuous scale rather than categorical class:** the score cell takes real values; the access condition is a threshold comparison, not a categorical membership predicate.
  The substrate formally distinguishes this: no closure rule fires "subject $S$ is in the granted class"; instead, "subject $S$'s score cell exceeds $\theta$" fires the access rule directly.

2. **Individual-level granularity:** each subject entity $S$ has their own score cell.
  The score is individuated: $\langle S, \texttt{score}\rangle$ is a predicate on $S$ specifically, not a group-membership predicate.

3. **Continuous re-ranking:** the score cell is updated by each new behavioral-trace increment.
  The access-granted cell is re-evaluated at each settling step.
  Subjects must maintain their score above $\theta$ continuously, not merely qualify once.

The governance consequence: unlike categorical eligibility (once established, stable until revoked), score-governed access is inherently unstable.
Subjects' normative standing oscillates with their score.
This is a structural property of the score-governed gate, not a policy choice — it follows from the continuous re-evaluation of the threshold condition.
