---
name: Molecular Chaos
aliases: [Stosszahlansatz, propagation of chaos]
date-created: 2026-09-03
references:
  boltzmann1872:
    authors: ["Ludwig Boltzmann"]
    title: "Weitere Studien über das Wärmegleichgewicht unter Gasmolekülen"
    publication: "Sitzungsberichte der Kaiserlichen Akademie der Wissenschaften Wien"
    year: 1872
  lanford1975:
    authors: ["Oscar E. Lanford III"]
    title: "Time Evolution of Large Classical Systems"
    publication: "Dynamical Systems, Theory and Applications (J. Moser, ed.), Lecture Notes in Physics vol. 38"
    year: 1975
---

**Molecular chaos**, Boltzmann's *Stosszahlansatz* ("collision-number hypothesis";
Boltzmann 1872), is the assumption that, just before colliding, two gas particles'
velocities are statistically independent — the two-particle joint distribution
factorizes as a product of one-particle distributions, $f_2(v_1, v_2) = f_1(v_1)
f_1(v_2)$. It is the closure that lets Boltzmann's collision integral be written purely
in terms of the one-particle distribution $f_1$, cutting off the [BBGKY hierarchy](./bbgky-hierarchy.md)
at its first level. As a hypothesis about correlations building up over time, it is not
obviously compatible with time-reversible microscopic dynamics — colliding particles
that were independent before a collision become correlated afterward — which is one root
of Loschmidt's objection to the H-theorem's apparent irreversibility.

**Propagation of chaos** is the sharper, dynamical claim: that if molecular chaos holds
at the initial time, it continues to hold (asymptotically, as particle number $N \to
\infty$) at all later times, so the *Stosszahlansatz* is self-consistent rather than an
assumption that must be independently re-justified at every instant. Lanford (1975)
proved this rigorously for a hard-sphere gas in the Boltzmann–Grad limit, for a time
interval short compared to the mean free time — the rigorous justification the
*Stosszahlansatz* had lacked since 1872.

## In Obsmetrologia

`Obsmetrologia.KineticTheory.Gas.MolecularChaosGluing` reads molecular chaos as a
**vanishing obstruction**, the kinetic instance of `Cohomology.SettlingCohomologyH1` /
`Flow.CurvatureRegime.vanishes_iff_declaredFlat` (`H¹ = 0 ⟺ flat ⟺ gluing unobstructed`). A joint
distribution `Factorizes` — molecular chaos holds — exactly when it is the **separated
gluing** of two single-particle sections; the obstruction is the **connected
correlation** `corr`, the discrete truncated two-point function (a $2\times2$ minor),
antisymmetric under exchanging the two particles (a cocycle). `factorizes_imp_decorrelated`
proves molecular chaos forces every correlation minor to vanish — the `H¹ = 0`
projection direction (axiom profile `propext`) — and `epr_not_factorizes` exhibits a
maximally-correlated joint whose nonzero correlation provably obstructs factorization —
the *Stosszahlansatz* failing (axiom profile `propext`). This is the finite combinatorial
obstruction; the harder converse (decorrelated implies factorizes) and Lanford's
continuum propagation-of-chaos theorem are the analytic layer this discrete core
approximates, not proved by this module.

## See also

- [Boltzmann equation](./boltzmann-equation.md) — the equation this closure makes solvable
- [BBGKY hierarchy](./bbgky-hierarchy.md) — the hierarchy this closure truncates
