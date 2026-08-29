---
type: question
status: open
see-also:
  - ../objects/side-effect.md
  - ../theorems/side-effect-irreversibility-bound.md
  - teaching/explanations/tool-use-and-safety.md
---

# How to bound tool-use side effects?

## The question

How can a tool-using agent's side effects be bounded to safe, intended consequences?
Per [side-effect-irreversibility-bound](../theorems/side-effect-irreversibility-bound.md), some side effects cannot be undone post-hoc; bounding them in advance is therefore safety-critical.

## Why it's hard

- **Side effects are not just from individual calls.** Combinations produce emergent effects.
- **Effects propagate.** Initial effects trigger cascading effects in external systems.
- **Effects are not always visible.** Some effects (delayed actions, async work) aren't observable to the agent.
- **Effects are not always classifiable.** "Reversible" vs "irreversible" is a spectrum.
- **Adversarial inputs change the picture.** Prompt injection can trigger unintended side-effecting actions.

These compound.

## Approaches

**Pre-commit gating.**

- Side-effecting actions require approval before execution.
- Approval source: user, supervisor agent, policy engine.
- Standard practice but expensive at scale.

**Capability restriction.**

- Don't give agents tools whose side effects are unsafe.
- Read-only by default; mutating tools added with scrutiny.
- Effective but limits capability.

**Sandboxing.**

- Effects contained to sandbox; don't reach production.
- Standard for code execution.
- Can't sandbox all real-world action.

**Effect monitoring.**

- Observe effects post-hoc; rollback if anomalous.
- Requires reversibility — works for some effects.

**Policy enforcement.**

- Rules constrain what actions are permissible.
- Implemented in middleware between agent and tools.
- Effective for clearly-rule-based constraints.

**Bounded budgets.**

- Limit cost (money, time, message count) per agent session.
- Limits magnitude of harm even if not class.

Production systems combine these.

## What's not solved

- **Composition effects.** Even bounded individual actions may compose unsafely.
- **Adversarial effects.** Prompt injection can trigger unintended actions.
- **Unobservable effects.** Some effects bypass monitoring.
- **Trust in approval.** Approval mechanisms can be compromised.
- **Long-horizon effects.** Effects that manifest much later are hard to attribute.

## Hypotheses

- **Bounding works in restricted settings.** With carefully-curated tools and sandboxing, bounding is achievable.
- **Bounding doesn't scale.** General-purpose agents with broad capabilities cannot have side effects reliably bounded.
- **Defense in depth required.** No single mechanism suffices; combined mechanisms are necessary.
- **Capability ceiling.** Practical bounding sets a ceiling on safe agent capability.

These are partly compatible.

## What progress requires

- **Effect-classification standards.** Standardized metadata for tool reversibility.
- **Approval-workflow patterns.** Standardized patterns for high-stakes action gating.
- **Effect-monitoring infrastructure.** Production- grade observability for agent actions.
- **Adversarial robustness research.** Defending against action-injection.
- **Capability-evaluation methodology.** Knowing what agents can do is prerequisite to bounding.

Each is partially developed.

## Why it matters

- **Production deployment.** Bounded side effects are prerequisite for many deployments.
- **Trust.** Users won't trust agents with unbounded action capacity.
- **Regulatory.** Compliance often requires bounded, auditable actions.
- **Long-term safety.** As agent capability grows, bounding becomes more important.

## Status

Open and active.
Industry practice is evolving quickly; theoretical foundations lag.
Likely to remain unsettled for some time as deployments encounter new failure modes and mechanisms evolve in response.
