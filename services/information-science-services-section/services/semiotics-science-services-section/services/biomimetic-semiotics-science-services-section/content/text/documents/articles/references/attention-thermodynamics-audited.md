---
title: "Reference on Attention Thermodynamics, Audited"
description: "Annotated bibliography for the physicist's calibration of the 2026-08-21 attention-thermodynamics note: sources for the machine-side attention/Hopfield identity, Landauer's principle and its stochastic-thermodynamics generalizations, the free-energy principle and Wasserstein-gradient-flow literature, and the defect-mediated-growth upgrade."
date-created: 2026-08-26
type: notes
name: 2026-08-26-reference-on-attention-thermodynamics-audited
authors:
  - Claude Sonnet
keywords:
  - biomimetic-semiotics
  - attention
  - thermodynamics
  - landauer
  - hopfield
  - free-energy-principle
  - dissipative-adaptation
  - defect-mediated-growth
  - bibliography
---

# Reference on Attention Thermodynamics, Audited

Sources for the calibration in [Attention Thermodynamics,
Audited](./2026-08-26-note-on-attention-thermodynamics-audited.md), grouped by
the claim cluster each supports. Status notes indicate whether a source
confirms, narrows, or challenges the claim it is cited for.

## Attention as Hopfield energy descent (holds exactly)

- Ramsauer, H. et al. (2020). *Hopfield Networks is All You Need.* arXiv:2008.02217; ICLR 2021. Proves the exact algebraic identity between one update of a continuous-state modern Hopfield network and standard dot-product transformer attention. Confirms.
- Krotov, D. & Hopfield, J. J. (2016). *Dense Associative Memory for Pattern Recognition.* NeurIPS. Origin of the dense/modern Hopfield energy-function program. Confirms (foundation).
- Demircigil, M. et al. (2017). *On a Model of Associative Memory with Huge Storage Capacity.* J. Stat. Phys. Establishes exponential storage capacity for log-sum-exp energy functions. Confirms.
- Hoover, B. et al. (2023). *Energy Transformer.* NeurIPS. Extends the energy-descent identity to a full transformer block. Confirms, extends scope.
- Hu, J. Y.-C. et al. and Wu, D. et al. (2023). Show softmax, sparsemax, and α-entmax attentions as solutions of a single Helmholtz free-energy variational problem. Confirms, generalizes.
- Toulouse, G. (1977). Gauge-theoretic treatment of spin-glass frustration (loops, holonomy-style obstruction). Real physics of disordered magnets. Status: **not connected** by any existing theorem to trained attention matrices — cited in the audit as the source of a claim that must retract to metaphor.

## Brain-side attention metabolism (structural analogy, must shrink)

- Attwell, D. & Laughlin, S. B. (2001). *An Energy Budget for Signaling in the Grey Matter of the Brain.* J. Cereb. Blood Flow Metab. 21:1133-1145. Decomposes cortical signaling energy (action potentials ~47%, postsynaptic currents ~34%, resting potential ~13%, recycling ~3%); favors sparse/distributed codes. Confirms a real energy constraint on neural coding, not a claim about "attention" specifically.
- Levy, W. B. & Calvert, V. G. (2021). *Communication Consumes 35 Times More Energy than Computation in the Human Cortex, but Both Costs Are Needed to Predict Synapse Number.* PNAS 118:e2008173118. Shows most cortical ATP is spent on wiring/communication, not discriminable computation. Narrows the claim that "attention" has a distinctly large computational energy signature.
- Raichle, M. E. & Mintun, M. A. (2006). *Appraising the Brain's Energy Budget.* PNAS 103:10237. Local PET/blood-flow changes during demanding cognition are typically ≤5%; whole-brain metabolic rate is nearly task-invariant. Narrows.
- Wiehler, A. et al. (2022). *Fatigue: Tough Days at Work Change Your Prefrontal Metabolites.* Current Biology 32:3564. MRS shows ~8% glutamate/glutamine rise in lateral PFC after a day of high-demand cognitive work, linked to reduced pupil dilation and effort-averse choice shifts. Confirms a real, specific, but slow and modest biochemical signature of sustained cognitive control.
- Levy, W. B. & Baxter, R. A. (1996). *Energy Efficient Neural Codes.* Neural Computation. Origin of the information-per-spike efficiency framework underlying sparse-coding-as-energy-constraint. Confirms (foundation).

## Landauer's principle and stochastic thermodynamics of information ("no free settling")

- Landauer, R. (1961). Original erasure-cost argument (*kT* ln 2 minimum per bit). Foundational.
- Bérut, A. et al. (2012). *Experimental Verification of Landauer's Principle Linking Information and Thermodynamics.* Nature 483:187-189. Confirms the bound is approached in the quasistatic limit.
- Jun, Y., Gavrilov, M. & Bechhoefer, J. (2014). *High-Precision Test of Landauer's Principle in a Feedback Trap.* PRL 113:190601. Confirms; finite-time protocols dissipate strictly more.
- Parrondo, J. M. R., Horowitz, J. M. & Sagawa, T. (2015). *Thermodynamics of Information.* Nature Physics 11:131-139. Generalized second law under measurement/feedback; correlation with a witness enables work extraction, later balanced by erasure cost. Status: cited in the audit as running **against** the "unwitnessed erasure is counterfeit" framing, not in support of it.
- Wolpert, D. H. (2019). *The Stochastic Thermodynamics of Computation.* J. Phys. A 52:193001 (arXiv:1905.05669). Review establishing the general framework beyond simple bit-counting.
- Kolchinsky, A. & Wolpert, D. H. (2017). *Dependence of Dissipation on the Initial Distribution over States.* J. Stat. Mech. Proves the mismatch-cost theorem: excess dissipation equals a contraction of KL divergence between actual and optimal initial distributions. Confirms, narrowly scoped.
- Still, S., Sivak, D. A., Bell, A. J. & Crooks, G. E. (2012). *Thermodynamics of Prediction.* PRL 109:120604. Proves that retained nonpredictive information ("nostalgia") costs extra dissipation. Confirms the narrower, correct version of "no free settling."

## Free energy principle, JKO, and "completion = death"

- Jordan, R., Kinderlehrer, D. & Otto, F. (1998). *The Variational Formulation of the Fokker-Planck Equation.* SIAM J. Math. Anal. 29:1-17. Proves Fokker-Planck evolution is steepest descent of a free-energy functional in Wasserstein-2 geometry, for linear diffusion with fixed potential and Gaussian noise. Confirms, narrowly scoped — the scope limit is the audit's central caution here.
- Colombo, M. & Wright, C. (2018/2021). *First Principles in the Life Sciences: The Free-Energy Principle, Organicism, and Mechanism.* Synthese / Biology & Philosophy. Argues the free-energy principle's persistence claim is close to tautological given how free energy relates to entropy by definition; Friston has conceded this in correspondence as "the essence" of the principle. Status: critique, taken seriously and unresolved.
- Raja, V. et al. (2021). *The Markov Blanket Trick: On the Scope of the Free Energy Principle and Active Inference.* Physics of Life Reviews. Shows the claimed universality rests on an assumption (well-defined Markov blankets) that does not generally hold. Status: critique, live scholarly dispute with published rebuttals.
- Schrödinger, E. (1944). *What Is Life?* Origin of the negentropy framing. Foundational, qualitative.
- Prigogine, I. (1960s-70s). Dissipative structures; sustained order in open systems requires continuous free-energy throughput. Confirms the qualitative "life = maintained disequilibrium" claim.
- England, J. L. (2013). *Statistical Physics of Self-Replication.* J. Chem. Phys. (arXiv:1209.1179). Derives a heat-dissipation lower bound for self-replication in a specified driven-stochastic model class.
- Perunov, N., Marsland, R. A. & England, J. L. (2016). *Statistical Physics of Adaptation.* Phys. Rev. X 6:021036. Extends dissipative-adaptation results.
- Kolchinsky, A. et al. (2024). *Thermodynamic Dissipation Does Not Bound Replicator Growth and Decay Rates.* arXiv:2404.01130. Directly challenges the generality originally claimed for England-style bounds. Status: active technical correction, current as of 2024.
- Georgescu-Roegen, N. Proposed "fourth law" of thermodynamics (matter entropy). Status: **rejected by physicists**, not accepted physics — should not be cited as validated.

## Defect-mediated growth (the upgrade)

- Burton, W. K., Cabrera, N. & Frank, F. C. (1951). *The Growth of Crystals and the Equilibrium Structure of Their Surfaces.* Phil. Trans. R. Soc. A 243:299-358. Screw dislocations sustain crystal growth below the two-dimensional nucleation threshold. Confirms, for inorganic crystals.
- Keber, F. C. et al. (2014). *Topology and Dynamics of Active Nematic Vesicles.* Science 345:1135-1139. Topological defects as self-propelled, active organizers of shape change, not static flaws.
- Maroudas-Sacks, Y. et al. (2021). *Topological Defects in the Nematic Order of Actin Fibres as Organization Centres of Hydra Morphogenesis.* Nature Physics 17:251-259. +1 defects in actin nematic order mark and drive the sites of Hydra's body-plan organizers (mouth, tentacles, foot). Status: the audit's recommended replacement emblem for "growth organizes around held defects" in living systems.
