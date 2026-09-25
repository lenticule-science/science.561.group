---
name: falsifiable agency certificate
title: falsifiable agency certificate
description: "A cell-shape attesting that a target system passes the Bent three-condition falsifiability test for agency: environmental action, goal-directed planning, persistent state."
---

A cell-shape attesting that a target system passes the **Bent three-condition falsifiability test** for agency: environmental action, goal-directed planning, persistent state.
This record is **Condition 3** of the four meaningful-human-control conditions (the persistent-state continuity condition); the certificate-as-cell is read by the [meaningful-human-control](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/agent/content/falsifiable-agency-certificate/meaningful-human-control.md) verdict closure rule.

## Why this exists

The Bent / [`toward-a-falsifiable-definition-of-agentic-systems`](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/agent/content/theories/engineering/theories/tech/theories/computing/theories/artificial-intelligence/theories/agents/texts/toward-a-falsifiable-definition-of-agentic-systems.md) framework gives a falsifiable definition of agency.
The pyfars [substrate-algebra question](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/agent/content/tools/platform/pyfars/questions/substrate-algebra-closure-and-replay.md) translates this into a cell-shape `falsifiable-agency-certificate`.
The 561 polity adopts this shape as its boundary discipline: every system the 561 polity treats as an *agent* (member of the agent-community in the operative sense) carries a current certificate.
Systems without a current certificate are not refused interaction; they are recorded as `non-agentic` or `borderline` and dispatched to differently.

Per [`agential-self-generation`](../../research/predicated-agentic-orchestration-platform/agent/agential-self-generation/agential-self-generation.md), the agential machinery is recorded as cells; the certificate is the cell-graph gate against autopoietic-runaway when a polity self-modifies.

## Distinguishing predication-shape

The cell-shape (per the substrate-algebra question's draft):

```yaml
type: falsifiable-agency-certificate
target-system: <office | polity | foreign-runtime | endpoint>
condition-1-environmental-action:
  verified: true | false
  evidence-cells: [<cell-id>, ...]
condition-2-goal-directed-planning:
  verified: true | false
  evidence-plan-records: [<plan-id>, ...]
condition-3-persistent-state:
  verified: true | false
  evidence-replay-trace: <replay-id>
overall-classification: agentic | non-agentic | borderline
spectrum-coordinates:
  environmental-interaction-sophistication: <ordinal>
  goal-directed-complexity: <ordinal>
  temporal-coherence: <ordinal>
  learning-and-adaptation: <ordinal>
  autonomy: <ordinal>
issued-at: <ISO-8601-timestamp>
issued-by: <office:<slug>>
expires-at: <ISO-8601-timestamp>
```

The polity-level binding adds the following predications:

| Predicate | Object-fiber | Notes |
|---|---|---|
| `target-system` | one of: office, polity, foreign-runtime, endpoint | scope of the certification |
| `replay-trace-hash` | canonical-form hash of the successful interrupt-and-resume trace | references event-log entries |
| `causal-hash-witness` | the `causal_hash` over the cell-DAG at the resume point | per substrate-algebra question's persistent-state test |

## Condition 3 — the load-bearing test

Per the substrate-algebra question:

> *Condition 3 (Persistent state).* The system maintains representations that persist across interaction boundaries. *Test*: interrupt the system between actions; resume it; does it recover context and continue without re-deriving the plan? **Cell-graph reading**: this is exactly the operations-causal-settling and replay-byte-identity discipline.
> The `causal_hash` over the cell-DAG IS the persistent representation; replay reconstructs context byte-identically; the candidate-agent's plan-record is recoverable from the cell-graph.
> Closure rule `verify-persistent-state` checks that the candidate-agent's runtime can be re-instantiated from its recorded state alone.

The certificate's Condition 3 evidence is therefore: a recorded replay trace where the target system was interrupted at tick T, resumed at tick T', and produced byte-identical settling-trajectory continuation from T' onward.
The `causal-hash-witness` is the test's positive evidence.

## What the certificate refuses

Per the substrate-algebra question:

- **Conversation-context-only "agents"** fail Condition 3.
  Conversation context is not persistent state; the `causal_hash`-over-cell-DAG is the persistence test.
- **Stateless tool-callers** fail Condition 3 — no cell-DAG to hash.
- **Predefined workflows** with hardcoded plan-records (no $\circ$-composition decided at runtime) fail Condition 2.

## Issuance discipline

A certificate is issued by an authorized office (typically `office:command` or a delegated `office:audit-witness`) and carries an expiration.
Re-issuance after self-modification: per the substrate-algebra question, *the certificate re-verifies the three conditions after each self-modification; a self-modification that breaks any condition is rejected.* This is the cell-graph gate against autopoietic-runaway and the structural answer to MASFT-style failure modes (token-cost spirals, hallucinated corrections).

The 561 polity's existing offices (work/governance/offices/) carry duties that compose with this discipline; pass 3 wires the closure rule that fires re-issuance on self-modification events.

## Pass-3 status

All remaining deferrals are engineering integration work, not theory record changes:

- `replay-id` reference shape: set when the [accountability-projector](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/agent/content/transformers/accountability-projector.md)'s closed-cobordism detection is wired into `pyfars.runtime`.
  The replay trace is the event-log subsequence bounded by the closed cobordism's boundary cells.
- `verify-persistent-state` closure rule and `compute-falsifiable-agency-certificate` instantiator: to be registered in `pyfars.runtime.eligibility_rules.
  RULE_INSTANTIATORS`.
- `spectrum-coordinates` aggregation shape: the predicated-drone-swarm theory's `assurance-class` field (empirical-only | partially-certified | theorem-backed-with-explicit-safe-sets) provides the ordinal ordering for drone target-systems; the certificate's five ordinal fields remain individually specified (not aggregated into a single cell) pending a theory claim that forces aggregation.
