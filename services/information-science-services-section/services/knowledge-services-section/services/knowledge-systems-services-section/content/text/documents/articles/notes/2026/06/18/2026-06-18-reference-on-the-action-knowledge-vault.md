---
title: "Reference on the Action Knowledge Vault"
description: "Documents how induceBins projects a knowledge-vault shape (tools, resources, prompts) from one induced action apex with no separate MCP registry to keep in sync, exposing the resource/prompt layer (literalResource, observeResource, observePrompt, prompt, observation contracts) from @emsenn/metroplat/running."
date-created: 2026-06-18
keywords:
  - action
  - boundary
  - MCP
  - package
  - structure
  - witness
  - membrane
  - apex
  - OpenAPI
  - hoare-logic
---


The action apex is not only a tool list.
`induceBins` also induces MCP resources and prompts from the same package surface.

This gives a package a small knowledge-vault shape:

- tools: actions that can be called
- resources: addressable artifacts the package declares or derives
- prompts: composed message templates the package declares or derives

All three are projected from one induced apex.
There is no separate MCP registry to keep in sync.

## Public Handles

Use `@emsenn/metroplat/running` for the resource and prompt layer:

```ts
import {
  actionMcpHandle,
  literalResource,
  observeResource,
  observePrompt,
  prompt,
  promptObservationContract,
  resourceObservationContract,
  userMessage,
} from "@emsenn/metroplat/running";
import { action, induceBins } from "@emsenn/metroplat";
```

`induceBins(source)` collects:

- action legs from `action(...)`
- resource legs from `resource(...)` or `literalResource(...)`
- prompt legs from `prompt(...)`

It also derives:

- JSON Schema resources for registered structures and action inputs/outputs
- a discovery resource for the apex itself
- an operations-manifold resource for the induced operation graph
- export-surface resources when an admitted package export surface is supplied
- bin-surface resources when an admitted package bin surface is supplied
- package-surface resources when an admitted package membrane is supplied
- resource-observation contracts, lenses, witness policies, and descriptor projection reports on resource descriptors
- prompt-observation contracts, lenses, witness policies, and descriptor projection reports on prompt descriptors
- one guided prompt per action

## What This Is For

This is the package-level version of "do not make agents guess the API from a README."
The same action declaration that dispatches an operation can also project:

- the callable MCP tool
- the input/output schema resources
- the discovery structure
- a prompt that tells an agent how to prepare the input structure
- custom package resources and prompts
- admitted package export surfaces as API-boundary commitments
- admitted package bin surfaces as process-entrypoint commitments
- admitted package membranes as combined package-boundary commitments
- the `ContractExposure` and `ContractExposureReport` proving a `resources/read` boundary observation was lensed and witnessed under Ω

That is useful for humans too, but the primary audience is an agent or tool surface that can list/read resources and get prompts before calling a tool.

## Example

The runnable example:

```sh
node examples/package/action-projection.mjs
```

induces the package action apex and checks the MCP/OpenAPI projection:

- `tools/list` exposes one tool per action
- OpenAPI and MCP carry the same `settle` contract id
- successful `tools/call` runs dispatch as a full action outcome and returns ordinary text content plus the action `ContractExposure`, `ContractExposureReport`, action-contract `ContractOutcome`, action-contract `ContractOutcomeReport`, action-instrument `ContractOutcome`, action-instrument `ContractOutcomeReport`, and `InstrumentRealizationReport`
- failed `tools/call` returns the ordinary MCP tool-error result plus a boundary-only `tool-error` `ContractExposure` and `ContractExposureReport`
- `resources/read` returns the operations-manifold resource body
- the same `resources/read` response includes a `ContractExposure` with contract, lens, and witness-policy ids plus a `ContractExposureReport`
- `prompts/get` returns rendered messages plus a prompt `ContractExposure` and `ContractExposureReport`
- the admitted package export surface is readable as structure material through the same resource boundary
- the admitted package bin surface is readable as structure material through the same resource boundary
- the admitted package membrane is readable as structure material through the same resource boundary

For the derived operations-manifold resource specifically, see [Operations manifold topology](2026-06-18-reference-on-the-operations-manifold-topology.md).

## Boundary

This is not an agent runtime.
It does not plan, schedule, remember, or decide.
It projects what the package has declared so an MCP-capable client can inspect and call it.

It is also not a replacement for structure validation.
Tools still run through the action dispatcher and its codecs.
Resources and prompts make the action family legible; they do not weaken the boundary.
Resource reads are boundary observations: `resourceObservationContract` derives the Γ/P/m/Q/Φ/Λ/Ω contract for the resource leg, and `observeResource` returns the text with its exposure witness.
Tool calls are boundary observations too: dispatch attaches `DispatchResult.exposure` plus `DispatchResult.exposureReport`, `DispatchResult.outcomeReport`, and `DispatchResult.instrumentOutcomeReport`; MCP exposes them as `result.exposure`, `result.exposureReport`, `result.outcomeReport`, and `result.instrumentOutcomeReport`, and pure HTTP routing carries the same report-bearing material on `ServedResponse`.
Prompt renders are boundary observations as well: `promptObservationContract` derives the Γ/P/m/Q/Φ/Λ/Ω contract for the prompt leg, and `observePrompt` returns messages with their exposure witness.
Route documents are boundary observations at the transport face: `routeObservationContract` derives the route Γ/P/m/Q/Φ/Λ/Ω contract, and `routeRequest` exposes generated OpenAPI, discovery, index, health, feed, form, MCP-envelope, and route-error responses with `ServedResponse.exposure`.
Evaluator term packets are resource material as well: `evaluatorTermPacketResources` publishes closed RMN catalog terms with packet-publication contracts, so portable descent, reader, measurement, FCA, and Chu bodies can be read through the same MCP resource boundary.
Export surfaces are resource material when supplied from package-manifest admission: `exportSurfaceResources` publishes the classified API commitments and a boundary-only Hoare contract for observing them.
Bin surfaces are resource material on the same terms: `binSurfaceResources` publishes classified process-entrypoint commitments and a boundary-only Hoare contract for observing them.
Package surfaces combine those faces: `packageSurfaceResources` publishes the admitted package membrane and a boundary-only Hoare contract for observing the combined vocabulary.
