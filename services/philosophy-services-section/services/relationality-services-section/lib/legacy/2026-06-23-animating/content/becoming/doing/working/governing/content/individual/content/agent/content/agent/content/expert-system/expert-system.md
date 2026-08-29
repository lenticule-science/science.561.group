---
title: "Expert System"
description: "An ExpertSystem is any live system whose architecture combines a DataStore (knowledge base) with an Engine (inference engine): the DataStore holds structured content; the Engine applies operations to that content to produce output."
defines: ExpertSystem
extends: System
related: RelationalMachineRuntime
uses:
  - DataStore
  - Engine
date-created: 2026-03-18
date-modified: 2026-03-19
---

## What this is

An **ExpertSystem** is a live system that combines a [DataStore](data-store.md) with an [Engine](engine.md).

The DataStore holds structured content — accumulated knowledge, state, constraints.
The Engine applies operations to that content — inference rules, normalization, derivation — and produces output.
Together they constitute a system that reasons: it takes accumulated knowledge and derives conclusions from it.

The term comes from classical AI (1970s–1990s), where an expert system consisted of a knowledge base and an inference engine.
This pattern strips the domain-specific connotations and makes it available as a structural concept.

## The RelationalMachineRuntime is an ExpertSystem

A [RelationalMachineRuntime](relational-machine-runtime.md) is an ExpertSystem:

| ExpertSystem component | RelationalMachineRuntime component |
|---|---|
| Knowledge base (DataStore) | DataStore |
| Inference engine (Engine) | Engine |
| Output / explanation layer | Observation Layer |

The RelationalMachineRuntime is not merely analogous to an expert system.
It IS a formal instantiation of the ExpertSystem pattern — the DataStore + Engine architecture given a precise mathematical substrate.

## A RelationsSystem is not an ExpertSystem

A [RelationsSystem](relations-system.md) has no Engine.
Agents drive closure through skill invocations, not through a continuously-running Engine.
The absence of an Engine is not a gap — it is what makes a System static and a Runtime live.
A static ExpertSystem is not an ExpertSystem; it is a System.

## What the pattern predicts

Any live, running cognitive system that accumulates knowledge and derives conclusions from it will have both a DataStore and an Engine.
A system with a DataStore but no Engine is an archive.
A system with an Engine but no DataStore restarts from nothing on every invocation.
Finding one without the other in a designed live system indicates either an incomplete architecture or a system that is not actually running.

An ExpertSystem MUST have a [DataStore](data-store.md) that persists structured content and an [Engine](engine.md) that applies operations to that content.
It MUST be live — an ExpertSystem whose Engine cannot run is not an ExpertSystem; it is a System.

## Open questions

- Whether the ExpertSystem pattern requires the Engine to be autonomous (running without external triggers) or whether event-driven Engines (triggered by steps received at the [RelationalMachineInterface](relational-machine-interface.md)) qualify.
  The RelationalMachineRuntime uses event-driven Engine invocations (Dapr actors invoked by NATS messages), not a continuously polling Engine.
