---
name: distributed-path-compose
role: Compose paths across a distributional coverage site with refinement/gluing.
inputs:
- id: distributional-coverage-site
  name: site
- id: path-payload
  name: path-a
- id: path-payload
  name: path-b
outputs:
- id: path-payload
  name: composed
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Orchestrates the parameterized path composition lift across a
[Distributional Coverage Site](../structure/distributional-coverage-site.md).

## Definition
- Inputs: two routed path payloads whose endpoints align and whose cover
  identifiers share a refinement; access to restriction services for both ends.
- Outputs: a composed path payload with provenance showing which nodes executed
  reparameterization and gluing.
- Behaviour: schedules restriction to a common overlap, invokes the
  [Path Composition Lift](../../math/operator/path-composition-lift.md) with
  distribution-aware parameters, then replicates the result to interested ports.

## Preconditions
- Coverage metadata is synchronized across nodes so refinement/overlap tables are
  consistent.
- Failure channels connected to propagate incompatibility or missing overlaps.

## Postconditions
- Successful composition yields a path payload ready for machine-level runtime
  execution; failures are emitted with enough provenance for replay.
- Matching-family caches in the distributional coverage site are updated or
  invalidated coherently.

## Proof
- Uses: [path-composition-lift](path-composition-lift.md) plus overlap/restrict
  operators on the distributional coverage site to refine/glue paths.
- Shows that: refining both paths to a common overlap and gluing yields a
  composed path with recorded provenance, suitable for downstream execution.
