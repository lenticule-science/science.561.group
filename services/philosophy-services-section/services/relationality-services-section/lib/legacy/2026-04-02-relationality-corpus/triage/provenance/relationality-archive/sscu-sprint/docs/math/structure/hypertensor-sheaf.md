---
name: hypertensor-sheaf
role: structure
emerges_from: sheafification
proof_refs:
- presheaf
- sheaf-condition
- sheafification
- hypertensor-coverage
- hypertensor-window
- hypertensor-fiber
- hypertensor-tower
fields:
- name: section
  type: hypertensor-section
  description: section carrier of the sheaf.
- name: restrict
  type: matching-family
  description: restriction maps over the coverage site.
- name: glue
  type: matching-family
  description: gluing operation for compatible families.
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



The **Relational Quasicrystalline Hypertensor Sheaf** packages the earned
window, fiber, and tower carriers into a sheaf with sections, restriction, and
gluing over the relational site.

## Definition
- Carriers:
  - `Window`: earned lattice windows from trace decomposition and fixed-point
    substitution (see [Hypertensor Window](docs/math/structure/hypertensor-window.md)).
  - `Fiber`: traced-context carriers over windows (see
    [Hypertensor Fiber](docs/math/structure/hypertensor-fiber.md)).
  - `Tower`: profile towers attached to each fiber (see
    [Hypertensor Tower](docs/math/structure/hypertensor-tower.md)).
- Sheaf: applying the sheaf acts (presheaf, sheaf condition, sheafification)
  yields `(Section, restrict, glue)` as a sheaf over the earned coverage.
- State: set `State := Section`; this is the math-level state carrier.

## Invariants
- Sheaf axioms hold (matching families glue uniquely over covers).
- Flow/nucleus commute with restrict/glue as earned by the flow/nucleus acts.
- State is unique up to earned equivalence.

## Proof
- Derived from the sheaf acts applied to the earned window/fiber/tower carriers
  over the relational coverage.
- Flow/nucleus commutation acts ensure stability under dynamics.
- Shows that: the sheaf data `(section, restrict, glue)` is earned; no
  unearned primitives are introduced.
