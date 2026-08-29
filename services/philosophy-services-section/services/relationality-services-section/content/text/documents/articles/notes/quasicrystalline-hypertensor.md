---
title: Quasicrystalline Hypertensor Simulation
keywords:
  - simulation
  - quasicrystal
  - flow
depends_on:
  - theorem/external/quasicrystalline-relational-hypertensors
---
# Quasicrystalline Hypertensor Simulation

This specification captures the constructive content of
**Theorem (Quasicrystalline Relational Hypertensors)** as a **finite simulation
view** over the global quasicrystalline hypertensor sheaf/state.  We work with
hypertensors `T : Z^d -> R` whose entries are stabilized recognitions evolving
under the earned flow and nucleus, but we only ever materialise finite windows
as caches; authoritative state lives in the hypertensor sheaf.

## State representation

- **Lattice window.**
  A finite or symbolic subset `(window-index-set) ⊂ Z^d` describing the portion of the lattice we
  currently materialise as a *simulation window* into the global hypertensor
  sheaf.  Each site stores an identifier for a stabilised recognition (or tower
  entry) already present in the global state, plus any local simulation metadata
  (e.g., flow phase, numeric approximations).

- **Flow/Nucleus operators.**
  Interfaces implementing the earned `Flow` and `Nucleate` acts restricted to
  the current lattice window.  Implementations may approximate these using
  numerical transforms, but conceptually they are restrictions of the global
  flow/nucleus geometry to the finite slice.

- **Substitution rule.**
  A finite data structure encoding the golden recursion (`Σ`) mapping each site
  to a patch of successor sites, as induced by the hypertensor substitution
  acts.  Includes inflation factors and patch templates used to construct new
  windows from old ones.

- **Pattern catalogue.**
  A cache (e.g., hash map) from local patches within the current windows to
  canonical equivalence classes, used to detect aperiodicity, relative
  denseness, and uniform discreteness.  This catalogue is derived from the
  global hypertensor sections seen so far and can be recomputed; it is not an
  independent global store.

## Inputs

1. Dimension `d`, substitution matrices, and initial seed hypertensor `T_0`.
2. Commutation data for `F` and `ν` (ensuring `ν(F(r)) = F(ν(r))` on stabilized
   recognitions).
3. Tolerance parameters for equivalence testing (if numerically approximated).

## Update procedure

1. **Flow application.**
   For each site in the window, apply `F` to propagate recognitions along each
   coordinate direction.

2. **Nucleus stabilization.**
   Collapse the updated recognitions via `ν`; entries already stabilized should
   remain unchanged.

3. **Substitution inflation.**
   Apply the substitution rule `Σ` to expand the lattice window, replacing each
   site with its inflated patch.  Update pattern catalogue accordingly.

4. **Limit extraction.**
   Track the projective limit by comparing successive windows; when patches
   stabilize (up to nucleus equivalence), record them as part of the universal
   hypertensor `Q`.

5. **Quasicrystal checks.**
   - **Aperiodicity:** search for nontrivial translations `v` with identical
     patterns; any hits flag a violation.
   - **Relative denseness:** ensure every ball (within the simulated window)
     contains copies of each finite patch encountered so far.
   - **Uniform discreteness:** verify occurrences of patches are separated by a
     minimum distance.

## Invariants

- Flow and nucleus must commute numerically; detect drift by measuring
  `||ν(F(r)) - F(ν(r))||`.
- Substitution inflation should preserve pattern counts consistent with the
  primitive rule.
- Quasicrystal conditions (aperiodicity, relative denseness, uniform
  discreteness) must hold within the simulated window; violations imply the
  approximation is insufficient or incorrect.

## Outputs

- Snapshots of the lattice window after each substitution stage.
- Pattern catalogue (list of unique patches with frequencies).
- Diagnostics for quasicrystal conditions and flow/nucleus commutation residuals.
