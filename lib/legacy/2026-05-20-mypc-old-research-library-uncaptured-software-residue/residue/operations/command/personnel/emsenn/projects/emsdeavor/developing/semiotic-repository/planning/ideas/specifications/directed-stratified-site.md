---

title: Directed Stratified Site Simulation
aliases:
  - Directed Stratified Site Simulation
  - directed stratified site simulation
date-created: "2026-03-04T00:00:00"
keywords:
  - simulation
  - site
  - directed
depends_on:
  - theorem/external/relational-directed-stratified-infinity-sites
type: specification
description: Specification for simulating directed stratified sites with coverage computation, tower generation, and directed morphism validation.
target-discipline: mathematics
triage-status: promotable
---


# Specification (Directed Stratified Site Simulation)

This specification focuses on generating the directed coverage and stratification
described in the Infinity-Site theorem, emphasising practical data structures
for disciplines, filters, and towers.

## State representation

- **Strata registry.**  
  Map of strata identifiers to their corresponding acts (e.g., foundation,
  trace, term, etc.), along with discipline/filter configurations.

- **Coverage constraints.**  
  For each stratum, a list of coverage rules (filters) and witnesses showing
  stability under flow/nucleus.

- **Tower templates.**  
  Definitions for building nested towers combining strata components.

## Inputs

1. Set of strata to include (foundation → physics or a subset).
2. Discipline/filter rules per stratum.
3. Tower composition instructions.

## Procedures

1. **Coverage computation.**  
   Evaluate discipline/filter acts to produce covering families; verify closure
   under directed morphisms.

2. **Tower generation.**  
   Compose strata using `BuildProfileTower` etc., ensuring each level inherits
   coverage from the previous one.

3. **Directed morphisms.**  
   Maintain the flow/nucleus relationships at each stratum, checking that
   coverage respects directed edges.

## Invariants

- Coverage must be stable under base change (pullbacks).
- Tower levels must align with the directed structure (consistency across strata).

## Outputs

- Structured site description ready for sheafification.
- Validation log for coverage/tower coherence.
