---
type: definition
class: structure
realizes: [dispatch]
depends-on: [agent, skill, twist-product-fusion, closure-rule-system, predication-fiber-algebra, bilattice]
see-also: [agential-orchestration-platform, dispatch-matching, dispatch-composes-authorization]
title: Dispatch table
description: The engineering structure that supports dispatch.
---

# Dispatch table

The engineering structure that supports [dispatch](teaching/explanations/dispatch.md).
A dispatch table is structurally a sub-rule-system of the platform's [closure-rule system](../../../objects/closure-rule-system.md) — the rules that fire on work-arrival cells and produce agent-assignment cells via [twist-product fusion](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md) of work-type and capability predications.

Concretely, a dispatch table is a sub-graph of the [predication-graph store](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md) consisting of:

- The capability-predication index — a derived view that, for each capability predicate $c$, returns the set of [agent](teaching/explanations/agent.md) and [skill](teaching/explanations/skill.md) entities carrying $c$.
- The work-type-to-capability mapping — predications recording which work-type predicates require which capability predicates as a precondition for handling.
- The match-policy — the closure rule (or family of rules) that, given a message and a candidate set, computes the [bilattice](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice.md)-valued match strength via $\odot$ ([twist-product fusion](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md)).

Two engineering benefits of having dispatch as a *table* (a sub-rule-system) rather than as a hardcoded routing function:

- **Dispatch policy is replaceable.** Switching from a fairness-based policy to a priority-based policy is editing the match-policy closure rule.
  There is no compiler step; the new policy is in effect on the next [tick](teaching/explanations/tick.md).
  Per [closure-rule-system](../../../objects/closure-rule-system.md)'s versioning, the dispatch policy change produces a new rule-system version with a new version hash; replay against the prior hash reproduces the prior dispatch behavior.
- **Dispatch is observable.** A query over the dispatch table — "which agents are candidates for this work-type?" or "what is the match strength for this message at this moment?" — is a [traversal](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/traversal.md).
  An auditor can inspect the dispatch state at any moment without instrumenting the dispatch operator (per [cost-discipline-reads-free](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/cost-discipline-reads-free.md)).

Dispatch is per-message.
The dispatch table is consulted on each message arrival at an [inbox](teaching/explanations/inbox.md); the table's current state determines which agent handles the message.
Edits to the table between messages are picked up automatically; there is no cache to invalidate.

The dispatch operation is bilattice-valued by [dispatch-composes-authorization](../dispatch-composes-authorization/dispatch-composes-authorization.md): the same $\odot$ composition that fuses capability predications also incorporates authorization predications, producing a single match-strength value that respects the [truth-order](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/truth-order/truth-order.md) ranking $\mathbf{f} \leq_t \bot \leq_t \mathbf{t}$.
Earlier predicated-computing literature identified the bilattice-valued composition pattern (extends, $\odot$, twist-product fusion) and the bilattice-valued restriction pattern ($\Rightarrow$, twist-product right-residual) as the two primitive forms of dispatch.
The modern formulation makes both first-class operators and locates them in the dispatch table: extends-dispatch is the table's match-policy applying $\odot$; restricts-dispatch is the table's match-policy applying $\Rightarrow$.
A given dispatch table may use either (or both) depending on the engineering objective.
