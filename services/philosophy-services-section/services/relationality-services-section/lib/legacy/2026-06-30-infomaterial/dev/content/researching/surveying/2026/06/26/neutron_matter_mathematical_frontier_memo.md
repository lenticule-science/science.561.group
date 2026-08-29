---
title: "Neutron Mathematics: Dense Fermionic/Nuclear Constraint Matter at the 2020–2026 Frontier"
author: "ChatGPT research memo for emsenn"
date: "2026-06-27"
status: "graduate-to-research-level survey; sources checked June 2026"
---

# Neutron Mathematics: Dense Fermionic/Nuclear Constraint Matter at the 2020–2026 Frontier

## Executive thesis

**Neutron matter is constraint-matter.**  Its mathematical character is not exhausted by the phrase "matter made of neutrons."  It is a regime in which the ordinary molecular ontology of matter has mostly collapsed, but spacetime has not yet collapsed into a horizon.  What remains is a coupled system of constraints: antisymmetry of a many-fermion wavefunction, short-range nuclear attraction, repulsive cores and three-body forces, weak-interaction equilibrium, charge neutrality, superfluid and superconducting order parameters, elastic and topological defects, and relativistic hydrostatic balance.  In neutron stars these constraints are assembled by gravity into an observable macroscopic object, so the central mathematical object is not only a Hamiltonian or a field theory but an **equation of state** (EOS) plus a relativistic structure map.

The frontier is therefore an interface between several mathematical domains:

1. **Quantum many-body theory**: interacting spin-1/2 fermions with nuclear two- and three-body forces, pairing, response, and finite-temperature corrections.
2. **Relativistic stellar structure**: the Tolman--Oppenheimer--Volkoff (TOV) equations and their extensions, converting an EOS into mass-radius-tidal observables.
3. **Frustrated geometry and topology**: nuclear pasta as a phase problem in which surfaces, curvatures, Betti numbers, Euler characteristic, percolation, defects, and glassy disorder matter physically.
4. **Superfluid/superconducting defect theory**: vortices, flux tubes, pinning, entrainment, mutual friction, glitches, and magneto-elastic coupling.
5. **Inverse inference**: a Bayesian and computational problem linking nuclear theory, heavy-ion experiments, NICER X-ray timing, gravitational waves, and merger simulations.
6. **Rigorous mathematical physics**: stability of matter, Fermi-gas asymptotics, compact-star existence/stability, and theorem-level constraints on EOS classes, still far from a complete derivation of neutron-star matter from QCD.

Recent 2020--2026 work has made the frontier sharper but not closed.  Chiral effective field theory (χEFT), many-body perturbation theory, and quantum Monte Carlo now give increasingly quantified low-to-moderate-density neutron-matter input; NICER, massive pulsars, and gravitational waves constrain macroscopic structure; pQCD constrains asymptotically high-density behavior; finite-temperature EOS tables and numerical relativity drive merger modeling; machine learning and Bayesian workflows accelerate inverse inference; and topological data analysis is being used to classify pasta phases.  The hard middle remains: densities above controlled χEFT and below perturbative QCD, where neutron-star cores may contain strongly interacting baryons, hyperons, meson condensates, or deconfined quarks, but current evidence is still indirect and model-dependent.

---

# 1. Core mathematical object

## 1.1 Pure neutron matter

The idealized mathematical object called **pure neutron matter** (PNM) is usually the thermodynamic limit of a system of neutrons only:

\[
H_N = \sum_{i=1}^N \frac{p_i^2}{2m_n} + \sum_{i<j} V_{ij}^{NN} + \sum_{i<j<k} V_{ijk}^{3N} + \cdots,
\]

acting on antisymmetric spin-isospin wavefunctions in a box of volume \(V\), with baryon number density

\[
n = \frac{N}{V}, \qquad k_F=(3\pi^2 n)^{1/3}
\]

for a spin-1/2 one-component Fermi system.  The thermodynamic object is the ground-state energy density or free-energy density,

\[
\varepsilon(n,T) = \lim_{N,V\to\infty,\,N/V=n}\frac{E_N(T)}{V},
\]

and derived quantities such as

\[
P(n,T)=n^2\frac{\partial}{\partial n}\left(\frac{F}{N}\right)_T,
\qquad
\mu=\frac{\partial\varepsilon}{\partial n}.
\]

PNM is not literally the entire content of a neutron star.  It is a controlled theoretical limit: no protons, electrons, muons, Coulomb frustration, crustal nuclei, weak equilibrium, or gravity.  Its importance is that neutron-star matter is extremely neutron-rich, so PNM is a benchmark for the isospin-asymmetric part of the nuclear EOS.

## 1.2 Nuclear matter

**Nuclear matter** is homogeneous, infinite matter made of interacting nucleons.  The main idealizations are:

- **symmetric nuclear matter** (SNM): \(n_n=n_p\), proton fraction \(x=n_p/n=1/2\);
- **asymmetric nuclear matter**: \(0<x<1/2\);
- **pure neutron matter**: \(x=0\).

A common expansion writes the energy per baryon as

\[
E(n,x) \approx E_{\rm SNM}(n) + S(n)(1-2x)^2 + O((1-2x)^4),
\]

where \(S(n)\) is the **symmetry energy**.  Near saturation density

\[
n_0\simeq 0.16\,\mathrm{fm}^{-3},
\]

one expands

\[
S(n) = J + L\frac{n-n_0}{3n_0} + \frac{K_{\rm sym}}{2}\left(\frac{n-n_0}{3n_0}\right)^2 + \cdots.
\]

The slope \(L\) strongly influences neutron skins, crust-core transition density, radii, and pasta morphology.  The difficulty is that laboratory nuclei constrain matter near and below \(n_0\), whereas neutron-star cores probe several times \(n_0\).

## 1.3 Neutron-degenerate matter

**Neutron-degenerate matter** is matter in which neutrons occupy Fermi states up to a large Fermi momentum and the temperature is small relative to the Fermi temperature:

\[
T\ll T_F, \qquad k_B T_F=E_F.
\]

For a noninteracting nonrelativistic neutron gas,

\[
E_F = \frac{\hbar^2 k_F^2}{2m_n},
\qquad
\frac{E}{N}=\frac{3}{5}E_F,
\qquad
P=\frac{2}{5}nE_F.
\]

This is the mathematical seed of neutron degeneracy pressure.  In real neutron-star matter, the free Fermi gas is only a baseline: nuclear interactions, beta equilibrium, three-body forces, pairing, and relativistic gravity change both the pressure and the phase structure.

## 1.4 Beta-equilibrated matter

**Beta-equilibrated matter** is matter in weak-interaction equilibrium.  In the simplest cold \(npe\mu\) model,

\[
\mu_n = \mu_p + \mu_e,
\qquad
\mu_e=\mu_\mu \quad \text{when muons are present},
\]

with charge neutrality

\[
n_p=n_e+n_\mu.
\]

This is the first point at which neutron matter stops being a one-component Fermi problem.  The neutron star chooses its proton fraction by minimizing the total energy subject to baryon number, charge neutrality, and weak equilibrium.  The proton fraction affects cooling, neutrino emission, superconductivity, and possible direct Urca processes.

## 1.5 Neutron-star matter

**Neutron-star matter** is the stratified, self-gravitating, beta-equilibrated, charge-neutral, cold or finite-temperature dense matter inside neutron stars.  It includes several regimes:

- outer crust: nuclei in an electron gas;
- inner crust: neutron-rich nuclei, free neutrons, electrons, pasta phases near the crust-core transition;
- outer core: mostly neutrons plus protons, electrons, muons, superfluid/superconducting condensates;
- inner core: unknown dense phase, possibly nucleonic, hyperonic, mesonic, quark-containing, or some crossover/mixed phase.

The star is not simply a sample of PNM.  It is an EOS-mediated object in general relativity: local microphysics is compressed into \(P(\varepsilon,T,Y_i)\), and macroscopic observables are produced by relativistic stellar structure and merger dynamics.

## 1.6 Distinctions from neighboring regimes

| Regime | Degrees of freedom | Dominant mathematical support/constraint | What distinguishes it from neutron matter |
|---|---:|---|---|
| Ordinary plasma | ions/electrons, often classical or weakly degenerate | Coulomb fields, kinetic theory, Maxwell/Vlasov/MHD | chemical/nuclear individuality largely remains; pressure is usually thermal/electromagnetic rather than neutron Fermi/nuclear |
| White-dwarf matter | nuclei plus degenerate electrons | electron degeneracy, Coulomb lattice, gravity | baryons stay in nuclei; electrons supply pressure; weak collapse has not made neutron-rich bulk matter dominant |
| Nuclear matter | infinite interacting nucleons | strong interaction plus Fermi statistics | no necessary beta equilibrium, crustal Coulomb structure, or relativistic stellar self-gravity |
| Neutron-star matter | nucleons/leptons plus possible exotic degrees | EOS, weak equilibrium, degeneracy, superfluidity, GR | physically realized compact-star matter; observable through masses, radii, cooling, glitches, GWs |
| Quark matter | deconfined quarks/gluons | QCD at finite baryon chemical potential, color superconductivity possible | hadronic degrees are replaced or crossed over into quark degrees; still uncertain inside observed stars |
| Black hole | no material interior described by a stable EOS in classical exterior theory | horizon geometry, Einstein equations, thermodynamics | pressure support loses; no static material surface or stellar EOS outside horizon |

The transition sequence is not a simple ladder of temperature.  It is a sequence of changing constraints: from electromagnetic kinetic matter, to degenerate electron matter, to baryonic degenerate nuclear matter, to frustrated nuclear geometry, to possible deconfinement, to horizon formation.

---

# 2. The mathematical ontology of neutron matter

## 2.1 Constraint-matter

Neutron matter is best understood as **constraint-matter**: matter whose macroscopic order arises not from chemical bonding or crystalline orbitals but from hard constraints on allowable states.

The constraints include:

1. **Antisymmetry**: the many-neutron wavefunction obeys
   \[
   \Psi(\ldots,x_i,\ldots,x_j,\ldots)=-\Psi(\ldots,x_j,\ldots,x_i,\ldots).
   \]
   The exclusion principle forces occupation of high-momentum states, generating degeneracy pressure and Fermi-liquid structure.

2. **Nuclear interaction**: nucleons attract at intermediate range, repel at short range, and interact through tensor, spin, isospin, and many-body terms.  The Hamiltonian is not a simple pairwise central potential.

3. **Weak equilibrium**: matter changes composition until chemical potentials satisfy beta-equilibrium constraints.

4. **Charge neutrality**: macroscopic Coulomb fields are energetically suppressed, so lepton and proton densities are linked.

5. **Superfluid/superconducting order**: broken global/gauge symmetries introduce phase fields, vortices, flux tubes, entrainment, and quantized circulation.

6. **Elastic/geometric constraints**: the crust supports shear, fractures, defects, and topologically nontrivial pasta networks.

7. **General relativity**: pressure and energy density source curvature; pressure itself contributes to gravity.

This makes neutron matter unlike ordinary condensed matter.  A crystal is order built from periodicity; a glass is metastable amorphous constraint; a plasma is kinetic field matter; neutron matter is **degenerate nuclear equilibrium matter**.

## 2.2 Collapse of chemical individuality without horizon formation

At ordinary density, matter decomposes into atoms, molecules, crystals, liquids, and plasmas, with chemical identity providing a useful ontology.  In white dwarfs, atoms are destroyed but nuclei remain, embedded in a degenerate electron gas.  In neutron-star cores, even nuclear identity mostly dissolves into a homogeneous or nearly homogeneous nucleonic fluid.  The object is no longer organized by molecules, but it has not crossed into a black-hole exterior state where a stellar material EOS is no longer visible.

The mathematical window is therefore narrow and rich:

\[
\text{chemical individuality gone} \quad < \quad \text{EOS-supported compact matter} \quad < \quad \text{horizon formation}.
\]

In that window, pressure support is neither thermal nor chemical; it is the result of Fermi statistics plus nuclear interactions plus relativistic equilibrium.  The object is a material solution of Einstein's equations parameterized by a dense-matter EOS.

## 2.3 EOS structure as ontology

For neutron-star matter, the EOS is not a secondary material property.  It is the mathematical object that mediates between microscopic theory and observables:

\[
\text{Hamiltonian / EDF / field theory} \longrightarrow P(\varepsilon,n,T,Y_i)
\longrightarrow \text{TOV or merger spacetime}
\longrightarrow M,R,\Lambda,f_{\rm postmerger},\text{cooling, glitches}.
\]

An EOS determines:

- stiffness or softness, through \(dP/d\varepsilon\);
- stability, through positive compressibility;
- causal admissibility, through \(c_s^2=dP/d\varepsilon\le c^2\);
- phase transitions, through nonanalyticities or mixed-phase constructions;
- stellar compactness, through TOV integration;
- tidal deformability, through metric perturbations of the TOV background.

This is why neutron mathematics is an inverse problem as much as a forward model.

---

# 3. Foundational models

## 3.1 Degenerate Fermi gas

The baseline model is the ideal Fermi gas.  For one neutron species at \(T=0\),

\[
n=\frac{k_F^3}{3\pi^2},
\qquad
\varepsilon_{\rm NR}=n m_n c^2 + \frac{3}{5}n\frac{\hbar^2 k_F^2}{2m_n},
\qquad
P_{\rm NR}=\frac{\hbar^2}{5m_n}(3\pi^2)^{2/3}n^{5/3}.
\]

Relativistically,

\[
\varepsilon = \frac{1}{\pi^2\hbar^3}\int_0^{p_F} p^2\sqrt{p^2c^2+m_n^2c^4}\,dp,
\]

\[
P = \frac{1}{3\pi^2\hbar^3}\int_0^{p_F}\frac{p^4c^2}{\sqrt{p^2c^2+m_n^2c^4}}\,dp.
\]

**Captures:** Pauli pressure, scaling laws, degeneracy, a useful lower-order ontology.

**Fails:** nuclear attraction/repulsion, beta equilibrium, crustal nuclei, pairing, three-body forces, realistic maximum masses.  Oppenheimer and Volkoff's original ideal-neutron-gas star is historically foundational but too soft for observed \(\gtrsim 2M_\odot\) stars.

## 3.2 Interacting Fermi systems and Landau Fermi liquid

At densities near and above nuclear saturation, interactions cannot be ignored.  A useful phenomenological description treats low-energy excitations as quasiparticles near the Fermi surface:

\[
\delta E = \sum_{p\sigma}\epsilon_{p\sigma}\delta n_{p\sigma}
+\frac{1}{2}\sum_{p\sigma,p'\sigma'} f_{p\sigma,p'\sigma'}\delta n_{p\sigma}\delta n_{p'\sigma'}.
\]

The interaction function \(f\) is expanded in Legendre channels, giving Landau parameters \(F_l,F_l',G_l,G_l'\).  These determine effective masses, compressibility, spin susceptibility, and collective responses.

**Captures:** quasiparticles, response, transport coefficients, collective modes.

**Fails:** strong pairing regimes, non-Fermi-liquid transitions, first-principles derivation at high density, topological pasta morphology.

## 3.3 Neutron-proton-electron-muon matter

Cold homogeneous \(npe\mu\) matter is specified by a baryon density \(n=n_n+n_p\), proton fraction \(x=n_p/n\), lepton densities, and equilibrium constraints:

\[
\mu_n(n,x)=\mu_p(n,x)+\mu_e,
\qquad
\mu_e=\mu_\mu \quad (\mu_e>m_\mu c^2),
\]

\[
n_p=n_e+n_\mu.
\]

The energy density is

\[
\varepsilon(n,x)=n[m_nc^2(1-x)+m_pc^2x + E(n,x)] + \varepsilon_e(n_e)+\varepsilon_\mu(n_\mu).
\]

**Captures:** weak equilibrium, charge neutrality, lepton pressure, realistic proton fractions.

**Fails:** inhomogeneous crust, pasta, superfluid/superconducting gaps unless added, high-density exotic phases.

## 3.4 Nuclear equations of state

The cold EOS is often represented as

\[
P=P(\varepsilon) \quad \text{or} \quad E/A=E(n,x),
\]

with temperature and composition extensions for mergers and supernovae:

\[
P=P(n,T,Y_e),\qquad \varepsilon=\varepsilon(n,T,Y_e),\qquad s=s(n,T,Y_e).
\]

EOS modeling families include:

- analytic polytropes and piecewise polytropes;
- speed-of-sound parameterizations;
- spectral expansions;
- nuclear-energy-density functionals;
- relativistic mean-field models;
- χEFT-constrained low-density EOS joined to generic high-density extensions;
- hybrid hadron-quark constructions;
- finite-temperature tabulated EOS for simulations.

**Captures:** the micro-to-macro bridge.

**Fails:** one parameterization rarely captures all controlled limits; high-density extrapolation is underdetermined; phase transitions can be hidden by smooth parameterizations.

## 3.5 Skyrme energy-density functionals

Skyrme-type models replace microscopic interactions with a local or quasilocal energy-density functional:

\[
E[\rho_q,\tau_q,\mathbf{J}_q,\ldots]
=\int d^3r\,\mathcal{H}(\rho_q,\tau_q,\nabla\rho_q,\mathbf{J}_q,\ldots),
\]

where \(q=n,p\), \(\rho_q\) are densities, \(\tau_q\) kinetic densities, and \(\mathbf{J}_q\) spin-current densities.  Parameters are fit to finite nuclei, nuclear matter, and sometimes neutron-star constraints.

**Captures:** finite nuclei, crust nuclei, neutron-rich systems, Hartree-Fock-Bogoliubov pairing, spatially inhomogeneous phases.

**Fails:** uncontrolled extrapolation to several \(n_0\), parameter degeneracy, missing correlations unless encoded phenomenologically.

## 3.6 Relativistic mean-field models

Relativistic mean-field (RMF) models begin with a Lorentz-covariant Lagrangian in which nucleons couple to mesonic mean fields, often schematically

\[
\mathcal{L}=\bar\psi\left[i\gamma^\mu\partial_\mu -m_N + g_\sigma\sigma - g_\omega\gamma^\mu\omega_\mu - g_\rho\gamma^\mu\vec\tau\cdot\vec\rho_\mu\right]\psi
+\mathcal{L}_{\sigma,\omega,\rho}+\mathcal{L}_{\rm nonlinear}.
\]

In uniform matter the meson fields are replaced by expectation values, yielding self-consistent effective masses and vector potentials.

**Captures:** relativistic covariance, saturation, high-density stiffness, finite-temperature tables, compact-star EOS families.

**Fails:** parameter sensitivity, uncertain high-density degrees of freedom, mean-field treatment of correlations.

## 3.7 Chiral effective field theory

Chiral EFT organizes nuclear forces as an expansion in

\[
Q/\Lambda_\chi,
\]

where \(Q\) is a low-momentum scale and \(\Lambda_\chi\) the chiral breakdown scale.  It naturally includes two-nucleon, three-nucleon, and higher forces order by order.  The modern frontier emphasizes uncertainty quantification from truncation, regulator variation, low-energy constants, and many-body method errors.

**Captures:** controlled low-energy nuclear interactions; neutron matter up to low-to-moderate densities; uncertainty bands.

**Fails:** loss of controlled convergence at sufficiently high density; regulator artifacts; dependence on many-body solution method.

## 3.8 Many-body perturbation theory

Given softened interactions, one expands the energy around a Hartree-Fock reference:

\[
E = E_{\rm HF}+E^{(2)}+E^{(3)}+\cdots.
\]

At finite temperature one works with the free energy or grand potential.  MBPT is central to producing neutron-matter and nuclear-matter EOS bands from χEFT.

**Captures:** efficient uncertainty-propagated EOS construction, finite-temperature corrections, response and Landau parameters in controlled regimes.

**Fails:** assumes perturbative convergence; less reliable for hard interactions, strong pairing, and high densities.

## 3.9 Quantum Monte Carlo

Quantum Monte Carlo (QMC) methods approximate the many-body ground state by imaginary-time projection, sampling, or auxiliary fields.  Variants include Green's function Monte Carlo (GFMC), auxiliary-field diffusion Monte Carlo (AFDMC), and lattice Monte Carlo.

**Captures:** nonperturbative correlations, benchmark neutron-matter energies, strong pairing tendencies, finite systems and periodic boxes.

**Fails:** fermion sign problem or fixed-node/constrained-path approximations; local-interaction constraints; finite-size corrections; regulator artifacts.

## 3.10 Density functional theory and Hartree-Fock-Bogoliubov

Nuclear density functional theory models the energy as a functional of densities and pairing tensors:

\[
E=E[\rho,\kappa,\kappa^*].
\]

Hartree-Fock-Bogoliubov (HFB) equations diagonalize a quasiparticle Hamiltonian,

\[
\begin{pmatrix}
h-\mu & \Delta \\
\Delta^* & -h^*+\mu
\end{pmatrix}
\begin{pmatrix}U_k\\V_k\end{pmatrix}
=E_k\begin{pmatrix}U_k\\V_k\end{pmatrix}.
\]

**Captures:** pairing, finite nuclei, crustal nuclei, neutron-rich inhomogeneous systems, possible pasta geometries.

**Fails:** functional uncertainty; hard connection to QCD; computational complexity in large 3D cells.

## 3.11 Tolman--Oppenheimer--Volkoff equations

For a static spherically symmetric star in general relativity, the TOV equations are

\[
\frac{dP}{dr}= -\frac{G(\varepsilon+P/c^2)(m+4\pi r^3P/c^2)}{r^2\left(1-2Gm/(rc^2)\right)},
\]

\[
\frac{dm}{dr}=4\pi r^2\varepsilon/c^2,
\]

with central pressure \(P_c\), boundary condition \(m(0)=0\), and surface \(R\) defined by \(P(R)=0\).  The gravitational mass is \(M=m(R)\).  An EOS closes the system.

**Captures:** relativistic hydrostatic balance, mass-radius curves, maximum mass, compactness.

**Fails:** rotation, magnetic fields, anisotropic stresses, dynamical mergers, finite-temperature nonequilibrium, superfluid multi-fluid dynamics unless extended.

---

# 4. Equation of state and relativistic structure

## 4.1 EOS as central mathematical object

The EOS is the central mathematical object because it compresses nuclear microphysics into a macroscopic map:

\[
P(\varepsilon) \mapsto \{M(R),\Lambda(M),I(M),\omega_{\rm mode},f_{\rm merger},\ldots\}.
\]

At zero temperature, beta-equilibrated neutron-star matter is commonly modeled by \(P=P(\varepsilon)\).  At finite temperature and nonequilibrium composition, as in mergers or proto-neutron stars, the EOS becomes

\[
P=P(n,T,Y_e),\qquad \varepsilon=\varepsilon(n,T,Y_e),\qquad \mu_i=\mu_i(n,T,Y_e).
\]

## 4.2 Stability and causality

An admissible cold EOS must satisfy at least:

1. **thermodynamic stability**:
   \[
   \frac{dP}{d\varepsilon}>0;
   \]
2. **positive compressibility**:
   \[
   K=9\frac{\partial P}{\partial n}>0;
   \]
3. **causality**:
   \[
   c_s^2=\frac{dP}{d\varepsilon}\le c^2;
   \]
4. **support of observed massive stars**:
   \[
   M_{\rm max}\gtrsim 2M_\odot;
   \]
5. **consistency with nuclear constraints near saturation**;
6. **consistency with tidal deformability and radius constraints**.

These are mathematical admissibility filters.  They do not determine the EOS uniquely.

## 4.3 Phase transitions and speed of sound

A first-order phase transition may be represented by a Maxwell construction with constant pressure across an energy-density jump:

\[
P(\varepsilon)=P_t,\qquad \varepsilon_-<\varepsilon<\varepsilon_+.
\]

Mixed phases with multiple conserved charges may instead use Gibbs constructions and finite-size/Coulomb terms.  A useful diagnostic is the speed of sound:

\[
c_s^2 = \frac{\partial P}{\partial \varepsilon}.
\]

In conformal ultrarelativistic matter, \(c_s^2/c^2=1/3\), but neutron-star phenomenology may require stronger stiffness at intermediate density.  A peak in \(c_s^2\), a softening, or a discontinuity can indicate changes in degrees of freedom, but the inverse problem is nonunique.

## 4.4 TOV map and inverse structure

Given a one-parameter central density sequence, TOV integration produces a curve

\[
P(\varepsilon) \longrightarrow \{M(\rho_c),R(\rho_c)\}.
\]

The stable branch is typically characterized by

\[
\frac{dM}{d\rho_c}>0,
\]

until the maximum mass, after which radial instability sets in.  In idealized settings the mapping between an EOS and the full mass-radius curve is close to invertible, but real inference sees only noisy, sparse observables.  Thus modern EOS work is a constrained inverse problem: infer a function \(P(\varepsilon)\) from finite data under physical priors.

## 4.5 Observational constraints

The modern constraint set includes:

- **mass measurements** of radio pulsars, especially stars near or above \(2M_\odot\), which require sufficient high-density stiffness;
- **NICER pulse-profile modeling**, which constrains masses and radii through relativistic X-ray light curves;
- **gravitational-wave tidal deformability**, especially GW170817, which constrains compactness and radii;
- **merger/kilonova observations**, which constrain ejecta, remnant lifetime, and indirectly EOS stiffness;
- **cooling curves**, which constrain pairing gaps, neutrino processes, and proton fraction thresholds;
- **glitches**, which constrain crustal moment of inertia, vortex pinning, and entrainment;
- **heavy-ion collisions and nuclear experiments**, which constrain symmetry energy, compressibility, and finite-temperature dense matter;
- **pQCD**, which constrains asymptotically high-density quark matter and therefore high-density EOS extensions.

Current inference is not a single measurement problem.  It is an intersection of heterogeneous constraints with different systematics.

---

# 5. Geometry and topology of nuclear pasta

## 5.1 Why pasta exists

Nuclear pasta appears near the crust-core transition, where matter is too dense for isolated spherical nuclei but not yet uniform nuclear liquid.  It is a frustrated phase problem.  Two competing tendencies dominate:

- short-range nuclear attraction favors dense nuclear regions;
- long-range Coulomb repulsion and electron screening penalize macroscopic charge separation.

The competition produces mesoscale structures whose names are informal but whose mathematics is serious: droplets, rods, slabs, tubes, bubbles, gyroids, sponge phases, labyrinths, and glassy mixed morphologies.

A minimal energy schematic is

\[
E = E_{\rm bulk}+E_{\rm surface}+E_{\rm Coulomb}+E_{\rm curvature}+E_{\rm shell}+\cdots.
\]

Pasta is the morphology of minimizers and metastable states of this frustrated functional under density, proton fraction, temperature, and boundary conditions.

## 5.2 Pasta as a geometric phase problem

Let \(\rho(\mathbf{x})\) be a baryon or proton density field in a simulation cell.  For a threshold \(\rho_\ast\), define an excursion set

\[
K_{\rho_\ast}=\{\mathbf{x}:\rho(\mathbf{x})\ge \rho_\ast\}.
\]

The morphology of \(K_{\rho_\ast}\) can be quantified by Minkowski functionals:

1. volume \(V\);
2. surface area \(A\);
3. integrated mean curvature
   \[
   C=\int_{\partial K} H\,dA;
   \]
4. Euler characteristic
   \[
   \chi = \beta_0-\beta_1+\beta_2.
   \]

Here \(\beta_0\) counts connected components, \(\beta_1\) tunnels, and \(\beta_2\) enclosed voids.  The signs and magnitudes of \(C\) and \(\chi\) classify droplet-like, rod-like, slab-like, tube-like, bubble-like, and sponge-like phases.

## 5.3 Persistent homology and phase classification

Threshold-dependent topology can be studied by persistent homology.  Instead of choosing a single \(\rho_\ast\), one tracks births and deaths of homology classes over a filtration:

\[
K_{\rho_1}\subseteq K_{\rho_2}\subseteq\cdots
\]

or over density/temperature/proton-fraction parameters.  Persistence diagrams then encode which connected components, loops, or cavities survive across scales.  This matters because pasta is often not cleanly periodic.  Finite simulation cells may contain mixtures, defects, domains, and percolating networks.

## 5.4 Percolation and transport

Pasta topology is not just classification aesthetics.  Connectivity controls transport:

- electron scattering;
- neutrino opacity;
- thermal conductivity;
- shear response;
- magnetic-field evolution;
- crust-core coupling;
- possible gravitational-wave damping.

A slab phase and a sponge phase can have similar volume fractions but different percolation and transport tensors.  Thus nuclear pasta is a genuine geometric/topological phase problem in dense matter.

## 5.5 Gyroids, sponge phases, and glassy morphologies

The frontier is moving beyond the canonical sequence

\[
\text{droplet}\to\text{rod}\to\text{slab}\to\text{tube}\to\text{bubble}\to\text{uniform}.
\]

Large-scale molecular dynamics, time-dependent Hartree-Fock, quantum molecular dynamics, and liquid-drop models show domains, defects, intertwined networks, and possible gyroid-like or sponge-like structures.  The mathematical object becomes a random or metastable morphology in a frustrated energy landscape, closer to glassy microphase separation than to a single periodic crystal.

Important open issue: whether simulation morphologies are physical, metastable, finite-size artifacts, or artifacts of boundary conditions.  Topological descriptors help because they compare phases without assuming a single idealized unit cell.

---

# 6. Statistical mechanics and many-body theory

## 6.1 Quantum many-body problem

Neutron matter is a strongly interacting quantum many-body problem.  The object is not an individual neutron but an antisymmetric state in Fock space.  At finite temperature, one works with

\[
Z=\mathrm{Tr}\,e^{-\beta(H-\sum_i\mu_iN_i)},
\qquad
\Omega=-T\log Z,
\]

from which

\[
P=-\Omega/V,
\qquad
n_i=-\frac{1}{V}\frac{\partial\Omega}{\partial\mu_i}.
\]

The challenge is finite-density nonperturbative nuclear physics: the QCD sign problem blocks direct lattice-QCD computation at neutron-star baryon chemical potentials, while nuclear EFT loses controlled convergence at high density.

## 6.2 Pairing and superfluidity

At low temperature, attractive channels near the Fermi surface produce Cooper pairing.  A schematic BCS gap equation is

\[
\Delta(k)= -\sum_{k'} V(k,k')\frac{\Delta(k')}{2E(k')},
\qquad
E(k)=\sqrt{(\epsilon_k-\mu)^2+\Delta(k)^2}.
\]

Relevant pairing channels include:

- crustal/intermediate-density neutron \(^1S_0\) pairing;
- core neutron \(^3P_2\)-\(^3F_2\) pairing;
- proton \(^1S_0\) superconductivity in the core.

Pairing gaps affect heat capacity, cooling, neutrino emissivity, glitches, vortex dynamics, and transport.  They are still uncertain because the in-medium interaction, polarization corrections, and density dependence are difficult.

## 6.3 BCS/BEC crossover and unitary analogies

Low-density neutron matter has a large neutron-neutron scattering length relative to interparticle spacing over some range.  This places it near the universal physics of the unitary Fermi gas, though neutron matter has finite effective range and nuclear-force details.  The BCS/BEC crossover analogy is useful mathematically: one tunes the ratio

\[
\frac{1}{k_F a}
\]

from weak BCS pairing to tightly bound pairs.  Neutrons do not form a stable dineutron in vacuum, but low-density neutron matter can display strong pairing and universal-like behavior.

## 6.4 Response functions and transport

Linear response functions are central for neutrino scattering, cooling, and transport.  For an operator \(O\),

\[
\chi_{OO}(\omega,\mathbf{q})=-i\int_0^\infty dt\, e^{i\omega t}\langle[O(t,\mathbf{q}),O(0,-\mathbf{q})]\rangle.
\]

Transport coefficients include thermal conductivity, shear viscosity, bulk viscosity, electrical conductivity, and neutrino opacities.  They depend on quasiparticle scattering, superfluid suppression factors, pasta disorder, magnetic fields, and possible exotic phases.

## 6.5 Dense-matter phase diagrams

The theoretical phase diagram depends on baryon density \(n\), temperature \(T\), proton fraction/electron fraction \(Y_p,Y_e\), magnetic field, and strangeness or quark content if allowed.  Neutron-star mergers access finite-temperature, neutron-rich matter far from cold beta equilibrium, so the relevant EOS domain is multidimensional.

The mathematical challenge is not merely drawing a phase diagram; it is constructing a thermodynamically consistent table satisfying Maxwell relations, causality where relevant, nuclear constraints, and stable numerical interpolation.

---

# 7. Superfluidity, elasticity, and defects

## 7.1 Order parameters

A neutron superfluid is described at long wavelengths by a complex order parameter

\[
\Psi_n=|\Psi_n|e^{i\phi_n}.
\]

The superfluid velocity is proportional to the phase gradient,

\[
\mathbf{v}_s=\frac{\hbar}{2m_n}\nabla\phi_n
\]

for paired neutrons.  Circulation is quantized:

\[
\oint \mathbf{v}_s\cdot d\mathbf{l}=\kappa N,
\qquad
\kappa=\frac{h}{2m_n}.
\]

In the core, protons may form a type-II superconductor with magnetic flux tubes.  The coexistence of neutron vortices and proton flux tubes creates a coupled defect network.

## 7.2 Vortices and glitches

A rotating superfluid forms a vortex array with areal vortex density

\[
n_v = \frac{2\Omega}{\kappa}.
\]

In the crust, vortices can pin to nuclei or pasta structures.  As the electromagnetic torque spins down the crust, pinned superfluid retains angular momentum.  Sudden unpinning or avalanche-like rearrangement can transfer angular momentum to the crust, producing a pulsar glitch.

The mathematical objects include:

- topological line defects;
- pinning potentials and metastable energy landscapes;
- Magnus force balance;
- mutual friction coefficients;
- vortex creep and avalanche statistics;
- two-fluid or multi-fluid hydrodynamics.

## 7.3 Elasticity of the crust

The crust is an elastic Coulomb/nuclear solid.  For small strains,

\[
\sigma_{ij}=C_{ijkl}u_{kl},
\]

with shear modulus \(\mu\) and breaking strain determined by lattice/pasta structure and defects.  Crust elasticity enters:

- torsional shear modes;
- magnetar quasi-periodic oscillations;
- crustquakes;
- maximum mountains and continuous gravitational waves;
- glitch recovery and crust-core coupling.

Nuclear pasta may alter elasticity strongly: slabs, rods, and sponges can be anisotropic, viscoelastic, or defect-rich rather than simple crystals.

## 7.4 Magneto-elastic coupling

In magnetars, magnetic stresses couple to elastic and superfluid degrees of freedom.  The continuum equations combine elastic displacement, magnetic field evolution, superfluid hydrodynamics, and relativistic gravity.  The frontier is not just solving MHD; it is solving MHD in a medium with quantized defects, entrainment, superconductivity, and anisotropic crustal topology.

---

# 8. Rigorous mathematics and formal structure

## 8.1 What is rigorous and what is not

A sharp distinction is necessary.

**Rigorous or theorem-level nearby mathematics includes:**

- stability of ordinary matter from the Pauli principle and Coulomb interactions;
- Lieb-Thirring inequalities and fermionic kinetic-energy bounds;
- rigorous dilute Fermi-gas asymptotics in simplified regimes;
- mathematical results on Thomas-Fermi and density-functional limits;
- existence/stability results for relativistic stellar-structure equations under specified EOS assumptions;
- compactness bounds and causal EOS inequalities.

**Not rigorously derived for neutron stars:**

- the full cold dense QCD EOS at neutron-star core densities;
- nuclear pasta phase diagrams from first-principles QCD;
- vortex pinning forces in realistic crustal microstructure;
- transport coefficients across all relevant densities and temperatures;
- a theorem-level map from microscopic nuclear Hamiltonians to observed glitch or merger data.

## 8.2 Stability of matter and Pauli support

The rigorous stability-of-matter program proves that fermionic antisymmetry prevents ordinary matter from collapsing under Coulomb attraction.  The conceptual relevance to neutron matter is high: fermionic kinetic pressure is a theorem-level stabilizing mechanism.  But neutron-star matter adds strong nuclear interactions, weak equilibrium, and general relativity; stability of ordinary atoms is not a proof of a neutron-star EOS.

## 8.3 Rigorous Fermi gas results

Mathematical physics has made progress on dilute Fermi gases with short-range interactions.  Results establish asymptotic energy expansions and bounds in limits such as \(k_F a\ll1\), including interaction corrections beyond the ideal Fermi gas.  These are important because they show how exclusion, scattering length, and many-body correlations can be controlled mathematically.

However, neutron-star matter is not generally dilute in this sense near saturation and above.  The neutron-neutron scattering length is large, effective range matters, three-body forces enter, and densities may exceed the controlled expansion regime.

## 8.4 Mean-field, DFT, and variational structures

Mean-field and density-functional approaches have rigorous analogues in other many-body systems: thermodynamic limits, semiclassical limits, Hartree/Hartree-Fock limits, Kohn-Sham variational principles, and convexity properties of energy functionals.  Nuclear DFT inherits this mathematical vocabulary, but practical Skyrme/RMF functionals are phenomenological.  Their success is empirical and computational, not theorem-level derivation from QCD.

## 8.5 Mathematical relativity of compact stars

For a specified EOS satisfying regularity, monotonicity, and positivity assumptions, the TOV equations define stellar models.  Mathematical questions include:

- existence and uniqueness of regular solutions;
- finite radius versus infinite atmosphere;
- stability under radial perturbations;
- maximum-mass turning-point criteria;
- compactness bounds such as Buchdahl-type inequalities;
- inverse problems reconstructing an EOS from idealized stellar observables.

This is one of the more rigorous parts of neutron-star theory: once an EOS class is assumed, relativistic structure has theorem-level content.  The uncertainty is pushed into the EOS.

## 8.6 Rigorous EOS constraints

EOS inference often imposes mathematical constraints:

\[
0<c_s^2\le c^2,
\qquad
P(\varepsilon)\ \text{monotone},
\qquad
\varepsilon+P>0,
\qquad
M_{\rm max}\ge M_{\rm observed}.
\]

These constraints are rigorous as admissibility conditions, but they do not select a unique physical EOS.  They carve out a feasible function space.

---

# 9. Computational frontier

## 9.1 Quantum Monte Carlo

QMC is producing increasingly precise nonperturbative neutron-matter benchmarks.  Modern work emphasizes:

- local chiral interactions suitable for QMC;
- regulator-artifact reduction;
- uncertainty propagation to neutron-star radii;
- finite-size corrections;
- pairing and response functions.

The mathematical insight is variational/projection geometry in high-dimensional antisymmetric Hilbert space: QMC is not just numerical approximation but a way to identify which interaction terms control the EOS uncertainty.

## 9.2 Lattice EFT

Lattice EFT places nucleons on a spacetime lattice with chiral interactions and computes nuclear systems by Monte Carlo.  It offers a bridge between EFT and nonperturbative many-body computation.  The hard problems are finite-density sign/phase issues, continuum extrapolation, lattice artifacts, and computational cost.

## 9.3 Density functional and HFB computation

Large 3D HFB and time-dependent Hartree-Fock calculations address crust nuclei and pasta.  The frontier includes:

- large periodic cells;
- finite-temperature HFB;
- pairing in inhomogeneous neutron-rich matter;
- beyond-mean-field correlations;
- uncertainty quantification over EDF families.

## 9.4 Molecular dynamics and pasta simulation

Pasta simulations use classical or semiclassical molecular dynamics, quantum molecular dynamics, time-dependent Hartree-Fock, compressible liquid-drop models, and phase-field-like approaches.  They generate density fields whose morphology is analyzed by Minkowski functionals, Betti numbers, persistent homology, and machine learning classifiers.

This is where computation is visibly creating new mathematics: phase identity is no longer assigned by eye but by geometric and topological invariants.

## 9.5 Bayesian EOS inference

Bayesian inference treats the EOS as a random function constrained by data:

\[
p(\mathrm{EOS}\mid d)\propto p(d\mid \mathrm{EOS})p(\mathrm{EOS}).
\]

Parameterizations include piecewise polytropes, spectral representations, Gaussian processes, speed-of-sound models, and nonparametric priors.  Likelihoods include masses, radii, tidal deformabilities, nuclear theory bands, and heavy-ion constraints.

The mathematical frontier is a constrained functional inverse problem under causality, thermodynamic stability, and sparse noisy observations.

## 9.6 Machine learning emulators and neural potentials

Machine learning appears in several distinct roles:

- emulating expensive EOS calculations;
- accelerating TOV and tidal-deformability maps;
- simulation-based inference for gravitational waves;
- classifying pasta phases from simulation data;
- fitting neural-network nuclear potentials or EDF corrections;
- producing differentiable surrogate models for merger simulations.

Reliability varies.  ML is strongest when used as an emulator with validated uncertainty bounds; weakest when extrapolating outside training physics.

## 9.7 Numerical relativity and mergers

Binary neutron-star simulations solve Einstein's equations coupled to relativistic hydrodynamics/MHD, neutrino transport, finite-temperature EOS, and sometimes subgrid viscosity or turbulence models.  Observables include inspiral tidal effects, post-merger frequencies, ejecta masses, kilonova heating, and remnant collapse time.

The frontier problem is not just numerical stability.  It is multi-scale coupling: microphysical EOS and transport coefficients affect macroscopic spacetime dynamics and electromagnetic counterparts.

## 9.8 Tools and infrastructures

Important computational infrastructures include:

- **CompOSE**: a repository and service for tabulated EOS data used in astrophysical simulations;
- **MUSES**: modular framework for dense-matter EOS construction and uncertainty-aware comparison;
- **NICER analysis pipelines**: pulse-profile inference from X-ray timing;
- **LIGO/Virgo/KAGRA inference software**: tidal deformability and merger analysis;
- **SpECTRE/SXS, Einstein Toolkit, WhiskyTHC, SACRA, IllinoisGRMHD**: numerical-relativity and relativistic-hydrodynamics infrastructures;
- **CompactObject and related Bayesian packages**: EOS inference workflows.

---

# 10. Observational and experimental interface

## 10.1 Masses

Precise pulsar masses are hard lower bounds on EOS stiffness.  Any viable cold EOS must support the heaviest reliably measured neutron stars.  Stars near \(2M_\odot\) rule out many soft EOS models.  Very high black-widow masses are important but have larger systematic uncertainty.

Mathematically, a mass measurement imposes

\[
M_{\rm max}[P(\varepsilon)]\ge M_{\rm obs}.
\]

## 10.2 Radii and compactness

Radius measurements constrain pressure at roughly one to a few times saturation density.  NICER infers mass and radius by fitting rotation-modulated X-ray hot-spot emission in curved spacetime.  The inference depends on atmosphere models, spot geometry, spin, mass priors, and instrument systematics.

Compactness

\[
C=\frac{GM}{Rc^2}
\]

enters light bending, tidal deformability, and moment of inertia.

## 10.3 Tidal deformability

The dimensionless tidal deformability is

\[
\Lambda=\frac{2}{3}k_2 C^{-5},
\]

where \(k_2\) is the Love number.  Gravitational-wave inspiral phases measure combinations such as \(\tilde\Lambda\).  Tidal deformability is very radius-sensitive, so GW170817 strongly constrained overly stiff EOS models with large radii.

## 10.4 Post-merger signals and kilonovae

Post-merger gravitational-wave frequencies, if measured with sufficient signal-to-noise, would constrain the finite-temperature high-density EOS.  Kilonovae constrain ejecta mass, velocity, composition, and remnant lifetime.  These are indirect because they depend on neutrino transport, magnetic fields, viscosity, nuclear heating, and radiative transfer.

## 10.5 Cooling curves

Thermal evolution constrains neutrino emission processes, heat capacity, envelope composition, and pairing gaps.  Direct Urca processes require sufficiently high proton fraction; superfluidity suppresses or enhances different channels.  Thus cooling is a composition-and-pairing probe rather than a clean EOS measurement.

## 10.6 Glitches

Glitches constrain angular momentum reservoirs and vortex dynamics.  The relevant mathematical quantities include crustal moment of inertia, entrainment, vortex pinning forces, avalanche statistics, mutual friction, and core-crust coupling.  Because multiple mechanisms can reproduce similar glitch phenomenology, inference is underdetermined.

## 10.7 Nuclear and heavy-ion experiments

Laboratory constraints include:

- neutron skins and parity-violating electron scattering;
- dipole polarizability;
- isobaric analog states;
- nuclear masses and radii;
- heavy-ion flow and particle production;
- symmetry-energy constraints;
- finite-temperature nuclear matter probes.

These constrain the low-to-intermediate-density EOS and symmetry energy but do not directly measure cold beta-equilibrated matter at several \(n_0\).

---

# 11. Current frontier, 2020--2026

## 11.1 Dense-matter EOS inference

The most active frontier is EOS inference from heterogeneous constraints.  Modern analyses combine:

- χEFT bands at low-to-moderate density;
- perturbative QCD constraints at very high density;
- massive pulsars;
- NICER radii;
- GW tidal deformabilities;
- nuclear experiments;
- causality and stability priors;
- parameterized or nonparametric high-density extensions.

The frontier question is whether data require or merely allow changes in degrees of freedom.  Current evidence can be compatible with nucleonic EOS families and with hybrid scenarios; claims of quark cores are model-dependent and should be stated as evidence or consistency, not direct observation.

## 11.2 Multimessenger constraints

The merger era has shifted neutron-star matter from a nuclear theory problem to a multimessenger inverse problem.  Inspiral tidal data constrain cold EOS; post-merger signals would probe finite-temperature high-density matter; kilonovae constrain ejecta and remnant lifetime; electromagnetic observations of pulsars constrain masses/radii and cooling.

Reliability hierarchy:

- high: precise masses, basic causality/stability constraints;
- moderate: NICER radii and GW tidal constraints, with systematics;
- moderate to uncertain: heavy-ion extrapolation to cold beta-equilibrated matter;
- speculative: identifying a particular exotic phase from current data alone.

## 11.3 χEFT, MBPT, and QMC uncertainty reduction

Recent theory improves low-density neutron matter by quantifying truncation errors, regulator artifacts, many-body convergence, and three-body-force uncertainties.  These results reduce radius uncertainties for lower-mass stars and provide priors for EOS inference.  The limitation remains the breakdown of controlled χEFT convergence at higher densities.

## 11.4 Nuclear pasta topology

Pasta work has become increasingly geometric.  Rather than assigning labels by visual inspection, researchers use Minkowski functionals, Euler characteristic, Betti numbers, persistent homology, graph/network measures, and machine learning.  Recent work builds phase diagrams from curvature and Euler-characteristic classifiers and explores finite-temperature proto-neutron-star pasta.

The frontier is to connect these morphological descriptors to transport, elasticity, neutrino opacity, and observable consequences.

## 11.5 Superfluid and superconducting phases

The superfluid/superconducting frontier includes:

- density-dependent neutron pairing gaps;
- proton superconductivity and type-I/type-II uncertainty;
- vortex-flux-tube interactions;
- vortex tangles and turbulence;
- pinning to pasta and crust nuclei;
- glitch avalanche models;
- magneto-elastic oscillations.

The mathematical challenge is coupling quantum-defect dynamics to macroscopic relativistic hydrodynamics.

## 11.6 Finite-temperature dense matter and mergers

Mergers require EOS tables over density, temperature, and electron fraction.  The frontier includes thermodynamic consistency, neutrino opacities, viscosity, magnetic fields, turbulence, and post-merger gravitational-wave spectra.  Cold \(P(\varepsilon)\) is insufficient.

## 11.7 High-density extrapolation and exotic matter

At densities beyond controlled nuclear EFT, possible degrees of freedom include hyperons, meson condensates, deconfined quarks, color superconducting phases, or smooth quark-hadron crossover.  pQCD constrains asymptotic behavior but not the entire neutron-star core.  The frontier is to stitch low-density nuclear theory, high-density QCD, and observations without imposing artificial model conclusions.

## 11.8 Major active collaborations and infrastructures

Important current groups/infrastructures include:

- **NICER** for X-ray pulse-profile mass-radius inference;
- **LIGO/Virgo/KAGRA** for tidal deformability and merger constraints;
- **N3AS** for nuclear astrophysics theory and simulations;
- **MUSES** for modular dense-matter EOS construction;
- **CompOSE** for EOS tables;
- **FRIB/RIKEN/GSI/FAIR and heavy-ion programs** for nuclear constraints;
- **SXS/SpECTRE and numerical-relativity groups** for mergers;
- **LANL/INT/Darmstadt/Helsinki/ECT*/MSU/RIKEN/RIKEN-RBRC and related dense-matter theory networks** for χEFT, QMC, pQCD, transport, and inference.

---

# 12. Open problems

## 12.1 Finite-density nuclear many-body problem

**Problem.**  Derive the neutron-star EOS from controlled microscopic theory across \(n\sim n_0\) to several \(n_0\).

**Why hard.**  QCD is nonperturbative at these densities; lattice QCD has a sign problem at baryon chemical potential; nuclear EFT loses convergence at high density; many-body correlations and three-body forces matter.

**Advance needed.**  A controlled bridge among χEFT, nonperturbative nuclear many-body methods, and high-density QCD constraints, with quantified uncertainty.

## 12.2 Dense-matter EOS above controlled χEFT

**Problem.**  Determine \(P(\varepsilon)\), composition, and speed of sound at \(2--8n_0\).

**Why hard.**  Observations constrain integrated stellar properties, not local microphysics.  Many EOS functions produce similar masses/radii/tidal deformabilities.

**Advance needed.**  More precise radii, multiple tidal measurements, post-merger gravitational waves, better pQCD matching, and less parameterization-dependent inference.

## 12.3 Nuclear pasta classification

**Problem.**  Classify pasta phases and metastable morphologies in a physically invariant way.

**Why hard.**  Pasta is finite-temperature, frustrated, defect-rich, and boundary-condition-sensitive.  Ideal shapes are oversimplified.

**Advance needed.**  Persistent topological descriptors tied to transport and elasticity, validated across independent simulation methods.

## 12.4 Crust-core transition

**Problem.**  Determine the transition density and order of transition from inhomogeneous crust/pasta to uniform core.

**Why hard.**  It depends on symmetry energy, surface tension, Coulomb screening, pairing, finite-size effects, and temperature.

**Advance needed.**  Unified EDF/χEFT-constrained models with quantified uncertainties and consistent treatment of pasta.

## 12.5 Superfluid vortex dynamics

**Problem.**  Derive macroscopic glitch and rotational dynamics from microscopic vortex pinning and mutual friction.

**Why hard.**  Vortices interact with a disordered nuclear landscape, superconducting flux tubes, turbulence, entrainment, and evolving crustal stress.

**Advance needed.**  Multi-scale simulations linking microscopic pinning forces to statistical avalanche dynamics and relativistic two-fluid hydrodynamics.

## 12.6 Glitch modeling

**Problem.**  Explain glitch sizes, waiting times, recovery, and source dependence within a unified model.

**Why hard.**  Many mechanisms are degenerate observationally; internal superfluid parameters are uncertain; crust-core coupling is complex.

**Advance needed.**  Joint inference using timing data, thermal data, crust/pasta microphysics, and vortex-dynamics simulations.

## 12.7 Transport coefficients

**Problem.**  Compute shear/bulk viscosity, conductivity, neutrino opacity, and mutual friction across all relevant phases.

**Why hard.**  Transport is sensitive to excitations, pairing gaps, disorder, magnetic fields, pasta topology, and possible exotic degrees of freedom.

**Advance needed.**  Response-function calculations validated by many-body theory and incorporated into merger/cooling simulations.

## 12.8 Merger dynamics

**Problem.**  Predict post-merger gravitational waves, ejecta, and electromagnetic counterparts from microphysical EOS and transport.

**Why hard.**  Requires full GR, finite-temperature EOS, neutrinos, MHD, turbulence, nuclear reactions, radiative transfer, and uncertain initial conditions.

**Advance needed.**  Higher-resolution numerical relativity with validated microphysics and fast inference pipelines for future detectors.

## 12.9 Phase transitions to quark matter

**Problem.**  Determine whether neutron-star cores contain deconfined quark matter or a sharp/smooth hadron-quark transition.

**Why hard.**  Dense QCD is not solved at intermediate chemical potential; hybrid-star signals are degenerate with nucleonic EOS variations.

**Advance needed.**  Stronger high-density constraints from pQCD, improved multimessenger data, and model-independent signatures of discontinuities or conformal behavior.

## 12.10 Rigorous microphysics-to-observables map

**Problem.**  Prove controlled links from microscopic Hamiltonians/field theories to EOS, from EOS to stellar structure, and from structure to observables.

**Why hard.**  Each map involves a different mathematical limit: thermodynamic, many-body, relativistic, hydrodynamic, statistical-inference, and observational-noise limits.

**Advance needed.**  A layered proof program: rigorous many-body bounds, validated EOS function spaces, theorem-level TOV/inverse stability, and uncertainty-aware observational inference.

---

# 13. Cross-regime comparison

| Regime | Density scale | Degrees of freedom | Dominant constraint | Order | Topology | Field structure | Central equation/object | Computation | Open problem |
|---|---:|---|---|---|---|---|---|---|---|
| Plasma | low to stellar, often below nuclear density | ions, electrons, photons | Coulomb kinetics, collective EM fields | kinetic, sometimes turbulent | field-line topology, shocks | Maxwell/Vlasov/MHD | distribution function \(f_s(x,p,t)\) | PIC, MHD, kinetic solvers | turbulence, reconnection, collisionless transport |
| White-dwarf matter | \(10^6--10^{10}\,\mathrm{g/cm^3}\) | nuclei + degenerate electrons | electron Pauli pressure | Coulomb lattice/liquid | crystal defects, phase separation | Newtonian/GR gravity + electron gas | Chandrasekhar EOS, hydrostatic balance | stellar evolution codes | crystallization, Type Ia progenitors |
| Pure neutron matter | \(\lesssim\) few \(n_0\) in theory | neutrons | antisymmetry + nuclear forces | Fermi liquid/superfluid | vortices if rotating | nuclear Hamiltonian/EFT | \(E(n),P(n)\) from many-body theory | χEFT, MBPT, QMC | controlled EOS beyond EFT range |
| Beta-equilibrated neutron-star matter | crust/core densities | neutrons, protons, electrons, muons | Pauli + weak equilibrium + charge neutrality | superfluid/superconducting fluid | vortices, flux tubes | GR + multifluid hydro | EOS + TOV | EOS inference, cooling, NR | composition and high-density EOS |
| Nuclear pasta | inner crust near crust-core transition | nucleons + electrons in inhomogeneous phases | nuclear attraction vs Coulomb frustration | microphase-separated, defect-rich | Betti numbers, Euler characteristic, percolation, gyroids | density fields, Coulomb fields | frustrated energy functional | MD, TDHF, QMD, TDA | physical classification and transport links |
| Quark matter | several \(n_0\) and above, uncertain in stars | quarks, gluons, possible color pairs | QCD, color neutrality, beta equilibrium | color-superconducting or strongly coupled fluid | vortices/domain structures possible | gauge fields, condensates | finite-density QCD EOS | pQCD, models, holography, inference | sign problem/intermediate-density QCD |
| Black hole | beyond material support | exterior characterized by mass/spin/charge | horizon formation, Einstein equations | no material order visible externally | horizon topology | spacetime geometry | Einstein equations, horizon thermodynamics | numerical relativity | singularity/interior quantum gravity |
| Crystal | ordinary condensed density | atoms/electrons | energy minimization with periodic order | long-range periodic | defects, dislocations | elastic/electronic fields | lattice Hamiltonian/phonons | DFT, MD | defects, nonequilibrium, quantum materials |
| Glass | ordinary condensed density | atoms/molecules/colloids | kinetic constraint/metastability | amorphous, nonergodic | energy landscape basins | elastic/viscoelastic fields | glass transition/stat mech | MD, replica, ML | nature of glass transition |
| Liquid | ordinary condensed density | molecules/atoms | local packing, thermal motion | short-range order | vortices/free surfaces | hydrodynamic fields | Navier-Stokes/stat mech | MD/CFD | turbulence, transport from microphysics |

The sequence

\[
\text{plasma}\to\text{degenerate matter}\to\text{neutron matter}\to\text{nuclear pasta}\to\text{quark matter}\to\text{black hole}
\]

is a sequence of changing mathematical support.  Plasma is field-kinetic; degenerate matter is Pauli-supported; neutron matter is Pauli plus nuclear interaction; pasta is frustrated nuclear geometry; quark matter is finite-density QCD; black holes are no longer material EOS-supported objects in the exterior classical description.

---

# 14. Annotated bibliography

## 14.1 Foundational neutron-star and dense-matter sources

**Oppenheimer, J. R., and Volkoff, G. M. (1939). "On Massive Neutron Cores." _Physical Review_ 55, 374. DOI: 10.1103/PhysRev.55.374.**  The original general-relativistic neutron-core calculation using an ideal neutron Fermi gas.  Historically central because it joins Fermi degeneracy to relativistic hydrostatic balance; quantitatively superseded by realistic nuclear EOS.

**Tolman, R. C. (1939). "Static Solutions of Einstein's Field Equations for Spheres of Fluid." _Physical Review_ 55, 364. DOI: 10.1103/PhysRev.55.364.**  Foundational derivation of relativistic fluid spheres.  Together with Oppenheimer--Volkoff, it gives the TOV framework.

**Baym, Pethick, and Sutherland (1971). "The Ground State of Matter at High Densities: Equation of State and Stellar Models." _Astrophysical Journal_ 170, 299. DOI: 10.1086/151216.**  Canonical outer-crust EOS.  Important for the transition from nuclei plus electrons to neutron-rich crustal matter.

**Baym, Bethe, and Pethick (1971). "Neutron Star Matter." _Nuclear Physics A_ 175, 225. DOI: 10.1016/0375-9474(71)90281-8.**  Foundational neutron-star matter theory, including the inner crust and neutron drip logic.  Still a reference point for crust-core thinking.

**Glendenning, N. K. (1997/2000). _Compact Stars: Nuclear Physics, Particle Physics, and General Relativity_. Springer.**  A classic monograph connecting nuclear physics, compact-star structure, and possible exotic phases.  Useful for formal EOS and phase-transition constructions.

**Haensel, Potekhin, and Yakovlev (2007). _Neutron Stars 1: Equation of State and Structure_. Springer.**  Detailed reference for neutron-star EOS, crust, thermal evolution, and structure.  Still valuable as a technical baseline.

## 14.2 Modern EOS and multimessenger frontier

**Chatziioannou, K., et al. (2024/2025). "Neutron stars and the dense matter equation of state: from microscopic theory to macroscopic observations." arXiv:2407.11153.**  A recent broad review of the EOS from nuclear microphysics to masses, radii, and gravitational-wave constraints.  Useful for the current inference landscape.

**Kumar, R., et al. / MUSES Collaboration (2024). "Theoretical and experimental constraints for the equation of state of dense and hot matter." _Living Reviews in Relativity_ 27, 3. DOI: 10.1007/s41114-024-00049-6.**  Major review of dense/hot matter constraints from theory, heavy-ion collisions, neutron stars, and mergers.  Important because it explicitly compares validity domains and uncertainty sources.

**Drischler, C., Holt, J. W., and Wellenhofer, C. (2021). "Chiral Effective Field Theory and the High-Density Nuclear Equation of State." _Annual Review of Nuclear and Particle Science_ 71, 403. DOI: 10.1146/annurev-nucl-102419-041903.**  Core modern review of χEFT, many-body perturbation theory, and uncertainty quantification for nuclear and neutron matter.  A key source for low-to-moderate density reliability.

**Rutherford, N., et al. (2024). "Constraining the Dense Matter Equation of State with New NICER Mass-Radius Measurements and New Chiral Effective Field Theory Inputs." arXiv:2407.06790.**  Incorporates new NICER PSR J0437 constraints and new χEFT inputs.  Representative of current Bayesian EOS inference.

**Komoltsev, O., and Kurkela, A. (2022). "How perturbative QCD constrains the equation of state at neutron-star densities." _Physical Review Letters_ 128, 202701. DOI: 10.1103/PhysRevLett.128.202701; arXiv:2111.05350.**  Shows how asymptotically high-density QCD constraints can restrict lower-density EOS extensions through causality and stability.  Important for high-density interpolation.

**Annala, E., Gorda, T., Hirvonen, J., Komoltsev, O., Kurkela, A., Nättilä, J., and Vuorinen, A. (2023). "Strongly interacting matter exhibits deconfined behavior in massive neutron stars." _Nature Communications_ 14, 8451. DOI: 10.1038/s41467-023-44051-y; arXiv:2303.11356.**  Influential evidence that high-mass neutron stars may probe quark-like matter, but the conclusion is inference-based and model-dependent.  It should be read as a high-density EOS constraint study, not a direct detection.

## 14.3 Microscopic many-body theory

**Tews, I., et al. (2024/2025). "Neutron matter from local chiral effective field theory interactions at large cutoffs." arXiv:2407.08979.**  Uses QMC with local χEFT interactions to reduce regulator artifacts and propagate neutron-matter uncertainty to neutron-star radii.  Important recent benchmark for PNM.

**Keller, J., Wellenhofer, C., Hebeler, K., and Schwenk, A. (2021). "Neutron matter at finite temperature based on chiral effective field theory interactions." _Physical Review C_ 103, 055806. DOI: 10.1103/PhysRevC.103.055806; arXiv:2011.05855.**  Gives finite-temperature neutron-matter thermodynamics from χEFT many-body perturbation theory.  Important for supernova and merger EOS extensions.

**Alford, M. G., et al. (2022). "Relativistic mean-field theories for neutron-star physics based on chiral effective field theory." arXiv:2203.05117.**  Fits RMF models to χEFT pure-neutron-matter bands, connecting microscopic constraints to flexible astrophysical EOS models.  Useful for finite-temperature and high-density model building.

**Alp, D., et al. (2025). "Equation of State and Fermi Liquid Properties of Strongly Interacting Dense Matter." arXiv:2504.05607.**  Recent many-body perturbation theory work on nuclear and neutron matter, including Landau parameters and speed of sound.  Representative of the 2025 many-body frontier.

**Gezerlis, A., and Carlson, J. (2010). "Strongly paired fermions: cold atoms and neutron matter." _Physical Review C_ 81, 025803. DOI: 10.1103/PhysRevC.81.025803.**  Connects low-density neutron matter to unitary Fermi-gas physics.  Useful for the BCS/BEC crossover analogy.

## 14.4 Nuclear pasta, topology, and morphology

**Ravenhall, D. G., Pethick, C. J., and Wilson, J. R. (1983). "Structure of Matter below Nuclear Saturation Density." _Physical Review Letters_ 50, 2066. DOI: 10.1103/PhysRevLett.50.2066.**  One of the foundational papers introducing non-spherical nuclear structures in dense matter.  Origin of the canonical pasta sequence.

**Hashimoto, M., Seki, H., and Yamada, M. (1984). "Shape of nuclei in the crust of neutron star." _Progress of Theoretical Physics_ 71, 320. DOI: 10.1143/PTP.71.320.**  Foundational early pasta morphology work.  Important for historical development of rods/slabs/tubes/bubbles.

**Schuetrumpf, B., Klatt, M. A., Iida, K., Maruhn, J. A., Mecke, K., and Reinhard, P.-G. (2013). "Time-dependent Hartree-Fock approach to nuclear pasta at finite temperature." _Physical Review C_ 87, 055805. DOI: 10.1103/PhysRevC.87.055805.**  Uses Minkowski functionals to classify pasta morphology in TDHF simulations.  Important because it makes topology/geometry part of the phase descriptor.

**Schneider, A. S., Caplan, M. E., Berry, D. K., and Horowitz, C. J. (2018). "Domains and defects in nuclear pasta." _Physical Review C_ 98, 055801. DOI: 10.1103/PhysRevC.98.055801; arXiv:1807.02557.**  Large molecular-dynamics simulations showing domains and defects in pasta.  Important for moving beyond ideal periodic morphologies.

**Kycia, R. A., Kubis, S., and Wójcik, W. (2017). "Topological analysis of nuclear pasta phases." _Physical Review C_ 95, 065805. DOI: 10.1103/PhysRevC.95.065805; arXiv:1702.04365.**  Applies algebraic topology and Betti numbers to pasta.  Key source for homological descriptors.

**López, J. A., Dorso, C. O., and Frank, G. A. (2021). "Properties of nuclear pastas." _Frontiers in Physics_ 9, 655912. DOI: 10.3389/fphy.2021.655912.**  Review of pasta simulations and properties, including morphology, transport, screening, and astrophysical implications.

**Muñoz, I., and López, J. A. (2024). "Phase diagrams of nuclear pastas with machine learning." arXiv:2411.18041.**  Uses neural networks trained on curvature and Euler characteristic to classify stable pasta phases and generate 3D phase diagrams.  Representative of the ML/topological phase-classification frontier.

**Zhou, X., et al. (2026). "Nuclear pasta in hot neutron-star matter and proto-neutron stars." arXiv:2602.12091.**  Recent finite-temperature/proto-neutron-star pasta study using compressible liquid-drop modeling with surface tension.  Useful for 2026 frontier context, but provisional as a preprint.

## 14.5 Superfluidity, superconductivity, and defects

**Anderson, P. W., and Itoh, N. (1975). "Pulsar glitches and restlessness as a hard superfluidity phenomenon." _Nature_ 256, 25. DOI: 10.1038/256025a0.**  Foundational vortex-unpinning picture of pulsar glitches.  Still central to the mathematical ontology of neutron-star defects.

**Haskell, B., and Melatos, A. (2015). "Models of pulsar glitches." _International Journal of Modern Physics D_ 24, 1530008. DOI: 10.1142/S0218271815300086.**  Major review of glitch models, angular momentum reservoirs, vortex dynamics, and observational phenomenology.

**Chamel, N. (2024). "Superfluidity and superconductivity in neutron stars." arXiv:2410.02644.**  Current review of pairing, vortices, flux tubes, entrainment, and glitch/magnetic implications.  Good 2024 map of superfluid/superconducting neutron-star physics.

**Link, B., and Levin, Y. (2022). "Vortex pinning in neutron stars, slip-stick dynamics, and glitches." _Astrophysical Journal_ 941, 148. DOI: 10.3847/1538-4357/aca0ff.**  Studies pinning forces and vortex-network dynamics.  Important for treating glitches as defect/friction dynamics.

**Haskell, B., et al. (2020). "Modelling pulsar glitches with realistic equations of state and superfluid turbulence." _Monthly Notices of the Royal Astronomical Society_ 498, 4634. DOI: 10.1093/mnras/staa2578.**  Connects glitch data to turbulent pinned superfluids and realistic EOS.  Important for multi-scale modeling.

**Shukla, V., et al. (2024). "Neutron superfluid vortices and proton superconducting flux tubes: dynamics and interaction in neutron stars." _Physical Review D_ 109, 043026. DOI: 10.1103/PhysRevD.109.043026.**  Numerical study of coupled vortex/flux-tube dynamics.  Representative of current defect-network computation.

## 14.6 Observational constraints

**Abbott, B. P., et al. (LIGO/Virgo Collaboration) (2017). "GW170817: Observation of Gravitational Waves from a Binary Neutron Star Inspiral." _Physical Review Letters_ 119, 161101. DOI: 10.1103/PhysRevLett.119.161101.**  First binary-neutron-star gravitational-wave detection.  Opened tidal-deformability constraints on dense matter.

**Abbott, B. P., et al. (2018). "GW170817: Measurements of neutron star radii and equation of state." _Physical Review Letters_ 121, 161101. DOI: 10.1103/PhysRevLett.121.161101.**  EOS/radius inference from GW170817.  Key source for tidal-deformability constraints.

**Miller, M. C., et al. (2019). "PSR J0030+0451 Mass and Radius from NICER Data." _Astrophysical Journal Letters_ 887, L24. DOI: 10.3847/2041-8213/ab50c5.**  One of the first NICER mass-radius results.  Important for X-ray pulse-profile inference.

**Riley, T. E., et al. (2019). "A NICER View of PSR J0030+0451." _Astrophysical Journal Letters_ 887, L21. DOI: 10.3847/2041-8213/ab481c.**  Independent NICER analysis of the same source.  Important for comparing inference systematics.

**Miller, M. C., et al. (2021). "The Radius of PSR J0740+6620 from NICER and XMM-Newton Data." _Astrophysical Journal Letters_ 918, L28. DOI: 10.3847/2041-8213/ac089b.**  NICER radius inference for a high-mass neutron star.  Important because high-mass radius constraints probe high-density stiffness.

**Riley, T. E., et al. (2021). "A NICER View of the Massive Pulsar PSR J0740+6620." _Astrophysical Journal Letters_ 918, L27. DOI: 10.3847/2041-8213/ac0a81.**  Parallel analysis of PSR J0740+6620.  Important for uncertainty and method comparison.

**Choudhury, D., et al. (2024). "A NICER View of the Nearest and Brightest Millisecond Pulsar: PSR J0437-4715." _Astrophysical Journal Letters_ 971, L20. DOI: 10.3847/2041-8213/ad5a6f; arXiv:2407.06789.**  New NICER mass-radius result for PSR J0437-4715.  Important because it adds a nearby, bright millisecond pulsar to the EOS inference set.

**Dittmann, A. J., et al. (2024). "A more precise measurement of the radius of PSR J0740+6620 using updated NICER data." _Astrophysical Journal_ 974, 295. DOI: 10.3847/1538-4357/ad5f1e; arXiv:2406.14467.**  Updated high-mass NICER radius analysis.  Important for the high-density EOS.

## 14.7 Rigorous mathematics

**Dyson, F. J., and Lenard, A. (1967/1968). "Stability of Matter." _Journal of Mathematical Physics_.**  Foundational theorem-level proof program for stability of ordinary matter.  Important conceptual ancestor for degeneracy-pressure mathematics.

**Lieb, E. H. (1976). "The Stability of Matter." _Reviews of Modern Physics_ 48, 553. DOI: 10.1103/RevModPhys.48.553.**  Classic review of how the Pauli principle and Coulomb structure stabilize matter.  Relevant to the rigorous side of fermionic constraint matter.

**Lieb, E. H., and Thirring, W. (1975). "Bound for the kinetic energy of fermions which proves the stability of matter." _Physical Review Letters_ 35, 687. DOI: 10.1103/PhysRevLett.35.687.**  Establishes kinetic-energy inequalities central to fermionic stability.  Useful as theorem-level Pauli mathematics.

**Lieb, E. H., and Seiringer, R. (2010). _The Stability of Matter in Quantum Mechanics_. Cambridge University Press.**  Modern mathematical treatment of stability of matter.  The rigorous baseline for understanding fermion pressure as more than heuristic.

**Lauritsen, M. B., and Seiringer, R. (2023/2024). "The ground state energy of the dilute spin-polarized Fermi gas." arXiv:2311.11692 and related works.**  Recent rigorous dilute Fermi-gas results.  Important as a controlled mathematical cousin of neutron matter, though not directly a neutron-star EOS derivation.

**Lindblom, L. (1992). "Determining the nuclear equation of state from neutron-star masses and radii." _Astrophysical Journal_ 398, 569. DOI: 10.1086/171882.**  Classic inverse stellar-structure result: idealized mass-radius data can determine the EOS.  Important for the mathematical inverse problem.

**Buchdahl, H. A. (1959). "General relativistic fluid spheres." _Physical Review_ 116, 1027. DOI: 10.1103/PhysRev.116.1027.**  Compactness bounds for relativistic fluid spheres.  Relevant to rigorous constraints on stellar models.

## 14.8 Computational tools and infrastructure

**CompOSE Collaboration. "CompOSE: CompStar Online Supernovae Equations of State." https://compose.obspm.fr/**  Provides EOS tables and tools for astrophysical simulations.  Important infrastructure for comparing and using dense-matter EOS.

**MUSES Collaboration. "Modular Unified Solver of the Equation of State." https://musesframework.io/**  Modular framework for dense and hot matter EOS, with links to heavy-ion and neutron-star applications.  Important for multi-model, uncertainty-aware EOS construction.

**SXS/SpECTRE Collaboration. "SpECTRE." https://spectre-code.org/**  Numerical relativity code supporting binary neutron-star and relativistic MHD simulations.  Important for high-accuracy merger modeling.

**Dax, M., et al. (2025). "Real-time gravitational-wave inference for binary neutron stars using machine learning." _Nature_.**  Representative of rapid simulation-based inference for neutron-star gravitational-wave data.  Important for the computational inverse-problem frontier.

**Huth, S., Pang, P. T. H., et al. (2022). "Constraining neutron-star matter with microscopic and macroscopic collisions." _Nature_ 606, 276. DOI: 10.1038/s41586-022-04750-w.**  Combines nuclear theory, heavy-ion constraints, and astrophysical data.  Important interdisciplinary EOS inference source.

---

# Final synthesis

Neutron mathematics is not simply "math applied to neutron stars."  It is the mathematics of matter after chemical order has been crushed but before horizon formation: antisymmetric many-body states, nuclear interactions, weak-equilibrium constraints, superfluid phases, elastic and topological defects, frustrated geometries, relativistic pressure support, and inverse observation.  Its central object is an EOS constrained by theory, simulation, and multimessenger data, but its most visually distinctive object is nuclear pasta: a dense-matter morphology whose classification genuinely requires geometry and topology.

The deepest current gap is the middle-density regime.  Low-density neutron matter is increasingly constrained by χEFT, MBPT, and QMC; very high density is asymptotically constrained by pQCD; macroscopic observations carve out possible EOS functions.  But the core of massive neutron stars remains a mathematical frontier where dense nuclear many-body theory, phase transitions, topology, and relativistic inverse problems all meet.
