---
type: definition
class: substrate-tuple
status: draft
symbol: "\\mathrm{Inc}"
depends-on: [office-as-double-settlement, jural-relation]
realizes: [incumbent]
---

# Incumbent

The mathematical realization of an [incumbent](../../../../../../../../../../../../../lib/legacy/2026-07-31-lenticule-science-corpus/library/social-sciences/sociology/_archive/from-discourse-domain-locus-work-studies/incumbent/incumbent.md) per the library's quadruple definition: the formal tuple recording that a particular agent currently holds a particular office at a particular history.

## Data

An incumbent $\mathrm{Inc}$ at stage $\tau^*$ is a quadruple

$$\mathrm{Inc} \;=\; (O,\; \tau^*,\; a,\; \iota)$$

instantiated on the operations base:

- $O \in E_{\mathrm{op}}$ — the [office](../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/lib/legacy/2026-06-23-animating/content/becoming/doing/working/governing/content/individual/content/agent/actuating/content/actuator/embodying/content/body/integrating/content/drone/swarming/content/swarm/membering/situating/coordinating/governing/content/office/_archive/office-as-double-settlement.md), as a substrate entity. Its structural cells (normative-structure, action-domain, deontic-profile-actions) are distinct from the candidate predicates.
- $\tau^* < \lambda$ — the *current stage* of the operations settling at which the incumbency holds. Incumbency is stage-indexed: it holds at $\tau^*$, not necessarily at all $\tau$.
- $a \in E_{\mathrm{op}}$ — the *occupant* — a substrate entity (typically an agent, persona, or personnel record) named by the incumbency. The occupant is an entity, not a value in $\mathbf{FOUR}$; the substrate carries claims about $a$, not $a$ itself.
- $\iota$ — the *incumbency proposition*, an entity in $E_{\mathrm{op}}$ standing for the assertion *$a$ holds $O$ at $\tau^*$*. Concretely, $\iota$ carries cells $\langle \iota, \texttt{occupant}, a\rangle = \mathbf{t}$, $\langle \iota, \texttt{office}, O\rangle = \mathbf{t}$, $\langle \iota, \texttt{at-stage}, \tau^*\rangle = \mathbf{t}$.

## Full incumbency: joint settlement of two predicates

Per the library's [incumbent](../../../../../../../../../../../../../lib/legacy/2026-07-31-lenticule-science-corpus/library/social-sciences/sociology/_archive/from-discourse-domain-locus-work-studies/incumbent/incumbent.md) text, full incumbency is the condition that two predicates over $\iota$ have both reached affirming settlement at $\tau^*$:

- *Institution* — the predicate that $O$'s authority has been conferred on $\iota$. Affirming settlement means the past has settled the meaning of the appointment (recognized authority). The cell $\langle \iota, \texttt{instituted-into}, O\rangle = \mathbf{t}$.
- *Induction* — the predicate that corporeal possession has been entered. Affirming settlement means the occupancy is forward-active, present in every continuation of $\tau^*$. The cell $\langle \iota, \texttt{inducted-into}, O\rangle = \mathbf{t}$.

This is identical in shape to the [office-as-double-settlement](../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/lib/legacy/2026-06-23-animating/content/becoming/doing/working/governing/content/individual/content/agent/actuating/content/actuator/embodying/content/body/integrating/content/drone/swarming/content/swarm/membering/situating/coordinating/governing/content/office/_archive/office-as-double-settlement.md) two-required-predicates structure, applied here at the incumbent-quadruple granularity rather than the office-as-quadruple granularity. The library uses *recognition* and *institution* interchangeably for the past-settling axis; the substrate-level cells use whichever name aligns with the operational vocabulary.

## Body politic / body natural

Per Kantorowicz's two-body doctrine, the office's normative structure is the *body politic* (the structural assertions of $O$); the occupant $a$ is the *body natural* (a substrate entity, indexed to the current stage).

*Dignitas non moritur* in the substrate is conditional: when an office's structural assertions and epoch are held fixed, changing an occupant or incumbency proposition does not itself change its normative structure. [Office-as-double-settlement](../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/lib/legacy/2026-06-23-animating/content/becoming/doing/working/governing/content/individual/content/agent/actuating/content/actuator/embodying/content/body/integrating/content/drone/swarming/content/swarm/membering/situating/coordinating/governing/content/office/_archive/office-as-double-settlement.md) treats that structure separately from the candidate predicates; this is a governance/structural preservation condition. [Settling monotonicity](../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/settling-monotonicity.md) instead permits an affirming $\mathbf{t}$ to rise to $\top$ when denying evidence arrives, so it alone does not preserve any cell exactly at $\mathbf{t}$. Vacancy of $O$ at stage $\tau$ means: no $\iota'$ has both required predicates at $\mathbf{t}$ at $\tau$; the incumbency evidence of any specific $\iota$ may change independently of the stated structural condition.

## Succession instantaneity

When the previous incumbent's $\iota$ retires (e.g., $\langle \iota, \texttt{relieved-by}, A\rangle = \mathbf{t}$ for some authority $A$) and a new incumbency proposition $\iota'$ is admitted by [installation](../morphisms/installation.md), under the stated structural preservation condition, the office $O$'s structural cells are unchanged. The "instantaneous succession" — the body politic passes — is the substrate-algebraic fact that $O$'s deontic profile transfers to whichever $\iota$ currently has both required predicates at $\mathbf{t}$, and the moment that joint settlement holds for $\iota'$ is the moment of new incumbency. Under the stated structural preservation condition, changing the occupant does not itself require the office's structural cells to be re-settled.

## Connection to officer

The library's [officer term](../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/lib/legacy/2026-06-23-animating/content/becoming/doing/working/governing/content/individual/content/agent/actuating/content/actuator/embodying/content/body/integrating/content/drone/swarming/content/swarm/membering/situating/coordinating/governing/content/office/_archive/officer.md) names the natural-person occupant $a$ of the incumbency. Where *incumbent* is the formal tuple, *officer* is the natural-person view: the human or AI agent currently bearing the office's authority. The substrate-algebraic distinction:

- **Officer:** the entity $a$.
- **Incumbent:** the tuple $(O, \tau^*, a, \iota)$ — the office, the stage, the occupant, the incumbency proposition.

A query "who is the officer of $O$ at $\tau^*$?" returns $a$. A query "is the incumbency held?" returns the joint-settlement state of the two required predicates over $\iota$.
