---
component-of: container
within: relational-machine-runtime
specialization: processing-component
applies: transformation-operation
reads:
  - data-store
  - state
produces: output
distinguishes: live-runtime-from-static-store
date-created: 2026-03-18
date-modified: 2026-03-19
---

# Engine

## What this is

An **Engine** is the processing component within a [Runtime](relational-machine-runtime.md) that applies transformation operations to [State](state.md) held in a [DataStore](data-store.md) and produces output.

The Engine is what makes a Runtime live.
A DataStore with no Engine is an archive.
An Engine with no DataStore is stateless.
A Runtime combines both: the DataStore holds the accumulated State; the Engine continuously transforms it.

## Role in the ExpertSystem pattern

The Engine corresponds to the **inference engine** in the [ExpertSystem](expert-system.md) pattern.
The DataStore is the knowledge base; the Engine applies operations to that knowledge base to derive output.

In classical expert systems, the inference engine applied logical rules to a knowledge base to produce conclusions.
In a [RelationalMachineRuntime](relational-machine-runtime.md), the Engine applies the composite nucleus π_t = σ_t ∘ Δ_t to the fiber H_t, retracting it onto H*_t = Fix(σ_t) ∩ Fix(Δ_t).

## What an Engine is not

An Engine is not the DataStore.
The Engine does not hold persistent State — all durability lives in the DataStore.
The Engine reads from and writes to the DataStore, but between invocations it carries nothing.

An Engine is not the input boundary.
The [RelationalMachineInterface](relational-machine-interface.md) receives external steps; the [RelationalMachineSteppingMap](relational-machine-stepping-map.md) advances the history index.
The Engine operates within an index position to transform the State there.

An Engine is not the Observation Layer.
The Observation Layer reads settled State and emits it outward.
The Engine produces that settled State; the Observation Layer exposes it.

## The absence of an Engine marks a System, not a Runtime

A [RelationsSystem](relations-system.md) has no Engine.
Agents perform closure operations through skill invocations — there is no continuously-running processing component driving normalization.
This is not a deficiency; a System is static by design.
The absence of an Engine is what distinguishes a System from a Runtime.

An Engine MUST read State from a [DataStore](data-store.md), apply defined transformation operations to that State, and write the result back.
It MUST hold no persistent State itself — it is stateless between invocations.
An Engine MUST NOT receive external inputs directly (that is the [RelationalMachineInterface](relational-machine-interface.md)'s role) and MUST NOT emit output to external consumers directly (that is the Observation Layer's role).

## Open questions
