---
type: concept
class: scope
depends-on: [application-sublocale]
see-also: [office, governance, application-sublocale]
title: Scope
description: A bounded region of the predication-graph store within which an agent's skill invocations and runbook executions are admissible — the platform's notion of "where this agent is allowed to act." A scope is determined by an application…
---

# Scope

A bounded region of the [predication-graph store](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md) within which an [agent](agent.md)'s [skill invocations](../skill/skill-invocation/skill-invocation.md) and [runbook](runbook.md) executions are admissible — the platform's notion of "where this agent is allowed to act."
A scope is determined by an [application sublocale](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/application-sublocale.md): the predicates the scope admits, the closure-rule subset operating within it, and the nucleus that projects the visible region.

Three engineering uses:

- **Sandboxing.** An agent operating within scope $\sigma$ may insert predications only on entities whose visibility through $\sigma$'s nucleus admits the insertion.
  An attempt to insert outside the scope is either rejected (returning an error in the witness) or is escalated to an agent at a containing scope (see [escalation](../governance/escalation/escalation.md)).
- **Capability boundary.** An agent's capability predications cite the scope within which a capability is held.
  "This agent has skill $s$ in scope $\sigma$" means the agent may invoke $s$ when operating in $\sigma$ — not in any other scope.
  Capability is scope-typed, not global.
- **Audit boundary.** A [witness](../../teaching/explanations/witness.md) cites the scope at which the witnessed action took place.
  An auditor reviewing the scope's history reads only the witnesses cited at that scope; activity in other scopes is not visible.
  This is the engineering content of *organizational compartmentalization* — different teams, different applications, different security domains.

Scopes compose.
A scope $\sigma_2$ contained in scope $\sigma_1$ admits all predicates and closure rules in $\sigma_2$'s vocabulary, plus those of $\sigma_1$ that propagate inward through $\sigma_2$'s nucleus.
An agent at the inner scope $\sigma_2$ may act on $\sigma_2$'s vocabulary; an agent at the outer scope $\sigma_1$ may act across both.

Scope and office are sometimes conflated — the agent-with-bounded-authority pattern.
The modern formulation distinguishes: an [office](office.md) is an agent entity bearing scope-bounded capability predications; a scope is the application sublocale that defines the bound.
An office is *in* a scope; a scope does not act, only entities at the scope act.
