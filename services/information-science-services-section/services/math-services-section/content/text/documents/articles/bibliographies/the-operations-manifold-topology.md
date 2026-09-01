---
title: "Reference on the Operations Manifold Topology"
description: "Documents the operations-manifold surface reading an induced action family as topology (structures consumed and produced, local edges composing by structure identity plus Hoare post/pre compatibility, and frontier structures lacking a local producer or consumer), exposing operationsManifoldOf, operationsManifoldGraphOf, and the manifold resource derived from induceBins discovery structures."
date-created: 2026-06-18
keywords:
  - MCP
  - structure
  - action
  - package
  - apex
  - hoare-logic
type: bibliography

---


The operations-manifold surface reads an induced action family as topology: which structures the package consumes, which structures it produces, which local actions compose by structure identity plus Hoare post/pre compatibility, and where the visible frontier still lacks a local producer or consumer.

This is not a route table and not an operations-site registry.
It is derived from the same discovery structure that powers dispatch, OpenAPI, MCP, prompts, resources, forms, and schema-node mounting.

## Public Handles

Import from `@emsenn/metroplat/running`:

- `operationsManifoldOf`
- `operationsManifoldGraphOf`
- `operationsManifoldUri`
- `operationsManifoldResource`

The main inputs are ordinary `induceBins(...)` discovery structures.
No package imports another package to make a graph. For local edges inside one induced apex, structure identity supplies the boundary candidate and `ContractCompositionReport` checks the stronger law:

```text
producer.codomain.$id === consumer.domain.$id
producer.postcondition => consumer.precondition
```

## What It Reads

`operationsManifoldOf(discovery)` returns:

- an apex summary: package name, protocol, action bins, resource URIs, prompt names
- domain extrema: structure `$id`s consumed by package actions
- codomain extrema: structure `$id`s produced by package actions
- incoming frontier: consumed structures with no local producer
- outgoing frontier: produced structures with no local consumer
- local edges: action pairs whose codomain/domain structure ids match and whose `ContractCompositionReport.ok` is true
- rejected local edge candidates: schema-identity matches whose Hoare post/pre report failed
- utterance facts describing the manifold as relational data

`operationsManifoldGraphOf(manifolds)` lifts that read across several package manifolds.
If one supplied package produces a structure another supplied package consumes, the graph contains a cross-package edge.
Unmatched structures stay visible as incoming or outgoing frontier.

## Product Reading

This is the package-mesh read that turns "a bunch of Node packages with actions" into a typed operation graph.
It makes package composition inspectable without asking an agent to infer it from README prose, HTTP paths, or import graphs.

The useful move is that action topology is structure topology checked by contract topology.
The package does not need separate workflow metadata to know that one operation can feed another: the structure identity equation proposes the edge, and the phase-indexed Hoare report decides whether the edge is admissible.

## MCP Resource

`induceBins(...)` automatically publishes an operations-manifold resource beside the discovery resource.
An MCP client can list resources, read `operationsManifoldUri(packageName)`, and get the current apex/extrema/edge projection as JSON.

## Boundary

The operations manifold does not execute actions or schedule work.
For local action pairs it exposes both the structure incidence graph and the contract-composition report already implied by action declarations; cross-package graph edges remain structure-boundary candidates unless the package manifests being compared carry enough contract material to check Q=>P.
Runtime dispatch, validation, witnessing, and transport behavior stay in their own surfaces.

## Verification

The action-apex projection tests read the MCP operations-manifold resource and assert that local edges carry `metroplat.contract.composition` reports with boundary and predicate compatibility accounted.
