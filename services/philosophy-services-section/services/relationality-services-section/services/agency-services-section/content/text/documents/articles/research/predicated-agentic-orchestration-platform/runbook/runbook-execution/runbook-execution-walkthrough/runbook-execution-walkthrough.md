---
type: example
class: runbook-walkthrough
depends-on: [runbook-execution, skill-invocation, dispatch-matching, settlement-path-cost-monotonicity]
instantiates: [runbook-execution, skill-invocation]
title: Runbook execution walkthrough
description: A concrete walkthrough of an agent executing a runbook composed of three skills at different formality layers, demonstrating settlement-path-cost-monotonicity in practice.
---

# Runbook execution walkthrough

A concrete walkthrough of an agent executing a runbook composed of three skills at different formality layers, demonstrating [settlement-path-cost-monotonicity](../../../settlement/settlement-path/settlement-path-cost-monotonicity/settlement-path-cost-monotonicity.md) in practice.

## Setup

- Substrate $S$ with agent `triage-officer`.
- Runbook `process-incoming-issue`:
  1. Step 1 — `parse-issue-payload` (skill at formality layer $F_3$, deterministic tool).
  2. Step 2 — `classify-issue-severity` (skill at formality layer $F_2$, model-assisted procedure with structured output).
  3. Step 3 — `route-to-team` (skill at formality layer $F_3$, deterministic tool — dispatch table lookup).
- Input: a raw issue payload from a federation peer.

## Trace

**Open session.** Per [open-session](../morphisms/open-session.md), `triage-officer` opens session `s-2026-05-01-triage-1` in scope `incident-response`.
Session-record records the agent, scope, started-at ordinal $\tau=8421$.

**Begin runbook.** Per [runbook-execution](../runbook-execution.md), the runbook execution starts.
Witness chain begins under the runbook-id.

**Step 1: parse-issue-payload ($F_3$).** Per [skill-invocation](../../../skill/skill-invocation/skill-invocation.md), the tool-layer skill executes deterministically: parse JSON payload, validate against shape, produce structured-issue record.
Cost: substrate compute only, no model invocation.
Witness records the substrate-state advance from $\tau=8421$ to $\tau=8422$.

**Step 2: classify-issue-severity ($F_2$).** The skill-layer skill has a substrate-recorded procedure (rules for severity classification) plus a model-invocation step for the natural-language portions.
Per [settlement-path-cost-monotonicity](../../../settlement/settlement-path/settlement-path-cost-monotonicity/settlement-path-cost-monotonicity.md), this layer's per-invocation cost is dominated by the model call but bounded by the structured procedure's narrow scope.
The model returns "severity: high"; the substrate validates against the procedure's shape; the validated severity is admitted.
Substrate-state advances to $\tau=8423$.

**Step 3: route-to-team ($F_3$).** Per [dispatch-matching](../../../dispatch/dispatch-matching/dispatch-matching.md), the dispatch table lookup matches the issue's (severity=high, type=security) to the security-team's queue.
Tool-layer skill executes deterministically — no model invocation.
Substrate-state advances to $\tau=8424$.

**Runbook completes.** The runbook's witness chain aggregates all three step-witnesses.
Per [witness](../../../objects/witness.md), the runbook produces a final witness with input-hash, per-step witness chain, output-hash.
Substrate-state at $\tau=8424$ reflects the issue routed to security-team.

**Close session.** Per [close-session](../morphisms/close-session.md), `triage-officer` closes the session with `ended-at: 8425`.

## Cost analysis

Per [settlement-path-cost-monotonicity](../../../settlement/settlement-path/settlement-path-cost-monotonicity/settlement-path-cost-monotonicity.md):

| Step | Layer | Per-invocation cost |
|---|---|---|
| 1: parse-issue-payload | $F_3$ | Substrate-compute only |
| 2: classify-issue-severity | $F_2$ | Substrate-compute + one structured model call |
| 3: route-to-team | $F_3$ | Substrate-compute only |

If the runbook were re-implemented entirely at $F_3$ (the severity classification became a deterministic rule rather than model-assisted), the runbook's cost would drop.
Per [settlement-path-cost-monotonicity](../../../settlement/settlement-path/settlement-path-cost-monotonicity/settlement-path-cost-monotonicity.md), this would be a permanent cost reduction.

## Replay verification

Per [settlement-determinism](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-determinism.md), replaying this runbook on the same input under the same rule-system version produces: - Step 1 ($F_3$): byte-identical output (deterministic). - Step 2 ($F_2$): byte-identical output *if the model's response is the same* (the witness records the model's response hash; replay can verify against the witness or re-call the model). - Step 3 ($F_3$): byte-identical output (deterministic).

The runbook's overall witness chain replays byte-identically given the recorded model response.
An auditor can ask "what did this triage do?" and see the full chain.

## What's notable

- **Mixed-formality runbooks are first-class.** The substrate doesn't require all-deterministic or all-model — runbooks compose layers naturally.
- **Cost is layer-determined.** Per [settlement-path-cost-monotonicity](../../../settlement/settlement-path/settlement-path-cost-monotonicity/settlement-path-cost-monotonicity.md), moving steps from $F_2$ to $F_3$ over time reduces cost without changing substrate behavior.
- **Audit covers the full execution.** Per [witness](../../../objects/witness.md), every step's effect is recorded; the runbook is replayable.
- **Per [session-as-time-bounded-sublocale](../../../session/session-as-time-bounded-sublocale/session-as-time-bounded-sublocale.md), the session bounds the work to the agent's authorized sublocale.**
