---
name: Boltzmann Equation
date-created: 2026-09-03
references:
  boltzmann1872:
    authors: ["Ludwig Boltzmann"]
    title: "Weitere Studien über das Wärmegleichgewicht unter Gasmolekülen"
    publication: "Sitzungsberichte der Kaiserlichen Akademie der Wissenschaften Wien"
    year: 1872
---

The **Boltzmann equation** (Boltzmann 1872) governs the evolution of a dilute gas's
one-particle phase-space distribution function $f(x, v, t)$ under free streaming and
binary collisions:

$$\frac{\partial f}{\partial t} + v \cdot \nabla_x f + F \cdot \nabla_v f = \left(\frac{\partial f}{\partial t}\right)_{\text{coll}},$$

where the left side is free (Liouville) transport under any external force $F$ and the
right side — the **collision integral** — accounts for the gain and loss of particles
at $(x, v)$ from binary collisions. Writing the collision integral in closed form
requires the **Stosszahlansatz** ("collision-number hypothesis", the technical name for
[molecular chaos](./molecular-chaos.md)): the assumption that the two colliding
particles' pre-collision velocities are statistically independent, so the joint
two-particle distribution factorizes as a product of one-particle distributions. Without
this closure hypothesis the equation for $f$ would depend on the two-particle
distribution, which depends on the three-particle distribution, and so on — the
[BBGKY hierarchy](./bbgky-hierarchy.md) this closure truncates.

## In Obsmetrologia

`Obsmetrologia.KineticTheory.Gas` studies kinetic existence's gas physics through this
equation's discrete core. `KineticTheory.Gas.BoltzmannClosure` reads finite
discrete-velocity collisions as closure rules and proves `finite_boltzmann_collision_lfp`,
the least-fixed-point form of Boltzmann's kinetic equation — the discrete, combinatorial
skeleton the continuum stochastic equation above generalizes, with Vlasov's collisionless
kinetic equation (Vlasov 1938) the analytic theory for the case with no collision term at
all. `KineticTheory.Gas.MolecularChaosGluing` proves the factorization closure's
consequences: see [molecular chaos](./molecular-chaos.md).

## See also

- [Molecular chaos](./molecular-chaos.md) — the closure hypothesis this equation depends on
- [BBGKY hierarchy](./bbgky-hierarchy.md) — the exact coupled hierarchy this equation's closure truncates
- [Boltzmann H-theorem](./boltzmann-h-theorem.md) — the entropy-monotonicity consequence proved from this equation
