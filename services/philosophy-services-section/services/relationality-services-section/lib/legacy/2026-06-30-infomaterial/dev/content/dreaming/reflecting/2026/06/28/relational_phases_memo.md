---
title: "Relational Matter and Its Phases"
subtitle: "A brief memo on relational phase theory"
date: "2026-06-28"
author: "emsenn / RelMath notes"
status: "concept memo"
suggested-path: "dev/content/dreaming/notes/2026-06-28-relational-phases.md"
keywords:
  - relational-math
  - phase-theory
  - sheaves
  - laplacians
  - material-regimes
  - keratin
---


## 1. Core idea

A relational phase theory treats a material regime not first as a substance, but as a way local information survives coarse-graining.

The primitive object is not “matter” in the usual sense. It is a decorated compatibility structure: a base of cells, local data on those cells, restriction maps between incident cells, and a criterion for when the local data cohere globally.

In the thin version, a cell carries a value. In the thick version, a cell carries structured local material data: geometry, orientation, state, history, damage, chemistry, load, memory, boundary behavior, and possible transitions. Matter appears when these decorated cells cannot be understood independently, but only through their compatibility, obstruction, closure, spectrum, hull, gauge constraint, or causal boundary.

A useful slogan is:

> A phase is a form of local-to-global survival.

The same local data may survive as symmetry, as obstruction, as a persistent near-kernel, as a metastable basin, as a correlation field, as a kinetic distribution, as a gauge-invariant observable, or as a causal boundary. These are not merely different physical substances. They are different mathematical regimes of coherence.

## 2. The basic relational form

A relational material system may be modeled, at minimum, by:

\[
(X, \mathcal F, \rho, \Gamma)
\]

where:

- \(X\) is a cell complex, graph, site, causal order, contact complex, tiling complex, or other base of local incidence.
- \(\mathcal F(\sigma)\) is the stalk of local data over a cell \(\sigma\).
- \(\rho_{\sigma\tau}:\mathcal F(\sigma)\to\mathcal F(\tau)\) is a restriction or compatibility map along an incidence \(\tau\subseteq\partial\sigma\).
- \(\Gamma\) is the global compatibility criterion: the condition under which local assignments glue into a coherent state.

A global state is a section

\[
x\in\prod_\sigma \mathcal F(\sigma)
\]

satisfying all compatibility equations. In the familiar linear sheaf setting, the obstruction to gluing can be written as a coboundary: local assignments fail to agree on overlaps or shared faces. With inner products, the sheaf Laplacian

\[
L_{\mathcal F}=\delta^*\delta
\]

measures local-to-global inconsistency. Its kernel consists of exact coherent global sections; small eigenmodes or persistent near-kernels measure almost-compatible configurations.

RelMath already has an order-theoretic analogue of this shape: closure/fixed-point settling, Lawvere/Tarski Laplacian behavior, harmonic states as fixed/global sections, and cohomological obstruction as the failure or residue of gluing. The relational phase idea extends that spine from abstract local values to decorated material stalks.

## 3. Phases as survival modes

The following grammar is not a literal thermodynamic sequence. It is a classification by the mathematical form in which local information survives.

```text
matching
→ sheaf obstruction
→ symmetry quotient
→ aperiodic hull
→ landscape frustration
→ correlation flow
→ kinetic distribution
→ field constraint
→ gauge constraint
→ causal boundary
```

Each arrow marks a change in what counts as the carrier of information.

### Tile / matching regime

At the thinnest level, local data are labels on cells with matching rules. A configuration is admissible when adjacent labels match. This is the root form of a phase: a finite local constraint system.

### Sheaf / obstruction regime

Labels thicken into stalks, and matching rules become restriction maps. A global configuration is a section. Information survives as compatibility or obstruction. The obstruction is no longer merely “wrong label next to wrong label,” but failure of local data to glue.

### Crystal regime

In a crystal, local gluing is compressed by symmetry. Information survives through unit cells, translation symmetry, space groups, reciprocal lattices, defects, phonons, and Bloch/Floquet structure. The phase is organized by quotienting local compatibility through periodic symmetry.

### Quasicrystal regime

In a quasicrystal, gluing is aperiodic but ordered. Information survives as local matching rules, substitution structure, tiling hulls, cut-and-project data, Meyer structure, diffraction, and Anderson--Putnam-type cohomology. The phase is not periodic, but it is not random. It is organized by hull rather than lattice quotient.

### Glass regime

In a glass, local compatibility becomes frustration in configuration space. Local constraints coexist with metastable basins, bottlenecks, aging, overlap structure, and slow relaxation. Information survives as obstruction, landscape, memory, and near-stuck dynamics.

### Liquid regime

A liquid relaxes rigid local compatibility into mobile correlation. Information survives as pair correlations, structure factors, hydrodynamic variables, transport coefficients, and closure relations. The phase is not locally arbitrary, but local order is transient.

### Gas regime

A gas pushes the carrier of information into phase-space distribution. The local object is no longer a fixed configuration but a statistical distribution evolving under kinetic equations, entropy production, collision rules, and coarse-grained constraints.

### Plasma regime

A plasma adds self-consistent fields. Information survives through charge density, electromagnetic fields, screening, collective modes, gauge constraints, helicity, and stability/instability structure. Local particles and global fields co-determine one another.

### Neutron matter regime

Neutron matter is constraint-matter. The organizing data are not molecular bonds but Fermi statistics, nuclear forces, charge neutrality, weak equilibrium, superfluid defects, equation of state, and relativistic stellar structure. Information survives as dense constraint, degeneracy, and equilibrium under extreme pressure.

### Quark matter regime

Quark matter is gauge-matter. The apparent local fields are not directly physical; observables must survive gauge redundancy. Information is carried by gauge-invariant structures such as Wilson loops, condensates, topological charge, color-singlet constraints, and confinement diagnostics.

### Black-hole regime

The black-hole regime is the terminal contrast. A black hole is not primarily a material body but a global causal region. The organizing object is not a local material sheaf but causal accessibility, horizon structure, asymptotic charge, entropy, radiation, scattering data, and boundary behavior.

Here information survives not as local constitution but as what remains visible, measurable, or recoverable across a causal boundary.

## 4. Keratin as the first thick material tile

Keratinous matter is an important test case because it forces the theory to stop treating local data as clean, symmetric, reversible, or scalar.

A keratinous system is directed, anisotropic, multiscale, frictional, morphogenetic, history-bearing, humidity-sensitive, and damage-sensitive. Its base space may include shafts, follicles, cuticle-scale surface cells, contacts, yarn segments, textile loops, felt patches, pilling sites, fracture sites, and damaged regions.

Its stalks may carry:

- rod geometry,
- curvature and torsion,
- cross-section and ellipticity,
- cuticle morphology,
- root-to-tip direction,
- humidity,
- chemistry,
- medulla state,
- friction coefficients,
- damage,
- processing history,
- lock state,
- pilling or felting state.

The ordinary sheaf Laplacian is too symmetric for this. A keratinous restriction map is generally directed and history-dependent:

\[
\rho^+_{\sigma\tau}\neq \rho^-_{\sigma\tau},
\qquad
\rho_{\sigma\tau}=\rho_{\sigma\tau}(H,D,\chi,\ell,t,\mathrm{history}).
\]

A first formal model might have the schematic form

\[
L_{\mathrm{ker}}
=
\delta^\dagger W(H,D,\chi,t)\delta
+
A_{\mathrm{dir}}
+
M_{\mathrm{hist}}
+
P_{\mathrm{lock}},
\]

where:

- \(W\) weights local incompatibility by humidity, damage, chemistry, and time;
- \(A_{\mathrm{dir}}\) encodes non-self-adjoint directional friction;
- \(M_{\mathrm{hist}}\) encodes hysteresis and memory;
- \(P_{\mathrm{lock}}\) encodes irreversible transitions such as felting, pilling, tangling, and fracture.

The kernel of such an operator would consist of coherent keratinous configurations. Near-kernels would describe almost-compatible textures: states that are not exactly coherent, but persist because their incompatibility is small, locked, distributed, or hidden in history.

This makes keratin a first serious materialization of the tile. The cell does not merely have a label. It has a surface, direction, memory, chemistry, and damage. Its boundary maps are not neutral projections. They are physically loaded compatibility operations.

## 5. Why this matters for RelMath

The existing RelMath spine already suggests a thin form of this theory:

```text
Mark
→ articulation
→ predication
→ FOUR / valuation
→ closure / settling
→ sheaf / cohomology
→ flow / Laplacian
→ aperiodic hull
→ Lorentzian causal boundary
```

The relational phase idea gives this spine a material interpretation without collapsing it into physics too quickly.

- Predication cells are thin oriented cells.
- Valuations are thin local sections.
- Closure/settling gives fixed coherent states.
- Sheaf/cohomology gives local-to-global compatibility and obstruction.
- Laplacian/flow gives harmonicity, relaxation, and convergence.
- Aperiodic modules give hulls and persistent obstruction.
- Lorentzian modules give causal closure and boundary behavior.

The next step is not to declare that all matter is already formalized. It is to introduce a careful `Phase` or `Material` layer that can host decorated compatibility structures while preserving the current dependency discipline.

A minimal future skeleton might include:

```lean
structure DecoratedCellComplex where
  Cell : Type
  Face : Cell → Cell → Prop

structure MaterialSheaf (X : DecoratedCellComplex) where
  Stalk : X.Cell → Type
  restrict : ∀ {σ τ}, X.Face τ σ → Stalk σ → Stalk τ

structure CompatibleSection (F : MaterialSheaf X) where
  section : ∀ σ, F.Stalk σ
  compatible : ... -- restrictions agree on incidences / overlaps
```

For keratin, this would then be specialized by adding directed incidences, ordered/lattice-valued damage states, contact histories, irreversible transitions, and weighted obstruction measures.

## 6. Cautions

This memo should not be read as a claim that RelMath already proves a physical theory of matter. The current theory has structural projections: finite cells, values, closures, sheaf-like gluing, obstruction, fixed points, and causal closure. Empirical material modeling requires geometry, measurement, statistics, mechanics, fields, and validation.

The point is narrower and more useful:

> Relational matter is a framework for asking what mathematical form local information takes when it survives as a phase.

In some regimes it survives as symmetry. In others as hull, obstruction, memory, distribution, gauge-invariant observable, or causal boundary. Keratin is a particularly strong test case because it forces the theory to become thick: directed, damaged, historical, frictional, and material.

## 7. Working thesis

Relational matter is not matter made out of relations. It is matter described by the survival of local compatibility under coarse-graining.

A relational phase is a regime in which the same basic local-to-global problem is answered by a different mathematical carrier:

- a match,
- a section,
- an obstruction,
- a quotient,
- a hull,
- a landscape,
- a correlation,
- a distribution,
- a field constraint,
- a gauge invariant,
- or a causal boundary.

The project should therefore organize future Lean work around theorems that earn these transitions. The goal is not to force one metaphor over all regimes, but to find the exact points where a local compatibility system must thicken into material, field, gauge, or causal structure.

Keratin is the first warning that the tile has a body.
