# Math

Algebraic measurement and growth experiments without rendering. Each
subdir takes a different angle on the project's relational-order /
void-monoid framework: the orbit graph of the bypass DAG, the
directional preordered monoid's free growth, meaning-compression
benchmarks, crystal-seed axiom systems.

The output here is numbers and structure, not pictures or sound — the
[`art/`](../art/) toys are visualizations of the same objects.

## Subdirectories

- [`dag/`](dag/) — Orbit graphs from spec/ frontmatter. Carrier =
  frozenset of Events; Empty = no frontmatter; Extend = add an event;
  Order = subset inclusion. Includes engine, growth measurement, the
  bypass-orbit interval-zeta, and the full strata catalog across
  DependsOn (image / saturation-shadow / transfer-shadow / unstable).
- [`void-monoid/`](void-monoid/) — Directional Preordered Monoid (DPM)
  experiments. Free monoid over generators G under bypass dynamics;
  growth animation; 3D spatiotemporal manifold; tower operator
  Φ(G, ⊳); zeta function and phase transitions in beta-space; void
  failure physics engine. Plus `void.py`, the CLI for growing and
  measuring DPMs.
- [`compression/`](compression/) — Meaning-compression benchmarks.
  Relational-Ordering codec against standard compression. RO peels
  algebraic redundancy at different scales; intermediate states in
  sequential event data are *redundant under the algebra*, even when
  statistically incompressible.
- [`crystals/`](crystals/) — Python mirror of `Core/Foundation.lean`.
  One seed; the axioms are the methods; nonconfluence is the point.
  Extending in different orders gives different histories; the
  structure grows transfinitely without settling.
- [`collatz/`](collatz/) — Collatz problem as a relation on `Z/N`,
  explored with the project's modal/structural operators: stabilizer,
  modal-spectrum explorer, affine generalization, lab driver,
  Fibonacci-shape predictions, transition simulator.
- [`modal-lab/`](modal-lab/) — Finite-poset Heyting-algebra +
  KZ-comonad lab. Self-contained `ritm_core` plus a modal-formula
  engine with named modalities and axiom packs; ported from Scheme.
- [`cohesion/`](cohesion/) — The cell → category → geometry → physics
  → thermo stack with a thermal-flow demo running end-to-end (ASCII
  output).
