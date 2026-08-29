---
type: theorem
class: informal
status: active
depends-on:
  - ../objects/side-effect.md
see-also:
  - teaching/explanations/tool-use-and-safety.md
references: []
---

# Side-effect irreversibility bound

**Statement (informal).** A subset of tool-use side effects (irreversible writes, external communication, physical-world action) cannot be undone by the agent post hoc.
Safety for agents with access to such tools requires *pre-commit gating*, not post-hoc recovery.

## What's irreversible

Examples of irreversible side effects:

- **Sent email.** Once sent, cannot be unsent.
- **Posted message.** Removable but not unseen.
- **Wire transfer.** Reversible only with counterparty cooperation.
- **Contractual commitment.** Legally binding once made.
- **Physical action.** Robot deletes a thing, etc.
- **Information disclosure.** Once revealed, cannot be unrevealed.
- **External-system mutation** without rollback capacity.

Even "reversible" effects often have *partial* irreversibility: the act-of-having-happened is permanent even if the state is restored.

## Why it matters

Compared to reversible effects:

- **Reversible.** Mistake → detect → undo.
  Iterative improvement possible.
- **Irreversible.** Mistake → permanent consequence.
  Iteration impossible.

Agents that lean on iterative correction *cannot* correct irreversible effects post-hoc.

## Pre-commit gating

The standard mitigation pattern:

- **Classify tools** by reversibility class.
- **Gate irreversible tools** behind explicit approval.
- **Approval source.** User confirmation, supervisor agent, policy check, etc.
- **Approval granularity.** Per-call, per-session, per-class.
- **Audit logging.** All approvals logged.

This *prevents* irreversible mistakes rather than correcting them.

## Variants

- **Per-call approval.** Slow but safest.
- **Whitelist-based approval.** Pre-approved patterns (e.g., "send to alice@example.com" pre-approved) bypass per-call.
- **Threshold-based.** Effects below a threshold proceed; above require approval.
- **Reversibility certificate.** Tools that include reversibility metadata; gating triggers on irreversibility class.

Production systems combine these.

## Connection to other results

- **Tool error amplification.** Even with low per-step error rate, irreversible effects fail catastrophically on errors that occur.
- **Composition correctness undecidable.** Cannot prove irreversible chain is correct; must gate execution.
- **Trust in agent reasoning.** Pre-commit gating doesn't trust agent reasoning for irreversible effects.

## Implications for design

- **Reversibility classification is essential metadata** for tool registries.
- **Default to read-only.** Mutating tools require explicit enablement.
- **Default to gated.** Irreversible tools require explicit approval.
- **Gate at the right granularity.** Too coarse → user fatigue; too fine → not safe.
- **Logging for audit.** All irreversible actions logged with approving entity.

## What pre-commit gating doesn't solve

- **Chain side effects.** Even if each step is gated, the *combination* may surprise.
- **Approval bypass.** Compromised approval mechanisms (e.g., compromised supervisor agent) defeat gating.
- **Implicit irreversibility.** Effects classified as reversible may have irreversible aspects (e.g., data exposure during reversal window).
- **Adversarial prompts.** Prompt injection may trick user into approving unintended actions.

## Limits

- **"Irreversible" is a spectrum.** Not binary.
- **Gating adds friction.** User experience cost.
- **Approval automation.** Automated approval (e.g., by another agent) reintroduces the trust problem.
- **Cost of false negatives.** Gating misses some irreversible effects.

## Status

Foundational safety concept in production agentic systems.
Standard practice in deployed systems with external action capacity.
Active research on reversibility metadata standards and approval workflow patterns.
