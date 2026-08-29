---
id: relational-machine-runtime
description: "A RelationalMachineRuntime is a live, operational instantiation of the RelationalMachine: a running system with an input boundary receiving steps, a DataStore holding fiber Heyting algebra state, an Engine applying dual-nucleus normalization, and an Observation Layer emitting settled sections."
defines: RelationalMachineRuntime
implements:
  - RelationalMachine
  - ExpertSystem
date-created: 2026-03-18
date-modified: 2026-03-18
---

# Relational Machine Runtime

## What this is

A **RelationalMachineRuntime** is a live, operational instantiation of the [RelationalMachine](relational-machine.md).

The RelationalMachine is the abstract specification: the mathematical description of what a machine with fiber Heyting algebra state and dual-nucleus normalization must be.
The RelationalMachineRuntime is that specification running — a concrete system that receives steps, maintains State, normalizes fibers, and emits settled sections.

A RelationalMachineRuntime IS an [ExpertSystem](expert-system.md): its [DataStore](data-store.md) is the knowledge base (H_t) and its [Engine](engine.md) is the inference engine (π_t = σ_t ∘ Δ_t).

## How it differs from RelationalMachine

The RelationalMachine is the specification — the abstract mathematical structure.
The RelationalMachineRuntime is the realization — it IS running, it IS processing steps, its DataStore IS holding actual State.

The distinction is the same as between a program specification and a running process, or between a theory and one of its models.
A RelationalMachine that is not running is not a RelationalMachineRuntime.

## How it differs from RelationsSystem

A [RelationsSystem](relations-system.md) has no [Engine](engine.md).
Agents drive closure through skill invocations; there is no continuously-running processing component.
A RelationsSystem is static; a RelationalMachineRuntime is live.
This is not a ranking — they are different kinds of things that happen to share the same mathematical fixed point (R = U_G(R)) from different operational angles.

A RelationalMachineRuntime MUST have all components of the input boundary running — [RelationalMachinePort](relational-machine-port.md), [RelationalMachineInterface](relational-machine-interface.md), [RelationalMachineSteppingMap](relational-machine-stepping-map.md) — along with DataStore, Engine, and Observation Layer.
The DataStore MUST persist State durably across Engine invocations.
The Engine MUST be stateless between invocations — all durability lives in the DataStore.
The [RelationalMachinePort](relational-machine-port.md) declares the independence relation I; the [RelationalMachineInterface](relational-machine-interface.md) MUST enforce it: commuting steps MUST produce the same history class regardless of order, and step processing MUST be idempotent so that at-least-once delivery does not corrupt State.
A RelationalMachineRuntime MUST NOT share State with a [RelationsSystem](relations-system.md) — the two are categorically different systems with different operational models and no defined interoperability.

## Open questions
