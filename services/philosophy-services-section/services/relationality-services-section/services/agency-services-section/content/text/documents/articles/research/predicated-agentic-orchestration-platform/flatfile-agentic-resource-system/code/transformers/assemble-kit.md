---
name: assemble-kit
description: "The morphism that composes a session's working fiber from the contributing substrate entities: the office's full fiber, the agent's identity-and-skills fiber, the active rule-system's predications, the active mode's restrictions, and (for resumed sessions) prior session state."
title: assemble-kit
---

The morphism that *composes a session's working fiber* from the contributing substrate entities: the office's full fiber, the agent's identity-and-skills fiber, the active rule-system's predications, the active mode's restrictions, and (for resumed sessions) prior session state.
`assemble-kit` is the substrate-level operation that produces the *always-loaded tier* of a session per [three-tier-memory](../../architecture/three-tier-memory/three-tier-memory.md), per [kit-assembly](../../kit-assembly/kit-assembly.md).

The morphism is invoked by [`open-session`](open-session.md) at session-start, by [`resume-session`](resume-session.md) at session-resume, and by [`transition-mode`](transition-mode.md) at every mode transition.
The session's working fiber is *always* the output of an `assemble-kit` call against the current substrate state; intermediate edits to substrate content (office's fiber updated, mode's restrictions edited) trigger an implicit re-assembly on the next operation.

## Signature

```
assemble-kit(office, agent, mode, rule-system; prior-state) → (working-fiber, witness)
```

Inputs:

- **`office`** — reference to the [`OfficeRecord`](../objects/office-record.md) the agent is inhabiting.
- **`agent`** — reference to the [`AgentRecord`](../objects/agent-record.md).
- **`mode`** — reference to the [`ModeRecord`](../objects/mode-record.md).
  For default-mode-only realizations, this is the office's `default-for-offices` mode.
- **`rule-system`** — reference to the [`ClosureRuleSystem`](../objects/closure-rule-system.md) version active at the assembly.
- **`prior-state`** — optional.
  For resumed sessions, the session's pre-pause working state and observation cursor.
  For new sessions, null.

Outputs:

- **`working-fiber`** — the composed kit fiber per [kit-assembly](../../kit-assembly/kit-assembly.md): constraint fiber + action-vocabulary fiber + equipment fiber + observation-and-guard fiber + session-state fiber + identity fiber + scope fiber.
- **`witness`** — [`Witness`](../objects/witness.md) recording the assembly: the input record hashes, the rule-system version, the prior-state hash (or null), the resulting working-fiber hash.

## Operational semantics

`assemble-kit` SHALL proceed in seven phases, in order.
The order is normative — replay-deterministic kit assembly requires the same composition order — and follows [kit-assembly](../../kit-assembly/kit-assembly.md):

1. **Office fiber.** Load the office's fiber: `name`, `title`, `type`, deontic profile (duties/powers/privileges/immunities), action domain (entities-governed, channels-read, channels-write, state-transitions), capabilities (work-types, provides-capabilities, constructors, settlement-path-position), installation state.
  The starting fiber.

2. **Agent compose.** Per [`compose`](compose.md), compose the agent's identity-and-skills fiber: the agent's `name`, `type`, `signing-key`, `skills`, `work-types`, `reads`, `writes`.
  Concordant additions sustain (e.g., the agent's `reads: status` AND the office's `channels-read: status` → both `t`); discordant additions surface contradictions for repair.

3. **Rule-system compose.** Compose the rule-system's predications — the *constraint fiber* — declaring which closure rules fire at the session's scope.
  The rule-system's version is pinned at this composition; subsequent rule edits don't retroactively modify the session.

4. **Mode restriction.** Compose the mode's `restricts` fiber.
  The composition is *subtractive*: mode's `restricts` cells with $f$ values cause previously-`t` predicates to become $\top$ (contested between office's grant and mode's denial) or $\bot$ (no opinion).
  The result is the *post-restriction* effective scope.

5. **Substitutions.** Apply the mode's `substitutions` (skill-replacement pairs) to the fiber: each substitution removes the original-skill reference and adds the substitute.
  The action-vocabulary is updated.

6. **Prior-state compose** (if present).
  Compose any session-resumption state into the working fiber.
  The resumption state may include in-progress runbook bindings, observation-cursor positions, partial query results.

7. **Witness aggregation.** Construct the witness aggregating the per-phase composition hashes; the cumulative chain is what an auditor replays to verify the kit.

## Normative invariants

- **Order-deterministic.** Phases SHALL run in the declared order.
  A different order produces a different working fiber even with byte-identical inputs (because [`compose`](compose.md) is associative but composition with restrictions is order-sensitive at the cell-presence level).
- **Substrate-state-derived.** The working fiber SHALL be derived entirely from substrate-state inputs (office, agent, mode, rule-system, prior-state).
  No realization-side configuration, no environment variables, no out-of-band parameters.
  Same substrate state → same kit.
- **Replay-deterministic.** Same inputs SHALL produce byte-identical `(working-fiber, witness)`.
- **No-side-effects.** `assemble-kit` SHALL NOT mutate substrate state.
  The morphism reads; it produces a working fiber; it emits no events.
  (The session-record edit that *uses* the working fiber is a separate operation, per [`open-session`](open-session.md), [`resume-session`](resume-session.md), or [`transition-mode`](transition-mode.md).)
- **Validation-aware.** When the composition produces $\top$-cells (contradictions between contributors), the working fiber SHALL preserve them.
  The substrate's [validation-as-settlement](../../settlement/validation-as-settlement/validation-as-settlement.md) discipline applies: $\top$-cells are substrate-visible; downstream operators see them and can decline to proceed (per the `force` flag discipline).

## Failure modes

- **Office not loadable.** The cited office reference does not resolve.
  Abort with `guard` diagnostic; the calling morphism (typically [`open-session`](open-session.md)) handles the abort.
- **Agent not loadable.** The cited agent reference does not resolve.
  Abort with `guard` diagnostic.
- **Rule-system version unavailable.** The cited rule-system version is not in the substrate.
  Abort; the calling morphism converts to a per-call failure.
- **Mode not loadable.** The cited mode reference does not resolve.
  Per the failure-policy of the calling morphism, default to the office's `default-for-offices` mode (if any) OR to a substrate-defined fallback (`default` mode is conventionally always present and unrestricted) OR abort.
- **Composition $\top$ on critical cells.** The contributing fibers produce $\top$ on cells the operator's caller deems critical (e.g., `$\top$` on a write-permission predicate when the caller is about to edit).
  Per [validation-as-settlement](../../settlement/validation-as-settlement/validation-as-settlement.md): the calling morphism MAY admit (under `force`) or fail.

## Composition with session morphisms

`assemble-kit` is invoked by:

- [`open-session`](open-session.md) — phase 2 (Compose always-loaded fiber).
  Result becomes the session's initial working fiber.
- [`resume-session`](resume-session.md) — phase 3 (Always-loaded re-render).
  Result becomes the resumed session's working fiber, replacing whatever the prior pause had cached.
- [`transition-mode`](transition-mode.md) — phase 4 (Kit re-assembly).
  Result replaces the session's working fiber for the new mode.

Three operational paths into one morphism.
The substrate-level discipline is the same; the calling morphisms differ only in *what they do with the assembled kit*.

## Position

`assemble-kit` is the substrate-level *kit-assembly primitive*.
Without it, the substrate would have multiple kit-shaped operations across [`open-session`](open-session.md), [`resume-session`](resume-session.md), [`transition-mode`](transition-mode.md), each implementing its own composition with potentially divergent behavior.
With it, the substrate has one canonical assembly operation; the three calling morphisms differ only in their pre- and post-conditions.

The morphism composes with all four [`OfficeRecord`](../objects/office-record.md), [`AgentRecord`](../objects/agent-record.md), [`ModeRecord`](../objects/mode-record.md), and [`ClosureRuleSystem`](../objects/closure-rule-system.md) record types (the inputs); with [`compose`](compose.md) (the operator); and with [`Witness`](../objects/witness.md) (the output side).
