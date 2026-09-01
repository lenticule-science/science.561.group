---
name: distributional-coverage-site
role: structure
derived_from: math/structure/parameterized-coverage-site
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



System projection of the parameterized coverage site where covers, restrictions,
and matching checks are distributed across interfaces and policy-controlled
nodes.

## Definition
- Ports: ingest cover descriptions, emit refined covers, and expose restriction
  services keyed by cover indices.
- Tasks: coordinate overlap computation, schedule matching-family checks, and
  trigger sheaf gluing when compatibility succeeds.
- Policies: control refinement depth, caching of restrictions, and admissible
  base-change operations when covers move between nodes.
- Interfaces: message shapes for cover tables, restriction payloads, and
  matching-family witnesses.

## Invariants
- Distribution safety: every distributed restriction is traceable to the
  underlying parameterized coverage and respects refinement policies.
- Liveness: matching-family checks eventually return either compatibility data
  or explicit incompatibility to avoid silent stalls.
- Reversibility hooks: path-composition requests retain provenance so failures
  can be replayed or rolled back without violating coverage invariants.

## Proof
- Derived from: [Parameterized Coverage Site](../../math/structure/parameterized-coverage-site.md)
  by assigning interfaces, tasks, and policies for distributed execution.
- Shows that: coverage, restriction, and matching logic survive distribution and
  are ready for kernel realisation and SDK projection.
