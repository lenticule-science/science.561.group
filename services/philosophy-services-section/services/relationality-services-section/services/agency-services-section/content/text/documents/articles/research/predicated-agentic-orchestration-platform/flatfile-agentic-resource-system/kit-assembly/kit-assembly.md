---
name: kit-assembly
description: "The discipline that a session's working fiber at start is a quartermaster's kit: an assembled composition of substrate-resident components that together produce the agent's operational frame for the session."
type: concept
class: framing
depends-on: [scope-as-fiber, modal-restriction, fiber, three-tier-memory]
see-also: [assemble-kit, open-session, office-record, mode-record]
title: kit-assembly
---

# Kit assembly

The discipline that *a session's working fiber at start is a quartermaster's kit*: an assembled composition of substrate-resident components that together produce the agent's operational frame for the session.
Components include the [office's constructors](../objects/office-record.md) (skills + runbooks the agent can invoke), the office's deontic profile (duties/powers/privileges/immunities), the active [`ClosureRuleSystem`](../objects/closure-rule-system.md), the active [mode's restrictions](../modal-restriction/modal-restriction.md), the [agent's identity-and-history fibers](../objects/agent-record.md), and (where relevant) prior session state for [resumption](../morphisms/resume-session.md).

Per the prior-art's "harness installation as kit assembly" framing: the harness is *not* a system prompt and the agent is *not* loaded with arbitrary configuration.
Instead, the substrate composes a *kit* — a fiber containing exactly what this agent in this office under this mode at this scope needs to do its work — and the kit IS what the realization renders into the agent's working context.

The kit-assembly framing is the *unifying view* of [scope-as-fiber](../scope-as-fiber/scope-as-fiber.md) and [three-tier-memory](../architecture/three-tier-memory/three-tier-memory.md): scope-as-fiber says *what* gets composed (which fibers contribute predicates); three-tier-memory says *where* it lives (in always-loaded, the kit's primary tier).
Kit-assembly names the operation that produces the always-loaded tier from the contributing substrate entities.

## What's in a kit

A session's kit fiber SHALL contain, after [`assemble-kit`](../code/transformers/assemble-kit.md):

- **Constraint fiber.** Predicates from the active [`ClosureRuleSystem`](../objects/closure-rule-system.md) that govern admissible substrate moves.
  The "rules" component of the kit.
  Standing orders the agent operates under.
- **Action-vocabulary fiber.** The set of [`SkillRecord`](../objects/skill-record.md) and [`RunbookRecord`](../objects/runbook-record.md) references the agent has via office.constructors, agent.skills, and mode-permitted residual.
  The "tool kit" the agent has been issued.
- **Equipment fiber.** Pre-built [`respond`](../code/transformers/respond.md) compositions the agent can invoke without building from scratch — typically realized as commands or higher-level skills exposed at the harness surface.
  The "equipment" pre-loaded in the kit.
- **Observation-and-guard fiber.** The active observation rules (what the substrate is currently watching) and guard rules (what the substrate currently enforces).
  Hooks, in the realization-side vocabulary.
- **Session-state fiber.** For resumed sessions, the prior session's working state and observation cursor.
  For new sessions, the empty starting state.
- **Identity fiber.** The agent's identity predicates (name, type, signing key) plus the office's title and authority predicates.
  Cited in every witness the session emits.
- **Scope fiber.** The composed `reads` and `writes` predicates per [scope-as-fiber](../scope-as-fiber/scope-as-fiber.md), AFTER applying the mode's restriction.
  This is the working-set authorization fiber that [`check-authorization`](../code/transformers/check-authorization.md) reads.

## How the kit assembles

[`assemble-kit`](../code/transformers/assemble-kit.md) composes the components in a fixed order, per [`compose`](../morphisms/compose.md)'s associativity:

1. Office's full fiber (deontic profile, constructors, action domain).
2. Compose with agent's identity-and-skills fiber.
3. Compose with active rule-system's predications (the constraint fiber).
4. Compose with active mode's restrictions (subtractive, may produce $\bot$ or $\top$ on previously-permitted cells).
5. Compose with prior session state (for resumption) or empty initial state (for fresh sessions).

The order is normative for replay-determinism.
The composition's output is the kit fiber.

## What kit-assembly enables

- **Substrate-driven session start.** [`open-session`](../morphisms/open-session.md) calls [`assemble-kit`](../code/transformers/assemble-kit.md) and gets the working fiber back; nothing about the realization-side runtime is involved in the assembly.
  The kit is byte-stable: same substrate state + same office + same mode → same kit.
- **Mode-transition reassembly.** When a [`transition-mode`](../code/transformers/transition-mode.md) operates, it triggers re-assembly: the new mode's restriction is composed in place of the old.
  The kit is updated; the session's working fiber reflects the change.
- **Audit of session capability.** An auditor can ask "what could this session have done at this moment?" by replaying the session's events to the moment in question and assembling the kit — this is the substrate's authorization snapshot at that point.
- **Federation of kits.** Two FARS substrates exchanging session content can verify each other's kit composition, because both compose from the same kind of substrate entities under the same composition discipline.

## What kit-assembly is not

- **Not a system prompt.** A system prompt is a string of natural language fed to an LLM at the start of a turn.
  A kit is a *substrate fiber* with structured predicates that the realization MAY render into a prompt-shaped form for an LLM agent, but the kit IS the substrate composition, not the prompt.
- **Not a configuration loading.** Configuration loading reads a config file at process start.
  Kit assembly is a substrate operation: substrate entities compose under [`compose`](../morphisms/compose.md); the result is a fiber.
  Re-assembly during the session (per mode transitions) is a substrate operation, not a configuration reload.
- **Not session-private.** Kits are *not* exclusive to one session.
  Two sessions running under the same office, agent, and mode produce the same kit — the kit is *substrate state composed for use*, not per-session secret material.
  Two sessions sharing a kit is a feature, not a bug; it makes their authorization decisions equivalent.

## Position

Kit assembly is the framing that makes [`open-session`](../morphisms/open-session.md), [`resume-session`](../morphisms/resume-session.md), and [`transition-mode`](../code/transformers/transition-mode.md) coherent at the working-fiber layer.
Without kit assembly, sessions would each have to compose their working frame ad-hoc; with kit assembly, the substrate has a canonical composition operation, the result is byte-stable, and the substrate's audit chain records every kit re-assembly.

The framing depends on [scope-as-fiber](../scope-as-fiber/scope-as-fiber.md), [modal-restriction](../modal-restriction/modal-restriction.md), and [three-tier-memory](../architecture/three-tier-memory/three-tier-memory.md).
It is realized by [`assemble-kit`](../code/transformers/assemble-kit.md).
