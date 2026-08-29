---
title: Interface Ports
id: interface-port
role: structure
status: plan
derived_from: math/structure/policy-regime
proof_refs: []
---


# Interface Ports

## Statement

Input/output ports through which external data enters and observables exit the
system, constrained by policy and measurement stacks.

## Definition
- Carrier: port endpoints parameterised by [Policy Regime](./policy-regime.md);
  each port declares admissible payload types, policy regime, and observability.
- Ports: `InPorts` accept intake payloads; `OutPorts` expose observables.
- Compatibility: a port is compatible with another when payload/observable
  types and policy regimes agree.

## Invariants
- Payload/observable typing matches the earned intake/measurement carriers.
- Policy conformance: ports enforce the attached policy regime.
- Compatibility is symmetric and respects policy/type constraints.

## Proof
- Derived from: [Policy Regime](./policy-regime.md),
  attaching policy to intake/measurement endpoints.
- Shows that: parameterising ports by policy yields well-typed interface
  endpoints for system intake and distribution.
