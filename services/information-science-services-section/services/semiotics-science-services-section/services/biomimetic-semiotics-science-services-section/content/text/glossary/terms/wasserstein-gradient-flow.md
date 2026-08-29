---
name: wasserstein gradient flow (JKO)
description: "The Jordan-Kinderlehrer-Otto theorem: for overdamped Langevin dynamics with a fixed potential and Gaussian noise, the Fokker-Planck evolution of the probability density is exactly steepest descent of a free-energy functional in the Wasserstein-2 metric."
date-created: 2026-08-26
authors:
  - Claude Sonnet
---

Jordan, Kinderlehrer & Otto (1998, *SIAM Journal on Mathematical Analysis*)
proved that a specific and important class of diffusion processes has a
variational structure. For overdamped Langevin (Smoluchowski-type) dynamics —
a drift given by the gradient of a fixed potential, plus constant-coefficient
Gaussian noise — the time evolution of the probability density under the
corresponding Fokker-Planck equation is exactly the curve of steepest descent
of the free-energy functional F[ρ] = ∫ρ log ρ + ∫ρV (internal entropy plus
potential energy), where distance between probability densities is measured
by the quadratic Wasserstein (optimal-transport) metric rather than the more
familiar L² or total-variation distances. The proof proceeds by a discrete-
time variational scheme (the "JKO scheme"): a sequence of implicit-Euler steps,
each minimizing free energy plus a Wasserstein-distance penalty from the
previous step, that converges to the true Fokker-Planck solution as the time
step shrinks. Otto's subsequent work extended the same "Riemannian calculus on
the space of probability measures" viewpoint to other equations, including the
porous medium equation, founding the modern theory of gradient flows in metric
spaces (Ambrosio, Gigli & Savaré).

The result is one of the most celebrated pieces of 20th/21st-century
mathematical analysis connecting probability, PDEs, and geometry, and it
underwrites much of the modern optimal-transport literature used in current
generative modeling (diffusion and flow-matching methods).

Calibrated status: JKO is completely rigorous, but it is a theorem about one
specific class of linear diffusion equations — a fixed potential, Gaussian
noise, overdamped dynamics — not a general law that any system decreasing
some free-energy-like quantity over time is "doing" a Wasserstein gradient
flow. In particular, it does not establish that a social, psychological, or
formally-defined "settling" process literally is (or is well-approximated by)
such a diffusion; that would require an independent argument that the system
in question actually has this structure. Relatedly, a formal system built so
that it satisfies its own H-theorem (monotonic free-energy decrease by
construction) demonstrates internal consistency, not an empirical discovery —
a point made explicitly, in the closely related context of Karl Friston's
free-energy principle, by Colombo & Wright (2018; sharpened 2021), who argue
the principle's persistence claim is close to tautological given how free
energy is defined relative to entropy, a characterization Friston has himself
conceded in correspondence as "the essence" of the principle. Raja et al.
(2021, *Physics of Life Reviews*) raise a related, independent technical
objection: the framework's claimed generality depends on every system
admitting a well-defined Markov-blanket partition, which does not always hold.
Use JKO for exactly what it proves.
