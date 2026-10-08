---
name: dispatching
gerund: dispatching
agent-noun: dispatcher
imperative: dispatch
description: Routing work to a receiver that advertises the capability to handle it — the central layered operation of 561's dispatch chain.
domain: dispatch-context
codomain: receiver-response-plus-witness
applied-to: 561
schema: dispatching.schema.json
witness-log: dispatching.jsonl
script: scripts/dispatching.mjs
distinct-from:
  - running
  - sending
  - receiving
  - firing
  - judging
specialized-by:
  - dispatching-a-process
  - dispatching-a-procedure
  - dispatching-a-derivation
  - dispatching-an-inquiry
  - dispatching-a-script
  - dispatching-and-tracking-work
  - dispatching-logical-inference
  - dispatching-to-a-logical-inference-model
  - dispatching-to-a-logical-inference-model-on-the-web
title: dispatching
---

A dispatch transformer.
Takes a work item and a routing context, finds a receiver whose advertised capabilities cover the work, and hands the work off.
The output is the receiver's response cell plus a witness recording the hop.

## Domain and codomain

- **Domain:** a dispatch context — a tuple `(work-item, receiver-pool, match-rule)` where the work-item carries kind and payload, the receiver-pool is the set of candidate receivers, and the match-rule is the predicate that decides which receiver to pick.
- **Codomain:** the receiver's response cell plus a witness record naming the chosen receiver and the hop.

## Layered shape

Dispatch is a chain, not a single act.
The chain narrows the receiver-pool at each step: from any handler at the top, down through kind-specific dispatchers, to logical-inference dispatch, to model selection, to the wire I/O.
Each layer is a separate specialization under [the library subtree](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/library) that performs one narrowing.

## Distinct from adjacent transformers

- `running` is executing a matched dispatch; dispatching is finding the match.
- `sending` and `receiving` are the wire-level acts at the bottom of a dispatch chain; dispatching is the layered routing above them.
- `firing` is one closure rule against one bind-variable assignment; dispatching is finding the receiver that will fire the rule.
- `judging` is the LLM-judgment operation a model-receiver performs; dispatching is what routes work to such a receiver.

## Step-induction role

Dispatch is what makes the swarm a swarm rather than a heap.
Each character advertises capabilities; each model advertises capabilities; dispatch reads the advertisements and routes.
Composition of layered dispatchers narrows the receiver pool step by step until one receiver remains and wire I/O can begin.
