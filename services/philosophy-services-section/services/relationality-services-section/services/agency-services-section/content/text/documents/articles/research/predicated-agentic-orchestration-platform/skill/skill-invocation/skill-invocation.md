---
type: morphism
class: operator
realizes: [skill]
depends-on: [skill, agent, witness, closure-rule-application, predication-valuation, application-sublocale]
see-also: [runbook-execution, dispatch-matching, settlement-path-cost-monotonicity]
title: Skill invocation
description: The operator that, given an agent, a skill, a scope, and an input bundle, executes the skill's body and produces an output bundle and a witness entry.
---

# Skill invocation

The operator that, given an [agent](teaching/explanations/agent.md), a [skill](teaching/explanations/skill.md), a [scope](../../scope/scope.md), and an input bundle, executes the skill's body and produces an output bundle and a [witness](../../../objects/witness.md) entry.
A skill invocation is structurally a [closure-rule application](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/closure-rule-application.md) (or a sequence of them) restricted to the agent's authorized [application sublocale](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/application-sublocale.md), advancing the substrate's [predication settling](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) by one or more steps within that sublocale.
Formally:

$$ \mathrm{invoke}(\mathrm{agent},\, \mathrm{skill},\, \mathrm{scope},\, \mathrm{input}) \;\longrightarrow\; (\mathrm{output},\, \mathrm{witness}) $$

The invocation proceeds in three phases:

1. **Precondition check.** The skill's precondition shape predications are evaluated against the input and the [predication-graph store](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md) at the agent's scope.
  A precondition violation aborts the invocation; the witness records the abort and the rule that violated.
2. **Body execution.** The skill's body — a sequence of [closure-rule applications](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/closure-rule-application.md), shell commands, or external API calls — is executed.
  Each step within the body emits its own sub-witness; the skill's witness aggregates them.
  Per [settlement-path-cost-monotonicity](../../settlement/settlement-path/settlement-path-cost-monotonicity/settlement-path-cost-monotonicity.md), the body's cost depends on the skill's formality layer: a tool-layer skill ($F_3$) executes deterministically as substrate operators; a model-layer skill ($F_0$/$F_1$) involves frontier-model inference per invocation.
3. **Postcondition check.** The skill's postcondition shape predications are evaluated against the output and the post-execution predication-graph state.
  A postcondition violation is reported in the witness; the platform's [governance](teaching/explanations/governance.md) determines whether the violation is recoverable (partial output recorded) or aborts (the invocation is rolled back via [retraction](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/retraction.md)).

Three engineering properties:

- **Recorded.** Every invocation produces a witness in the [event log](../../../objects/event-log.md).
  The witness chain — input hash, sub-witness hashes for each body step, output hash — is what makes the invocation replayable per [settlement-determinism](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-determinism.md).
- **Scope-bounded.** Per [session-as-time-bounded-sublocale](../../session/session-as-time-bounded-sublocale/session-as-time-bounded-sublocale.md), the agent's invocation can only act on entities visible at its scope (the agent's authorized sublocale).
  Attempts to act outside scope are pre-condition violations recorded in the witness.
- **Determinism is per-skill.** Skills declared as deterministic (the body is a sequence of closure-rule applications) produce byte-identical output on identical input across replays per [settlement-determinism](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-determinism.md).
  Skills declared as non-deterministic (the body involves a frontier model, an external service, a wall-clock-dependent operation) record the non-determinism in the witness — typically including the entropy source's canonical hash so an auditor with access to that source can reproduce the result.

Earlier predicated-computing literature defined the operational primitive as `message(entityId, payload)`.
The modern formulation refines: the message arrives at an [inbox](teaching/explanations/inbox.md), the dispatch table picks an agent and a skill via [dispatch-matching](../../dispatch/dispatch-matching/dispatch-matching.md), and the skill invocation is what executes the work as substrate-side closure-rule applications.
The single-primitive ergonomics of `message(...)
` is preserved at the platform's API surface; the underlying skill-invocation operator is what makes the message handling auditable, replayable, and scope-bounded.
