---
title: Critical Lenses, Affect, and Assemblages Program
id: critical-lenses-assemblages-program
role: structure
status: someday
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
---



Program idea to represent genre, affect, power, and assemblages as recognitions
so agents can respect cultural complexity.

## Behaviour
- Genre & discourse recognitions:
  - `GenreRecognition`: form/voice conventions; blend relations.
  - `DiscourseMoveRecognition`: local moves (hedging/asserting/joking, etc.)
    linked to text fragments.
- Affect & stance recognitions:
  - `AffectStateRecognition`: emotional/energetic state (label/intensity/valence).
  - `StanceRecognition`: orientation (reverent, skeptical, ironic, etc.).
  - Measurements: affect time series by domain; stance–outcome correlations.
- Critical lenses & power:
  - `LensRecognition`: critical lens (Marxist, feminist, queer, etc.).
  - `PowerStructureRecognition`: who benefits/harmed/invisible; actors/resources/norms.
  - `LensApplicationRecognition`: highlights/tensions from applying a lens.
- Assemblages:
  - `AssemblageRecognition`: configuration of heterogeneous elements with
    binding relations and functions.
  - `AssemblageElementRoleRecognition`: roles elements play.
  - Topology/measurement: overlap/nesting/change; stability/fragility/power diffusion.
- Cultural metrics:
  - `RepresentationRecognition`: who/what appears (axes tied to your vocab).
  - `ImpactRecognition`: assessed/experienced impact (stress/hope/etc.).
  - `NormShiftRecognition`: patterns suggesting changing norms.
- Runbooks/agents:
  - `analyze_with_lens`, `surface_hidden_costs`, `map_benefit_harm`.
  - Agents choose genres/stances explicitly, run lenses before summarizing,
    watch representation/impact skew, and suggest rebalancing runbooks.

## Proof
- Derived from: [Documentation Interpreter](../../../computer/type/documentation-interpreter.md).
- Shows that: this program instantiates the documentation interpreter to realise the described behaviour without extending machine semantics.

