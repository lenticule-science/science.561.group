---
type: example
class: instantiation
status: draft
depends-on: [witness-as-increment, capability-fiber-bundle, project-fiber-to-capability, dispatch-monotonicity]
title: Granting a capability is a witness-increment that lifts dispatch readiness
description: A working community grants agent $A$ the capability $c$ — perhaps by completing $A$'s training, recording $A$'s certification, or admitting $A$ to a role.
---

# Granting a capability is a witness-increment that lifts dispatch readiness

A working community grants agent $A$ the capability $c$ — perhaps by completing $A$'s training, recording $A$'s certification, or admitting $A$ to a role.
In the predicated-work theory, the grant is a single substrate operation: a [witness](../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/text/glossary/terms/witness-as-increment.md) increment on the cell $\langle A, \texttt{provides-capability}, c \rangle$ asserting value $\mathbf{t}$.
This worked example traces what that single operation entails downstream.

## The increment

At stage $\tau$, the grant is the increment

$$u_\tau\bigl(\langle A, \texttt{provides-capability}, c \rangle\bigr) \;=\; \mathbf{t}.$$

Before the grant: $v^{\mathrm{op}}_\tau\bigl(\langle A, \texttt{provides-capability}, c \rangle\bigr) = \bot$ (no information).
After the grant: $v^{\mathrm{op}}_{\tau+1}\bigl(\langle A, \texttt{provides-capability}, c \rangle\bigr) = \bot \vee_k \mathbf{t} = \mathbf{t}$.

The change is local to the cell, but its consequences propagate via the closure-rule subsystem.

## Downstream consequence 1 — capability-availability fiber updates

By [capability-availability-from-existential](../../../../glossary/concepts/capability-availability-from-existential.md), the availability fiber at $c$ is the knowledge-order join over all agents: $$\mathrm{avail}(c) \;=\; \bigvee_{A'}^{(k)} \sigma_{A'}(c).$$

Suppose before the grant $\mathrm{avail}(c) = \bot$ (no agent has been recorded as providing $c$).
The increment lifts $\sigma_A(c)$ from $\bot$ to $\mathbf{t}$, which lifts $\mathrm{avail}(c)$ from $\bot$ to $\mathbf{t}$ via the [project-fiber-to-capability](../../../../glossary/terms/project-fiber-to-capability.md) morphism.
The capability becomes *operationally available in the community* by virtue of $A$'s grant.

## Downstream consequence 2 — dispatch readiness lifts for $A$ on $c$-requiring tasks

For any task $T$ with $c$ in its required-capability section, the [dispatch morphism](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/actuating/content/actuator/embodying/content/body/integrating/content/drone/swarming/content/swarm/content/social/_archive/sociology/content/work/theories/predicated-work/morphisms/dispatch.md) value $$\delta(A, T) \;=\; \bigwedge_{c' \in C}^{(t)} (\rho_T(c') \Rightarrow \sigma_A(c'))$$ has the $c$-coordinate residual $\rho_T(c) \Rightarrow \sigma_A(c)$ updated from $(\rho_T(c) \Rightarrow \bot)$ to $(\rho_T(c) \Rightarrow \mathbf{t})$.
The latter is $\mathbf{t}$ if $\rho_T(c) \in \{\bot, \mathbf{t}\}$ — i.e., the requirement is either uncommitted or positive.

By [dispatch-monotonicity](dispatch-monotonicity.md), $\delta(A, T)$ can only increase or preserve in the knowledge order.
If $\delta(A, T)$ was previously $\bot$ (under-determined) due to the $c$-coordinate, the grant may lift it to $\mathbf{t}$ (ready) — *provided* every other required capability of $T$ is also at least $\mathbf{t}$.

## Downstream consequence 3 — closure-rule cascade

The grant is the antecedent for any closure rule whose consequent depends on $A$ providing $c$.
Examples in a typical operations subsystem:

- Notification rules: "if $A$ provides $c$, increment the cell $\langle A, \texttt{notified-of-}c\texttt{-grant}, \mathrm{community}\rangle$."
- Eligibility-snapshot rules: "if $A$ provides $c$ and there is a pending $c$-requiring task $T$, set $\langle A, \texttt{eligible-for}, T\rangle = \mathbf{t}$."
- Audit rules in the [predicated-governance](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/actuating/content/actuator/embodying/content/body/integrating/content/drone/swarming/content/swarm/content/social/_archive/sociology/content/work/theories/predicated-work/examples/theories/predicated-governance) layer: "if $A$ provides $c$ at stage $\tau$ and the granting body did not hold the power-to-grant at $\tau$, set $\langle A, \texttt{provides-capability}, c\rangle = \top$" (i.e., contradict the grant on normative grounds — a repair condition rather than a silent override).

## CALM for the grant cascade

The grant increment $u_\tau(\langle A, \texttt{provides-capability}, c\rangle) = \mathbf{t}$ is $\leq_k$-monotone: once settled, the cell stays at $\mathbf{t}$ (or advances to $\top$ if contradicted).
By the [predication-settling CALM corollary](../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/formalization/infomaterial/lib/infomaterial/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/settling-calm-corollary.md):

- Confirming "has agent $A$ been granted capability $c$?" is coordination-free: any replica that has received the grant increment can confirm it locally.
- Confirming "has $A$ *not* been granted $c$?" requires coordination — it confirms the absence of the grant increment across all log replicas.

All three downstream consequences (capability-availability lift, dispatch-readiness lift, closure-rule cascade) inherit this CALM property: they fire on the positive grant cell, so confirming their *firing* is also coordination-free.
Confirming that the availability fiber has *not* been updated requires confirming the grant has not occurred, which requires coordination.

The eligibility-snapshot rule fires locally once the closure operator delivers the grant cell: any node running the closure operator can determine $A$'s eligibility for $c$-requiring tasks without central coordination.
This is the CALM-theoretic content of "capability enrollment propagates coordination-free."

## LES for the unauthorized-grant case

The audit closure rule — "if $A$ provides $c$ at stage $\tau$ and the granting body did not hold the power-to-grant at $\tau$, set $\langle A, \texttt{provides-capability}, c\rangle = \top$" — drives the grant cell to $\top$ when the grant is normatively unauthorized.
In the [truth-knowledge long exact sequence](../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/truth-knowledge-cohomology-long-exact-sequence.md) applied to the capability-grant sheaf $\mathcal{F}_{\mathrm{grant}}$:

The audit rule's contradiction $(\mathbf{t}$ grant, $\mathbf{f}$ granting-authority) makes $\mathcal{F}^{(\top)}_{\mathrm{grant}} \neq 0$ at capability $c$ for agent $A$.
The connecting morphism $\partial: H^0(\mathcal{F}^{(\top)}_{\mathrm{grant}}) \to H^1_t(\mathcal{F}^{(t)}_{\mathrm{grant}})$ is non-zero.
The unauthorized grant is cohomologically flagged with a degree-1 obstruction.

This is the LES signature of an illegitimate credential: not silently valid (the grant cell is not left at $\mathbf{t}$) and not silently invalid (the grant cell is not retracted to $\mathbf{f}$ — settling-monotonicity forbids lowering a $\mathbf{t}$ cell).
The $\top$-cell is the substrate's repair condition: the grant is recorded but flagged as contested, pending governance adjudication.
The downstream consequences (dispatch-readiness, availability fiber) inherit the $\top$: $\delta(A, T)$ becomes $\top$ on the $c$-coordinate if $\sigma_A(c) = \top$, surfacing the unauthorized-capability problem at dispatch time.

## What the example shows

The example is small but exhibits the substrate-native architecture: a single witness increment cascades through (i) fiber-bundle projections, (ii) dispatch-readiness updates protected by [monotonicity](dispatch-monotonicity.md), and (iii) closure-rule consequences that may cross into the [normative-operational layering](../../../../../../../../../../../social-science-services-section/services/social-theory-science-services-section/content/text/glossary/concepts/normative-operational-layering.md).
No special "grant-handling" subsystem is required; the architecture is the [closure-driven coordination](../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/concepts/closure-driven-coordination.md) of predicated-work.
The CALM and LES analysis show the coordination structure of the cascade: positive grant propagation is coordination-free; unauthorized-grant detection is a LES obstruction requiring adjudication.
