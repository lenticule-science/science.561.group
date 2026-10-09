---
type: reference
authors: [Almeida, Paulo Sérgio, Shoker, Ali, Baquero, Carlos]
year: 2018
title: "Delta State Replicated Data Types"
venue: "Journal of Parallel and Distributed Computing 111, 162–173"
kind: reference
description: P.
---

## Full citation

P. S. Almeida, A. Shoker, C. Baquero. "Delta State Replicated Data Types." *Journal of Parallel and Distributed Computing* 111, 162–173, 2018.

## Status

Pending direct access. Cited via secondary literature.

## Annotation

The delta-state CRDT model: replicas exchange small *deltas* — incremental updates relative to a shared causal frontier — rather than full state snapshots. The merge operation remains a join in the underlying join-semilattice, but the bandwidth profile improves dramatically when state grows. For the program, this is the bandwidth-realistic refinement of the bare CRDT-convergence framework: deltas correspond to Čech 1-cochains modulo coboundaries — i.e., classes in $H^1$ relative to a local-state cover.

## Where used

- [CRDT convergence](../../../glossary/concepts/crdt-convergence.md)
- [CRDTs and CALM](../notes/undated/crdts-and-calm.md)
