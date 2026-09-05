---

name: nuclear-reading-of-objective
description: "Formal nuclear-mathematical reading of the objective concept — achievement as convergence criterion, progress as gap closure, cascading as meet decomposition."
date-created: 2026-04-02
extracted-from: humanities/domains/sociology/domains/work/terms/objective.md
reads: [objective, goal, teleology, friction, judgment]
---


This text provides the relational-mathematical formalization of [objective](../../../humanities/domains/sociology/domains/work/terms/objective.md) using the nuclear quartet framework. The term definition covers the secondary intension (what an objective IS); this text covers how objectives behave in the formal fiber structure.

## Formal definition

An **Objective** is a four-tuple $\mathcal{O} = (o, g, m, \tau)$:

$$\mathcal{O} = (o \in H_t,\; g : \mathrm{Goal},\; m : H_t \to [0,1],\; \tau : \mathrm{Deadline})$$

where:
- $o$ is the **specific target element** — a concrete, measurable element of $H_t$ whose settlement in $H^*_\tau$ constitutes achievement
- $g$ is the **goal** the objective serves — $o \leq g$ in the fiber order
- $m : H_t \to [0,1]$ is the **progress metric** — tracks how close $o$ is to settlement
- $\tau$ is the **deadline** — the specific target history at which $o$ must be in $H^*_\tau$

## Proposition 1: Achievement as convergence criterion

For objective $(o, g, m, \tau)$, the achievement condition $o \in H^*_\tau$ is equivalent to:

$$\mathrm{RelationalHistoryFiberPropositionStableEnvelope}_\tau(o) = o = \mathrm{RelationalHistoryFiberJointNuclearRetraction}_\tau(o)$$

The objective is achieved iff the stable envelope of $o$ at $\tau$ equals $o$ equals the telos of $o$ at $\tau$ — the instability interval has collapsed to a point.

*Proof.* From Teleology Proposition 4 (convergence criterion): $a \in H^*_t$ iff the stabilization-envelope dyad collapses. Applied to $o$ at $\tau$: achievement is exactly the dyad collapse. $\square$

*Content.* The convergence criterion gives the operational test for objective completion: both the stable envelope (the already-secured floor) and the telos (the outstanding commitment ceiling) must equal $o$ itself.

## Proposition 2: Progress as gap closure

The progress metric $m : H_\tau \to [0,1]$ has a canonical nuclear form: $m(o)$ measures what fraction of the instability interval $[\mathrm{RelationalHistoryFiberPropositionStableEnvelope}_\tau(o), \mathrm{RelationalHistoryFiberJointNuclearRetraction}_\tau(o)]$ has been closed.

*Proof.* The instability interval is a well-defined sub-Heyting-algebra containing $o$. Any monotone function from the interval to $[0,1]$ that maps the minimum to 0 and the maximum to 1 and is 1 iff the interval has collapsed gives a valid progress metric. The canonical choice is the lattice-rank of $o$ within the interval normalized to $[0,1]$. $\square$

*Content.* The natural progress metric is nuclear, derived from RelationalHistoryFiberJointNuclearRetraction, not an arbitrary external scale.

## Proposition 3: Objective contribution preserves telos order

If $o \leq g$ in the fiber order, then:

$$\mathrm{RelationalHistoryFiberJointNuclearRetraction}_\tau(o) \leq \mathrm{RelationalHistoryFiberJointNuclearRetraction}_\tau(g)$$

*Proof.* RelationalHistoryFiberJointNuclearRetraction is a nucleus, hence order-preserving: $o \leq g$ implies the inequality. $\square$

*Content.* Objective relevance (the SMART "Relevant" criterion) has a formal content: the objective genuinely contributes to the goal iff $o \leq g$, verified by the telos-order inequality.

## Proposition 4: Objective portfolios close under meet

If $o_1, o_2 \in H^*_\tau$, then $o_1 \wedge o_2 \in H^*_\tau$.

*Proof.* By meet-preservation of both nuclei. $\square$

*Content.* A portfolio of achieved objectives is jointly achieved. This supports objective cascading: if $g = o_1 \wedge \cdots \wedge o_k$, then achieving all $o_i$ achieves $g$. The well-formedness condition for objective decomposition is that the decomposition is a meet in the fiber.

## Proposition 5: Friction can un-achieve objectives

If $o \in H^*_{t_0}$, it does not follow that $\pi^*(o) \in H^*_{t_n}$ for a path $\pi : t_0 \to t_n$. Restriction maps do not preserve $H^*$ in general.

*Proof.* From Friction: $H^*$ is not preserved by arbitrary restriction maps. $\square$

*Content.* The SMART "Time-bounded" criterion has deeper content: the deadline $\tau$ is the specific history at which achievement is assessed. Objectives require monitoring because they can regress.

## Open questions

- Whether the progress metric must be a homomorphism from the fiber Heyting algebra to the unit interval
- Whether objective cascading preserves achievability — whether achieving all lower-level objectives guarantees achievement of the higher-level one
- Whether the progress metric can always be derived from nuclear dynamics for objectives with non-linear instability intervals
- Whether friction-induced regression can be bounded for certain classes of objectives
