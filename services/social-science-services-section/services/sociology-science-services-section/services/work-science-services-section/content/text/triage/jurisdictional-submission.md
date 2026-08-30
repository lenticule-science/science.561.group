---
type: morphism
status: sketch
depends-on: [jurisdiction, jural-relation, operations-settling]
realizes: [jurisdictional-submission]
see-also: [jurisdictional-invocation, jurisdictional-declination, jurisdiction-as-base-change]
---

# Jurisdictional submission

The morphism by which a subject entity $S$ consents to — and thereby reinforces — the operative jurisdiction of an authority $A$ over history-fiber pairs involving $S$.

## Definition

Given a [jurisdiction](../objects/jurisdiction.md) $\mathcal{J} = (A, T_J, H_J, V)$ and a subject entity $S \in E_{\mathrm{op}}$, **jurisdictional submission** is the increment

$$\mathrm{sub}_{\mathcal{J}}(S) \;=\; \langle S, \texttt{submits-to-jurisdiction-of}, A\rangle \;\mapsto\; \mathbf{t}$$

settling the subject's consent cell, adding a knowledge-order increment to the validity-condition evidence for matters involving $S$ within $\mathcal{J}$'s scope.

## Effect

Jurisdictional submission is a witnessing increment, not a jurisdiction-conferring act. The authority's jurisdiction derives from its normative position ($A$'s power-cells, the charter's mandate, the polity's structure), not from subjects' consent. But submission contributes to the validity-condition cell $V(t, a)$ for matters involving $S$: the consent cell fires a closure rule that increments the knowledge-order evidence for $(t, a)$'s validity.

In the Hohfeldian structure: submission is $S$'s exercise of a Hohfeldian power — $S$ has the power to alter their own normative position relative to $A$'s jurisdiction by consenting to it. $S$'s submission creates a new Hohfeldian duty on $S$ to comply with $A$'s directives within $\mathcal{J}$'s scope, a duty $S$ could not otherwise be bound by (for matters where jurisdiction is personal, requiring consent).

## Paraconsistency: submission + prior refusal

If a prior refusal cell $\langle S, \texttt{refuses-jurisdiction-of}, A\rangle$ is already at $\mathbf{t}$ and a submission increment arrives, the resulting state is:

$$v(\langle S, \texttt{submits-to-jurisdiction-of}, A\rangle) = \mathbf{t} \;\;\wedge\;\; v(\langle S, \texttt{refuses-jurisdiction-of}, A\rangle) = \mathbf{t}$$

These are *distinct* cells — the submission is not a negation of the refusal but an additional assertion. The knowledge-order join accumulates both pieces of evidence; the adjudication machinery (and the governance layer) determines which takes precedence. Submission does not retract refusal; it adds a competing body of evidence.

## Relation to personal jurisdiction

For matters where jurisdiction is *personal* (requiring the subject's presence or consent), jurisdictional submission is the operational prerequisite for the jurisdiction's validity-condition to be satisfied. Without submission, personal-jurisdiction validity-condition $V$ fails; the authority's invocation is ultra-vires for $S$-involving matters. With submission, the validity-condition cell receives a knowledge-order increment, potentially satisfying $V$ if the other preconditions (temporal/subject-matter) are also met.
