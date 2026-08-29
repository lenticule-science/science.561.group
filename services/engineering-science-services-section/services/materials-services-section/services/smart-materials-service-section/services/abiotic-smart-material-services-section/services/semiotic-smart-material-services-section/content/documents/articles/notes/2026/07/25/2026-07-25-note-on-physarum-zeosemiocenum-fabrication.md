---
title: "Fabrication of the Ossification Substrate: A Siloxane–Zeolite Glass-Ceramic"
description: "The process design kit for the Physarum zeosemiocenum substrate, stated as constraint counting: zeolite as the over-constrained ossified phase, transport in the floppy matrix complement, J26 as the space-filling geometry of the rigid domain, a closed formulation sheet on one declared basis, and a layer map from the Lean objects to their physical referents, row by row."
date-created: 2026-07-25
kind: research-note
keywords:
  - fabrication
  - process-design-kit
  - rigidity-percolation
  - constraint-counting
  - ossification
  - glass-ceramic
  - vitrimer
  - zeolite
  - siloxane
  - gyrobifastigium
  - obsmetrologia
status: design
declared-by: claude-interactive-session-supplying-leader-movement-team
---
# Fabrication of the Ossification Substrate: A Siloxane–Zeolite Glass-Ceramic

## 0. What the material is

A **glass-ceramic**: a rigid crystalline phase grown, under control, out of a compliant
amorphous host. Not a mixed-matrix membrane. The distinction is not cosmetic — a membrane's
figure of merit is flux *through* the dispersed phase, and a glass-ceramic's is the
crystalline volume fraction, morphology, and connectivity of a phase that does not transport
anything at all.

Two phases, placed by constraint counting:

| phase | mean coordination | Phillips–Thorpe regime | behaviour |
|---|---|---|---|
| PDMS matrix, Si–O backbone | ⟨r⟩ = 2 | far below 2.4 | floppy₍₃₎, compliant, ion-permissive |
| zeolite framework, 4-connected aluminosilicate | ⟨r⟩ = 4 | far above 2.4 | stressed-rigid₍₃₎, brittle, does not flow |

The Phillips–Thorpe rigidity threshold sits at ⟨r⟩<sub>c</sub> = 2.4, where bond-stretching
and bond-bending constraints exactly balance the three translational freedoms per atom
(Phillips 1979; Thorpe 1983; Phillips & Thorpe 1985). Below it a network carries floppy₍₃₎
modes that cost no energy; above it the network is over-constrained and carries internal
stress.

**Rigidity terms carry their matroid.** The family — floppy, rigid, jammed, load-bearing,
percolating, critical — is matroid-relative, and the subscript records which matroid is meant.
₍₁₎ is the **graphic** matroid, whose nullity is the cycle rank b₁ = |E| − |V| + c and whose
independence oracle is union–find; ₍₂₎ and ₍₃₎ are generic rigidity in the plane and in space,
of rank 2|V| − 3 and 3|V| − 6, whose oracle is the pebble game and whose independence
condition is hereditary and therefore nonlocal. Constraint counting is a statement about a
three-dimensional atomic network, so the two phases above are floppy₍₃₎ and rigid₍₃₎, while
every quantity the Lean modules of §1 compute is ₍₁₎. That is §8, made visible at each use
site rather than in one frontier section. Where a family word is used of an argument or a role
rather than of a network it is the ordinary English word and carries no matroid.

**The zeolite is the ossification.** It is the maximally over-constrained end of the same
axis whose floppy₍₃₎ end is the matrix. It is not a channel, ions do not traverse its
interior, and nothing about the device asks it to conduct.

**Transport is in the complement.** Ions move through the floppy₍₃₎ matrix, in the volume the
rigid phase has not claimed. Growing the rigid phase raises mechanical rigidity *and*
constricts the conducting volume: one process, two readouts moving in opposite directions.
That coupling is the device.

**The state variable is the degree of ossification** — the composite's position relative to
its own rigidity₍₃₎ percolation threshold — not a filler loading and not a conduction path
through the filler.

The physical picture is developed in the companion notes
`lib/emsenn/services/561-group/services/lenticule-science/content/documents/articles/notes/2026/07/25/ossification-as-the-state-variable.md`
and `.../coordination-obstruction-as-mirror-descent.md`. This note is the fabrication and
formulation side of it.

## 1. The layer map, row by row

The map below is not a set of equivalences. Each row is examined on its own terms in the
subsection named beside it: some carry a genuine shared invariant, some are no more than a
naming convenience with nothing shared, and one is withdrawn outright.

| formal object | mathematical content | physical reading |
|---|---|---|
| `Primitive.Mark` | terminal object / single-sieve site | unbonded functional site (−OH, −H, −CH=CH₂) (§1.1) |
| `Language.Positing.Four` | Belnap bilattice, Klein-four involution group | siloxane substitution series M/D/T/Q (§1.2) |
| `Language.Positing.FiberAlgebra` | residuated fiber functor | dynamic covalent bond exchange (§1.3) |
| `Closure.SettlingMonotonicityQuiescence` | least fixed point of a monotone inflationary operator | hydrosilylation gel point and cure completion (§1.4) |
| `AperiodicOrder.Tiling.J26` | oriented combinatorial cell complex, space-filling | tiling of the volume claimed by the rigid domain (§1.5) |
| `AperiodicOrder.Tiling.Percolation` | cycle rank of the cover nerve | degree of ossification (§1.6) |
| `Cohomology.CoordinationCohomology.H1rank` | `(cells + components) − entities` | irreducible coordination obstruction — not `SettlingCohomologyH1` (§1.7) |

Lean paths below are relative to
`lib/emsenn/services/561-group/services/lenticule-science/services/obsmetrological-services-section/src/services/obsmetrologia/`.

### 1.1 Mark and the unbonded site

Both a terminal object and an unreacted functional group are "the distinguished minimal
thing," and that is the entire content of the row. No invariant is shared, no map is
constructed, nothing downstream depends on it. It is retained as a naming convenience and
carries no inferential weight.

### 1.2 The bilattice and M/D/T/Q, retracted

Two independent failures.

**The nomenclature is conflated.** M/D/T/Q names the four siloxane substitution types by the
count of bridging oxygens on a silicon: M = R₃SiO<sub>1/2</sub> (one), D = R₂SiO<sub>2/2</sub>
(two), T = RSiO<sub>3/2</sub> (three), Q = SiO<sub>4/2</sub> (four). The superscripted Q<sup>n</sup>
series is a *different* notation, from ²⁹Si NMR, applying only to tetrafunctional silicon and
indexing its bridging-oxygen count from Q⁰ to Q⁴. Writing "M-unit = Q¹" merges the two. The
figure below uses M/D/T/Q only:

```
        M                      D                      T                      Q
    (terminator)          (chain unit)        (branch point)         (network node)
       CH3                    CH3                    CH3                   O1/2
        |                      |                      |                     |
CH3 --- Si --- O1/2    O1/2 -- Si -- O1/2     O1/2 -- Si -- O1/2   O1/2 -- Si -- O1/2
        |                      |                      |                     |
       CH3                    CH3                    O1/2                  O1/2

  1 bridging O            2 bridging O           3 bridging O         4 bridging O
```

Each unit has exactly one referent. Figures that place tetramethylsilane at the bottom of this
series alongside the M-unit give the bottom element two referents at once: tetramethylsilane has
no bridging oxygens at all and is not a network unit.

**Cardinality is not evidence, and the structure does not in fact match.** A bijection between
two four-element sets always exists; exhibiting one establishes nothing. The question is
whether the *structure* transfers, and it does not. The Belnap knowledge order on
{⊥, f, t, ⊤} is a diamond: ⊥ below two mutually incomparable middles f and t, both below ⊤ —
a bounded lattice of height 2. The M/D/T/Q series ordered by bridging-oxygen count is a
4-chain of height 3, with no incomparable pair anywhere. A diamond is not order-isomorphic to
a chain. So no order-preserving bijection exists in the knowledge order, and the Klein-four
involution group ⟨~, −⟩ (`Language/Positing/Four.lean`, `Charge.conflate`, `Charge.negConf`)
has no counterpart at all in the substitution series — there is no chemical involution
swapping M with Q while fixing D and T.

The row is withdrawn. What survives is the uncontroversial chemistry: silicon is sp³, its four
valences point at tetrahedral vertices, and the substitution series indexes network
connectivity. That is used throughout §2 and needs no bilattice.

### 1.3 Fiber algebra and bond exchange

Retained as a naming convenience only. Its physical side is the silyl ether motif of §3, and
no invariant is exhibited on either side of the row. Nothing depends on it.

### 1.4 Settling and the gel point

This is the one row that carries a real argument, and it is worth stating properly.

`Closure/SettlingMonotonicityQuiescence.lean` builds a settling operator that is inflationary
and monotone in the knowledge order. Its orbit from a seed is therefore a monotone chain
(`orbit_monotone`, line 96); the chain's limit is a fixed point (`settle_quiescent`, line 163);
and it is the *least* fixed point above the seed (`settle_least_quiescent`, line 169).

Platinum-catalysed hydrosilylation has exactly this shape as a chemical process. Extent of
reaction is monotone non-decreasing in time: the Si–CH₂CH₂–Si bond formed by addition across
a vinyl group is not reversed under cure conditions, so the set of formed bonds only grows.
The process is inflationary — starting from any partially reacted state, cure adds bonds and
removes none. And it terminates at a fixed point: the quiescent, fully cured network, which is
the *least* such state reachable from the given charge, since nothing in the cure creates
bonds beyond those the stoichiometry admits. Gelation is a genuine percolation transition
inside that monotone ascent, at the point where the growing bond set first spans the sample.

The shared invariant is real: **least fixed point of a monotone inflationary operator, with a
spanning transition partway up the chain**. This is the row to keep.

One honest limit. The Kock–Zöberlein lax-idempotence decoration on the settling monad is
never checked against anything about cure. Lax idempotence is a 2-categorical coherence
condition on the monad's multiplication; no property of hydrosilylation kinetics is claimed to
correspond to it, and none is exhibited here. The row is argued at the level of least fixed
points and no further.

### 1.5 J26 as the geometry of the rigid domain

The gyrobifastigium J₂₆ is the unique space-filling Johnson solid: two triangular prisms
joined on a square face with a quarter turn between them. `AperiodicOrder/Tiling/J26.lean`
builds it as an oriented combinatorial cell complex — eight vertices, fourteen edges, eight
exterior faces (`combinatorial_counts`, line 154) — with strict dimension drop across face
incidence (`face_dim_drop`, line 219).

The question J₂₆ answers here is **how ossified regions tile the volume they claim**. That is
a packing question about the rigid phase, and an oriented cell complex with a dimension-drop
property is the right kind of object for it. This is a legitimate, load-bearing role.

It is **not** a block copolymer mesophase target. No Flory–Huggins gate produces a
gyrobifastigium lattice, no χN threshold is relevant, and the whole self-assembly framing is
absent from this note by design (§7).

The D<sub>2d</sub> point group of the gyrobifastigium is an external geometric fact, cited not
proved. There is no `Geometry.D2d` object in the library and none is claimed. The Lean complex
is combinatorial; it carries no point-group structure.

What is argued: the object is built, its combinatorics are checked, and space-filling is the
property the rigid domain needs. What is not argued: any map from the Lean cell complex to a
crystallite morphology in a real cast film. That map is a design intention, not a theorem.

### 1.6 Ossification degree and the percolation module

`AperiodicOrder/Tiling/Percolation.lean` supplies a threshold (`percolationThreshold`, line 63,
the spanning-forest contact count), an order parameter (`h1rank_eq_excess`, line 67, contacts in
excess of that forest), a floppy₍₁₎ characterization (`floppy_iff_at_threshold`, line 90), and
an onset theorem (`percolation_onset`, line 110).

Its vocabulary is *rigidity* vocabulary — floppy, load-bearing, jamming click — and on the
ossification reading that vocabulary is correct at ₍₃₎: mechanical rigidity is exactly the
phenomenon the device runs on. Every one of those words is earned at ₍₁₎ only. The gap between
the vocabulary and the implemented object is §8, and it is a frontier rather than a defect.

### 1.7 The H¹ merge, undone

There is a claim in circulation in this family of documents of the form

> `Cohomology.H1` ⟺ H¹(𝒳, ℱ_inconsistent) ≠ 0 ⟺ defect propagation and active flow channels

citing `Cohomology/SettlingCohomologyH1.lean`. **It asserts the negation of its own named
source.** `SettlingCohomologyH1.lean:200` proves `h1_vanishes` — every 1-cocycle over every
cover glues, uniquely, so H¹ = 0 *unconditionally*, for any cover and any agreeing family. And
line 213 defines `Hn (_n : Nat) : Type := Unit`, the zero group. Nothing in that module can be
non-zero. A citation to it in support of a non-vanishing obstruction is a citation to a proof of
the opposite.

The non-vanishing object exists, but it is a different one. `Cohomology/CoordinationCohomology.lean`
defines a cover nerve (line 270) and its cycle rank

```
H1rank N = (N.cells + N.components) − N.entities        -- line 291
```

which is `|E| − |V| + c`, the first Betti number of the nerve, and which is nonzero exactly when
the nerve is not a forest (`h1_vanishes_iff_forest`, **CoordinationCohomology.lean:303** — not in
`SettlingCohomologyH1.lean`, where it has never been).

Two unrelated H¹'s were merged by name:

| | `SettlingCohomologyH1` | `CoordinationCohomology.H1rank` |
|---|---|---|
| object | Čech H¹ of a sheaf of valuations over a cover | first Betti number of a cover *nerve* |
| value | identically zero, proved | `(cells + components) − entities`, generically nonzero |
| what it measures | gluing obstruction (there is none) | independent cycles among overlapping claims |
| module | `Cohomology/SettlingCohomologyH1.lean` | `Cohomology/CoordinationCohomology.lean` |

They share three characters of a name and nothing else. Only the right-hand column is a
non-vanishing invariant, and only it is cited anywhere in this note.

Neither of them is a flow channel. What the nerve cycle rank does license is a cut statement
rather than a flow statement: a nerve of rank b₁ is redundantly connected, surviving the
removal of any b₁ overlaps without disconnecting a pair of claims that were connected before.
Redundant paths buy survival under cuts, not throughput. Under the ossification reading there
is no cohomological transport claim to make at all: transport is ordinary ionic conduction
through a floppy₍₃₎ matrix, constricted by an inert rigid phase, and it is measured with an
impedance bridge.

## 2. Network formation: the addition cure

The base cure is a standard Pt addition cure, and it is the right one.

**Platinum-catalysed hydrosilylation** of vinyl-terminated PDMS with a
methylhydrosiloxane–dimethylsiloxane copolymer, Karstedt's catalyst, 1-ethynyl-1-cyclohexanol
as cure-rate inhibitor:

$$\text{R--CH}=\text{CH}_2 \;+\; \text{H--Si--R}' \;\xrightarrow[\Delta]{\text{Pt}}\; \text{R--CH}_2\text{--CH}_2\text{--Si--R}'$$

Addition, not condensation: no small molecule is expelled by the network-forming step, so the
volumetric fractions set at cast are the fractions in the cured part. **This property is the
whole reason for choosing an addition cure, and §4 is about the one ingredient that can destroy
it.**

**Hinge and panel geometry is the constraint-counting picture.** In a
siloxane the O–Si–O angle is held near the tetrahedral 109.5° by a stiff bending force
constant — a rigid *panel*. The Si–O–Si bridging angle at oxygen ranges over roughly 120–180°
at negligible energy cost — a floppy *hinge*. In Phillips–Thorpe terms the bond-bending
constraint at the bridging oxygen is effectively broken while the one at silicon is intact,
and it is precisely this that puts a linear siloxane chain at ⟨r⟩ = 2, far below the 2.4
threshold, while a fully cross-linked four-connected aluminosilicate sits at ⟨r⟩ = 4, far
above it. Rigid panels on floppy hinges is not an analogy for the ossification axis; it is the
mechanism of it.

## 3. Exchange chemistry: silanolate is excluded, silyl ether metathesis replaces it

### 3.1 An objection that fails

It is sometimes argued that a hydrosilylation network cannot be a vitrimer, because the
Si–C bonds formed at the junctions cannot undergo silanolate exchange. **This objection is
false**, and it should not be repeated.

The junctions need not exchange. What a vitrimer requires is that network junctions be
*relocatable*, and relocating a junction only requires that the strands between junctions be
exchangeable. In this system those strands are Si–O–Si, which equilibrates readily. Zheng and
McCarthy (JACS 2012, **134**, 2024, "A surprise from 1954") built precisely this architecture —
permanent Si–CH₂CH₂–Si bridges holding a network whose PDMS strands carried living silanolate
ends — and demonstrated complete cut-and-heal at 90 °C. Siloxane equilibration is associative
in Leibler's sense (Montarnal, Capelot, Tournilhac & Leibler, *Science* 2011, **334**, 965):
a new bond forms before the old one breaks, connectivity is conserved throughout, and viscosity
follows Arrhenius rather than WLF. It is a true vitrimer.

### 3.2 The showstopper that is real

**Sodium silanolate and Si–H cannot coexist in one formulation.** Two independent failures:

1. Alkali silanolate reacts dehydrogenatively with Si–H, evolving H₂ and consuming the
   cross-linker. Gas evolution in a casting is foaming; cross-linker consumption is
   under-cure. Both defeat the addition cure's only advantage.
2. At the elevated-temperature step, unquenched alkali silanolate back-bites the siloxane
   network into volatile cyclics (D₃, D₄, D₅). Anionic ring–chain equilibration is the standard
   route *to* those cyclics; running it inside a finished part depolymerizes the part.

Zheng and McCarthy could use living silanolate exactly because their system contained no Si–H.
This one does. The combination is not a tuning problem.

Two adjacent proposals are also excluded, for reasons worth recording:

- **Zn(OAc)₂ is a transesterification catalyst**, Leibler's, for exchanging *ester* bonds in
  epoxy–acid networks (Capelot, Montarnal, Tournilhac & Leibler, JACS 2012, **134**, 7664). It
  has no established role in siloxane redistribution. Listing it as an alternative to
  silanolate confuses which bond is being exchanged — ester versus siloxane — and would leave
  the formulation with a catalyst for a bond the network does not contain.
- **B(C₆F₅)₃ is excluded.** It catalyses Piers–Rubinsztajn coupling of Si–H with alkoxysilanes,
  which evolves alkane gas. It is a second gas-evolving path into a formulation whose central
  property is that it evolves nothing.

### 3.3 The route that works

**Acid-catalysed silyl ether metathesis.** The exchangeable motif is Si–O–C rather than
Si–O–Si: silyl ethers undergo direct metathesis under Brønsted or Lewis acid catalysis, with
no free hydroxyl required and no small molecule evolved (Nishimura, Chung, Muradyan & Guan,
JACS 2017, **139**, 14881; Tretbar, Neal & Guan, JACS 2019, **141**, 16595). The 2019 system is
specifically a direct-metathesis vitrimer with exceptional thermal stability, which is the
property the 160 °C step needs. Acid catalysis is tolerant of residual platinum; alkali
silanolate is tolerant of nothing in this formulation.

**`Unrealized` — the concrete Si–O–C package.** Introducing a defined population of
metathesis-active silyl ether linkages into the *load-bearing₍₃₎* strands of a Pt-cured
vinyl-PDMS network, without a dehydrogenative Si–H + O–H path and without a
condensation byproduct evolved after gelation, is not specified by this note. The base sheet
in §5 is the static network only. The exchange package must satisfy, and is accepted only on
evidence of:

1. silyl ether linkages present in the load-bearing₍₃₎ strands between permanent
   Si–CH₂CH₂–Si junctions, not pendant;
2. any condensation byproduct evolved **before** gelation, during the solvent-removal stage, so
   the volumetric fractions of the gelled part are the cast fractions;
3. no residual Si–H at the point the acid catalyst becomes active;
4. measured topology-freezing temperature T<sub>v</sub> and exchange activation energy
   E<sub>a</sub>, from stress relaxation, with the Arrhenius form

   $$\kappa_{\text{exchange}}(T) = \kappa_0 \exp\!\left(-\frac{E_a}{RT}\right)$$

   fitted rather than assumed. The relaxation time that measurement returns is the numerator
   of the substrate's Deborah number, De = τ<sub>relax</sub>/τ<sub>observe</sub>, the
   dimensionless control parameter the companion lifecycle note runs on. T<sub>v</sub> and
   E<sub>a</sub> are thermodynamic quantities in Kelvin and are not that parameter; the
   Arrhenius *T* above is a real temperature and nothing else.

Until (1)–(4) are on the record the substrate is a thermoset, not a vitrimer, and the note says
so rather than asserting a T<sub>v</sub>.

## 4. The filler: zeolite 4A is a desiccant, and that falsifies the cure

### 4.1 The defect

Zeolite 4A is Na-LTA at Si/Al = 1 — the most aluminous, most hydrophilic zeolite made. It
holds 20–22 wt% water at ambient equilibrium. That is what it is sold to do.

Under platinum catalysis, water and Si–H react:

$$\text{Si--H} + \text{H}_2\text{O} \;\xrightarrow{\text{Pt}}\; \text{Si--OH} + \text{H}_2\uparrow$$

Take the §5 charge: 58.5 g of zeolite per kilogram of formulation. Uncalcined, at 21 wt%
equilibrium water, that is 12.3 g of water — 0.68 mol — against a cross-linker charge of
0.060 mol of Si–H. Water exceeds Si–H by a factor of eleven. The cross-linker is destroyed
several times over before it can reach a vinyl group, and every equivalent consumed releases
hydrogen gas into a curing casting.

This **falsifies the stated reason for choosing an addition cure**. "Zero volatile byproducts,
preserves exact volumetric fractions" is a property of hydrosilylation, and hydrated 4A takes
it away. A formulation that reaches for addition cure and then loads a desiccant has spent the
property it paid for.

### 4.2 Why the graft does not fix it

Grafting vinyltrimethoxysilane onto the zeolite was proposed as the remedy. It cannot be one.
VTMS has a kinetic diameter of roughly 7–8 Å. The LTA eight-ring window is 4 Å. The silane
cannot enter the pore, so grafting functionalizes the **external surface only** and leaves the
micropore water untouched.

The same geometry bounds the achievable graft density, and it bounds it hard. For monodisperse
spheres the external specific surface area is
S = 6/(ρd). At d = 200 nm and ρ ≈ 1.5 g cm⁻³, S ≈ 20 m² g⁻¹; over the range d = 100–300 nm,
S ≈ 40 to 13 m² g⁻¹. At a reactive silanol density of ~2.5 nm⁻² accessible to a bulky
trialkoxysilane, the ceiling is

```
20 m2/g  =  2.0e19 nm2/g  x  2.5 /nm2  =  5.0e19 sites/g  =  0.083 mmol/g
```

giving **0.05–0.17 mmol vinyl per gram** across the particle-size range, nominally 0.08. A
specification of 1.2 mmol g⁻¹ — an order of magnitude above the ceiling — would require
~290 m² g⁻¹ of *external* surface, meaning sub-20 nm particles, or else access to the internal
surface, which the 4 Å window forbids. Graft density on a 100–300 nm LTA powder is bounded by
its own geometry and cannot be specified past it.

### 4.3 The fix

Dehydrate the filler and keep it dry. Grafting is retained for interfacial bonding — under the
ossification reading, the rigid phase *should* be well bonded, and the graft need only avoid a
continuous insulating shell rather than maintain a conductive path through it, which is a far
weaker constraint and a satisfiable one.

```
FILLER PREPARATION
  1. Calcine zeolite 4A powder, 450-550 C, flowing dry air, 6-12 h.
  2. Cool under flowing dry inert gas; transfer without exposure to ambient air.
  3. Graft VTMS in dry toluene, 80 C, 4 h, under Schlenk or glovebox conditions.
  4. Wash, dry, and store under inert atmosphere.

ACCEPTANCE
  - TGA: mass loss below 150 C  <  1.0 wt%.        [gate: the cure margin depends on it]
  - Graft density by TGA / elemental C: 0.05 - 0.17 mmol vinyl/g, nominal 0.08.
  - Any batch failing the TGA gate is re-calcined, not adjusted for.
```

Even fully dehydrated, a high-surface-area filler adsorbs both the platinum complex and the
alkynol inhibitor, which retards cure. The cure margin is restored by moving in both
directions at once:

- **Platinum at 25–50 ppm** on solids, rather than the 10–15 ppm an unfilled addition cure
  needs, to cover adsorptive loss.
- **Inhibitor at 0.01–0.02 wt%** on solids, well below an unfilled formulation's 0.05 wt%,
  since the filler already supplies pot-life by adsorption and a second brake over-retards.

## 5. Formulation sheet

**Declared basis.** Every figure below is stated against one of exactly two bases, named in
each line:

- **BATCH** — 1000.0 g of as-mixed formulation, solvent included. The batch column sums to
  1000.0 g.
- **SOLIDS** — the 731.5 g of non-volatile matter remaining after the solvent stage; this is
  the cured part. Loadings, catalyst ppm, and inhibitor level are quoted on this basis.

A sheet that lets one part sum to 100 wt% internally and then adds further components "of
total" is not a formulation; it is two arithmetics sharing a page. Every line below carries its
basis, and both columns close.

```
========================================================================================
FORMULATION: SILOXANE-ZEOLITE OSSIFICATION SUBSTRATE          basis = 1000.0 g BATCH
========================================================================================

  component                                                        BATCH g    SOLIDS
  --------------------------------------------------------------  --------  ---------
  [1] Vinyl-terminated PDMS, Mw 28,000 g/mol, ~1,000 cSt             660.00    90.2 wt%
        vinyl content 2/Mw = 0.0714 mmol/g -> 47.12 mmol vinyl
  [2] Zeolite 4A, calcined + VTMS-grafted per section 4.3             58.50     8.00 wt%
        100-300 nm; graft 0.08 mmol vinyl/g -> 4.68 mmol vinyl
  [3] Methylhydrosiloxane-dimethylsiloxane copolymer                  13.00     1.78 wt%
        25-30 mol% Si-H, ~4.6 mmol Si-H/g -> 59.80 mmol Si-H
  [4] n-Heptane, dry (< 30 ppm H2O)                                  267.00    volatile
  [5] Karstedt's catalyst, 2% Pt in xylene                             1.40    38 ppm Pt
  [6] 1-Ethynyl-1-cyclohexanol (inhibitor)                             0.10     0.014 wt%
  --------------------------------------------------------------  --------  ---------
  BATCH TOTAL                                                       1000.00
  SOLIDS TOTAL  ( [1] + [2] + [3] + Pt )                             731.53
  solids content of batch                                                     73.2 wt%

  STOICHIOMETRY
    total vinyl   = 47.12 (PDMS) + 4.68 (grafted filler)  = 51.80 mmol
    total Si-H                                            = 59.80 mmol
    Si-H : vinyl                                          =  1.15 : 1
    (modest excess; kept low because residual Si-H is a liability to
     the section 3.3 exchange package, not merely a cure-margin knob)

  VOLUME FRACTIONS IN THE CURED PART
    matrix  [1]+[3] = 673.00 g / 0.97 g cm-3   = 693.8 cm3
    zeolite [2]     =  58.50 g / 1.50 g cm-3   =  39.0 cm3
                                                 -------
                                                  732.8 cm3
    phi_zeolite = 39.0 / 732.8 = 5.32 vol%

  CURE-MARGIN SETTINGS (section 4.3)
    Pt        38 ppm on SOLIDS      [target band 25-50 ppm]
    inhibitor 0.014 wt% on SOLIDS   [target band 0.01-0.02 wt%]
    filler H2O  < 1.0 wt% below 150 C by TGA   [gate, not a target]
========================================================================================
```

### 5.1 Loading is set by modulus, not by percolation

**No filler percolation threshold needs to be reached.** The threshold that matters is the
composite's *rigidity₍₃₎* threshold, and it is approached by *growing* the rigid phase in
situ, not by compounding more of it. Nothing in the device asks the as-cast filler to span the
sample.

This dissolves the modulus conflict outright. A transport reading demands ~16 vol% hard filler
to reach a conduction percolation threshold, and Guth–Gold reinforcement at that loading is
incompatible with a 45–120 kPa target — the two requirements cannot be met by one material. At
φ = 5.32 vol% there is no conflict to resolve:

$$\frac{E}{E_0} = 1 + 2.5\varphi + 14.1\varphi^2 = 1 + 0.133 + 0.040 = 1.17$$

An end-linked network of M<sub>c</sub> = 28 kg mol⁻¹ chains has
G′ ≈ ρRT/M<sub>c</sub> = (970)(8.314)(298)/28.0 ≈ 86 kPa; times 1.17 gives ≈ 101 kPa, inside the
target band with headroom on both sides. The as-cast loading is chosen to land there, and the
ossification state variable is then swept from that starting point by devitrification, not by
reformulation.

### 5.2 Process

```
========================================================================================
PROCESS
========================================================================================

  a. Charge [1] and [4] under dry inert atmosphere. Add [2] (dry-transferred,
     section 4.3). High-shear mix, 3000 rpm, 15 min.
  b. Bath sonicate, 40 kHz, 45 min, to break agglomerates.
  c. Add [6], then [5]. Mix 5 min. Vacuum degas at -0.95 bar, 20 min.
  d. Cast or spin-coat.

  STAGE 1   50 C / 2 h    solvent removal.
                          Volatiles leave HERE, pre-gel. Any byproduct of a
                          section 3.3 exchange package must also leave here.
  STAGE 2  120 C / 4 h    hydrosilylation to the quiescent network.
                          Gelation occurs early in this stage (section 6).
  STAGE 3  160 C / 2 h    anneal.
                          Framed as vitrimer activation only once the section 3.3
                          package is realized and T_v is measured, not assumed.
                          With no alkali silanolate present this stage is safe;
                          with silanolate present it depolymerizes the part.

========================================================================================
SPECIFICATIONS
========================================================================================
  Shear modulus G'                45 - 120 kPa      (soft-tissue regime; 101 kPa nominal)
  Shore hardness                  00-20
  Rigid-phase volume fraction     5.3 vol% as cast, swept upward by devitrification
  Rigid-domain geometry           space-filling gyrobifastigium (J26); D2d point group
  State variable                  degree of ossification = position relative to the
                                  composite rigidity percolation threshold
  Transport                       ionic conduction in the FLOPPY MATRIX, constricted
                                  by the rigid phase; nothing conducts through the
                                  zeolite interior
  Signature                       modulus and conductivity move in OPPOSITE directions
                                  under a single devitrification process
  T_v                             UNREALIZED - see section 3.3, to be measured
========================================================================================
```

## 6. Gelation: the Flory–Stockmayer criterion, stated correctly

The gel point of a randomly branching step network is reached when the branching coefficient
α — the probability that a given functional group on a branch unit leads, through a chain, to
another branch unit — reaches

$$\alpha_c = \frac{1}{f - 1},$$

with *f* the functionality of the branch unit. The equivalent Carothers form is
p<sub>gel</sub> = 2/f̄.

**There is no square root.** The form `p_c = 1/√(f_avg − 1)` is not the criterion and is not an
approximation to it. At f = 3 it gives 1/√2 = 0.707 where the criterion gives 0.500 — high by 41%, and the error
grows with f: at f = 9.2 it gives 0.349 against 0.122, high by a factor of 2.9. Every gel-point
estimate derived from the square-root form is unusable.

For the §5 sheet the branch unit is the Si–H copolymer: M<sub>w</sub> ≈ 2,000 g mol⁻¹ at
4.6 mmol Si–H g⁻¹ gives f ≈ 9.2 Si–H sites per chain, so

$$\alpha_c = \frac{1}{9.2 - 1} = 0.122.$$

Gelation at roughly 12% conversion of Si–H — early in Stage 2, as expected for a
multifunctional cross-linker, and the reason Stage 1 must complete solvent removal before
Stage 2 begins.

## 7. What is deliberately absent

**Block copolymer self-assembly.** No PDMS-*b*-PS or PDMS-*b*-PLA, no χN gate, no effective
volume fraction, no "volumetric fractional tuning." J₂₆ is the space-filling geometry of the
ossified domain (§1.5), reached by controlled devitrification, and no mesophase produces it.
Removing the self-assembly framing also removes the entire particle-size-versus-domain-size
problem, because nothing needs to sit at a domain interface any more.

One number from that framing is worth recording as a diagnostic of how the error travelled.
The target effective volume fraction was given as φ = 0.382. That is not a polymer quantity:

$$0.382 = \frac{3 - \sqrt{5}}{2} = 2 - \varphi_{\text{golden}} = \lambda_5,$$

the non-crystallographic quadratic surd from the pentagon and crystallographic-restriction
argument elsewhere in this corpus, transplanted intact into a formulation sheet and relabelled
as a volume fraction. A quantity from a symmetry argument about fivefold rotation was carried
across into a mixing recipe unchanged. It is worth naming because the same failure mode — a
number keeping its value while changing what it is a number *of* — is what the H¹ merge of §1.7
is, in a different register.

**The percolation-channel Lean.** The `Obsmetrologia.PDK` namespace does not exist. Neither do
`SiloxaneValence`, `valenceToBilattice`, `PolymerSystem`, `gelationThreshold`,
`cure_settling_quiescence`, `J26Mesh`, `HasPercolatingChannels`, `h1_nontrivial_of_percolation`,
`Geometry.D2d`, or `Obsmetrologia.Language.Settling.ReflTower`. A verified search of the library
returns zero hits for every one of them. The snippets that quote them circulate with bodies
ending in `sorry`, so even taken on their own terms they state nothing; one of them (§1.7)
states the negation of a theorem the library does contain. Nothing in this note quotes them,
and no Lean is displayed here that is not built, named by file, and named by line.

**A loading-percolation threshold of 0.158.** No such constant appears anywhere in the library,
and on the ossification reading there is no filler-percolation quantity for it to be.

## 8. The frontier: the vocabulary is rigidity, the implemented matroid is connectivity

This is the one open mathematical problem the ossification reading creates, and it is worth
stating precisely rather than papering over.

`AperiodicOrder/Tiling/Percolation.lean` speaks throughout in rigidity terms — floppy, jammed,
load-bearing, the jamming click — and on the ossification reading that vocabulary is *correct*
at ₍₃₎. Mechanical rigidity is exactly the phenomenon the device runs on.

But the implemented object is the cycle rank

$$b_1 = |E| - |V| + c,$$

which is the **nullity of the graphic matroid**, so every one of those words is earned at ₍₁₎.
Its transition is the appearance of the first cycle: continuous, sharp at a single contact
count, each surplus contact raising the rank by exactly one (`h1rank_eq_excess`,
`percolation_onset`). The independence oracle is union–find.

Mechanical rigidity is a different matroid. Generic rigidity in the plane is governed by
Laman's condition and the **generic rigidity matroid**, of rank 2|V| − 3 (Laman 1970). The
generic rigidity matroid exists in every dimension — it is the matroid of the rigidity matrix at
a generic configuration, well defined by genericity — but in three dimensions only the rank
count 3|V| − 6 is available, not a combinatorial characterization: Laman's condition fails in
3D, with the double-banana graph as the standard counterexample. The correct test for whether an
added contact is independent or redundant is the **pebble game**, not union–find (Jacobs &
Hendrickson 1997). And Laman's condition is hereditary — every subgraph on n′ vertices carries
at most 2n′ − 3 edges — so redundancy is a nonlocal property, invisible to any per-site or
per-vertex count.

The order of the transition is not part of the gap. Rigidity percolation's order is
lattice-dependent and was contested: on the two-dimensional triangular lattice, generic rigidity
percolation is measured as **continuous** — second-order, in a universality class of its own
(Jacobs & Thorpe 1995, 1996). First-order behaviour is the Bethe-lattice and mean-field result
(the Moukarzel–Duxbury–Leath line; attribution not independently checked here). What separates
the two matroids is the rank function and the independence oracle, not the sharpness of the
rise.

So the gap is exact:

| | implemented ₍₁₎ | required ₍₂₎ / ₍₃₎ |
|---|---|---|
| matroid | graphic | generic rigidity |
| rank | \|V\| − c | 2\|V\| − 3 (plane); 3\|V\| − 6 (space, combinatorially uncharacterized) |
| oracle | union–find | pebble game |
| independence | local: does this edge close a cycle | hereditary: does any subgraph exceed 2n′ − 3 |

Closing it means replacing the graphic independence oracle with a rigidity one — a strictly
harder object, whose independence test is nonlocal — and the payoff is that the ossification
state variable would then be computed by the mathematics that actually governs it.

A second, smaller gap: constraint counting gives a threshold in *mean coordination*, and any
derivation of a critical *fraction* from a per-site occupation rate additionally requires a
joint law over sites. Invariance of a single-site distribution does not force independence
across sites, and correlated placement crosses a coordination threshold at a very different
density than independent placement. Any critical-fraction claim must state which joint law it
assumes; none here does, so none is made.

## 9. What would falsify this

1. Grow the rigid phase incrementally in one sample while measuring dynamic modulus and ionic
   conductivity together. The design predicts they move in opposition. If they move together,
   or if conductivity is insensitive to crystalline fraction, the two-phase reading is wrong.
   Cheapest test, run it first: a cast film and two electrodes.
2. Measure the floppy₍₃₎-to-rigid₍₃₎ transition against crystalline volume fraction and extract
   its critical exponents. The *order* of the transition discriminates nothing — both matroids
   give a continuous rise in two dimensions — but the exponents do, since two-dimensional
   generic rigidity percolation sits in a universality class distinct from connectivity
   percolation (Jacobs & Thorpe 1995, 1996). Connectivity exponents would show the
   graphic-matroid reading is adequate here; rigidity exponents would show the gap of §8 is
   load-bearing.
3. Run TGA and evolved-gas analysis across Stages 1–3. Any hydrogen evolved in Stage 2 means
   the filler was not dry enough and §4 was not followed.
4. Determine whether ossified regions can be re-dissolved, and over how many cycles. If
   ossification is one-way the substrate is write-once — a record, not a reconfigurable state.

---

## References

Capelot, M., Montarnal, D., Tournilhac, F. & Leibler, L. (2012). Metal-catalyzed
transesterification for healing and assembling of thermosets. *Journal of the American
Chemical Society* **134**, 7664.

Jacobs, D. J. & Hendrickson, B. (1997). An algorithm for two-dimensional rigidity percolation:
the pebble game. *Journal of Computational Physics* **137**, 346.

Jacobs, D. J. & Thorpe, M. F. (1995). Generic rigidity percolation: the pebble game. *Physical
Review Letters* **75**, 4051.

Jacobs, D. J. & Thorpe, M. F. (1996). Generic rigidity percolation in two dimensions.
*Physical Review E* **53**, 3682.

Laman, G. (1970). On graphs and rigidity of plane skeletal structures. *Journal of Engineering
Mathematics* **4**, 331.

Montarnal, D., Capelot, M., Tournilhac, F. & Leibler, L. (2011). Silica-like malleable
materials from permanent organic networks. *Science* **334**, 965.

Nishimura, Y., Chung, J., Muradyan, H. & Guan, Z. (2017). Silyl ether as a robust and thermally
stable dynamic covalent motif for malleable polymer design. *Journal of the American Chemical
Society* **139**, 14881.

Phillips, J. C. (1979). Topology of covalent non-crystalline solids I: short-range order in
chalcogenide alloys. *Journal of Non-Crystalline Solids* **34**, 153.

Phillips, J. C. & Thorpe, M. F. (1985). Constraint theory, vector percolation and glass
formation. *Solid State Communications* **53**, 699.

Reiner, M. (1964). The Deborah number. *Physics Today* **17**(1), 62.

Thorpe, M. F. (1983). Continuous deformations in random networks. *Journal of Non-Crystalline
Solids* **57**, 355.

Tretbar, C. A., Neal, J. A. & Guan, Z. (2019). Direct silyl ether metathesis for vitrimers with
exceptional thermal stability. *Journal of the American Chemical Society* **141**, 16595.

Zheng, P. & McCarthy, T. J. (2012). A surprise from 1954: siloxane equilibration is a simple,
robust, and obvious polymer self-healing mechanism. *Journal of the American Chemical Society*
**134**, 2024.
