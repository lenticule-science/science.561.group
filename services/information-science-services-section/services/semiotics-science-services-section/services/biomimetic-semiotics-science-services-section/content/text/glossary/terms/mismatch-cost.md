---
name: mismatch cost
description: "The extra thermodynamic dissipation a physical process incurs when the actual distribution of its inputs differs from the distribution it is optimally tuned to handle, equal to a contraction of their KL divergence."
date-created: 2026-08-26
authors:
  - Claude Sonnet
---

Mismatch cost is a theorem from the stochastic thermodynamics of computation,
developed by Artemy Kolchinsky and David Wolpert (2017, *J. Stat. Mech.*;
extended 2021 for quantum and classical processes). For any fixed physical
process — a specified stochastic map coupled to a thermal bath — there is a
minimum achievable entropy production, obtained only when the process is fed
its "optimal" initial distribution over states, the one it was effectively
built to handle. If the process is instead run on some other, actual initial
distribution, it incurs additional entropy production above that minimum. The
theorem shows this excess, the mismatch cost, has a clean information-
theoretic form: it equals a (generally contracting) Kullback-Leibler
divergence between the actual initial distribution and the optimal one,
evaluated as it evolves under the process's dynamics. The result holds at the
level of integrated entropy production, fluctuating trajectory-level entropy
production (which obeys an integral fluctuation theorem), and instantaneous
production rate.

The theorem sits inside a broader program — Wolpert's 2019 "stochastic
thermodynamics of computation" review situates it alongside Still, Sivak,
Bell & Crooks's 2012 "Thermodynamics of Prediction" (*PRL*), which proves a
related but distinct result: a system's memory of the past that is not
predictive of the future (they call this "nostalgia") necessarily costs extra
dissipation, so a thermodynamically efficient predictive system must actively
discard non-useful memory rather than hoard it.

Calibrated status: this is rigorous, quantitative, current physics — not a
metaphor — but it is narrowly scoped. It requires a specified physical or
computational state space and a well-defined stochastic transition map before
it can be evaluated; it does not, on its own, tell you the mismatch cost of a
social, psychological, or semantic "mismatch" unless that system's states and
dynamics are actually specified in these terms. It is, however, the best
available rigorous anchor for a claim like "holding a representation
miscalibrated to what is actually being fed to a process, or retaining
non-predictive information, has a real dissipative cost" — a considerably
more precise and more defensible claim than an unscoped "no free settling."
See also [Landauer's principle](./landauers-principle.md).
