---
title: "External-physics frontier map: operator-triaged anchors for the hole program"
date: 2026-07-02
status: operator triage + candidate correspondences; nothing here is earned until constructed
provenance: "Operator selected these fourteen from a physics-anchor survey (2026-07-02 session) as belonging to the math end; the remainder of the survey (no-hair, Jacobson equation-of-state, Landauer, Penrose diagrams, Martin–Panangaden domains, data-processing inequality) was triaged as already carried by existing corpus objects."
---

## External-physics frontier map (math end)

Each entry: the external name, the one-line content, the candidate in-corpus
correspondence, and honest status. House discipline applies: these are search
aids and naming candidates, not explanations; a name is earned when its object
is constructed and its laws re-proved on local carriers. Existing verified
ground: `HoleRegion = C \ J⁻(R)` is definitionally the black-hole-region
formula (external-name-check note); `Hole` is an endofunctor via sequencing
(`HoleDiamondCausalSet.lean`, axiom-audited).

## Formation / collapse seam

0. **SO / orientation-frame gauge.** Smooth external accounts often place
   horizon kinematics in oriented orthonormal frames.  The finite carrier is
   now earned only as `FiniteSOReadoutFrame`: a readout-generated horizon plus
   a finite gauge group used as an orientation-frame proxy, a finite
   connection, a local transform, a class-function observable, and a closed
   loop.  The horizon side still computes surface/interior/exterior from the
   readout; the frame side inherits finite closed-loop holonomy conjugation and
   Wilson-loop invariance. Smooth `SO(n)`, determinant, frame-bundle, spin, and
   metric claims remain open.
1. **Trapped surface** (Penrose 1965). Surface where even outgoing light
   converges; trapped surface ⇒ collapse inevitable (singularity theorem).
   The finite carrier is now earned as `FiniteTrappedSurfaceWitness`: a
   kugelblitz articulation site whose step-diamond lower endpoint is in
   `ReadoutExterior` and whose upper endpoint lands on the shroud.  The upper
   endpoint is proved to be inside the computed black-hole-region proxy, not
   exterior, and an `ApparentEvent` with an exterior predecessor.  The
   local hole-entry law is now earned as
   `ArticulationHoleRegionSwitchesAt`: in the generated causal set, the tail is
   exterior and not hole-side, while the paired next articulation is shroud-side,
   hole-side, and not exterior.  The continuum trapped-surface singularity
   theorem is not earned.  The stronger global exactness lemma "strict
   hole-region growth iff kugelblitz step" remains the separate
   `kugelblitz_growth_conjecture`.
2. **Apparent vs. event horizon.** Event horizon is teleological (needs the
   whole future); apparent horizon is quasi-local (computable now). Candidate:
   live/settled split — a running site can only ever compute an
   apparent-horizon analog (`observeHole` at runtime); event-horizon claims
   belong to settled/replayed material only. The finite readout-relative
   carrier is now tightened: `ReadoutRelativeHorizon` has surface exactly the
   shroud, interior exactly the no-readout black-hole-region proxy, exterior
   exactly the readout exterior, surface points are not exterior, and surface
   points have exterior predecessors. The live/settled design law remains open
   as a runtime discipline rather than a Lean theorem.
3. **Critical collapse** (Choptuik). Universal scaling at the exact threshold
   between dispersal and hole formation. The current finite carrier is now the
   `CriticalCollapseCandidate` alias for the kugelblitz articulation step: the
   tail endpoint is exterior, the next paired articulation lands on the shroud,
   is inside the no-readout region, is not exterior, and canonically builds a
   `FiniteTrappedSurfaceWitness`. It also carries the local hole-entry switch.
   Choptuik scaling remains open.

## Boundary as object

4. **Membrane paradigm / stretched horizon** (Thorne–Price–Macdonald).
   Exterior physics is exactly a 2D physical membrane with real surface
   properties. The finite membrane carrier is now earned as the
   horizon-facing `HorizonMembrane` laws over `ShroudIndexedKeratin`: vertices
   are addressed by shroud events, lie in the hole interior, lock histories
   inflate seed stalks, and locked settling is least among compatible states
   above the locked seed.  Continuum membrane stress, viscosity, conductivity,
   and transport coefficients remain open.
5. **Bekenstein plate** (local name; externally the Bekenstein bound /
   area law). Region information capacity scales with boundary area, not
   volume. The finite counting statement over hole/shroud events is now
   earned: `bekensteinPlate_card_eq_filter` identifies the plate count with the
   shroud-filtered finite event list, and `bekensteinPlate_length_le_events`
   bounds that count by the ambient causal-set event list.  The finite
   capacity witness is also now earned: `BekensteinPlateCapacityWitness` pairs
   that plate with a load-bearing `LandauerSupport`, so `capacity_pos` gives a
   positive finite Landauer cost while `ledger_eq_eulerChar` keeps the existing
   anti-Landauer ledger equality.  RWIL scaling beyond that witness, entropy
   law, and continuum area law remain open.

## Readout-relativity

6. **Rindler horizon.** An accelerating observer has a horizon in flat,
   empty space — horizons are readout artifacts, not matter artifacts.
   The finite carrier is the readout-generated horizon package: surface,
   interior, and exterior are all computed from the readout, with no matter
   carrier added.  The new `FiniteSOReadoutFrame` tightens the readout-only
   side by allowing a finite orientation-frame gauge and Wilson-loop observable
   over the same readout horizon without adding a material substrate. A smooth
   flat Rindler metric and continuum acceleration model remain open.
7. **Unruh effect.** Particle content is readout-relative (accelerated
   readout sees a thermal bath in vacuum). The first finite carrier was
   `FiniteUnruhReadoutWitness`: an apparent boundary event plus a C4
   creation/annihilation ledger and its generated finite Fock sector.  The
   next carrier is now earned as `FiniteUnruhThermalReadoutWitness`: it pairs
   that boundary/Fock witness with `LiftedThermoTransition`, so the same
   readout has a balanced finite flux, stationary-distribution temperature,
   positive creation count, positive Landauer cost, and positive hard-flow
   discharge. Thermal baths, detector response spectra, and continuum
   quantum-field claims remain open.
8. **Hole complementarity** (Susskind). Exterior and infalling readouts get
   different, individually complete, never-comparable stories. The finite
   no-comparison theorem is now earned over `ReadoutComplementarityWitness`:
   at the witnessed event, the left readout's hole classification rules out
   left exterior membership, the right readout's exterior classification rules
   out right hole membership, and the two readouts cannot share one common
   hole/exterior classification pair.  Full continuum black-hole
   complementarity remains open.
9. **Hole-region patches** (Bousso causal patches). Physics formulated
   per-observer-diamond as the fundamental unit. The finite patch carrier is
   now earned as `HoleRegionPatch`: patch membership implies black-hole-region
   membership, rules out readout-exterior membership, and prevents causal
   futures to exterior points. The shroud patch is definitionally the shroud
   and inherits an exterior-predecessor law. Observer-diamond kinematic-space
   moduli remain open.

## Network scale

10. **Wormhole bridge.** Correlation plus adjacency is now finite and earned:
    `FiniteWormholeBridge` packages a causal adjacency with a nonzero
    connected-correlation minor, and proves the joint cannot be
    molecular-chaos factorized.  The EPR joint gives the non-vacuous example
    when a causal carrier supplies adjacent endpoints.  Smooth throat geometry
    and full ER=EPR remain open.
11. **Antihole.** Order-dual no-ingress side: exit-only relative to a readout,
    no ingress from that readout future.  The finite carrier is now the
    complement of `ReadoutFuture`, with an antihole shroud whose adjacency is
    oriented toward a readout-future successor.  Listed readout anchors cannot
    causally enter an antihole event, and listed readout points are not
    antihole points. Stronger continuum reversal claims stay constrained by the
    arrow-of-time module (`ArrowOfTime.lean`, irreversible steps).
12. **Ergosphere / Penrose process.** Work extractable from the region
    outside the horizon. The finite carrier is now earned as
    `FiniteErgosphereExtraction`: a finite apparent boundary event on the
    shroud, plus a hard-closure settling firing over a finite support cell.
    The boundary side supplies black-hole-region membership and an exterior
    predecessor; the energetics side reuses the Nat-valued free-energy
    Lyapunov theorem to prove a strict drop across the firing.  Rotating
    continuum ergospheres and positive-temperature/work laws remain open.
13. **Cosmic censorship** (Penrose). No naked singularities: pathology is
    always horizon-hidden. The finite censorship law is now consolidated:
    arbitrary hole effects cannot have exterior sources, and for the canonical
    readout-generated hole an effect source is not in that readout exterior.
    The full conjecture-shape — no interior absurdity (⟨0,0⟩-side pathology)
    reaches exterior readouts unmediated — is unproved.

## Foundation

14. **Geon** (Wheeler 1955). Self-sustaining field-energy body: mass without
    mass. The finite carrier is now earned as `FiniteGeonCarrier`: a hole-side
    finite settling process whose stages reach one common no-readout root.  It
    induces a future anchor, a connected future core, a connected computed hole
    region, and an Alexandrov topological region.  Shroud events sit between
    exterior predecessors and the settled root.  Continuum Wheeler-geon
    geometry, mass laws, and the relation to aperiodic persistence remain open.

## Already carried (operator triage — not on this frontier)

No-hair → settlement filtration exposes only extremal invariants; Jacobson
equation-of-state → the thermodynamic reading of horizon information flow;
Landauer → append-only plate / retraction pressure; Penrose diagrams → future
SVG projection convention; Martin–Panangaden Scott-domain spacetime → already
cited in regions-as-points memo, bridges the Scott regime; data-processing
inequality → RWIL tier chain.
