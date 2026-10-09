---
type: theorem
class: engineering-claim
status: proved
depends-on:
  - teaching/explanations/intention-as-scope-bounded-commitment.md
  - teaching/explanations/session.md
  - teaching/explanations/scope.md
  - teaching/explanations/runbook.md
  - teaching/explanations/governance.md
  - teaching/explanations/authorization.md
  - teaching/explanations/guard.md
  - teaching/explanations/dispatch.md
  - ../../../teaching/explanations/predication-fiber-algebra.md
  - references/bratman1987.md
  - references/rao-georgeff1995.md
see-also:
  - teaching/explanations/intention-as-scope-bounded-commitment.md
  - teaching/explanations/belief-base-as-fiber-restriction.md
  - teaching/explanations/practical-reasoning-as-runbook-execution.md
  - teaching/explanations/plan-body-as-runbook.md
  - ../theorems/belief-base-is-scope-restriction.md
  - ../theorems/guard-verdict-is-bilattice-meet.md
  - ../theorems/dispatch-composes-authorization.md
  - theories/flatfile-agentic-resource-system/theorems/scope-composition-is-knowledge-order-monotone.md
title: "An agent's intention is a session-fiber commitment: Bratman's four roles are realized by substrate operators"
description: Claim.
---

# An agent's intention is a session-fiber commitment: Bratman's four roles are realized by substrate operators

**Claim.** An agent's *intention*, in the Bratman (1987) / BDI sense, is realized in the platform as a substrate predication on the agent's session entity — a *scope-bounded commitment* predication that records the runbook the agent is committed to executing within the session's lifetime.
Bratman's four functional roles of intention (settles deliberation, is partial, is conduct-controlling, is subject to consistency and coherence norms) are each realized by a specific substrate operator, not by a separate intention-set data structure or by an explicit commitment-management layer.

Formally: an intention $I$ is a predication $(\mathrm{session}_a, \mathrm{committed\text{-}to}, \mathrm{runbook}_R)$ with value $t$ in the substrate at the agent's session entity, where $\mathrm{runbook}_R$ is the substrate entity representing the intended procedure.
The commitment's persistence is determined by the scope the predication is attached to:

- *Session-bounded*: the predication exists while the session is open; it is retracted on `close-session`.
- *Scope-bounded*: the predication exists while the scope is active; it is retracted on scope exit.
- *Agent-bounded*: the predication is on the agent entity itself; it persists across sessions until explicitly retracted.

The commitment-policy trichotomy from BDI (*blind / single-minded / open-minded*) is recovered as a choice of scope attachment and retraction condition, not as a meta-level policy enforcement layer.

## Bratman's four roles, realized by substrate operators

### Role 1: Settles deliberation (forecloses reconsideration of alternatives)

**Bratman's formulation:** An intention settles which action the agent is committed to, foreclosing further deliberation about alternatives.
A fully deliberating agent at each moment would reconsider all options; intentions prevent this by committing the agent's practical reasoning to a course of action until the intention is dropped.

**Substrate realization:** The dispatch operator ([`dispatch`](../morphisms/dispatch.md)) ranks candidate runbooks for the agent's next action.
When a commitment predication $(\mathrm{session}_a, \mathrm{committed\text{-}to}, \mathrm{runbook}_R)$ is $t$ in the session's fiber, dispatch's ranking is biased toward $\mathrm{runbook}_R$'s continuation steps — candidates for the runbook's next step rank above unrelated alternatives.
Per [dispatch-composes-authorization](../../../dispatch/dispatch-composes-authorization/dispatch-composes-authorization.md), dispatch composes capability and authorization in one pass; the session's commitment predication is part of the session's fiber that dispatch reads.
The effect is that the committed runbook's next step occupies the top position in dispatch's ranked output; the agent "forecloses" other options by the algebraic fact that their rank is lower.

Re-deliberation (reconsidering the commitment) requires an explicit substrate event retracting the commitment predication — a `retract-edit` on the session's fiber.
This is auditable: the witness chain records when and why the commitment was dropped.

### Role 2: Is partial (leaves means and timing open)

**Bratman's formulation:** An intention commits to the *what* (the goal or procedure) while leaving the *how* (means) and *when* (timing) undetermined, to be filled in by further practical reasoning.

**Substrate realization:** A runbook's body is a procedure specification, not a fully-determined execution trace.
The runbook body commits to the sequence of steps at the abstraction level of substep-names and substep-kinds; the concrete realization of each step is determined at tick time by the agent's dispatch within the step's scope.
Per [plan-body-as-runbook](../../../runbook/plan-body-as-runbook/plan-body-as-runbook.md), the runbook body is exactly Bratman's "partial plan" — a commitment to a structured procedure whose concrete means are left to runtime resolution.
The timing is determined by the heartbeat tick, not fixed at intention adoption.

### Role 3: Is conduct-controlling (directs practical reasoning)

**Bratman's formulation:** An intention controls the agent's subsequent practical reasoning — it biases attention toward means-end reasoning relevant to the intention's realization and away from reasoning about alternatives the intention forecloses.

**Substrate realization:** Dispatch's ranking bias (see Role 1) is the conduct-controlling effect at the action-selection level.
At the level of substrate content, the committed runbook's step predicates (current step, step preconditions, step postconditions) are in the session's working fiber, loaded by kit-assembly.
Closure rules whose premises match the active step's preconditions fire ahead of rules for other substeps.
Per [tick-as-iteration](../../../flatfile-agentic-resource-system/tick-as-iteration/tick-as-iteration.md), the tick applies closure rules uniformly — but the rules relevant to the current step's predicates fire first (by hash-canonical ordering, which is deterministic and correct for the current step), and the step's postcondition-checking rules fire after the step's action rules.
The runbook's step structure controls which rules dominate the tick's firing sequence.

### Role 4: Is subject to consistency and coherence norms

**Bratman's formulation:** Intentions are subject to consistency norms that beliefs and desires alone are not: an agent cannot coherently hold two intentions that are mutually exclusive, or hold an intention and a belief that the intention is impossible.
Bratman's practical coherence requires a separate coherence-checking mechanism.

**Substrate realization:** Per [guard-verdict-is-bilattice-meet](../../../governance/guard/guard-verdict-is-bilattice-meet/guard-verdict-is-bilattice-meet.md), the guard operator computes the bilattice meet of three reads (shape, authorization, soul).
An intention that would violate the agent's governing-soul or governance constraints produces a $f$ or $\top$ at the guard's soul-read — the commitment is not admitted.
The guard is applied at dispatch time, before the runbook is committed, per the platform's dispatch-before-commitment discipline.

Two mutually exclusive intentions produce $\top$ in the session's fiber at the contested commitment predicate when both are proposed — the bilattice's $\odot$ of two incompatible values ($t$ and $f$ at the same predicate cell) produces $\top$.
The $\top$-cell surfaces as a substrate coherence diagnostic; the repair-catalog addresses it.
There is no separate coherence-checking mechanism — the bilattice's value domain IS the coherence-checking apparatus.

Belief-intention consistency (Bratman's requirement that the agent not intend what it believes to be impossible) is realized through the closure-rule system: a rule whose premise matches "agent has belief $p = f$ AND is committed to runbook whose precondition asserts $p = t$" fires and produces a $\top$-cell at the contested predication — the inconsistency surfaces.
The agent's belief base and intention are both fiber predications; the closure-rule system's cross-fiber rules enforce the consistency requirement.

## The commitment-policy trichotomy

Bratman identifies three commitment policies (and BDI architectures implement all three):

- **Blind commitment:** the agent pursues the intention until achieved or impossible, regardless of changes in beliefs or desires.
- **Single-minded commitment:** the agent pursues the intention until it believes the goal is achieved or believes it cannot be achieved.
- **Open-minded commitment:** the agent pursues the intention as long as the motivating reasons (beliefs and desires that led to adoption) still hold.

**Substrate realization:** The three policies are scope-attachment choices for the commitment predication, not meta-level policy enforcement.

- *Blind* ≈ agent-bounded commitment: the predication $(\mathrm{agent}_a, \mathrm{committed\text{-}to}, \mathrm{runbook}_R)$ persists across sessions until explicitly retracted.
  No closure rule retracts it on belief change; the agent must explicitly retract.
- *Single-minded* ≈ session-bounded commitment with a retraction closure rule: the predication $(\mathrm{session}_a, \mathrm{committed\text{-}to}, \mathrm{runbook}_R)$ is retracted by a closure rule whose premise matches "commitment predication $t$ AND (goal-achieved predication $t$ OR goal-impossible predication $t$)."
  The rule fires when the agent's belief base includes the goal-achieved or goal-impossible predication — the retraction is belief-driven, substrate-mechanical.
- *Open-minded* ≈ session-bounded commitment with a stronger retraction rule: the rule premise additionally matches "motivating-belief-still-holds predication $f$."
  The motivating beliefs (the beliefs that justified adoption) are substrate predicates cited in the commitment record; the retraction rule fires when those predicates drop below $t$.

In all three cases, the rule is a `ClosureRuleRecord` on the `learning`-channel (or a `guard`-channel diagnostic rule); it is substrate content, editable, queryable, and auditable.
The policy choice is a substrate edit: installing a retraction rule is installing a single-minded or open-minded commitment policy; having no retraction rule is the blind policy.

## Engineering consequences

**Intentions are auditable.** Per the substrate's witness-chain discipline, every commitment predication's admission and retraction produces a witness.
The intention's history — adoption timestamp, retraction timestamp, reason for retraction — is substrate-traversable.

**Intention adoption is a guard-filtered act.** Per [guard-verdict-is-bilattice-meet](../../../governance/guard/guard-verdict-is-bilattice-meet/guard-verdict-is-bilattice-meet.md), the guard's three reads include the soul-read (governing constraints).
An intention to execute a runbook that violates the governing soul is blocked at guard; the commitment predication is never admitted.
Governance integration is not a separate layer — it is the guard operator's soul-read.

**Intentions compose with federation.** A federated agent's session-fiber commitment is visible across federated substrates that share the session's scope, by the federation's substrate-join discipline.
Distributed coordination through shared intentions requires no special inter-agent protocol — the intention IS a substrate predication; federation propagates substrate predications.

**Intention-belief inconsistency surfaces as $\top$.** When the agent's belief base (per [belief-base-is-scope-restriction](../../../memory/belief-base-as-fiber-restriction/belief-base-is-scope-restriction/belief-base-is-scope-restriction.md)) contains a belief that contradicts a runbook precondition in the committed intention, the closure-rule system computes $\top$ at the contested predicate cell.
The inconsistency is substrate-visible, not agent-internal.
A repair-catalog entry for that predicate type governs resolution — typically, suspending the intention (retracting the commitment predication) until the belief-inconsistency is resolved.

## What the theorem requires

- The platform's runbook structure is the substrate's concrete realization of Bratman's "partial plan" — procedural commitment without fully-determined means.
- The guard operator is applied before commitment admission (the dispatch-before-commitment discipline holds).
- The session entity is the canonical scope for session-bounded commitments; the agent entity is the canonical scope for cross-session commitments.

## What the theorem does not claim

- **That the platform's intentional structure is metaphysically identical to Bratman's.** The theorem claims Bratman's four functional roles are realized by substrate operators — it does not claim the platform constitutes a mental-state theory.
  The platform is engineering.
- **That all BDI plan-body operators are covered.** BDI plan bodies include not-only `+belief` / `-belief` but also external actions, sub-plan calls, and failure handling.
  Those are covered separately by [practical-reasoning-as-runbook-execution](../../../runbook/practical-reasoning-as-runbook-execution/practical-reasoning-as-runbook-execution.md); the theorem covers the intention construct specifically.
