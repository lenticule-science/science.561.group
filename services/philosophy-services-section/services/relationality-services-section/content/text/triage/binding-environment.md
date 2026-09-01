---
title: Binding Environment
id: binding-environment
role: structure
status: plan
fields:
- name: env
  type: trace
  description: list or map of `{id, value}` entries.
- name: parent
  type: binding-environment
  description: optional outer environment for lexical scoping.
proof_refs:
- relationlessness
---


Finite mapping from identifiers (port ids or local names) to traces,
used during evaluation to resolve variables and ports.

## Definition
- `env`: list or map of `{id, value}` pairs where `value` is a [trace](trace.md).
- `parent`: optional link to an outer environment for lexical scoping.

## Invariants
- Uniqueness: ids are unique within a single environment layer.
- Shadowing: inner environments may shadow outer ids; lookup searches innermost first.
- Type discipline: values respect the carrier types declared for ids (ports or variables).
- Persistence: lookups are pure; updates produce a new environment (or
  explicitly mutate via documented operators).

## Proof
- Uses: the need to resolve identifiers during evaluation.
- Shows that: an explicit environment structure suffices to bind names to
  values with lexical scoping and type discipline.
