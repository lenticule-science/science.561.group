---
name: BBGKY Hierarchy
date-created: 2026-09-03
references:
  lanford1975:
    authors: ["Oscar E. Lanford III"]
    title: "Time Evolution of Large Classical Systems"
    publication: "Dynamical Systems, Theory and Applications (J. Moser, ed.), Lecture Notes in Physics vol. 38"
    year: 1975
---

The **BBGKY hierarchy** (Bogoliubov–Born–Green–Kirkwood–Yvon) is the exact infinite
tower of coupled evolution equations for the reduced $n$-particle distribution functions
$f_n$ of an $N$-particle system, obtained by integrating Liouville's equation over all
but $n$ particles: the equation for $f_1$ depends on $f_2$ (through the collision term),
the equation for $f_2$ depends on $f_3$, and so on. The hierarchy is exact — no
approximation has been made — but it does not close at any finite level: computing the
evolution of any $f_n$ requires knowing $f_{n+1}$. The Boltzmann equation for $f_1$
alone is obtained only by supplying an additional closure hypothesis at the second level
— [molecular chaos](./molecular-chaos.md) — which truncates the hierarchy by expressing
$f_2$ approximately in terms of $f_1$.

## In Obsmetrologia

`Obsmetrologia.KineticTheory.Gas.MolecularChaosGluing`'s header states plainly what the
module proves about the hierarchy's first coupling: it is *the finite combinatorial
obstruction* to closing $f_2$ into a product of $f_1$'s (the factorization/gluing
statement — see [molecular chaos](./molecular-chaos.md)), not the full infinite BBGKY
tower itself and not Lanford's continuum propagation-of-chaos theorem, which the module's
own header names as "the harder converse / not-visible analytic layer." This term
records what the corpus's Lean formalization is confirmed to support — the closure at
the $f_1$/$f_2$ level — and labels the rest inference: nothing in the audited theorem
set formalizes the full BBGKY tower at arbitrary $n$, its exact coupling structure, or
the general (any-$n$) propagation-of-chaos statement; those remain the standard
continuum theory (Lanford 1975 and its successors), outside the discrete core this
corpus builds.

## See also

- [Molecular chaos](./molecular-chaos.md) — the closure hypothesis that truncates this hierarchy
- [Boltzmann equation](./boltzmann-equation.md) — the equation obtained by truncating this hierarchy at its first level
