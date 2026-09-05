constraint singularity function
The constraint singularity function (`Σ`) is induced by the constraint gradient (`∇C`) and constraint curvature (`K_C`).

When constraint curvature becomes divergent at a point or vanishingly narrow region,
a singularity arises — a locus where constraint becomes undefined or discontinuous.

Σ := { x | lim_{ε→0} ∥∇C(x + ε) - ∇C(x)∥ = ∞ }

That is, a singularity is a location in the constraint field where gradient behavior diverges, causing local breakdown of modulation structure.
