---
name: dispatching
gerund: dispatching
agent-noun: dispatcher
imperative: dispatch
description: Routing work to a receiver that advertises the capability to handle it — the central layered operation of the OS's dispatch chain.
---

A dispatch transformer.
The transformer takes a work item and a routing context, finds a receiver whose advertised capabilities cover the work, and hands the work off.
The output is whatever the receiver returns plus a witness recording the hop.

## Domain and codomain

- **Domain:** a dispatch context — a tuple `(work-item, receiver-pool, match-rule)` where the work-item carries kind and payload, the receiver-pool is the set of candidate receivers, and the match-rule is the predicate that decides which receiver to pick.
- **Codomain:** the receiver's response cell plus a witness record naming the chosen receiver and the hop.

## Layered shape

Dispatch is a chain, not a single act.
The OS's dispatch chain layers narrow the receiver-pool at each step: from "any handler" at the top (`dispatching-work`) down through kind-specific dispatchers (`dispatching-a-process`, etc.) to logical-inference dispatch (`dispatching-logical-inference`) down to model selection (`dispatching-to-a-logical-inference-model`) down to the wire I/O.
Each layer is a separate skill that does one narrowing.

## Morphological forms in naming grammar

- `gerund: dispatching` heads skills built on this transformer: `dispatching-work`, `dispatching-a-process`, `dispatching-logical-inference`, `dispatching-to-a-logical-inference-model`, etc.
- `agent-noun: dispatcher` heads agents that invoke such skills.
- `imperative: dispatch` heads scripts that body such skills: `dispatch-work.mjs`, `dispatch-a-process.mjs`, etc.

## Distinct from adjacent transformers

- `running` is executing a matched dispatch; dispatching is finding the match.
- `sending` and `receiving` are the wire-level acts at the bottom of a dispatch chain; dispatching is the layered routing above them.
- `firing` is one closure rule against one bind-variable assignment; dispatching is finding the receiver that will fire the rule.
- [`judging`](judging.md) is the LLM-judgment operation an inference-model receiver performs; dispatching is what routes work to such a receiver.
  A workitem with `kind: derivation` or `inquiry` naming a capability-only judging skill is dispatched to whichever model record advertises the judging-skill's slug.

## Function-boundary shapes

The structures crossing the layered dispatch boundaries:

- Input: [`workitem-record`](../structures/workitem-record.md) — the in-flight cell-form the chain passes between layers.
  Required cells `kind`, `skill`, `target` plus kind-specific cells.
- Receiver registry: [`inference-model-record`](../structures/inference-model-record.md) for LLM-receivers; [`skill.md`](../../work/governance/rules/specifications/skill.md) for script-receivers.
  Future receiver-kinds get their own structure files.
- Witness: [`dispatch-witness-record`](../structures/dispatch-witness-record.md) — appended to `code/logs/tool-uses/YYYY-MM-DD.jsonl` by every layer when work crosses its boundary.

Every `dispatching-*` skill inherits its input/output contract from [`dispatching.schema.json`](dispatching.schema.json) at MCP-registration time via the harness's contract composer (`skill.md` §158).

## Step-induction role

Dispatch is the operation that makes a swarm a swarm rather than a heap.
Each character advertises capabilities via `skills:`; each model advertises capabilities via `skills:`; dispatch reads the advertisements and routes.
Composition of layered dispatchers narrows the receiver pool step by step until exactly one receiver remains and the wire I/O can begin.
