---
title: "Quark Mathematics: Gauge-Matter, QCD, Confinement, Dense Quark Matter, and Color Superconductivity"
date: 2026-06-27
status: research memo
scope: graduate-to-research-level survey; current through June 2026 where sources were available
central_frame: "quark mathematics is matter as nonabelian gauge/color constraint"
---

# Quark Mathematics: Gauge-Matter, QCD, Confinement, Dense Quark Matter, and Color Superconductivity

## Orientation

This memo treats **quark matter** not as a gas of tiny colored beads, but as a mathematical regime in which the material degrees of freedom are constrained by **nonabelian local gauge symmetry**.
The central ontology is a coupled system of fermionic matter fields and $SU(3)$ connection fields, modulo gauge redundancy, with physical observables restricted to gauge-invariant or gauge-covariant structures.
Quark matter is therefore "matter as gauge constraint": color charge, confinement, chiral symmetry, topology, and phase structure are not optional physical decorations but part of the definition of the object.

Current frontier status, in one paragraph: perturbative QCD is controlled at very high energies and asymptotically high densities; lattice QCD gives first-principles thermodynamics at zero and small baryon chemical potential; heavy-ion data plus relativistic hydrodynamics strongly constrain the hot quark-gluon plasma; neutron-star multimessenger data increasingly constrain cold dense QCD; color superconductivity is theoretically secure only asymptotically and phenomenologically uncertain at neutron-star densities; confinement, the Yang--Mills mass gap, real-time nonperturbative dynamics, and finite-density QCD remain mathematically hard open problems.

---

## 1. Core mathematical object

### 1.1 What is quark matter mathematically?

A minimal mathematical description of quark matter is a quantum field theory with:

- gauge group $SU(3)_c$;
- gauge field $A_\mu(x)=A^a_\mu(x)T^a$, a connection on a principal $SU(3)$ bundle;
- quark fields $q_f^\alpha(x)$, Dirac spinors in the fundamental representation of $SU(3)_c$, indexed by flavor $f\in\{u,d,s,c,b,t\}$ and color $\alpha\in\{1,2,3\}$;
- gluon field strength $$ F^a_{\mu\nu}=\partial_\mu A^a_\nu-\partial_\nu A^a_\mu+g_s f^{abc}A^b_\mu A^c_\nu; $$
- covariant derivative $$ D_\mu=\partial_\mu-i g_s A^a_\mu T^a; $$
- action, in continuum formal notation, $$ S_{\rm QCD}=\int d^4x\,\left[-\frac14F^a_{\mu\nu}F^{a\mu\nu} +\sum_f\bar q_f(i\gamma^\mu D_\mu-m_f)q_f +\theta\frac{g_s^2}{32\pi^2}F^a_{\mu\nu}\tilde F^{a\mu\nu}\right], $$ with $\tilde F^{a\mu\nu}=\frac12\epsilon^{\mu\nu\rho\sigma}F^a_{\rho\sigma}$.

The quantum object may be presented as a path integral, a Hamiltonian lattice gauge theory, a Euclidean lattice ensemble satisfying reflection positivity, a perturbative renormalized QFT, or a low-energy effective theory depending on regime.
Its physical Hilbert space is constrained by Gauss law:

$$ G^a(x)\,|\mathrm{phys}\rangle=0, $$

up to subtleties of gauge fixing and boundary conditions.
This is already the conceptual rupture from bead-like material ontology: the naive local fields $q(x)$ and $A_\mu(x)$ are not themselves arbitrary physical matter coordinates; they are representatives of gauge-equivalence classes.

### 1.2 Definitions

**Quarks.** Fermionic matter fields transforming in the fundamental representation of $SU(3)_c$.
In perturbative high-energy processes they are effective partonic degrees of freedom; in the confining low-temperature vacuum they do not appear as isolated asymptotic states.

**Gluons.** Gauge bosons of $SU(3)_c$, transforming in the adjoint representation.
Unlike photons in abelian electrodynamics, gluons carry the charge of the gauge group they mediate; the nonlinear $f^{abc}A^bA^c$ term is responsible for gluon self-interaction.

**Color charge.** The local $SU(3)_c$ gauge charge.
"Red, green, blue" are basis labels for a representation, not physical colors.
Local color is gauge-dependent; physical finite-energy states in the confining regime are color singlets or gauge-invariant composites.

**Hadrons.** Color-singlet bound states of quarks and gluons: mesons, baryons, glueballs, hybrids, tetraquarks, pentaquarks, and nuclear aggregates.
Mathematically, they are gauge-invariant excitations of QCD, not molecular aggregates of freely observable quarks.

**Quark-gluon plasma (QGP).** A hot deconfined phase/regime of QCD matter in which thermodynamic and transport degrees of freedom are quark and gluon-like rather than hadronic, though near the crossover the medium is strongly coupled and not well described as a weak ideal gas.

**Dense quark matter.** Low-temperature, high-baryon-density QCD matter in which quark degrees of freedom may be deconfined and organized by Fermi surfaces, neutrality constraints, beta equilibrium, and pairing.

**Color-superconducting quark matter.** Dense quark matter with diquark condensates near Fermi surfaces, schematically

$$ \langle q_i^\alpha C\Gamma q_j^\beta\rangle \neq 0, $$

where color, flavor, and spin indices determine the phase.
The condensate Higgses part of the gauge symmetry and can break global symmetries such as baryon number.

### 1.3 Why quark mathematics is not particles arranged in space

The usual particulate picture asks for units and locations: atoms in a lattice, beads in a textile, molecules in a liquid.
QCD instead begins with gauge equivalence.
A field configuration $(A,q)$ and its gauge transform

$$ A_\mu\mapsto U A_\mu U^{-1}+\frac{i}{g_s}(\partial_\mu U)U^{-1},\qquad q\mapsto Uq $$

describe the same physical configuration.
Therefore the mathematical configuration space is closer to

$$ \mathcal A/\mathcal G $$

coupled to fermionic matter modulo local gauge transformations, not a set of point particles in Euclidean space.
Quarks are coordinates in a representation of the gauge group; the directly meaningful objects are gauge-invariant operators such as Wilson loops, hadron interpolating fields, conserved-current correlators, topological charge, stress-energy, and thermodynamic response functions.

### 1.4 Distinctions from nearby regimes

**Hadronic matter.** The low-temperature, low-density regime.
Degrees of freedom are color-singlet hadrons and nuclei.
Chiral symmetry is spontaneously broken; confinement dominates.

**QGP.** High-temperature deconfined QCD medium.
Degrees of freedom are thermodynamically partonic, but near the transition the medium is strongly coupled and liquid-like.
The relevant mathematics is finite-temperature gauge theory, lattice thermodynamics, kinetic theory/hydrodynamics, and transport.

**Cold dense quark matter.** High baryon chemical potential, low temperature.
Degrees of freedom are quarks near Fermi surfaces, possible condensates, and collective modes.
It is not the same regime as hot QGP: pairing, neutrality, and beta equilibrium replace thermal deconfinement as organizing constraints.

**Neutron matter.** Dominated by baryonic degrees of freedom, especially neutrons plus protons/leptons in beta equilibrium in neutron stars.
It may cross over or transition to quark matter at high density, but this is not established model-independently.

**Ordinary plasma.** Ionized electromagnetic matter with abelian $U(1)$ gauge interaction and identifiable charged particles.
QGP is nonabelian; gluons carry color charge; the medium can be strongly coupled; and deconfinement is a finite-temperature/density property of a confining gauge theory.

**Black holes.** Not a QCD material phase in the ordinary thermodynamic sense.
In collapse beyond the compact-star stability limit, the exterior description becomes geometric/horizon-based; the matter equation of state no longer labels an externally visible material phase.
Holographic models borrow black-hole geometries to model strongly coupled plasma, but that is dual modeling, not literal QCD matter becoming a black hole.

---

## 2. The mathematical ontology of quark matter

### 2.1 Gauge-matter

Quark matter is **gauge-matter**: matter whose identity is organized by local nonabelian symmetry.
The primitive data are not independent particles but a fibered structure of fields over spacetime with local frame redundancy.
Mathematically:

- color is an internal $SU(3)$ fiber;
- gluons are connection degrees of freedom;
- quarks are sections of associated vector bundles;
- gauge transformations are changes of local trivialization;
- physical observables are gauge-invariant functionals or appropriately dressed operators.

This makes QCD closer to geometry and representation theory than to atomistic assembly.

### 2.2 $SU(3)$ color and gauge redundancy

The compact simple Lie group $SU(3)$ has dimension $8$ and rank $2$.
Its Lie algebra $\mathfrak{su}(3)$ has generators $T^a$, structure constants $f^{abc}$, and representations relevant to QCD:

- quarks: fundamental $\mathbf 3$;
- antiquarks: anti-fundamental $\bar{\mathbf 3}$;
- gluons: adjoint $\mathbf 8$;
- color singlets: trivial representation $\mathbf 1$ in tensor products such as $\mathbf3\otimes\bar{\mathbf3}=\mathbf1\oplus\mathbf8$ and $\mathbf3\otimes\mathbf3\otimes\mathbf3=\mathbf1\oplus\cdots$.

The phrase "color charge" should therefore be read as representation-theoretic and gauge-theoretic, not sensory.

### 2.3 Wilson loops and confinement

A central gauge-invariant observable is the Wilson loop:

$$ W_R(C)=\frac{1}{\dim R}\operatorname{Tr}_R\,\mathcal P\exp\left(i g_s\oint_C A_\mu dx^\mu\right), $$

where $R$ is a representation and $C$ a closed curve.
In a confining pure gauge theory one expects an **area law** for large loops:

$$ \langle W_R(C)\rangle\sim \exp[-\sigma_R\,\mathrm{Area}(C)], $$

with string tension $\sigma_R>0$.
Physically this corresponds to a linearly growing potential between static color sources,

$$ V(r)\sim \sigma r + \cdots. $$

With dynamical quarks the relation is subtler because strings can break by quark-antiquark pair creation, but Wilson loops, Polyakov loops, center symmetry, and related order/disorder variables remain central to confinement diagnostics.

### 2.4 Asymptotic freedom

The one-loop beta function of $SU(N_c)$ gauge theory with $N_f$ quark flavors is

$$ \mu\frac{dg}{d\mu}=-\frac{g^3}{16\pi^2}\left(\frac{11}{3}N_c-\frac{2}{3}N_f\right)+O(g^5). $$

For QCD with $N_c=3$ and $N_f\lesssim 16$, the coefficient is positive, so the coupling decreases at high energy and increases in the infrared.
This is the perturbative reason quarks behave partonically at short distances while confinement dominates long distances.
Gross, Wilczek, and Politzer's 1973 discovery of asymptotic freedom is the perturbative hinge on which QCD became the accepted theory of strong interactions.

### 2.5 Chiral symmetry breaking

For light $u,d$ and approximately $s$ quarks, the massless QCD Lagrangian has approximate global chiral symmetry

$$ SU(N_f)_L\times SU(N_f)_R\times U(1)_B $$

with axial $U(1)_A$ anomalously broken.
The QCD vacuum exhibits spontaneous chiral symmetry breaking:

$$ SU(N_f)_L\times SU(N_f)_R\to SU(N_f)_V, $$

with order parameter $\langle\bar q q\rangle$ and pseudo-Nambu--Goldstone bosons identified with pions, kaons, and eta modes.
At finite temperature chiral symmetry is partially restored through a crossover at physical quark masses.

### 2.6 Topological sectors and nonperturbative structure

Euclidean gauge fields of finite action are classified by topological charge

$$ Q=\frac{g_s^2}{32\pi^2}\int d^4x\,F^a_{\mu\nu}\tilde F^{a\mu\nu}\in\mathbb Z $$

under appropriate boundary conditions.
Instantons, theta vacua, axial anomalies, topological susceptibility, center vortices, monopoles, and domain walls are not metaphors.
They are specific structures in the topology of gauge bundles, gauge orbit space, and nonperturbative vacuum configurations.

---

## 3. Foundational models

This section lists canonical models by what they capture, their mathematical form, and their limitations.

### 3.1 Classical Yang--Mills theory

Pure Yang--Mills action:

$$ S_{\rm YM}= -\frac{1}{4}\int d^4x\,F^a_{\mu\nu}F^{a\mu\nu}. $$

Euler--Lagrange equation:

$$ D_\mu F^{\mu\nu}=0. $$

Captures: nonlinear gauge-field geometry, gauge covariance, classical instantons/solitons in Euclidean signature, and the structural source of gluon self-interaction.

Fails: classical Yang--Mills has no confinement mechanism by itself in the observed QCD sense, no quantum running coupling, and no mass gap in the classical wave equation.

### 3.2 Quantum Yang--Mills and QCD

Full QCD adds quark matter fields:

$$ \mathcal L_{\rm QCD}= -\frac14F^2+\bar q(i\gamma^\mu D_\mu-M)q+\theta\frac{g_s^2}{32\pi^2}F\tilde F. $$

Captures: the accepted microscopic theory of strong interactions, asymptotic freedom, chiral symmetry and its breaking, hadrons, high-temperature QGP, and asymptotically dense quark matter.

Fails as a rigorous object: four-dimensional continuum QCD is not yet constructed as a mathematically complete quantum field theory satisfying standard axioms.
Perturbation theory is rigorous order-by-order in formal/renormalized expansions, but the nonperturbative continuum theory with confinement and mass gap remains open.

### 3.3 Lattice QCD

Discretize Euclidean spacetime with spacing $a$; replace gauge fields by link variables $U_\mu(x)\in SU(3)$; write Wilson gauge action, e.g.

$$ S_g[U]=\frac{\beta}{N_c}\sum_p \operatorname{Re}\operatorname{Tr}(1-U_p),\qquad \beta=\frac{2N_c}{g^2}, $$

and a fermion determinant after integrating Grassmann quark fields:

$$ Z=\int \mathcal D U\,e^{-S_g[U]}\prod_f \det M_f[U,m_f]. $$

Captures: nonperturbative first-principles QCD thermodynamics at $\mu_B=0$ and small $\mu_B/T$, hadron spectra, susceptibilities, static potentials, topology, and many matrix elements.

Limitations: finite lattice spacing, finite volume, scale setting, fermion discretization artifacts, continuum extrapolation cost, topological freezing, real-time limitations, and the finite-density sign problem.

### 3.4 Chiral perturbation theory

Low-energy EFT of QCD Goldstone modes.
For $U(x)\in SU(N_f)$,

$$ \mathcal L_2=\frac{f_\pi^2}{4}\operatorname{Tr}(\partial_\mu U\partial^\mu U^\dagger) +\frac{f_\pi^2B}{2}\operatorname{Tr}(M U^\dagger+UM^\dagger)+\cdots. $$

Captures: low-energy pion/kaon/eta dynamics, symmetry constraints, current algebra, nuclear chiral EFT inputs.

Fails: not a direct description of deconfined quarks or QGP; expansion breaks down near high temperature, high density, or resonances unless extended.

### 3.5 Nambu--Jona-Lasinio models

Generic form:

$$ \mathcal L_{\rm NJL}=\bar q(i\gamma^\mu\partial_\mu-M)q +G[(\bar q q)^2+(\bar q i\gamma_5\vec\tau q)^2]+\cdots. $$

Extensions include diquark channels, vector interactions, and 't Hooft determinant interactions.

Captures: dynamical chiral symmetry breaking, constituent quark masses, model phase diagrams, color superconductivity via pairing channels.

Fails: no dynamical confinement; nonrenormalizable in four dimensions; results depend on cutoff and interaction-channel choices.
Recent RG-consistent treatments try to control cutoff artifacts in color-superconducting NJL models, but the framework remains model-dependent.

### 3.6 Quark-meson and Polyakov-loop models

Quark-meson models couple quarks to scalar/pseudoscalar mesons; Polyakov-loop-extended models add an effective potential for

$$ \Phi=\frac{1}{N_c}\operatorname{Tr}\,\mathcal P\exp\left(i\int_0^{1/T}A_0(\tau)d\tau\right). $$

PNJL/PQM models couple chiral order parameters to a deconfinement proxy.

Captures: qualitative interplay of chiral symmetry and deconfinement, finite-density phase-diagram scenarios, critical point phenomenology.

Fails: Polyakov loop is an exact order parameter only in pure gauge theory; parameters are fitted; critical point predictions vary strongly with interactions and regularization.

### 3.7 Bag models

MIT-like bag models approximate deconfined quark pressure by a quasifree expression minus vacuum pressure:

$$ P_{\rm QM}=P_{\rm quarks+gluons}-B+\Delta P_{\rm pairing}+\cdots. $$

Captures: crude phenomenological EoS, quark-star/hybrid-star modeling, intuition about vacuum pressure.

Fails: lacks confinement dynamics, chiral dynamics, controlled matching to QCD except when improved with perturbative QCD input.

### 3.8 Hard thermal loop theory

At high temperature, soft gauge modes require resummation.
HTL effective theory encodes leading thermal self-energies and screening:

$$ m_D^2\sim g^2T^2\left(\frac{N_c}{3}+\frac{N_f}{6}\right)+\cdots. $$

Captures: high-temperature plasma screening, quasiparticle propagation, transport kernels, thermal perturbation theory.

Fails: uncontrolled near $T_c$ where coupling is large; nonperturbative magnetic sector remains difficult.

### 3.9 Perturbative QCD

Perturbative QCD expands observables in $\alpha_s(Q)$ at high momentum scale $Q$ or asymptotically large chemical potential.
At cold high density, the pressure has the schematic form

$$ P(\mu)=P_0(\mu)+\alpha_s P_1(\mu)+\alpha_s^2 P_2(\mu)+\alpha_s^3\ln\alpha_s\,P_3(\mu)+\cdots. $$

Captures: asymptotic density behavior, high-energy scattering, hard probes, constraints on dense-matter EoS through high-density boundary conditions.

Fails: quantitatively uncertain at neutron-star core densities unless extrapolated conservatively; cannot by itself solve confinement or the moderate-density phase diagram.

---

## 4. Confinement and mass gap

### 4.1 Confinement as mathematical problem

Confinement can be phrased several ways:

1. **Absence of colored asymptotic states.** The physical spectrum contains color singlets only.
2. **Wilson area law.** Static source Wilson loops decay by area, not perimeter, in pure gauge theory.
3. **Linear potential.** Static color sources have $V(r)\sim\sigma r$ at large $r$ before string breaking.
4. **Mass gap.** Gauge-invariant excitations have a positive lowest mass above vacuum.
5. **Center-symmetry realization.** In pure gauge theory, confinement is tied to unbroken center symmetry and vanishing Polyakov loop; dynamical fundamental quarks explicitly break center symmetry.

These are related but not identical; with dynamical quarks the clean pure-gauge order parameter picture becomes subtler.

### 4.2 Wilson's lattice formulation

Wilson's 1974 lattice gauge theory made the strong-coupling area law computable.
In the lattice strong-coupling expansion, the leading contribution to a large Wilson loop is a minimal surface spanning the loop, giving an area law.
This is rigorous in a lattice strong-coupling regime, but the continuum limit $a\to0$ corresponds to weak bare coupling, not the same expansion regime.

### 4.3 Flux tubes and string tension

Lattice simulations show color-electric flux localized into tubes between static sources.
The string tension $\sigma$ sets the long-distance force.
Effective string theory describes subleading corrections, e.g. Lüscher terms, but deriving the flux-tube picture from continuum QCD remains part of the confinement frontier.

### 4.4 Gribov ambiguities

Gauge fixing in nonabelian theories is globally obstructed: a gauge condition may intersect a gauge orbit more than once.
These Gribov copies complicate path-integral quantization and motivate confinement scenarios based on the restriction of gauge fields to the Gribov region.
The Gribov-Zwanziger picture is influential but not a complete proof of confinement in QCD.

### 4.5 Yang--Mills existence and mass gap

The Clay Millennium problem asks for a rigorous construction of quantum Yang--Mills theory on $\mathbb R^4$ for compact simple gauge group and proof of a positive mass gap.
Its relation to QCD is direct but not identical: the official problem is usually formulated for pure Yang--Mills, while real QCD includes quarks.
A proof would not automatically solve every problem about quark matter, but it would transform the mathematical foundation of confinement.

Known:

- perturbative renormalization and asymptotic freedom are robust;
- finite lattice Yang--Mills theories are mathematically well-defined statistical systems;
- strong-coupling lattice area laws and mass gaps can be proved in suitable regimes;
- two-dimensional Yang--Mills is much better understood rigorously;
- numerical lattice simulations strongly support a glueball spectrum and mass gap in pure gauge theory.

Open:

- construction of interacting four-dimensional continuum Yang--Mills satisfying Wightman or Osterwalder--Schrader-type axioms;
- proof of mass gap in that continuum theory;
- proof of confinement in continuum $SU(3)$ gauge theory in the physically relevant regime;
- extension to full QCD with dynamical fermions and chiral structure.

---

## 5. QCD phase diagram

### 5.1 Variables

The phase diagram is organized by:

- temperature $T$;
- baryon chemical potential $\mu_B=3\mu_q$;
- electric charge and strangeness chemical potentials $\mu_Q,\mu_S$ in heavy-ion contexts;
- quark masses;
- magnetic field, rotation, isospin chemical potential, and other external conditions in specialized studies.

Thermodynamic pressure is

$$ P(T,\mu_B)=\frac{T}{V}\ln Z(T,\mu_B), $$

with susceptibilities

$$ \chi_n^B=\frac{\partial^n(P/T^4)}{\partial(\mu_B/T)^n}. $$

### 5.2 Main regions

**Hadron gas / nuclear matter.** Low $T$, low-to-moderate density, color singlet degrees of freedom.

**Chiral crossover.** At physical quark masses and $\mu_B\approx0$, lattice QCD establishes a smooth crossover rather than a true phase transition, with pseudocritical temperature near $T\sim155$--$157$ MeV depending on observable.

**Deconfinement crossover.** Deconfinement and chiral restoration are distinct concepts, but at physical masses their crossover regions are close enough that the thermal transition is treated as a broad crossover from hadronic matter to QGP.

**Critical point conjecture.** Many models predict a critical endpoint at finite $\mu_B$ where the crossover becomes first order.
It is not established.
Recent lattice methods constrain parts of the low-$\mu_B$ region, and Beam Energy Scan data are actively testing fluctuation signatures.

**Dense quark matter.** Low $T$, high $\mu_B$.
May contain deconfined quark matter, color superconductivity, inhomogeneous chiral phases, mixed phases, or quarkyonic-like regimes.
The sign problem prevents direct first-principles lattice QCD in the most relevant region.

### 5.3 Order parameters and symmetry patterns

- Chiral condensate $\langle\bar q q\rangle$: chiral symmetry breaking/restoration.
- Polyakov loop $\Phi$: center/deconfinement proxy; exact order parameter only in pure gauge theory.
- Diquark condensate $\langle qq\rangle$: color superconductivity.
- Topological susceptibility $\chi_t=\langle Q^2\rangle/V$: topology and axial anomaly.
- Conserved-charge cumulants: thermodynamic response and critical-point probes.

### 5.4 Universality

The conjectured QCD critical endpoint is expected, if it exists, to be in the 3D Ising universality class, after mapping QCD variables $(T,\mu_B)$ to Ising scaling variables $(r,h)$.
The chiral limit for two light flavors is often discussed in relation to $O(4)$ universality, with caveats about axial $U(1)_A$ restoration and lattice discretization.

### 5.5 The sign problem

At finite real baryon chemical potential,

$$ Z=\int\mathcal D U\, e^{-S_g[U]}\det M(U,\mu_B), $$

but $\det M(U,\mu_B)$ is generally complex.
Importance sampling requires a positive probability measure; replacing the complex determinant by its phase-quenched absolute value introduces an average phase factor that decays exponentially with volume:

$$ \langle e^{i\theta}\rangle_{\rm pq}\sim e^{-V\Delta f/T}. $$

This is the computational wall separating lattice QCD at small $\mu_B/T$ from the cold dense regime of neutron-star interiors.

Routes around it include Taylor expansion, analytic continuation from imaginary chemical potential, reweighting, canonical ensembles, complex Langevin, Lefschetz thimbles, holomorphic flow, dual variables, tensor networks, and machine-learned contour deformations.
None is yet a general solution for physical $3+1$D QCD at large baryon density.

---

## 6. Quark-gluon plasma

### 6.1 Hot quark matter mathematically

The QGP is a finite-temperature nonabelian quantum field medium.
At the level of equilibrium thermodynamics, lattice QCD computes quantities such as

$$ \epsilon(T),\quad P(T),\quad s(T)=\frac{\partial P}{\partial T},\quad c_s^2=\frac{\partial P}{\partial\epsilon}. $$

At the level of dynamics, heavy-ion collisions are modeled by relativistic hydrodynamics coupled to initial-state models, particlization, and hadronic transport.

The stress tensor decomposition is

$$ T^{\mu\nu}=\epsilon u^\mu u^\nu + (P+\Pi)\Delta^{\mu\nu}+\pi^{\mu\nu}, $$

with bulk pressure $\Pi$, shear stress $\pi^{\mu\nu}$, and projection $\Delta^{\mu\nu}=g^{\mu\nu}+u^\mu u^\nu$.
Conservation laws are

$$ \partial_\mu T^{\mu\nu}=0,\qquad \partial_\mu J_B^\mu=0, $$

supplemented by causal dissipative relaxation equations.

### 6.2 Transport coefficients

Important transport data include:

- shear viscosity $\eta/s$;
- bulk viscosity $\zeta/s$;
- conductivity and charge diffusion;
- heavy-quark diffusion coefficient;
- jet transport coefficient $\hat q$;
- quarkonium in-medium transport coefficients.

The discovery that QGP behaves like a nearly perfect liquid moved the frontier from "is there a plasma?" to "what is the quantitative non-equilibrium theory of a strongly coupled nonabelian liquid?"

### 6.3 Screening and quasiparticles

At high temperature, QCD exhibits electric Debye screening with scale $m_D\sim gT$.
Magnetic screening is nonperturbative at scale $g^2T$.
HTL theory is controlled when $T$ is high enough for scale separation; near $T_c$, quasiparticle pictures become model-dependent.

### 6.4 Heavy-ion modeling stack

A modern collision simulation typically contains:

1. fluctuating initial state, e.g. IP-Glasma, TRENTo, CGC-inspired models;
2. pre-equilibrium evolution;
3. viscous relativistic hydrodynamics;
4. particlization at a switching hypersurface;
5. hadronic afterburner, e.g. UrQMD/SMASH;
6. hard-probe modules for jets, heavy flavor, photons, dileptons.

Bayesian calibration turns this stack into an inverse problem: infer transport coefficients and initial-condition parameters from multi-observable experimental data.

### 6.5 What makes QGP unlike ordinary plasma

Ordinary electromagnetic plasma is abelian, typically has identifiable ions/electrons, and admits weak-coupling kinetic descriptions over wide regimes.
QGP is nonabelian: gluons self-interact, color charges are gauge-constrained, deconfinement is temperature/density dependent, and the experimentally produced medium is often better described as a strongly coupled liquid than a weak gas.

### 6.6 What makes QGP unlike cold dense quark matter

QGP is thermally populated and created in short-lived, rapidly expanding heavy-ion collisions.
Cold dense quark matter, if present in neutron-star cores, is a near-zero-temperature many-body ground state controlled by Fermi surfaces, chemical equilibrium, neutrality, pairing, and gravity.
Both are QCD matter; their mathematics is different.

---

## 7. Dense quark matter and color superconductivity

### 7.1 Cold dense quark matter

At large quark chemical potential $\mu$, quarks fill Fermi seas.
Low-energy dynamics occurs near Fermi surfaces.
Attractive channels in one-gluon exchange trigger BCS pairing.
Because quarks carry color and flavor, possible condensates are more structured than ordinary electron Cooper pairs.

### 7.2 Diquark pairing

A generic spin-zero diquark condensate is

$$ \langle q_i^\alpha C\gamma_5 q_j^\beta\rangle. $$

The favored channel at asymptotically high density is antisymmetric in color, flavor, and spin.
Pairing opens a gap $\Delta$ in quasiparticle spectra.
At weak coupling, the asymptotic gap has non-BCS dependence,

$$ \Delta\sim b\,\mu\,g^{-5}\exp\left(-\frac{3\pi^2}{\sqrt2 g}\right), $$

where $b$ is a prefactor sensitive to details.
This formula is asymptotic, not quantitatively reliable at neutron-star densities.

### 7.3 2SC phase

Two-flavor color superconductivity pairs up and down quarks of two colors, leaving one color unpaired in the simplest idealization.
The symmetry breaking pattern is roughly

$$ SU(3)_c\to SU(2)_c, $$

with subtleties involving electromagnetism, color neutrality, and beta equilibrium.
2SC can be favored when strange quarks are too heavy to participate symmetrically.

### 7.4 CFL phase

For three light flavors at asymptotically high density, the color-flavor locked condensate has the schematic form

$$ \langle q_i^\alpha C\gamma_5 q_j^\beta\rangle \propto \Delta\,\epsilon^{\alpha\beta A}\epsilon_{ijA}. $$

The symmetry breaking pattern is

$$ SU(3)_c\times SU(3)_L\times SU(3)_R\times U(1)_B \to SU(3)_{c+L+R}, $$

where the surviving diagonal group locks color and flavor.
Consequences:

- color gauge symmetry is Higgsed;
- baryon number is broken, so CFL is a superfluid;
- chiral symmetry is broken;
- a rotated electromagnetic $U(1)$ may remain;
- low-energy modes include Nambu--Goldstone bosons.

### 7.5 Neutrality and beta equilibrium

Neutron-star matter must be electrically neutral, color neutral, and in weak equilibrium.
Chemical potentials obey constraints such as

$$ \mu_d=\mu_u+\mu_e, $$

with analogous relations for strange quarks and leptons.
These constraints split Fermi surfaces.
Mismatched Fermi momenta can destabilize homogeneous pairing, giving gapless phases, crystalline phases, meson-condensed CFL variants, or unpaired/partially paired phases in models.

### 7.6 Inhomogeneous phases

Candidate phases include:

- crystalline color superconductors / LOFF phases;
- chiral density waves;
- quarkyonic chiral spirals;
- meson-current phases;
- domain-wall/skyrmion lattice phases in magnetic/dense regimes.

These are mathematically rich because they break translation and/or rotation symmetry while remaining embedded in gauge-constrained matter.
Their status in physical QCD at neutron-star densities is unsettled.

### 7.7 Relation to neutron stars

Dense quark matter affects neutron-star structure through the equation of state $P(\epsilon)$, sound speed $c_s^2=dP/d\epsilon$, transport coefficients, cooling, bulk viscosity, r-mode damping, merger dynamics, and possible phase-transition signatures.
Current multimessenger constraints are suggestive but not definitive: quark cores are plausible in massive neutron stars, but the exact phase and pairing gap are uncertain.

The most reliable theoretical anchors are:

- chiral EFT near nuclear saturation density;
- perturbative QCD at asymptotically high density;
- causality, stability, and thermodynamic consistency between them;
- astrophysical observations of masses, radii, tidal deformabilities, and merger outcomes.

---

## 8. Topology and modern mathematical structure

### 8.1 Instantons and theta vacua

Instantons are finite-action Euclidean solutions in nonabelian gauge theory, associated with integer topological charge.
They mediate tunneling between classical vacua labeled by winding number.
The QCD vacuum can include a theta term

$$ \mathcal L_\theta=\theta\frac{g_s^2}{32\pi^2}F^a_{\mu\nu}\tilde F^{a\mu\nu}. $$

The smallness of observable CP violation in strong interactions is the strong CP problem; axion physics is one proposed resolution.

### 8.2 Chiral anomaly

The axial current has anomalous divergence:

$$ \partial_\mu J_5^\mu = 2im\bar q\gamma_5q+ rac{g_s^2N_f}{16\pi^2}\operatorname{tr}(F_{\mu\nu}\tilde F^{\mu\nu}). $$

This links chirality to gauge-field topology and is central to the $U(1)_A$ problem, eta-prime mass, topological susceptibility, and chiral magnetic/vortical phenomena.

### 8.3 Topological susceptibility

Topological susceptibility is

$$ \chi_t=\frac{\langle Q^2\rangle}{V}. $$

It probes the distribution of topological charge sectors and enters the Witten--Veneziano relation in large-$N_c$ reasoning.
Lattice studies of $\chi_t(T)$ matter for axion cosmology and for understanding anomaly restoration near the chiral crossover.

### 8.4 Center vortices and monopoles

Center vortex scenarios relate confinement to extended topological defects carrying center flux.
Monopole mechanisms arise after abelian projection or in compactified/semiclassical regimes.
These mechanisms have numerical and analytical support in certain settings, but no universally accepted continuum proof of QCD confinement.

### 8.5 Higher-form symmetry and modern confinement language

Pure $SU(N)$ Yang--Mills has a $\mathbb Z_N$ one-form center symmetry acting on Wilson lines.
Confinement/deconfinement can be rephrased in the language of one-form symmetry realization:

- unbroken center one-form symmetry corresponds to area-law behavior for Wilson loops;
- broken center symmetry corresponds to perimeter-law behavior.

Dynamical fundamental quarks explicitly break the center one-form symmetry, which explains why full QCD is subtler than pure Yang--Mills.

### 8.6 Anomaly matching

't Hooft anomaly matching constrains possible infrared phases: anomalies of global symmetries must be reproduced by massless modes, topological order, symmetry breaking, or other IR structures.
In dense QCD and color superconductivity, anomaly matching helps test proposed phases, but does not by itself determine the ground state at moderate density.

### 8.7 Deep structure versus loose metaphor

Topology in QCD is not merely "twisted fields" as imagery.
It appears in:

- characteristic classes of gauge bundles;
- integer instanton number;
- theta dependence;
- index theorems relating Dirac zero modes to topological charge;
- anomaly equations;
- one-form symmetries and line operators;
- domain walls and topological defects.

The frontier is to connect these exact structures to quantitatively controlled confinement, chiral dynamics, and dense-matter phases.

---

## 9. Rigorous mathematics and formal structure

### 9.1 What is rigorous now?

**Finite lattice gauge theory.** With finite lattice, compact gauge group, and regulated fermions, the path integral is a well-defined finite-dimensional integral over compact groups and Grassmann variables.

**Strong-coupling lattice confinement.** Wilson's strong-coupling expansion and later cluster-expansion methods prove area-law behavior and mass gaps in certain lattice regimes.
This is rigorous but not the continuum QCD proof.

**Reflection positivity.** Osterwalder--Schrader reconstruction provides a bridge from Euclidean correlation functions satisfying positivity, covariance, regularity, and clustering to a Lorentzian QFT.
Lattice gauge actions can satisfy reflection positivity under suitable formulations.

**Perturbative renormalization.** Gauge theories are perturbatively renormalizable; asymptotic freedom is a perturbative theorem at the level of the beta function.
This does not construct the full nonperturbative theory.

**Two-dimensional Yang--Mills.** Much better developed rigorously, including exact partition functions, Wilson loop distributions, large-$N$ structures, and continuum measures in several formulations.

**Simplified/statistical systems.** Confinement-like behavior is rigorously established in many lower-dimensional, abelian, finite-group, strong-coupling, or dual spin systems.
These are not full 4D QCD, but they isolate mathematical mechanisms.

### 9.2 What is not rigorous yet?

- four-dimensional continuum nonabelian Yang--Mills existence with mass gap;
- derivation of quark confinement in physical QCD from first principles;
- construction of continuum QCD with dynamical fermions satisfying full axioms;
- rigorous finite-density QCD phase diagram;
- rigorous hydrodynamic limit from QCD in the experimentally relevant strongly coupled regime;
- real-time nonperturbative QCD dynamics.

### 9.3 Major proof programs and names

Foundational and rigorous-QFT names include C.N. Yang, Robert Mills, Kenneth Wilson, Gerard 't Hooft, David Gross, Frank Wilczek, David Politzer, Arthur Jaffe, Edward Witten, Konrad Osterwalder, Robert Schrader, Erhard Seiler, Joel Feldman, Jürg Fröhlich, Thomas Spencer, Vincent Rivasseau, Roland Sénéor, Tadeusz Balaban, Leonard Gross, Bruce Driver, Ambar Sengupta, Sourav Chatterjee, Scott Sheffield, and many others.

The relevant proof cultures include:

- constructive QFT;
- probabilistic Yang--Mills;
- lattice statistical mechanics;
- geometric analysis of connections;
- representation theory and large-$N$ limits;
- operator algebraic QFT;
- topological/higher-symmetry field theory.

### 9.4 The precise caution

There are many claimed solutions of Yang--Mills mass gap.
The mathematically relevant state remains: no generally accepted proof of the Clay problem exists.
A useful memo must not conflate numerical evidence, physically compelling mechanisms, strong-coupling lattice theorems, and continuum mathematical proof.

---

## 10. Computational frontier

### 10.1 Lattice QCD

Lattice QCD is the central nonperturbative computational framework.
It produces:

- hadron spectra and matrix elements;
- equation of state at $\mu_B=0$;
- crossover temperature and susceptibilities;
- finite-density Taylor coefficients;
- imaginary-$\mu$ analytic continuation;
- topological susceptibility;
- static quark potentials;
- screening masses;
- selected transport-related Euclidean correlators.

Major codes and infrastructure include Chroma, MILC, CPS, Grid, QUDA, openQCD, tmLQCD, Bridge++, and USQCD/EuroHPC/Leadership-class computing ecosystems.

### 10.2 Monte Carlo and finite-temperature methods

The Euclidean finite-temperature path integral compactifies imaginary time with period $\beta=1/T$.
Fermions have antiperiodic boundary conditions, bosons periodic.
The continuum limit requires $a\to0$ at fixed $T=1/(aN_\tau)$, so high precision thermodynamics uses multiple temporal extents $N_\tau$ and large spatial volumes.

### 10.3 Finite-density methods

Controlled small-$\mu_B/T$ methods:

- Taylor expansion around $\mu_B=0$;
- simulations at imaginary chemical potential with analytic continuation;
- reweighting;
- canonical fugacity expansion.

Less-settled methods:

- complex Langevin;
- Lefschetz thimbles and holomorphic flow;
- generalized density of states;
- dual variables;
- sign reweighting;
- tensor renormalization.

The frontier is not just faster computation; it is the search for new representations of QCD where the sign structure becomes tractable.

### 10.4 Dyson--Schwinger equations and functional renormalization group

DSE and FRG methods compute nonperturbative propagators, vertices, effective potentials, and phase structure through truncations.
They can access finite density more directly than lattice QCD but introduce truncation uncertainties.
They are essential for exploring the critical point, chiral dynamics, and dense phases where lattice QCD is blocked.

### 10.5 Holographic models

Gauge/gravity dual models, especially bottom-up Einstein--Maxwell--Dilaton and V-QCD models, treat strongly coupled plasma and dense matter through higher-dimensional gravitational duals.
They are powerful phenomenological generators of EoS and transport but are not first-principles QCD.
Their value lies in organizing strongly coupled hydrodynamics, phase structure, and transport where perturbation theory fails.

### 10.6 Machine learning and normalizing flows

ML is entering lattice gauge theory as algorithmic mathematics:

- gauge-equivariant normalizing flows for sampling gauge fields;
- learned trivializing maps to reduce autocorrelation and critical slowing down;
- flow-based contour deformations for sign problems;
- active learning in Bayesian heavy-ion calibration;
- surrogate models for expensive hydrodynamic and jet simulations;
- anomaly detection and phase classification.

The mathematical insight is that a learned invertible map can approximate a change of variables in field-configuration space.
If the map preserves gauge equivariance and has tractable Jacobian, it becomes a new sampling geometry, not merely a black-box fit.

### 10.7 Tensor networks

Tensor networks avoid importance sampling and can address real-time and finite-density problems in lower dimensions.
Current strengths:

- $1+1$D gauge theories;
- Schwinger model and simple nonabelian models;
- Hamiltonian formulations;
- finite-density toy models;
- entanglement structure.

Current limitation: scaling to $3+1$D QCD with dynamical fermions and continuum control remains beyond present capability, though roadmaps are active.

### 10.8 Quantum simulation

Quantum simulation targets Hamiltonian lattice gauge theory and real-time dynamics.
Recent work includes digital simulations of SU(3) lattice Yang--Mills structures on quantum hardware and qudit approaches to gauge constraints.
Near-term devices are far from full QCD, but the conceptual advance is important: real-time nonperturbative gauge dynamics may eventually be simulated without Euclidean sign/analytic-continuation barriers.

### 10.9 Where computation creates mathematics

Computation is producing new mathematical insight in at least five ways:

1. identifying nonperturbative structures, e.g. center-vortex/chiral-mass links;
2. constraining analytic phase-diagram conjectures;
3. forcing better definitions of continuum extrapolation and uncertainty;
4. generating new field-space transformations via normalizing flows;
5. recasting QCD as a family of inverse problems linking data, simulations, and EFT priors.

---

## 11. Experimental and observational interface

### 11.1 Heavy-ion collisions

RHIC and LHC create hot QCD matter through ultrarelativistic nucleus-nucleus collisions.
The system is small, short-lived, and expanding; the mathematical problem is inverse inference from final hadrons and probes to earlier QCD medium properties.

Key observables:

- anisotropic flow coefficients $v_n$;
- spectra and yields;
- event-by-event fluctuations;
- conserved-charge cumulants;
- jet quenching and nuclear modification factor $R_{AA}$;
- heavy-flavor diffusion;
- quarkonium suppression/regeneration;
- direct photons and dileptons;
- femtoscopy/HBT radii.

### 11.2 Critical point searches

The QCD critical point is sought through non-monotonic beam-energy dependence of fluctuation observables, especially higher cumulants of net-proton number as a proxy for net baryon number.
Interpretation is difficult because heavy-ion collisions are finite, rapidly expanding, non-equilibrium systems with acceptance cuts, baryon stopping, volume fluctuations, and critical slowing down.

### 11.3 Jet quenching

Hard partons created early in the collision lose energy traversing QGP.
The jet transport coefficient $\hat q$ measures transverse momentum broadening per length.
Bayesian inference frameworks such as JETSCAPE use suppression data across RHIC and LHC to constrain $\hat q$ and its dependence on temperature, energy, and virtuality.

### 11.4 Neutron-star observations

Cold dense QCD is probed indirectly through:

- two-solar-mass neutron stars;
- NICER mass-radius constraints;
- gravitational-wave tidal deformability from binary mergers;
- electromagnetic counterparts and kilonova modeling;
- possible post-merger spectra in future detectors;
- cooling and glitch phenomenology.

These constrain the equation of state, not the microscopic phase directly.
A quark core, a hyperonic core, a strong first-order transition, or stiff hadronic matter can sometimes mimic similar macroscopic observables.
The mathematical problem is inverse, nonunique, and prior-sensitive.

---

## 12. Current frontier, 2020--2026

### 12.1 Lattice phase diagram and critical point bounds

Recent lattice work has improved continuum-extrapolated equations of state and finite-density constraints.
A 2025 Wuppertal-Budapest-led analysis reported exclusion of a QCD critical point below roughly $\mu_B\sim450$ MeV at $2\sigma$ under its method and assumptions.
This is influential but not a universal theorem; a 2026 comment emphasized that entropy-contour methods may not be directly sensitive to singular critical behavior.
The frontier is now about observable-specific, scaling-aware, systematically controlled constraints.

### 12.2 Beam Energy Scan and finite-density phenomenology

BES-II and related programs are refining fluctuation measurements.
The mathematical difficulty is not merely measuring cumulants; it is mapping finite-time, finite-size, non-equilibrium proxies to equilibrium singularities of QCD.

### 12.3 Cold dense QCD and neutron-star EOS

The 2020--2026 period saw major progress combining:

- chiral EFT at low density;
- pQCD at high density;
- model-independent interpolation under causality/stability;
- astrophysical Bayesian inference;
- gravitational-wave and NICER constraints.

Evidence for deconfined behavior in the most massive neutron stars has strengthened, but it remains inference, not direct detection of a specific quark phase.

### 12.4 Perturbative high-density pressure

The pQCD cold quark-matter pressure has advanced to $O(\alpha_s^3\ln\alpha_s)$ with active work toward completing N3LO/four-loop contributions.
This matters because high-density pQCD boundary conditions propagate downward to neutron-star-density EoS inference.

### 12.5 Color superconductivity bounds

Color superconductivity is theoretically robust at asymptotic density.
At neutron-star densities, gap magnitudes are uncertain.
Recent multimessenger analyses have begun placing empirical bounds on the CFL gap, suggesting that very large pairing gaps may be disfavored by present neutron-star observations.
This is an important new connection between astrophysics and microscopic dense QCD.

### 12.6 QGP precision era

The QGP frontier is now quantitative: Bayesian calibration of viscosity, initial conditions, jet transport, heavy-quark diffusion, and EoS.
ALICE Run 3, RHIC sPHENIX, STAR BES-II, CMS/ATLAS heavy-ion measurements, and future FAIR/CBM data are moving the field from discovery to precision inverse theory.

### 12.7 Machine learning, tensor networks, and quantum computing

The 2020--2026 computational frontier has shifted from "ML as classifier" to ML as field-space geometry: normalizing flows, gauge-equivariant architectures, contour deformation, active-learning calibration, tensor-network contractions, and quantum circuits for nonabelian gauge dynamics.

### 12.8 Topology and higher symmetry

Topology remains active through topological susceptibility, anomaly restoration, instanton/vortex mechanisms, one-form symmetries, domain walls, and anomaly matching.
The modern frontier is sharper than old imagery: it asks which exact symmetry/topology constraints survive dynamical quarks, finite temperature, finite density, and real-time evolution.

---

## 13. Open problems

### 13.1 Yang--Mills mass gap

**Problem.** Construct four-dimensional quantum Yang--Mills theory rigorously and prove a positive mass gap.

**Why hard.** Requires nonperturbative continuum construction with gauge invariance, reflection positivity/Wightman axioms, renormalization, and control of infrared dynamics.

**What might resolve it.** New constructive QFT methods; probabilistic gauge-field measures; rigorous renormalization group; new line-operator criteria; exact nonperturbative inequalities.

### 13.2 Confinement in QCD

**Problem.** Prove absence of isolated color states and explain confinement quantitatively.

**Why hard.** Gauge dependence obscures local color; dynamical quarks break center symmetry and cause string breaking; confinement is infrared and nonperturbative.

**Advance needed.** A continuum theorem relating gauge-invariant correlation decay, Wilson/line operators, flux-tube formation, and physical spectrum.

### 13.3 Finite-density QCD

**Problem.** Determine QCD thermodynamics at large real baryon chemical potential.

**Why hard.** The fermion determinant is complex; importance sampling fails exponentially with volume.

**Advance needed.** A representation of QCD at finite density with positive or controlled weights, or a provably correct complex-contour/tensor/quantum method.

### 13.4 QCD critical point

**Problem.** Determine whether the QCD critical endpoint exists and where.

**Why hard.** Lattice is blocked by sign problem; heavy-ion experiments are finite and dynamical; models disagree.

**Advance needed.** Scaling-sensitive observables, dynamical critical modeling, lattice constraints beyond small $\mu_B/T$, and experimental statistics over the right energy range.

### 13.5 Color superconductivity in nature

**Problem.** Determine whether neutron-star cores contain color-superconducting phases, and which ones.

**Why hard.** The relevant densities are nonperturbative; observables are indirect; different phases can share similar macroscopic EoS.

**Advance needed.** Coupled constraints from EoS, transport, cooling, r-modes, mergers, and pQCD/chiral EFT boundaries.

### 13.6 Nonperturbative real-time dynamics

**Problem.** Compute spectral functions, transport coefficients, early-time dynamics, and hadronization from QCD.

**Why hard.** Euclidean lattice gives imaginary-time correlators; analytic continuation is ill-posed; real-time path integrals have severe sign/phase problems.

**Advance needed.** Quantum simulation, complex contour methods, spectral reconstruction with controlled priors, or new real-time nonperturbative formulations.

### 13.7 Hydrodynamic limit of QCD

**Problem.** Derive relativistic hydrodynamics and transport coefficients from QCD in the strongly coupled regime.

**Why hard.** Requires long-time, long-wavelength limits of an interacting quantum gauge theory, including nonequilibrium initial conditions.

**Advance needed.** Rigorous kinetic-to-hydro and QFT-to-hydro limits, or controlled nonperturbative computation of retarded correlators.

### 13.8 Quark-neutron phase transition

**Problem.** Determine whether neutron matter transitions sharply, crosses over, or never reaches deconfined quark matter inside stable stars.

**Why hard.** Direct first-principles QCD is unavailable at the relevant density; astrophysical inverse problems are degenerate.

**Advance needed.** More precise high-mass radius/tidal/post-merger data plus better QCD-informed EOS priors.

---

## 14. Cross-regime comparison

| Regime | Degrees of freedom | Symmetry | Dominant field | Confinement | Topology | Order parameter / diagnostic | Equations | Computation | Core open problem |
|---|---|---|---|---|---|---|---|---|---|
| Crystal | atoms/ions/electrons in periodic order | space group, broken translations | elastic/electromagnetic | none in QCD sense | defects, dislocations | lattice order, Bragg peaks | Schrödinger/DFT, elasticity | DFT, molecular dynamics | defects, correlated electrons, inverse design |
| Glass | atoms/molecules in amorphous metastable order | no long-range periodicity | molecular interactions | none | energy landscape topology | relaxation, configurational entropy | stochastic dynamics, elasticity | MD, spin glasses, ML | glass transition, aging |
| Liquid | molecules/atoms | rotational/translational statistically restored | intermolecular | none | vortices in superfluids | correlations, viscosity | Navier--Stokes, stat mech | MD, kinetic theory | turbulence, strongly correlated fluids |
| Ordinary plasma | ions/electrons | abelian $U(1)$ gauge | electromagnetic | no color confinement | magnetic reconnection, helicity | Debye screening, plasma frequency | Vlasov-Maxwell, MHD | PIC, MHD | turbulence, reconnection, kinetic closure |
| Neutron matter | neutrons, protons, leptons, nuclei | baryon number, isospin approximate | nuclear + weak + gravity | quarks confined in baryons | superfluid vortices, nuclear pasta | pairing gaps, EOS | many-body nuclear theory, TOV | QMC, chiral EFT, EOS inference | high-density EOS |
| QGP | quarks/gluons in hot medium | local $SU(3)$, chiral approximate | nonabelian gauge | deconfined thermodynamically | topology/anomaly fluctuations | $\eta/s$, $\hat q$, susceptibilities | thermal QCD, hydro, kinetic theory | lattice, hydro, Bayesian, jets | real-time strong coupling |
| Dense quark matter | quarks near Fermi surfaces | local $SU(3)$, flavor, $U(1)_B$ | nonabelian gauge + pairing | deconfined or quark-hadron continuity | vortices, anomalies, domain walls | diquark gaps, EOS, sound speed | dense QCD EFT, NJL, pQCD, TOV | pQCD, FRG/DSE, EOS inference | sign problem, phase identity |
| Color superconductor | paired quarks | color-flavor locked/broken | gauge-Higgsed color | deconfined but gauge-Higgsed | vortices, NG modes | diquark condensate $\langle qq\rangle$ | gap equations, EFT | models + pQCD + NS inference | gap magnitude in stars |
| Black hole | no material DOF externally; horizon geometry | diffeomorphism invariance | metric/gravity | not a material phase | horizon topology, entropy | mass/spin/charge, area | Einstein equations/QG | numerical relativity, holography | quantum gravity/information |

### 14.1 Plasma $\to$ QGP

The transition from ordinary plasma to QGP changes the gauge group and the charge ontology. $U(1)$ charges become nonabelian color charges; the gauge bosons self-interact; screening and collective modes become color-sector phenomena; near the QCD crossover the medium behaves as a strongly coupled liquid.

### 14.2 Neutron matter $\to$ dense quark matter

The transition changes degrees of freedom from color-singlet baryons to quark/color degrees of freedom, if deconfinement occurs.
The relevant order may shift from nucleonic superfluidity and nuclear interactions to quark Fermi surfaces and diquark condensates.
It may be a first-order transition, crossover, quark-hadron continuity, or absent in stable stars.

### 14.3 Quark matter $\to$ black hole

This is not a conventional phase transition in QCD.
It is gravitational collapse past stability.
The exterior theory changes from material EOS/TOV structure to horizon geometry.
If holography is used to model QGP, black holes appear as dual geometries for thermal states, not as literal final material phases of quark matter.

---

## 15. Annotated bibliography

### Foundational QCD and confinement

**Yang, C.N. and Mills, R.L. (1954).
"Conservation of Isotopic Spin and Isotopic Gauge Invariance." _Physical Review_ 96, 191.
DOI: 10.1103/PhysRev.
96.191.** The origin of nonabelian gauge theory.
QCD is a Yang--Mills theory with matter fields and gauge group $SU(3)$.

**Gross, D.J. and Wilczek, F.
(1973).
"Ultraviolet Behavior of Non-Abelian Gauge Theories." _Physical Review Letters_ 30, 1343.
DOI: 10.1103/PhysRevLett.
30.1343.** One of the discovery papers for asymptotic freedom; establishes why high-energy quark scattering can be perturbative.

**Politzer, H.D. (1973).
"Reliable Perturbative Results for Strong Interactions?" _Physical Review Letters_ 30, 1346.
DOI: 10.1103/PhysRevLett.
30.1346.** Independent discovery of asymptotic freedom; foundational for QCD as a theory of strong interactions.

**Wilson, K.G. (1974).
"Confinement of Quarks." _Physical Review D_ 10, 2445.
DOI: 10.1103/PhysRevD.
10.2445.** Introduced lattice gauge theory as a nonperturbative definition and gave the strong-coupling area-law picture of confinement.

**Jaffe, A. and Witten, E.
(2000).
"Quantum Yang--Mills Theory."
Clay Mathematics Institute problem description.** Official mathematical framing of Yang--Mills existence and mass gap.
Essential for separating rigorous theorem from physical evidence.

### Dense QCD and color superconductivity

**Fukushima, K. and Hatsuda, T.
(2011).
"The phase diagram of dense QCD." _Reports on Progress in Physics_ 74, 014001.
DOI: 10.1088/0034-4885/74/1/014001; arXiv:1005.4814.** Classic high-level review of QCD phases, including deconfinement, chiral restoration, critical points, color superconductivity, and inhomogeneous phases.

**Alford, M.G., Rajagopal, K., Schäfer, T., and Schmitt, A.
(2008).
"Color superconductivity in dense quark matter." _Reviews of Modern Physics_ 80, 1455.
DOI: 10.1103/RevModPhys.
80.1455; arXiv:0709.4635.** Canonical review of 2SC, CFL, gap equations, transport, and compact-star implications.

**Gholami, H., Hofmann, M., and Buballa, M.
(2025).
"Renormalization-group consistent treatment of color superconductivity in the NJL model." _Physical Review D_ 111, 014006; arXiv:2408.06704.** Recent example of improving dense-quark effective models by controlling cutoff artifacts.

**Geißel, A., Gorda, T., and Braun, J.
(2025).
"Color Superconductivity under Neutron-Star Conditions at Next-to-Leading Order." _Physical Review Letters_.
DOI: 10.1103/54g5-43nk; arXiv:2504.03834.** Computes pairing corrections under neutron-star conditions; important for linking CFL gaps to EOS constraints.

**Geißel et al. (2026).
"Neutron Star Observations Challenge a Large Colour-Superconducting Gap in Dense Quark Matter." arXiv:2606.03707.** Recent multimessenger inference placing limits on large CFL gaps.
Important but still inference-dependent.

### Lattice QCD, thermodynamics, and finite density

**Borsányi, S. et al. (2020).
"QCD Crossover at Finite Chemical Potential from Lattice Simulations." _Physical Review Letters_ 125, 052001.
DOI: 10.1103/PhysRevLett.
125.052001; arXiv:2002.02821.** High-precision determination of the crossover line at small real baryon chemical potential via lattice methods.

**Guenther, J.N. (2022).
"An overview of the QCD phase diagram at finite T and μ." arXiv:2201.02072.** Review of lattice progress on the QCD phase diagram and finite-density methods.

**Kahangirwe, M. et al. (2024).
"Finite density QCD equation of state: critical point and lattice-based constraints." _Physical Review D_ 109, 094046; arXiv:2402.08636.** Combines lattice-QCD resummation with critical scaling to build finite-density EoS families with possible critical points.

**Borsányi, S. et al. (2025).
"Lattice QCD constraints on the critical point from an improved precision equation of state." arXiv:2502.10267; _Physical Review D_ 112, L111505.** Influential recent claim excluding a critical point below about $\mu_B\approx450$ MeV at $2\sigma$ under its entropy-contour analysis.

**Lacey, R.A. (2026).
"Comment on 'Lattice QCD constraints on the critical point from an improved precision equation of state'." arXiv:2603.29279.** Useful caution about interpreting the 2025 critical-point exclusion as model-independent.

**Guenther, J.N. (2026).
"Lattice QCD at finite temperature and density." arXiv:2603.16230.** Current review of finite-temperature lattice QCD, chiral limit, anomalies, phase boundary, and critical endpoint constraints.

**Aarts, G. and Sexty, D.
(2026).
"Lattice field theories with a sign problem." arXiv:2604.24290.** Current review of sign-problem approaches, including thimbles, holomorphic flow, complex Langevin, dual variables, tensor methods, and ML.

### Hot QCD, QGP, and heavy-ion phenomenology

**Laine, M. and Vuorinen, A.
(2016/2017). _Basics of Thermal Field Theory_.
Springer; arXiv:1701.01554.** Technical introduction to perturbative thermal field theory and QCD plasma methods.

**Heinz, U. and Schenke, B.
(2024).
"Hydrodynamic Description of the Quark-Gluon Plasma." arXiv:2412.19393.** Modern review of relativistic hydrodynamics as the quantitative language of QGP discovery and precision modeling.

**Du, L., Sorensen, A., and Stephanov, M.
(2024).
"The QCD phase diagram and Beam Energy Scan physics: a theory overview." arXiv:2402.10183.** Connects theoretical phase-diagram structure to BES observables and finite-density heavy-ion phenomenology.

**Zhang, Y., Wang, Z., Luo, X., and Xu, N.
(2026).
"Search for the QCD Critical Point in High Energy Nuclear Collisions: A Status Report." arXiv:2602.08356.** Current experimental-status review of STAR net-proton fluctuation measurements and their interpretation issues.

**JETSCAPE Collaboration / Ehlers, R. et al. (2024/2025).
"Bayesian inference analysis of jet quenching using inclusive jet and hadron suppression measurements." arXiv:2408.08247; _Physical Review C_ 111, 054913.** State-of-the-art Bayesian extraction of the jet transport coefficient $\hat q$ from RHIC and LHC data.

**Wang, X.-N., ed. (2025). _Quark--Gluon Plasma 6_.
World Scientific.
ISBN: 9789811294662.** Updated contributed volume covering hot QCD theory and phenomenology after decades of RHIC/LHC work.

### Neutron stars and cold QCD constraints

**Annala, E., Gorda, T., Kurkela, A., Nättilä, J., and Vuorinen, A.
(2020).
"Evidence for quark-matter cores in massive neutron stars." _Nature Physics_ 16, 907.
DOI: 10.1038/s41567-020-0914-9; arXiv:1903.09121.** Influential model-independent inference connecting massive neutron-star cores, sound speed, and deconfined quark matter.

**Annala, E. et al. (2023).
"Strongly interacting matter exhibits deconfined behavior in massive neutron stars." _Nature Communications_ 14, 8451.** Further EOS inference suggesting deconfined behavior in the most massive stars, subject to observational and prior assumptions.

**Komoltsev, O. et al. (2024).
"Equation of state at neutron-star densities and beyond from perturbative QCD." _Physical Review D_ 109, 094030; arXiv:2312.14127.** Shows how pQCD high-density constraints propagate into neutron-star-density EOS inference.

**Gorda, T., Paatelainen, R., Säppi, S., and Seppänen, K.
(2023).
"Equation of State of Cold Quark Matter to $O(\alpha_s^3\ln\alpha_s)$." _Physical Review Letters_ 131, 181902; arXiv:2307.08734.** Advances perturbative cold quark matter EOS to a new order, strengthening high-density constraints.

**Kärkkäinen, A. et al. (2025).
"Quark matter at four loops: hardships and how to overcome them." arXiv:2501.17921.** Shows progress toward completing N3LO/four-loop cold dense quark matter pressure.

### Topology, anomalies, and modern structure

**'t Hooft, G.
(1976).
"Symmetry Breaking through Bell-Jackiw Anomalies." _Physical Review Letters_ 37, 8.
DOI: 10.1103/PhysRevLett.
37.8.** Foundational for instantons, anomalies, and nonperturbative QCD vacuum structure.

**Witten, E.
(1979).
"Current Algebra Theorems for the U(1) Goldstone Boson." _Nuclear Physics B_ 156, 269.** Classic large-$N$ and topological susceptibility argument behind the $\eta'$ mass problem.

**Veneziano, G.
(1979).
"U(1) Without Instantons." _Nuclear Physics B_ 159, 213.** Complements Witten's account of the axial anomaly and topological susceptibility.

**Zahed, I.
(2026).
"Anomalies, Topology, and Hadron Structure in QCD." arXiv:2606.13908.** Recent broad review tying anomalous symmetry breaking, topology, topological susceptibility, and hadron structure.

**Kotov, A.Y. et al. (2025).
"Topological observables and theta dependence in high-temperature QCD." _JHEP_ 09, 045.** Current lattice study of topology at high temperature.

**Kamleh, W., Biddle, J., Leinweber, D.B., and Virgili, A.
(2023).
"Emergent phenomena from centre vortices in dynamical QCD." arXiv:2302.00853.** Review of lattice evidence connecting center vortices to confinement and dynamical chiral symmetry breaking.

**Nguyen, M. et al. (2025).
"Phases of Theories with $\mathbb Z_N$ 1-Form Symmetry, and the Roles of Center Vortices." _Physical Review Letters_ 134, 141902.** Modern higher-symmetry treatment of center vortices and confinement-like phases.

### Computational methods

**Kanwar, G. et al. / flow-based lattice field theory reviews (2024).
"Flow-based sampling for lattice field theories." arXiv:2401.01297.** Review of normalizing flows as exact or asymptotically exact changes of variables for lattice field theory sampling.

**Abbott, R. et al. (2023).
"Normalizing flows for lattice gauge theory in arbitrary space-time dimension." arXiv:2305.02402.** Gauge-equivariant flow architecture extending normalizing-flow sampling toward 4D SU(3) lattice gauge theory.

**Abbott, R. et al. (2025).
"Progress in Normalizing Flows for 4d Gauge Theories."
LATTICE2024 proceedings.** Recent progress applying flows to four-dimensional nonabelian gauge theory and dynamical fermion contexts.

**Magnifico, G. et al. (2025).
"Tensor networks for lattice gauge theories beyond one dimension." _Communications Physics_ 8, 254.** State-of-the-art review and roadmap for tensor networks in lattice gauge theory beyond $1+1$ dimensions.

**Zohar, E.
(2022).
"Quantum simulation of lattice gauge theories in more than one space dimension." _Philosophical Transactions A_ 380, 20210069.** Review of quantum simulation approaches for gauge theories beyond toy one-dimensional systems.

**Ciavarella, A.N. and collaborators (2024).
"Quantum Simulation of SU(3) Lattice Yang-Mills Theory." _Physical Review Letters_ 133, 111901.** Important near-term quantum-simulation result for SU(3) lattice gauge dynamics.

### Interdisciplinary frameworks and active collaborations

**BEST Collaboration.** DOE topical collaboration focused on the Beam Energy Scan Theory program: critical fluctuations, hydrodynamics, and finite-density EoS.

**MUSES Collaboration.** A modular framework for equations of state and dense/hot QCD matter, designed to bridge heavy-ion, neutron-star, and QCD theory applications.

**HotQCD and Wuppertal-Budapest/BMW collaborations.** Major lattice collaborations producing high-precision QCD thermodynamics, equation-of-state, and phase-boundary results.

**JETSCAPE Collaboration.** Modular heavy-ion event generator and Bayesian calibration framework for QGP bulk and jet physics.

**STAR, sPHENIX, ALICE, CMS, ATLAS, HADES, CBM, NA61/SHINE.** Experimental programs mapping hot and finite-density QCD through heavy-ion collisions, cumulants, flow, hard probes, and rare probes.

---

## Final synthesis

Quark mathematics is not the mathematics of little things located in space.
It is the mathematics of a nonabelian gauge constraint becoming matter.
Its primitive grammar is:

$$ \text{local } SU(3)\text{ symmetry} + \text{fermions in }\mathbf3 + \text{connections} + \text{gauge-invariant observables}. $$

From this grammar emerge asymptotic freedom, confinement, chiral symmetry breaking, deconfinement, QGP hydrodynamics, dense Fermi surfaces, color superconductivity, topology, and compact-star phenomenology.
The frontier is sharply stratified:

- **Known with high confidence:** QCD as the microscopic theory; asymptotic freedom; hadron phenomenology; $\mu_B=0$ crossover; strongly coupled QGP; lattice thermodynamics at zero/small chemical potential.
- **Numerically and phenomenologically strong:** confinement evidence, QGP transport extraction, deconfined behavior in massive neutron-star cores, finite-density EoS constraints.
- **Model-dependent but mathematically structured:** QCD critical point, color superconductivity at neutron-star densities, inhomogeneous dense phases, holographic phase diagrams.
- **Open in rigorous mathematics:** four-dimensional Yang--Mills existence and mass gap, continuum confinement, finite-density QCD, nonperturbative real-time dynamics, and derivation of hydrodynamic limits from QCD.

The deepest short formula for the whole memo is:

$$ \boxed{\text{Quark matter is matter whose units are not objects but gauge-constrained fields.}} $$
