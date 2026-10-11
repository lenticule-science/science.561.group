---
title: "Tier routing"
description: "The dispatch scheduler picks the cheapest sufficient computation tier per respond. Tier 1 first, Tier 2 if substrate-algebra alone can't decide, Tier 3 only when natural-language reasoning is required."
kind: spec
status: normative
version: "0.2"
---


The dispatch scheduler ([`process/dispatch-as-scheduler.md`](../process/dispatch-as-scheduler.md)) picks both the office that handles a respond and the computation tier ([`process/computation-tiers.md`](../process/computation-tiers.md)) the office uses.
This spec is the tier-picking half.
The framing is committed by [`decisions/cheapest-sufficient-computation-tier.md`](../../decisions/cheapest-sufficient-computation-tier.md).

The captain's source idea is [`beyond-language-models-for-agent-computation.md`](../../../../engineering/triage/operations/command/ideas/triage/beyond-language-models-for-agent-computation.md).

## 1. The cheapest-sufficient policy

The scheduler picks the cheapest tier whose admissibility includes "can decide this respond."
Cheapness is the strict order:

```
tier-1  <  tier-2  <  tier-3
```

Cheapest is monotone in the same `agential-orchestration-platform/theorems/settlement-path-cost-monotonicity` sense the heartbeat scheduler already cites.
The scheduler never reaches for Tier 2 when Tier 1 has settled; never reaches for Tier 3 when Tier 2 has produced a sufficient answer.

This is a closure-rule policy, not a hard-coded scheduler privilege: the rules that perform tier selection are themselves substrate cells, observable, signable, and federation-replicable.

## 2. The tier-routing closure rule

The scheduler's tier choice is the firing of a tier-routing rule.
A tier rule fires after the office-routing rule of [`process/dispatch-as-scheduler.md`](../process/dispatch-as-scheduler.md) §2 has set `dispatch-to`:

```json
{
  "kind": "rule",
  "name": "tier-route-cheapest-sufficient",
  "premise": [
    {"s": "$task", "p": "dispatch-to", "o": "$office", "v": "True"},
    {"s": "$task", "p": "computation-tier", "o": "*", "v": "None"}
  ],
  "conclusion": [
    {"s": "$task", "p": "computation-tier", "o": "tier-1", "v": "True"}
  ]
}
```

The default-firing rule asserts `tier-1`; the σ-pass then attempts to settle the respond on the substrate's algebra alone.
If the σ/Δ engine surfaces $\bot$ for the respond's expected output predicates after one attempt at settlement (per the office's settlement gate), a follow-up rule fires:

```json
{
  "kind": "rule",
  "name": "tier-escalate-bottom-to-tier-2",
  "premise": [
    {"s": "$task", "p": "computation-tier", "o": "tier-1", "v": "True"},
    {"s": "$task", "p": "$expected-output-predicate", "o": "*", "v": "None"}
  ],
  "conclusion": [
    {"s": "$task", "p": "tier-escalated-from", "o": "tier-1", "v": "True"},
    {"s": "$task", "p": "computation-tier", "o": "tier-2", "v": "True"},
    {"s": "$task", "p": "tier-escalated-to", "o": "tier-2", "v": "True"}
  ]
}
```

A symmetric rule escalates from Tier 2 to Tier 3 when the model's confidence cell ([`agential/non-lm-models.md`](../agential/non-lm-models.md) §6) is below threshold.
The rules are wired in declared-dependency order per [`decisions/heartbeat-is-the-scheduler.md`](../../decisions/heartbeat-is-the-scheduler.md), so escalation is deterministic across replays.

## 3. Admissibility composition

Each tier-routing rule's premise composes the office's admissible-tier set per [`process/computation-tiers.md`](../process/computation-tiers.md) §3.
Concretely, a closure-rule premise:

```json
{"s": "$office", "p": "denies-tier", "o": "$tier", "v": "False"}
```

…is conjoined with the tier-rule premise so that an office's `denies-tier` cell suppresses the firing.
An office that denies all three tiers cannot be dispatched at all; the scheduler emits `PCS_TIER_ESCALATION_DENIED`.

The default admissibility (per formality-layer) is itself expressed as substrate cells emitted at office-creation time, not hard-coded into the scheduler.
F5/F6 offices have `permits-tier: tier-1`, `permits-tier: tier-2` cells but no `permits-tier: tier-3` unless the operator explicitly adds one.

## 4. Tier 1 sufficiency

Tier 1 is sufficient when the σ/Δ engine returns a settled value for every predicate in the respond's expected-output set.
The expected-output set is declared on the dispatch-target cell:

```json
{"s": "$task", "p": "expected-output-predicate", "o": "dispatch-to", "v": "True"}
{"s": "$task", "p": "expected-output-predicate", "o": "priority-rank", "v": "True"}
```

If after Tier-1 settlement every expected-output predicate has a non-$\bot$ settled value, the scheduler does not escalate.
If any expected-output predicate settles at $\bot$, the escalation rule fires (per §2).

The scheduler does NOT escalate when Tier 1 settles at $f$ (false) or $\top$ (contradiction); those are real answers.
False is "no, this office shouldn't dispatch"; $\top$ is "two derivations disagree, surface to operator."
Both are honest substrate output and require no tier escalation.

## 5. Tier 2 sufficiency

Tier 2 is sufficient when the model's output confidence cell is at or above the model's `confidence-threshold` ([`agential/non-lm-models.md`](../agential/non-lm-models.md) §6).
The scheduler:

1. Reads the model record matching the dispatch shape (looked up by `(office, expected-output-predicate)`).
2. If no model matches, surfaces `PCS_TIER_MODEL_MISSING` and escalates to Tier 3 if admissible (else escalation denied).
3. Invokes the model per the inference contract.
4. Reads the confidence cell after inference.
  If $\ge$ threshold, the output cells are honoured; if $< $ threshold (i.e., emitted at $\bot$), the escalation-to-Tier-3 rule fires.

Multiple models may match a single dispatch shape; the scheduler picks the one with the highest non-retired version per the supersession chain ([`agential/non-lm-models.md`](../agential/non-lm-models.md) §9).

## 6. Tier 3 dispatch

Tier 3 is the catch-all.
The scheduler:

1. Verifies the office's admissibility includes `tier-3`.
  If not, surfaces `PCS_TIER_ESCALATION_DENIED` and the respond returns to the operator with `requires-operator-review: True`.
2. Picks the LLM model identifier per the office's `formality-layer` field (per the existing v0.8 mapping: F0→Opus, F1→Sonnet, F2→Haiku, etc.; see [`security/persona-and-personnel.md`](../security/persona-and-personnel.md) §2).
3. Composes the prompt from the input fiber projection.
4. Invokes the LLM under the session's token budget.
5. Emits output cells at `"asserted"` stratum with `computation-tier: tier-3` attribution and the LLM model identifier in `derived_from`.

Tier 3 does not further escalate within a respond; an LLM-uncertain answer is returned to the operator with `requires-operator-review: True`.

## 7. Per-tick determinism

Within a single heartbeat tick, tier routing is deterministic:

- Same office × task fiber state → same `dispatch-to` (per [`process/dispatch-as-scheduler.md`](../process/dispatch-as-scheduler.md) §3).
- Same dispatch-to + same admissibility cells → same tier choice.
- Same tier + same input fiber → same Tier-1 settlement (algebra), same Tier-2 inference (model+weights are byte-identical per [`agential/non-lm-models.md`](../agential/non-lm-models.md) §3), same Tier-3 invocation (LLM call recorded as event; replay re-asserts the recorded LLM response cell rather than re-invoking).

This is what lets a conformance vector pin a routing decision and verify byte-identical replay.

## 8. Budget composition

Each tier composes with the session's resource budget per [`security/sandbox-and-fuel.md`](../security/sandbox-and-fuel.md):

- Tier 1 spends σ/Δ engine fuel.
- Tier 2 spends a configured per-respond inference fuel; weight loads are charged once per session.
- Tier 3 spends the session's token budget.

If a tier's budget is exhausted mid-respond, the respond surfaces `PCS_TIER_BUDGET_EXCEEDED`.
The escalation rule does NOT fire automatically on budget exhaustion (escalation is for sufficiency, not for resource starvation); the operator decides whether to refill the budget or accept the partial answer.

## 9. Replay and substitution

Tier 3 invocations are recorded as events whose payload includes the LLM response.
Replay re-asserts the recorded response rather than re-invoking the LLM (LLMs are non-deterministic and external; substrate replay must be byte-identical, so the recorded response is the canonical artefact).

When a v0.9 instinct-to-skill or instinct-to-model promotion captures a Tier-3 behavior into a Tier-1 closure rule or Tier-2 model, the substrate marks the original Tier-3 event with a `superseded-by` cell pointing at the new rule or model.
Subsequent dispatches through the same office × task shape route to the cheaper tier; the captured Tier-3 events remain in the log as audit history.

## 10. Errors

| Code | Meaning |
|---|---|
| `PCS_TIER_NOT_ADMISSIBLE` | The selected tier is denied for this office. |
| `PCS_TIER_INSUFFICIENT` | A tier returned $\bot$ for an expected-output predicate; escalation required. |
| `PCS_TIER_ESCALATION_DENIED` | Escalation needed but the next tier is also inadmissible. Surfaces to operator with `requires-operator-review: True`. |
| `PCS_TIER_MODEL_MISSING` | Tier 2 was selected but no matching model record exists. |
| `PCS_TIER_BUDGET_EXCEEDED` | The tier's per-respond budget was exhausted. |

## 11. Composition with the rest of the dispatch scheduler

Tier-routing rules are added to the rule set already specified by [`process/dispatch-as-scheduler.md`](../process/dispatch-as-scheduler.md):

| Rule layer (per dispatch-as-scheduler.md) | Purpose | Tier-routing addition |
|---|---|---|
| Office matching | Picks `dispatch-to: office:<X>` | Unchanged |
| Office selection (multi-candidate) | Picks single office | Unchanged |
| Capability check | Verifies office's authority | Unchanged |
| **Tier routing** | Picks `computation-tier` | **This spec** |
| Auto-dispatch | Opens session | Now also passes `computation-tier` to session-open |
| Fairness | Round-robin / priority | Unchanged |

The auto-dispatch daemon ([`process/dispatch-as-scheduler.md`](../process/dispatch-as-scheduler.md) §7) reads the `computation-tier` cell off the dispatched task and includes it in the session-open payload so [`process/session-as-process.md`](../process/session-as-process.md) §1's session record carries the tier from the start.

## 12. Conformance

Tier routing passes:

1. **Cheapest-sufficient.** A respond whose expected-output predicates settle at non-$\bot$ on Tier 1 produces no Tier-2 or Tier-3 invocation.
  Verified via the §13 conformance vector.
2. **Escalation determinism.** A Tier-1 → Tier-2 escalation produces matching `tier-escalated-from`/`tier-escalated-to` events whose hashes match documented values.
3. **Admissibility honoured.** A respond against an office with `denies-tier: tier-3` cannot escalate to Tier 3; surfaces `PCS_TIER_ESCALATION_DENIED`.
4. **Replay.** Replaying the event log reproduces the same tier-routing decisions byte-identically, including Tier-3 LLM-response substitution per §9.
5. **Cross-language equivalence.** Same fiber state + same admissibility cells → same tier choice in Python and Rust.

## 13. Conformance vector outline

A new conformance vector demonstrates that a routing decision is made by Tier 2 instead of an LLM with byte-identical output across replays:

- A fixture `tests/fixtures/tier-routing/tier-2-dispatch.jsonl` establishes:
  - An office `office:dispatch-router-test` at `formality-layer: F2` with default admissibility.
  - A model `model:dispatch-router-rfc-v3` per [`agential/non-lm-models.md`](../agential/non-lm-models.md) §1 with pinned weights and confidence-threshold $\tau$.
  - A task whose substrate-algebra alone returns $\bot$ for `dispatch-to-suboffice`.
  - The asserted cells needed to make the model's output confidence reach $\ge \tau$.
- Expected behaviour:
  - Tier 1 fires; settles at $\bot$ for the expected-output predicate.
  - The `tier-escalate-bottom-to-tier-2` rule fires; escalation events are emitted.
  - Tier 2 inference fires; output cell `(task:..., dispatch-to-suboffice, office:..., t)` is emitted with `computation-tier: tier-2` and `derived_from` pointing at the model and weights cells.
  - The session does NOT touch any Tier-3 LLM invocation event.
  - Replay reproduces every cell byte-identically; cross-language replay matches.

The vector is added to [`conformance-vectors.md`](../conformance-vectors.md) §12 (new section).

## 14. Plan 9 / Unix analogue

| Unix concept | Tier-routing analogue |
|---|---|
| Process scheduler with priority class | Tier-routing rule with admissibility composition |
| `nice` / `renice` | Office's `permits-tier` / `denies-tier` cells |
| In-kernel handler vs. userland fallback | Tier 1 vs. Tier 2 vs. Tier 3 |
| Fast-path / slow-path branching | Cheapest-sufficient escalation chain |
| `strace` recording syscalls | Tier-3 LLM event substitution on replay |
