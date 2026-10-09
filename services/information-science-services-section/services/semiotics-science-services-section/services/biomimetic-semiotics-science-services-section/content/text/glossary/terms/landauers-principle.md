---
name: landauer's principle
description: "Erasing one bit of information in a physical system must dissipate at least kT ln 2 of heat; the bound is approached only in the infinitely slow limit."
date-created: 2026-08-26
authors:
  - Claude Sonnet
---

Landauer's principle, proposed by Rolf Landauer in 1961, states that any
logically irreversible operation on a physical memory — most simply, erasing
a bit, mapping two distinguishable states onto one — must dissipate at least
*kT* ln 2 of heat into the environment, where *k* is Boltzmann's constant and
*T* the temperature of the surrounding bath. The argument is information-
theoretic rather than mechanism-specific: erasure reduces the number of
microstates the memory can occupy, and the second law of thermodynamics
requires that entropy reduction to be compensated by heat expelled elsewhere.
The bound is a minimum, achieved only for a quasistatic (infinitely slow)
erasure protocol; any process run in finite time necessarily dissipates
strictly more.

The principle went unverified experimentally for over fifty years because of
the difficulty of running single-particle experiments in the very-low-
dissipation regime it describes. Bérut et al. (2012, *Nature*) closed this
gap using a single colloidal particle trapped in a modulated double-well
optical potential, showing the mean dissipated heat saturates at the Landauer
bound as the erasure protocol is slowed. Jun, Gavrilov & Bechhoefer (2014,
*PRL*) confirmed this with a feedback trap and showed the predicted excess
dissipation at finite protocol speed. Parrondo, Horowitz & Sagawa's 2015
review "Thermodynamics of Information" (*Nature Physics*) generalizes the
principle to measurement and feedback control: an observer correlated with a
system can extract work using that correlation (the Maxwell-demon mechanism),
but only by paying an equivalent erasure cost later when the correlated
memory is reset, so the global second law is never violated. Wolpert's 2019
"stochastic thermodynamics of computation" review, and the mismatch-cost
theorems of Kolchinsky and Wolpert, extend the accounting further: the excess
dissipation of a real computation above the Landauer minimum depends on how
well the actual distribution of inputs matches the distribution the physical
process was built to handle.

Calibrated status: the *kT* ln 2 bound and its finite-time-protocol excess are
literal, settled, and experimentally confirmed physics for a specified
physical (or well-defined computational) state space with a stochastic
transition map on it. What is not licensed is extending "erasure has an
irreducible dissipative cost" to psychological, semantic, or social
"resolution of contradiction" without specifying that state space and map —
that move borrows the theorem's shape as metaphor, not its content. It is
also not licensed to read the measurement/feedback literature as implying
that *unwitnessed* erasure carries an extra, uncounted cost: that literature
shows the opposite emphasis, that correlation with a witness is what enables
work extraction, not what certifies an erasure's price. See also [mismatch
cost](./mismatch-cost.md) for the more precise, narrower claim the physics
actually supports about the cost of retained or mismatched information.
