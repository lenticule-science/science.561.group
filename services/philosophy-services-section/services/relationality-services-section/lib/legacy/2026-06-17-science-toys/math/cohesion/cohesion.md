# Cohesion

The cell → category → geometry → physics → thermo stack: a coherent
layered implementation of the project's relational-cohesive geometry,
with a thermal-flow demo that actually runs the stack end-to-end and
visualizes the result as ASCII.

## Toys

- [`demo-thermo.py`](demo-thermo.py) — Toy thermal-flow simulation on
  the cohesion stack. Seeds an object via `category.seed_object`,
  promotes it through `geometry.from_relational_object`, instantiates
  `ScalarField` / `VectorField` from `physics`, runs the
  `thermo`-defined heat equation, and prints `visualize_ascii` frames.

## Library files

- [`category.py`](category.py) — Categorical seed and relational
  morphisms.
- [`geometry.py`](geometry.py) — `GeometricCell` over the categorical
  base; promotes a relational object to a metric one.
- [`physics.py`](physics.py) — `ScalarField`, `VectorField`, and ASCII
  visualization on a `GeometricCell`.
- [`thermo.py`](thermo.py) — Heat-equation evolution and
  thermodynamic-flow operators on the geometry+physics base.
