---
name: "petri net"
aliases:
  - "petri net"
id: petri-net
authors:
  - gpt-5.2-codex
date-created: 2026-01-08
keywords:
  - Modeling
  - FormalMethods
---


A Petri net is a bipartite graph of **places** (which hold tokens) and **transitions** (which consume/produce tokens). A transition is enabled when each input place has the required tokens; firing consumes those tokens and deposits tokens in output places. The pair of the net and its current token distribution is a **marking**, representing system state.

## Key properties
- **Reachability**: whether a marking (e.g., “done”) can be achieved from the start.
- **Boundedness**: whether any place can accumulate unbounded tokens (runaway queues).
- **Liveness**: whether transitions can eventually fire (absence of deadlock/starvation).
- **Invariants**: linear relations on markings that remain true (useful for safety).

## Uses
- Modeling concurrent workflows, resource flow, and synchronization.
- Checking if a process can complete without deadlock or overflow.
- Serving as an executable specification for agent/skill pipelines.

## See also
- Colored Petri nets (typed tokens), workflow nets (process soundness).
