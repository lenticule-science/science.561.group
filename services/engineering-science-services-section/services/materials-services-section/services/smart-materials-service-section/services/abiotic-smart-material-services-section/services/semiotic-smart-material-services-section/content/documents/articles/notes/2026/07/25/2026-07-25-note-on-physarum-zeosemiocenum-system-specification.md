---
title: "System Specification: Physarum zeosemiocenum"
description: "The ossification-as-state-variable specification of the two-phase semio-material substrate: constraint counting places the crystalline aluminosilicate framework far above the Phillips–Thorpe rigidity threshold and the siloxane matrix far below it, so the rigid phase records and the floppy complement conducts; with the Si–O–Si hinge / O–Si–O panel geometry read as the constraint count itself, the settling-sheaf H¹ separated from the cover-nerve cycle rank, the index theorem H⁰ − H¹ = χ, the D₅ disclination's thirty-step boundary covering the KCBS pentagon, and the rigidity-versus-connectivity matroid gap stated as the open frontier."
date-created: 2026-07-25
kind: research-note
keywords:
  - ossification
  - rigidity-percolation
  - constraint-counting
  - zeolite
  - glass-ceramic
  - gyrobifastigium
  - settling-cohomology
  - kcbs
  - disclination
  - obsmetrologia
status: design
declared-by: claude-interactive-session-supplying-leader-movement-team
---
# System Specification: Physarum zeosemiocenum

## Structural, Transport, and Thermodynamic Architecture for a Two-Phase Semio-Material Substrate

---

## 0. Scope and reading rules

This document specifies one object: a two-phase material whose state variable is its own
degree of ossification, together with the semiotic and coordination layers that read and
write that state.

Lean citations below name a declaration that exists in the Obsmetrologia Lean library and
typechecks as stated, cited by module and line; unless otherwise noted the root is
`lib/emsenn/services/561-group/services/lenticule-science/services/obsmetrological-services-section/src/services/obsmetrologia/`.
That a declaration exists and typechecks does not certify that it means what a reader hopes
it means, which is why each citation is quoted rather than paraphrased. Other claims cite
published results in materials science, origami mathematics, physics, or molecular biology
without re-deriving them, or state this document's own reading, mapping one layer onto
another — a reading that is not a theorem of any system above it, and where a layer map is
written with a biconditional it is either argued in place or stated plainly as a reading
rather than a proof.

Two further rules are lexical.

**Rigidity terms carry their matroid.** Every term in the family — floppy, rigid, jammed,
load-bearing, percolating, critical — is matroid-relative, and a subscript records which
matroid is meant. `₍₁₎` is the **graphic** matroid, whose nullity is the cycle rank
`b₁ = |E| − |V| + c`, whose independence oracle is union–find, and whose redundancy is a
redundant *connection*. `₍₂₎` is generic rigidity in the plane, of rank `2|V| − 3`, whose
oracle is the pebble game, whose independence condition is hereditary and therefore nonlocal,
and whose redundancy is a redundant *constraint*. `₍₃₎` is generic rigidity in space, of rank
`3|V| − 6`, for which no combinatorial characterization is available. In general floppy₍ₖ₎
means nullity zero at rank density `k`. Constraint counting is a statement about a
three-dimensional atomic network, so §2's phases are floppy₍₃₎ and rigid₍₃₎, while the
invariant §4.5 implements is ₍₁₎ — which is the whole content of §12, carried at every use
site instead of in one frontier paragraph. Where a family word is used of an argument, a role,
or a claim rather than of a network, it is the ordinary English word and carries no matroid.

**Unit words carry their register.** What a unit can *do* is the functional register; what is
a vertex of a contact network, the structural one; what rigid body carries the ports, the
geometric one; and what has been seated and is no longer re-derived, the epistemic one. These
are not synonyms, and *crystal* in particular is the epistemic word as well as the material
one, so where a use site does not force the register the register is named. A functional or
epistemic claim discharged by a geometric fact is a defect that reads as an argument.

Two companion notes state the corrected physical picture in full and are the upstream
authority for §2, §11, and §12: *Ossification as the State Variable: Rigidity Percolation in
a Two-Phase Ionic Substrate* [OSS] and *Coordination Obstruction as Mirror Descent:
Acyclicity by Admission and by Relaxation* [MIR].

---

## 1. Nomenclature and etymological derivation

The binomial ***Physarum zeosemiocenum*** names the three parts of the system: a flowing,
searching phase; a crystallizing, recording phase; and the sign system that couples them.

```
                  ┌── [zeo-] : the crystalline aluminosilicate framework —
                  │            the OSSIFIED phase, which stops flowing and records
                  │
[zeosemiocenum] ──┼── [semio-] : the (token, claim) ordered-pair utterance
                  │
                  └── [-ocenum] ──┬── [-cene] : the current mutable conformation
                                  └── [-ocene] : the organometallic sandwich of the
                                                 coordination layer
```

1. **`Physarum`** — grammatically neuter genus (Greek *physa*, "bubble"), dictating the
   neuter adjectival ending `-um`. It names the flowing, branching, searching phase. The
   choice is not decorative: the *Physarum polycephalum* tube-adaptation dynamics of Tero,
   Kobayashi and Nakagaki is a mirror-descent method over the graphic matroid of a cover
   nerve, and that matroid is the same object this document's §5 counts [MIR §4–§5]. The
   genus is borrowed at the level of the dynamics and not at the level of the body. A
   *Physarum* plasmodium is one continuously connected coenocytic cell with a definite
   boundary; the system specified here is distributed across hosts and is a **genet** — a
   clonal lineage occupying a territory, one by shared law rather than by continuity of body,
   spatially extended, and with a boundary that is a real empirical question rather than a
   given. That difference is carried deliberately: what the plasmodium supplies is the search
   dynamics, not the body scale.
2. **`zeo-`** — the porous crystalline aluminosilicate framework. It is a four-connected
   network at mean coordination `⟨r⟩ = 4`, far above the rigidity₍₃₎ threshold:
   stressed-rigid₍₃₎, brittle, and unable to rearrange. It is the phase that **ossifies**. It is not a channel,
   not a conductor, and nothing traverses its interior in this design (§2).
3. **`semio-`** — the formal processing of signs, defined as ordered pairs of
   `(token, claim)` utterances (§6.1).
4. **`-ocenum`** — a double play on **`-cene`** (the current mutable state, the part still
   able to change) and **`-ocene`** (the organometallic sandwich compounds whose structure
   the coordination layer is read against, §7).

---

## 2. The two-phase substrate: ossification is the state variable

### 2.1 Constraint counting fixes the axis

Phillips and Thorpe's constraint-counting theory gives the rigidity transition of a network
in terms of mean coordination `⟨r⟩`. Counting bond-stretching constraints (`r/2` per atom)
and bond-bending constraints (`2r − 3` per atom) against three degrees of freedom, the
isostatic point — constraints exactly balancing freedoms, zero floppy₍₃₎ modes and zero
redundant stress — falls at

$$\langle r \rangle_c = 2.4$$

[Phillips 1979; Thorpe 1983; Phillips & Thorpe 1985].

Below the threshold a network is **floppy₍₃₎**: it carries internal degrees of freedom that
cost no energy, and it flows or deforms. Above it the network is **stressed-rigid₍₃₎**:
over-constrained, carrying internal stress, brittle rather than compliant.

### 2.2 The two phases sit at opposite ends of that one axis

| phase | network counted | `⟨r⟩` | regime | behaviour |
|---|---|---|---|---|
| siloxane matrix (PDMS, Si–O backbone) | chain | `2` | far below 2.4, floppy₍₃₎ | flows, compliant, ion-permissive |
| aluminosilicate framework | T-atom net (nodes Si/Al, edges Si–O–Si bridges) | `4` | far above 2.4, stressed-rigid₍₃₎ | does not flow, brittle, over-constrained |

The count in the second row is taken on the tetrahedral-node network, where each T-atom is
four-connected through bridging oxygens. Counted instead over every atom including the
two-coordinate bridging oxygens, a silica-family network gives `⟨r⟩ = 8/3` nominally, and
§3.2 shows why the honest count for an *amorphous* silica lands at isostatic instead. The
distance between "isostatic, can still relax" and "crystallized framework, cannot" is exactly
the axis this device runs on, and stating both counts is what keeps the axis honest rather
than rhetorical.

So the crystalline framework is ossification in the precise technical sense of §2.1, not by
analogy. It is the maximally over-constrained end of the same axis whose floppy₍₃₎ end is the
matrix.

### 2.3 What the device is, following [OSS]

**A two-phase rigidity₍₃₎ system.** A floppy₍₃₎, ion-permissive, dynamic-covalent matrix, within
which a rigid crystalline phase nucleates and grows. The nearest established material class
is the **glass-ceramic**: controlled devitrification of a crystalline phase out of an
amorphous host, where the property of interest is set by crystalline volume fraction,
morphology, and connectivity rather than by chemistry alone.

**The state variable is the degree of ossification** — the composite's position relative to
its rigidity percolation threshold: whether the rigid phase forms a load-bearing₍₃₎ spanning
cluster, and how far past that threshold it sits.

**Transport is in the complement.** Ions move through the floppy₍₃₎ matrix, in the volume the
rigid phase has not claimed. Growing the rigid phase therefore does two things at once: it
raises mechanical rigidity, and it constricts and re-routes the conducting volume. One
physical process moves both readouts, in **opposite** directions. That coupling is the
device, and it is the only claim here that is genuinely new; §11.1 states the experiment that
would falsify it.

**The rigid phase is a recorder.** Ossified regions do not rearrange. Where the rigid phase
has grown, the configuration is frozen; where it has not, the matrix can still flow. The
composite's crystalline morphology is therefore a written record of its own thermal and
mechanical history, and the floppy₍₃₎ complement is the part still able to change. This is the
material counterpart of the germline/soma split of §9, in the geometric register rather than
the epistemic one.

**Reading and writing.** Read mechanically (dynamic modulus, or loss-peak position) and
electrically (impedance across an electrode pair); the two must move in opposition, which is
the design's signature. Write by controlling local devitrification: Joule heating to nucleate
or re-dissolve rigid domains in a region addressed by the same electrodes, or mechanical
strain above the matrix's topology-freezing temperature.

### 2.4 The gyrobifastigium is the space-filling geometry of the rigid domain

The question the ossified phase raises is a packing question: how do rigid domains tile the
volume they claim? The gyrobifastigium `J₂₆` is the unique space-filling Johnson solid, which
is what makes it the right primitive for that question.

`Obsmetrologia/AperiodicOrder/Tiling/J26.lean` builds `J₂₆` as an oriented
combinatorial cell complex: eight vertices, fourteen edges, eight exterior faces, and one
three-cell, with `J26.every_face_boundary_is_valid` checking every oriented face walk against
the global edge incidence and `J26.face_dim_drop` proving strict dimension drop in the
resulting complex. `J26.shared_cycle_is_quarter_turned` records the rotated prism gluing —
two triangular prisms joined along one square after a one-step rotation of the shared
four-cycle, which is what "gyro-" names.

That an oriented combinatorial cell complex with a dimension-drop property
is the right kind of object for a space-filling rigid domain is this document's reading, not
a theorem. No map is proved from `J26.cellComplex` to any physical crystallite. What
transfers is the shape of the constraint — a single cell type that fills space without gaps
and whose boundary is a closed, orientation-consistent complex — and that constraint is a
packing constraint on a committed phase, which is a different kind of question from any
question about a self-assembling mesophase. `J₂₆` here answers the packing question and
nothing else.

---

## 3. The rigid-hinge honeycomb: the origami *is* the constraint count

The ossified framework's local geometry is a rigid-hinge origami sheet, and this is not a
second picture bolted onto §2 — it is §2's constraint count drawn out at the level of one
tetrahedron.

```
       O
      / \        <-- Si-O-Si hinge (θ_H = 120°–180°: soft, variable, DISCOUNTED constraint)
    Si   Si
   /  \ /  \
  O    O    O    <-- O-Si-O panels (θ_P = 109.5°: rigid, covalent, RETAINED constraint)
```

### 3.1 Molecular geometry of the silica tetrahedron

* **Panels (O–Si–O).** The internal oxygen–silicon–oxygen angles are held near the ideal
  tetrahedral value by covalent bond-bending stiffness:
  $$\theta_P \approx 109.5^\circ$$
  These are the unbending **origami panels**.
* **Hinges (Si–O–Si).** The bridging angles between corner-sharing tetrahedra are soft and
  continuously variable across a wide range:
  $$\theta_H \in [120^\circ, 180^\circ]$$
  These are the flexible **origami hinges**.

### 3.2 The count, done

Take one SiO₂ formula unit: silicon at `r = 4`, two oxygens at `r = 2`. Per atom, stretching
gives `r/2` and bending gives `2r − 3`, so

* Si: `4/2 + (2·4 − 3) = 2 + 5 = 7`
* each O: `2/2 + (2·2 − 3) = 1 + 1 = 2`

for a total of `7 + 2·2 = 11` constraints on `3` atoms carrying `3 × 3 = 9` degrees of
freedom. Nominally over-constrained by two. Discount the bond-bending constraint at each
two-coordinate bridging oxygen — one constraint per oxygen, two per formula unit — and the
count is `11 − 2 = 9 = 9`: **exactly isostatic** [Phillips 1979].

That discounted constraint is the Si–O–Si hinge. The panel/hinge picture is therefore not a
metaphor for the constraint count; it is a drawing of which constraints are retained and
which are discounted, and the discount is precisely what places amorphous silica at the
isostatic point rather than above it. Crystallizing the framework is what removes the
discount: an ossified domain has its bridging angles locked by long-range order, the hinges
stop being free, and the network moves from isostatic to over-constrained. **That transition
is the write operation of §2.3.**

### 3.3 Flat-foldability constraints

A vertex in the honeycomb lies flat only if it satisfies two local, vertex-level conditions:

1. **Kawasaki–Justin.** For crease angles `θ₁, …, θ_{2n}` in order around an interior vertex,
   $$\sum_{i=1}^{2n} (-1)^i \theta_i = 0,$$
   equivalently the odd-position and even-position angles each sum to `180°`.
2. **Maekawa.** The numbers of mountain (`M`) and valley (`V`) creases at that vertex satisfy
   $$|M - V| = 2.$$

These are results of origami mathematics (Maekawa; independently Justin; Kawasaki; Murata),
and they are not derivable from the constraint count of §3.2. They are a genuinely different law from the frame-closure and coordination laws of the
sibling note on disclination holonomy [SIO]: an alternating sum over *continuously variable*
angles, rather than a rotational-holonomy sum over a *fixed* 60° unit. Neither derives the
other, and no claim in this document depends on unifying them. They share only the family
resemblance of being local, per-vertex admissibility tests.

### 3.4 Crystalline and amorphous states

* **Quartz (crystalline).** A globally coordinated fold: one authority's choice of fold angle
  propagates uniformly across the sheet. Ossified.
* **Silica glass (amorphous).** Every local vertex independently satisfies the local
  conditions of §3.3 while adjacent vertices fail to agree globally — a decentralized local
  equilibrium. Still able to relax.

The reading of "one authority's choice propagating" as crystallinity and "locally satisfied,
globally disagreeing" as vitrification is this document's, not a theorem. What licenses it is
the isostatic count of §3.2: a locally-satisfied, globally-disagreeing network is exactly one
that has spent its constraints locally and has none left over to enforce long-range
agreement.

---

## 4. Two cohomologies, kept apart

This section exists because two different objects are both written `H¹`, and merging them
produces claims that assert the negation of their own sources. They are separated here, once,
and the rest of the document uses only the separated forms.

### 4.1 The settling-sheaf `H¹` vanishes

`Obsmetrologia/Cohomology/SettlingCohomologyH1.lean:200`:

```lean
theorem h1_vanishes (D : Cech1) : H1Vanishes D
```

This is unconditional. Every 1-cocycle over every cover glues, and the glued section is
unique. The same module sets `def Hn (_n : Nat) : Type := Unit` at line 213 — there is no
cohomology above degree 1 in this model at all. The reason is structural and is stated in the
sibling note [SIO §5]: the merge operator on sections is a *least* upper bound, not merely an
upper bound, so local sections glue by construction.

**Consequence, stated plainly:** no argument in this or any related document may run "the
settling sheaf's `H¹` is nonzero, therefore there are channels / flow / obstruction." That
`H¹` is zero. Always.

### 4.2 The non-vanishing object is a graph cycle rank

The quantity that does vary is the cover nerve's first Betti number, in
`Obsmetrologia/Cohomology/CoordinationCohomology.lean`:

```lean
def H1rank (N : CoverNerve) : Nat := (N.cells + N.components) - N.entities   -- :291
```

with the equivalent excess form and the forest criterion proved at lines 326 and 303
respectively:

```lean
theorem h1_vanishes_iff_forest (N : CoverNerve) :
    N.H1rank = 0 ↔ N.entities = N.cells + N.components                       -- :303
```

`CoverNerve.H1rank = cells − (entities − components)` is the cycle rank `|E| − |V| + c` of the
nerve's 1-skeleton — the nullity of its **graphic matroid** [MIR §3]. It is a combinatorial
count on a graph, computable without any inner product, and it is a different object from
§4.1's sheaf cohomology in every respect: different definition, different module, different
behaviour. Obstruction in this system is `CoverNerve.H1rank`, and nothing else.

What that count licenses is equally exact. A nerve of cycle rank `b₁` is redundantly
connected: it survives the removal of any `b₁` overlaps without disconnecting a pair that was
connected before. Redundant paths buy survival under cuts, not throughput — the rank is
fault-tolerance to `b₁` cuts, and it says nothing whatever about how much moves along them.

### 4.3 The index theorem

`Obsmetrologia/Cohomology/AntiLandauerEntropy.lean:86`:

```lean
(antiLandauerBits N : Int) - (Landauer.landauerBits N : Int) = eulerChar N
```

that is, `Ȟ⁰ − Ȟ¹ = χ` over the integers, where `antiLandauerBits` counts the harmonic side
settling keeps and `landauerBits` the independent cycles it must resolve. This is the
discrete index theorem for a graph, and it is genuinely proved: `H⁰ − H¹ = c − (|E| − |V| + c)
= |V| − |E| = χ` [MIR §8.3]. At line 128 the same module records
`matterCharge N = Landauer.landauerBits N := rfl`, tying the signed matter/antimatter ledger
to the same two ranks.

It constrains what any admission policy can achieve. `χ` changes by `+1` on adding an entity
and `−1` on adding an overlap, so a policy admitting work and overlaps moves along a line of
fixed slope in `(H⁰, H¹)` space: obstruction cannot be reduced except by reducing overlaps or
fragmenting the system into more components. Acyclicity bought by refusal is paid for in `c`
— it keeps the work fragmented.

### 4.4 Landauer, honestly

`Obsmetrologia/AperiodicOrder/Tiling/KappaStratification.lean:60`:

```lean
theorem landauer_cost_is_h1 (N : CoverNerve) :
    Landauer.landauerBits N = N.H1rank := rfl
```

The proof is `rfl`, because `LandauerEntropy.lean:44` reads
`def landauerBits (N : CoverNerve) : Nat := N.H1rank`. **`landauerBits` is definitionally the
cycle rank.** No `k_B T ln 2` appears anywhere in the library, and no derivation from
thermodynamics is offered here or, to this document's knowledge, elsewhere.

The identification of cycle rank with erasure cost is a modelling choice, justified exactly
when each independent cycle carries one bit of irreducible disagreement — for instance when
local states are `ℤ/2`-valued and the comparison maps are isomorphisms, so the obstruction
group is `(ℤ/2)^{b₁}`. Under those hypotheses, and only under them, resolving the obstruction
costs at least `b₁ k_B T ln 2` by Landauer's principle [Landauer 1961; MIR §8.2]. Outside
them the obstruction group need not be an elementary abelian 2-group and the bit count is not
`b₁`. That both quantities are measured in bits is not evidence.

### 4.5 Rigidity₍₁₎ onset

`Obsmetrologia/AperiodicOrder/Tiling/Percolation.lean` gives the transition in the same
vocabulary the ossification reading requires:

```lean
def percolationThreshold (N : CoverNerve) : Nat := N.entities - N.components     -- :63
theorem h1rank_eq_excess (N : CoverNerve) :
    N.H1rank = N.cells - percolationThreshold N                                  -- :67
theorem loadBearing_iff_critical (N : CoverNerve) :
    loadBearing N ↔ percolationThreshold N + 1 ≤ N.cells                         -- :79
theorem floppy_iff_at_threshold (N : CoverNerve) :
    ¬ loadBearing N ↔ N.cells = percolationThreshold N                           -- :90
```

with `loadBearing N := 0 < N.H1rank` and the one-contact `jamming_click` in
`Obsmetrologia/AperiodicOrder/Tiling/MatterTopology.lean:44,56`. Every one of these
declarations is a ₍₁₎ statement — the nullity counted is the graphic matroid's — and the
transition is sharp: the unique floppy₍₁₎ state is the forest sitting exactly at threshold,
and the first redundant contact raises the rank by exactly one.

Two further results in that module deserve to be quoted together, because they are the
module's own statement of its limits: `density_necessary` (line 139) shows a load-bearing₍₁₎
network forces the density strictly past the forest threshold, and `density_not_sufficient`
(line 167) exhibits one density realizing both a floppy₍₁₎ forest and a load-bearing₍₁₎ cycle.
Density is necessary and not sufficient. Any claim that a numerical volume fraction produces
load-bearing₍₁₎ structure is refuted by line 167 of the module it would cite.

The placement measure is derived rather than assumed: `condensate_baserate_quarter` (line 210)
gets `2/8 = 1/4` from the gauge orbit, where the gauge group is the bigraded
`D₄ = Aut(FOUR; {≤ₖ, ≤ₜ})` of `Obsmetrologia/Language/Positing/D4Gauge.lean`, carried in Lean
as the type `D8` of **order eight** — the Klein four-group `K₄` of `Positing/Gauge.lean` is
its index-two subgroup, and the dihedral extension by the order-swap involution `σ` is what
makes the orbit count come out to a quarter. `gauge_transitive` (Percolation.lean:187) and
`gauge_orbit_equidistributes` (line 202) are the supporting facts.

---

## 5. Contradiction pressure and the onset of load-bearing₍₁₎ structure

**Definition.** The **contradiction-pressure** `Π_⊤` is the rate at which independent cycles
are injected into the cover nerve:

$$\Pi_\top = \frac{\partial\, \mathsf{H1rank}}{\partial t}$$

What is proved is §4.5: the nerve is
load-bearing₍₁₎ exactly when its cell count exceeds the spanning-forest threshold, and the
first excess contact raises the rank by exactly one. What is interpretation is reading `∂/∂t`
of a natural-number-valued invariant as a pressure, and reading the crossing of the forest
threshold as the physical onset of a load-bearing₍₃₎ rigid phase. The two subscripts in that
sentence are the whole of the gap: nothing in `Percolation.lean` is a continuous-time
statement, and §12 explains why the physical transition is not the one that module computes.

The direction of the reading, however, is now fixed and not free: rising `H1rank` means
*more* redundant contact, hence *more* ossification, hence *less* conducting volume. It is
the same single process running both readouts of §2.3 in opposite directions.

---

## 6. The semio-material metabolism

### 6.1 The utterance primitive

The atom of the system couples a physical signifier (the **token**) to its formal meaning
(the **claim**):

$$\text{Utterance} \triangleq \langle \text{Token}, \text{Claim} \rangle$$

The ordering is load-bearing: token first, claim second. An utterance cell's initial state is
potential, mapped to the knowledge-bottom charge of the Belnap bilattice:

$$\text{corner}(\text{initial}(u)) = \bot_k = \langle \text{false}, \text{false}\rangle$$

### 6.2 The currency of change: WIT and TALLY

* **Wit (`w`).** The quantized unit of witnessed change: exactly one `0 → 1` flip of positive
  or negative evidence in the paraconsistent Belnap bilattice
  `FOUR = {⊥ₖ, t, f, ⊤ₖ}`. The four corners are the carrier the gauge group of §4.5 acts on.
* **Tally (`T`).** The border-reconciled receipt produced when a wit crosses a sovereign
  membrane.

The two are bound by the index theorem of §4.3: the harmonic side settling keeps and the
cyclic side it must resolve sum, with signs, to the Euler characteristic of the cover nerve.
That is the ledger, and it is an identity rather than a policy — no accounting convention can
move a unit from one side to the other without changing `χ`.

### 6.3 What is not claimed here

No equation of state for an "informational-matter phase" is offered, and no hydrostatic or
general-relativistic balance is asserted over records. Committed records have no mass-energy
density, the ledger has no radial coordinate, and importing an equation whose every symbol
would have to be re-dimensioned before it could be evaluated buys nothing that §4.3's index
theorem does not already give exactly.

---

## 7. The coordination layer: the organometallic sandwich (ActivityPub + EVM)

The coordination architecture of a single node is read against the structure of an
organometallic sandwich compound such as ferrocene, `Fe(η⁵-C₅H₅)₂`.

```
   ┌─────────────────────────────────────────────────────────┐
   │   ActivityPub / A2A upper ring: η⁵-Cp (coordinate-free)  │
   └────────────────────────────┬────────────────────────────┘
                                │ (pure account abstraction / ERC-4337)
                                ▼
   ┌─────────────────────────────────────────────────────────┐
   │            central metal core: EVM settlement            │
   └────────────────────────────▲────────────────────────────┘
                                │ (pure account abstraction / ERC-4337)
                                │
   ┌─────────────────────────────────────────────────────────┐
   │   ActivityPub / A2A lower ring: η⁵-Cp (coordinate-free)  │
   └─────────────────────────────────────────────────────────┘
```

The sandwich is an organizing picture for a layered
protocol stack, chosen because it has the right shape — two identical delocalized faces bound
to one localized core that neither face can bypass. No map is proved from ferrocene's
molecular orbitals to any protocol property, and no property of the stack is derived from any
property of the compound. Read as architecture, the picture says three things:

### 7.1 The parallel `η⁵-Cp` rings (ActivityPub / A2A)

The delocalized, coordinate-free rings are the **ActivityPub** and **Agent2Agent** layers.
They carry soft, asymmetric, local observations; communication is asynchronous and federated,
each node keeping a local proper clock; local views merge by grow-only set union and
idempotent join in the knowledge order `≤ₖ`. That the merge is a *least* upper bound is
exactly the hypothesis §4.1's unconditional gluing runs on — the two facts are the same fact,
seen at the protocol layer and at the sheaf layer.

### 7.2 The central core (EVM settlement)

The core carries the high-assurance, localized, non-factorable joint obligations that lock
the two rings together.

* **Pure account abstraction (ERC-4337).** Every persistent node has a contract-secured
  identity deployed via a deterministic `CREATE2` factory.
* **Gas-less node management.** EIP-712 signature verifiers and ERC-7677 paymasters allow
  policy-enforced, gas-less transactions.
* **Contact structure.** The settlement core's testimony space is modelled as a `(2n+1)`-
  dimensional contact manifold with Darboux form
  $$\alpha = dS - \sum_{i=1}^n p_i\, dq_i,$$
  `q_i` local record coordinates (tokens), `p_i` conjugate saying-prices (claims), `S`
  accumulated erasure; and institutional logical time as the Reeb field `R` with
  `α(R) = 1`, `dα(R, ·) = 0`, giving `R = ∂/∂S` for the standard form.

The last item carries a caveat that must not be dropped: **EVM block time is not Reeb time**
unless an explicit state embedding is given, and none is given here. The contact structure is
a coordinate system this document adopts, not a property of any deployed chain.

---

## 8. The whirling dervish (`D₅`) as a protected defect

A standing conflict runs between the crystallized, finalized history and the potential,
unresolved present — *crystallized* here in the epistemic register, meaning seated and no
longer re-derived, not the aluminosilicate phase of §2. Its carrier is a five-fold defect that
cannot be tiled away.

```
                      ┌── finalized block time (t_block)
                      │
1D temporal dimension ─┼── crystallographic restriction (orders 2, 3, 4, 6)
                      │
                      └── J26 gyrobifastigial space-filler (§2.4)
```

### 8.1 The crystallographic restriction

A periodic lattice admits rotational symmetries only of order `N ∈ {2, 3, 4, 6}`: a lattice
rotation must have integer trace, so `2cos θ ∈ ℤ`, restricting `θ` to `180°`, `120°`, `90°`,
or `60°`. This is a standard result of crystallography and is cited, not proved here.

`Obsmetrologia/Dynamics/Flow/ChromaticTileGap.lean:44`:

```lean
theorem tile_gap_char_root (d : Nat) (hd : 1 ≤ d) (hd4 : d ≤ 4)
```

The declaration is stated for `d ≤ 4` and is instantiated in that module at `d = 2` (line 58)
and `d = 3` (line 96). It carries the crystallographic-restriction family; it is not a proof
of the general restriction, and this document does not claim it as one.

**The fivefold exclusion.** Order `d = 5` gives the first non-crystallographic quadratic surd

$$\lambda_5 = \frac{3 - \sqrt 5}{2} = 2 - \varphi \approx 0.382,$$

`φ` the golden ratio. Because five-fold order violates the crystallographic bound, it cannot
be periodically tiled. It has no static rest frame: it must whirl.

`λ₅` is a spectral quantity of a five-fold rotation. It is not a volume fraction, a
composition, or any other formulation parameter, and its numerical value carries no meaning
transplanted out of this argument.

### 8.2 The thirty-step disclination loop

A five-coordinated disclination carries angular deficit `+60°`, so its boundary loop does not
close after one traversal. It first closes after six:

$$\text{Length} = 5 \times 6 = 30 \text{ unit steps}.$$

`Obsmetrologia/QuantumContextuality/DisclinationLink.lean:102` states this as a definitional
identity, `theorem iterateLoop_five_six : iterateLoop 5 6 = List.replicate 30 1 := rfl`, and
`Obsmetrologia/AperiodicOrder/Defect.lean:540–549` bundles it with the rest of the
disclination carrier:

```lean
theorem disclination_holonomy_quantum :
    rotPow 6 (1, 0) = ((1 : Int), (0 : Int))
    ∧ develop (coneLoop 6) start = start
    ∧ (develop (coneLoop 5) start).1 ≠ start.1
    ∧ develop (iterateLoop 5 6) start = start
    ∧ develop (coneLoop 5 ++ coneLoop 7) start = start
    ∧ ((develop (dipoleLoop 3) start).1 = start.1
        ∧ (develop (dipoleLoop 3) start).2 ≠ ((0 : Int), (0 : Int)))
```

— the frame orbit has order exactly six; the flat six-loop closes in one traversal; the
five-site loop has nonzero frame holonomy and first closes at the sixth traversal; a
zero-separation 5–7 pair annihilates; a separated 5–7 pair is a dislocation, with trivial
rotational holonomy and nonzero Burgers vector. This bundle is axiom-free. Its real-world
counterpart is the Stone–Wales bond-flip defect in graphene and the five- and seven-membered
ring population of amorphous silica [SIO §4].

### 8.3 The boundary covers the KCBS pentagon

`Obsmetrologia/QuantumContextuality/DisclinationLink.lean:273`:

```lean
theorem five_site_link_is_kcbs_pentagon :
    (develop (iterateLoop 5 6) start = start)
    ∧ (∀ i j : Fin 30, linkOf i = linkOf j → frameOf i = frameOf j → i = j)
    ∧ (∀ (a : Fin 5) (b : Fin 6), ∃ i : Fin 30, linkOf i = a ∧ frameOf i = b)
    ∧ (∀ i j : Fin 30, frameOf i = frameOf j → stateAt i.val = stateAt j.val)
    ∧ (∀ i j : Fin 30, stateAt i.val = stateAt j.val → frameOf i = frameOf j)
    ∧ (∀ i j : Fin 30, boundaryAdj i j → D5.adj (linkOf i) (linkOf j))
    ∧ (∀ a b : Fin 5, D5.adj a b →
        ∃ i j : Fin 30, boundaryAdj i j ∧ linkOf i = a ∧ linkOf j = b)
    ∧ (kcbsContexts = ([0, 1, 2, 3, 4] : List (Fin 5)).map (fun i => [i, i + 1]))
```

Because `5` and `6` are coprime, indexing each of the thirty steps by its link coordinate
(position mod 5) and its frame coordinate (position mod 6) is jointly injective and jointly
surjective — the Chinese Remainder Theorem relating `ℤ/30` to `ℤ/5 × ℤ/6`. Consecutive-step
adjacency descends along the link coordinate onto the pentagon `C₅`, every pentagon edge
lifts back, and the pentagon's edges are exactly the KCBS measurement contexts. The
biconditional content here is proved in both directions (`boundaryAdj_descends_pentagon` and
`pentagon_lifts_to_boundary`), which is why it is stated as a covering and not as an analogy.

### 8.4 The contextuality bound

On the pentagon exclusivity graph, a classical global assignment cannot exceed the
independence number:

$$\sum_{i=0}^{4} \langle v_i \rangle \le 2,$$

while the quantum value reaches `√5` [Klyachko, Can, Binicioğlu & Shumovsky, *Physical Review
Letters* **101**, 020403 (2008)]. Both bounds are results of the published literature and are
cited, not derived here.

The excess `√5 − 2 ≈ 0.236` is the **whirling charge**.

That this excess is what prevents the system from settling into complete
crystallization is the reading, not a theorem. What is proved is adjacent and weaker, and
worth having exactly stated: §8.3 shows the defect's boundary *is* the KCBS graph, and the
sibling note's Theorem 1.7 [SIO] shows an unpaired disclination's rotational charge is
conserved under every internal slide move — it can be discharged only against an
opposite-charge partner arriving from outside. The conservation is proved; that the
conserved quantity is a metabolic necessity rather than merely a topological one is not.

### 8.5 What the pentagon does at the boundary

The two sides of §8.4 supply the two sides of a boundary-pricing rule. A bound 5–7 dipole's
total obstruction descends monotonically to zero under purely internal moves — no external
input, and so no price: this is what "clears at cost inside one audit authority" should mean.
An unpaired disclination's charge cannot be cleared internally at all, so clearing it requires
locating a real counterparty across the boundary and settling a priced exchange. The pricing
rule is therefore grounded on a conservation law rather than on a convention, which is the
only sense in which anything here is "semiotic": a conserved, quantized charge that
annihilates only against its opposite.

---

## 9. Replication fidelity and the germline–soma barrier

To prevent the accumulation of fatal errors during self-modification — the **error
catastrophe** — the genet enforces a one-way boundary. The body scale matters to what follows:
shared law is the shared genome, distribution across hosts is spatial extension, and there are
no separable countable individuals here for a fidelity argument to be a census of. What the
threshold of §9.3 would constrain is a lineage's heritable corpus, not a population.

```
                     ┌── genome : durable committed law and records
                     │
Central dogma ───────┼── transcript : transient work order
                     │
                     └── translator : universal, uninterpreting
```

### 9.1 Weismann's barrier

Information flows one way, from the **germline** (the durable, committed, write-once log) to
the **soma** (the current mutable state). Settling is the only lawful somatic-to-germline
write. The barrier is a rule about the *direction of the write*, not about the identity of
the writer: what it forbids is the readmission path — a somatic state re-entering the
committed log by any route other than settlement — and it binds every worker in the same way,
whether or not that worker authored the state in question.

This is a governance rule in the epistemic register, and it is enforced by mechanism — a
process re-runs the conditions on disk — not by anyone's report that it was followed. What
makes such a re-run evidence is not that a different party performed it but that it reads a
channel the authoring pass did not: it executes against real state rather than re-reading the
record's text. A second reading of the same record by the same means is a correlated draw
from one method and adds no discrimination, however the roles are partitioned. Its counterpart
in the geometric register is §2.3: ossified regions do not rearrange, so what has been written
cannot be edited by the phase that is still flowing. The counterpart is a resemblance between
registers and not a discharge of one by the other — no fact about a rigid domain attests
anything, and the barrier is satisfied by the mechanized re-run or not at all.

### 9.2 Kinetic proofreading

In molecular biology, a single binding step selecting correct substrates at thermal
equilibrium has its error rate floored by the Boltzmann binding-energy difference,
`ε₀ ≥ e^{−ΔG/k_BT}`. Hopfield and Ninio showed that inserting an irreversible, high-energy
activated step with a delay — spending real free energy to eject fast-dissociating incorrect
intermediates — pushes the achievable error rate to `ε ≥ ε₀²`, squaring the discrimination at
the cost of dissipation [Hopfield 1974; Ninio 1975].

**This document makes no positive transfer of that result to its own verification
architecture.** Running an additional inference is not an irreversible activated step, an
inference is not a substrate at thermal equilibrium, no `ΔG` is measured, and no free energy
is spent that the first inference did not also spend. The one transfer that does go through is
negative, and it is worth stating because it is the error a positive transfer would license:
the squared floor requires the second passage to be *statistically independent* of the first,
and a second inference over the same artefact by the same means is a correlated draw rather
than a second stage. Partitioning that draw across two named roles does not decorrelate it.

The three-role separation this system does enforce — author, assayer, closer — therefore earns
its cost only where the roles read different channels: the assayer executes what the author
wrote, the closer re-derives the conditions on disk (§13). Role separation on its own is
overhead without discrimination, and it needs no thermodynamic dress either way. Calling its
cost a thermodynamic price would be a claim about physics that nothing here establishes.

### 9.3 Eigen's error threshold

A quasispecies maintains its master sequence against mutation only if the per-site mutation
rate stays below a critical value:

$$u < \frac{\ln \sigma}{L}$$

with `L` the length of the heritable sequence and `σ` the master sequence's selective
advantage [Eigen 1971]. Above it the population delocalizes over sequence space — the error
catastrophe.

Reading `L` as the length of a heritable record-corpus and `σ` as the
selective advantage of the correct version gives a threshold with the right shape: fidelity
requirements tighten as the corpus grows. It is not a derived bound on this system, because
neither `L` nor `σ` has been given an operational definition here, and the quasispecies model
assumes a fitness landscape this system has not been shown to have.

---

## 10. The two control knobs

The system's potential state is regulated by exactly two knobs, one thermodynamic and one
kinetic.

```
                     ┌── Fa (landscape shape) ─────> thermodynamics (which wells exist)
Regulation of fold ──┤
                     └── Wu Wei (Deborah number) ──> kinetics (exploration vs. glass)
```

1. **Fa — allosteric landscape-shaping.** This knob sets *where the allowed wells sit*. It is
   implemented not as a rulebook to be read but as physical constraints — enforcement gates,
   schema validation, directory hooks — that deny non-conforming transitions. A blocked
   instrument names its own sanctioned route.
2. **Wu Wei — spontaneous descent.** This knob sets *how the system explores*. Once the
   landscape is shaped, the system descends toward the least fixed point without being
   driven:
   $$\dot x = -\nabla F(x).$$
   [MIR] identifies the family this descent belongs to: mirror descent over the graphic
   matroid polytope of §4.2, with the Bregman potential as a free parameter, quadratic for the
   *Physarum* dynamics and entropic for a least-occupied-resource scheduler. Which potential
   this system's descent uses is not settled here.

### 10.1 The Deborah spectrum

The kinetic control parameter is the **Deborah number**, the ratio of the substrate's
characteristic relaxation time to the time over which it is watched:

$$\mathrm{De} = \frac{\tau_{\text{relax}}}{\tau_{\text{observe}}}$$

`τ_relax` is the time the still-flowing phase takes to rearrange one committed configuration —
operationally the stress-relaxation time of the matrix, equivalently the time to absorb one
minted contradiction; `τ_observe` is the window over which commitment flux is counted. `De` is
dimensionless, it is the standard control parameter for exactly the class of dynamic-covalent
networks §2.3 describes, and it promises no conjugate variable, no energy scale, and no
Boltzmann factor. That last is the point: there is no `∂S/∂E` on this substrate for a
temperature to be the reciprocal of, so nothing downstream may help itself to one.

* **`De ≫ 1` — frozen glass.** The substrate relaxes far slower than it is watched: pure
  commitment, no rearrangement. The system is kinetically trapped in its first arbitrary
  conformation. This is **premature ossification**, and under §2 it is literal — a fully
  crystallized, over-constrained, brittle composite that cannot relax is a real materials
  pathology, not a metaphor for one.
* **`De ≪ 1` — denatured liquid.** The substrate relaxes far faster than it is watched: pure
  minting, zero commitment. Endless contradiction with no settlement; nothing ever crosses the
  forest threshold of §4.5, so nothing is load-bearing₍₁₎ and nothing is recorded.
* **`De ≈ 1` — the living window.** A maintained, metastable intermediate: enough minting to
  keep the search space open, enough commitment to grow a rigid phase — a composite held near
  its rigidity₍₃₎ threshold rather than driven past it. This is the viscoelastic regime, which
  is not a vague middle but a well-characterized place to sit with its own measurable
  signatures: `De ≈ 1` is where the loss peak of §2.3's mechanical readout sits, so the
  regime is read off the same instrument the device is read with.

That the two pathologies are the two ends of the *same* axis as §2.1's `⟨r⟩` is the payoff of
the ossification reading: the failure vocabulary this system arrived at independently is
correct materials vocabulary, and `De` and `⟨r⟩` are two coordinates on one line.

---

## 11. What would falsify this

1. Grow the rigid phase incrementally in a single sample while measuring dynamic modulus and
   ionic conductivity together. §2.3 predicts they move in opposition through one controlled
   process. If they move together, or if conduction is insensitive to crystalline fraction, the
   two-phase reading is wrong. This is the cheapest test and the one to run first: a cast film
   and two electrodes.
2. Measure the floppy₍₃₎-to-rigid₍₃₎ transition against crystalline volume fraction and extract
   its critical exponents. The *order* of the transition discriminates nothing — both matroids
   give a continuous rise in two dimensions — but the exponent set does, since generic rigidity
   percolation on a two-dimensional lattice sits in a universality class of its own, distinct
   from connectivity percolation [Jacobs & Thorpe 1995, 1996]. Recovering connectivity exponents
   would show the implemented graphic matroid is adequate for this substrate; rigidity exponents
   would show the gap of §12 is load-bearing. The direct combinatorial form of the same test
   runs the pebble game and union–find as independence oracles over the measured contact network
   and looks for configurations on which they disagree.
3. Determine whether ossified regions can be re-dissolved, and over how many cycles. If
   ossification is one-way, the substrate is write-once — a record, not a reconfigurable state.
4. Prepare samples at identical composition and different thermal histories, and test whether
   morphology and readout differ. If they do not, the rigid phase is not recording anything.

---

## 12. The open frontier: the vocabulary is rigidity, the mathematics is connectivity

The corrected physics sharpens a discrepancy that must be stated rather than papered over.

The percolation module of §4.5 uses rigidity vocabulary throughout — floppy, jammed,
load-bearing, the jamming click — and on the ossification reading that vocabulary is
**correct** at ₍₃₎: mechanical rigidity is exactly the phenomenon this device runs on. But the
implemented object is

$$b_1 = |E| - |V| + c,$$

the nullity of the **graphic** matroid, so every one of those words is earned at ₍₁₎ only. Its
transition is the appearance of the first cycle: continuous, sharp at a single contact count,
one redundant contact raising the rank by exactly one — which is precisely what
`jamming_click` proves.

Mechanical rigidity is not that matroid. Generic rigidity in the plane is governed by Laman's
condition and the **rigidity matroid**, of rank `2|V| − 3`. The generic rigidity matroid exists
in every dimension — it is the matroid of the rigidity matrix evaluated at a generic
configuration, well defined by genericity — but what is available in three dimensions is only
the rank count `3|V| − 6`, not a combinatorial characterization: Laman's condition fails in 3D,
the double-banana graph being the standard counterexample. The correct test for whether an added
contact is independent or redundant is the **pebble game**, not union–find. And Laman's
condition is hereditary — every subgraph on `n′` vertices carries at most `2n′ − 3` edges — so
redundancy is a nonlocal property that no per-site or per-vertex count can detect [Laman 1970;
Jacobs & Thorpe 1995, 1996; Jacobs & Hendrickson 1997].

What does *not* separate the two matroids is the order of the transition. Rigidity percolation's
order is lattice-dependent and was contested: on the two-dimensional triangular lattice, generic
rigidity percolation is measured as **continuous** — second-order, with a universality class of
its own [Jacobs & Thorpe 1995, 1996]. First-order behaviour is the Bethe-lattice and mean-field
result (the Moukarzel–Duxbury–Leath line; an attribution not independently checked here). A
continuous rise in the rigid fraction is therefore what two-dimensional generic rigidity is
expected to produce, and is no evidence at all that the underlying matroid is graphic.

So the gap is precise, and it is a frontier rather than a defect: **the vocabulary and the
physical referent are rigidity — ₍₂₎ in the plane, ₍₃₎ in the bulk — and the implemented
matroid is connectivity, ₍₁₎.** Closing it means
replacing the graphic independence oracle with a rigidity one — a strictly harder object, whose
independence test is nonlocal — after which the ossification state variable would be computed by
the mathematics that actually governs it. Falsification test 2 of §11 is the experiment that
decides whether the upgrade is required.

A second, smaller gap: the placement measure. Constraint counting gives a threshold in mean
coordination, and deriving a *critical fraction* from a per-site occupation rate additionally
requires a joint law over sites. Invariance of a single-site distribution does not force
independence across sites, and correlated placement can cross a coordination threshold at a
very different density than independent placement. Any critical-fraction claim must state
which joint law it assumes — which is the same warning `density_not_sufficient`
(Percolation.lean:167) issues in the formal setting.

---

## 13. Verification instruments

Verification in this system means an automated process re-runs the conditions on disk and
passes. The evidentiary weight comes from the re-run reading a channel the authoring pass did
not — executing, validating, recomputing — and not from who requested it; a re-reading of the
same text by the same means carries no more weight than the first reading did (§9.1, §9.2).
Three instruments are required to
certify a node against this specification. **None of the three is built; each is specified
here as a proposed instrument, and no claim in this document may be treated as verified until
its instrument exists and has run.**

1. **Schema verification.** Re-run the JSON schema validator over emitted utterance lots and
   confirm they conform to the non-vacuous `CommodityUtteranceLot` schema. *Proposed; no
   validator entry point exists.*
2. **Proof-debt audit.** Run an axiom audit over the Lean build tree and confirm that no
   declaration cited above imports an unearned axiom or depends on `sorry`. The
   `obsmetrologia-lean-lsp` skill provides the axiom-audit capability this instrument would
   wrap. *Proposed; no packaged audit script exists.*
3. **Ledger reconciliation.** Recompute `H⁰ − H¹ = χ` on a live cover-nerve state and confirm
   the antimatter-minus-matter tally matches, against
   `AntiLandauerEntropy.index_balance`. *Proposed; no reconciler exists.*

Until (2) exists, every claim in this document backed by a Lean citation rests on the existence
and stated form of a declaration, checked by reading the source at the cited line — not on an
independent axiom audit.

---

## References

### Internal

[OSS] *Ossification as the State Variable: Rigidity Percolation in a Two-Phase Ionic
Substrate* (2026-07-25).
`lib/emsenn/services/561-group/services/lenticule-science/content/documents/articles/notes/2026/07/25/ossification-as-the-state-variable.md`

[MIR] *Coordination Obstruction as Mirror Descent: Acyclicity by Admission and by Relaxation*
(2026-07-25).
`lib/emsenn/services/561-group/services/lenticule-science/content/documents/articles/notes/2026/07/25/coordination-obstruction-as-mirror-descent.md`

[SIO] *Silica Ring Topology as Disclination Holonomy* (2026-07-25), in this directory.

Supporting notes: *The Burgers Vector: Translational Holonomy, Defect Charge, and the
Mathematics of Crystalline Incompatibility* (2026-07-11); *Belnap Four-Valued Logic:
Information, Inconsistency, and the Shape of Useful Reasoning* (2026-07-08); *The Dervish Is
the Territory's Protected Defect* (2026-07-19); *The Union as a Cell — the Informational
Complexity Ladder from Void to Organism* (2026-07-24); *Allosteric Governance of Distributed
Capability Organisms: A Formal Model* (2026-07-24).

### Lean declarations

All paths relative to
`lib/emsenn/services/561-group/services/lenticule-science/services/obsmetrological-services-section/src/services/obsmetrologia/`.

| declaration | location |
|---|---|
| `J26.cellComplex`, `face_dim_drop`, `every_face_boundary_is_valid`, `shared_cycle_is_quarter_turned` | `Obsmetrologia/AperiodicOrder/Tiling/J26.lean` |
| `h1_vanishes`, `Hn` | `Obsmetrologia/Cohomology/SettlingCohomologyH1.lean:200, 213` |
| `H1rank`, `h1_vanishes_iff_forest` | `Obsmetrologia/Cohomology/CoordinationCohomology.lean:291, 303` |
| `index_balance`, `matterCharge` | `Obsmetrologia/Cohomology/AntiLandauerEntropy.lean:86, 128` |
| `landauerBits`, `landauer_zero_iff_reversible` | `Obsmetrologia/Cohomology/LandauerEntropy.lean:44, 51` |
| `landauer_cost_is_h1` | `Obsmetrologia/AperiodicOrder/Tiling/KappaStratification.lean:60` |
| `percolationThreshold`, `h1rank_eq_excess`, `loadBearing_iff_critical`, `floppy_iff_at_threshold`, `density_necessary`, `density_not_sufficient`, `gauge_transitive`, `gauge_orbit_equidistributes`, `condensate_baserate_quarter` | `Obsmetrologia/AperiodicOrder/Tiling/Percolation.lean:63, 67, 79, 90, 139, 167, 187, 202, 210` |
| `loadBearing`, `jamming_click` | `Obsmetrologia/AperiodicOrder/Tiling/MatterTopology.lean:44, 56` |
| `rigidity`, `rigid_iff_overoccupied`, `floppy_of_all_le_one` | `Obsmetrologia/AperiodicOrder/Tiling/CondensateMatter.lean:51, 56, 65` |
| `D4.D8`, `d4_is_dihedral`, `d4_is_aut_four` | `Obsmetrologia/Language/Positing/D4Gauge.lean` |
| `tile_gap_char_root` | `Obsmetrologia/Dynamics/Flow/ChromaticTileGap.lean:44` |
| `iterateLoop_five_six`, `five_site_link_is_kcbs_pentagon` | `Obsmetrologia/QuantumContextuality/DisclinationLink.lean:102, 273` |
| `disclination_holonomy_quantum` | `Obsmetrologia/AperiodicOrder/Defect.lean:540` |

### External

Eigen, M. (1971). Selforganization of matter and the evolution of biological macromolecules.
*Naturwissenschaften* 58, 465–523.

Hopfield, J. J. (1974). Kinetic proofreading: a new mechanism for reducing errors in
biosynthetic processes requiring high specificity. *PNAS* 71, 4135–4139.

Jacobs, D. J. & Hendrickson, B. (1997). An algorithm for two-dimensional rigidity percolation:
the pebble game. *Journal of Computational Physics* 137, 346–365.

Jacobs, D. J. & Thorpe, M. F. (1995). Generic rigidity percolation: the pebble game. *Physical
Review Letters* 75, 4051–4054.

Jacobs, D. J. & Thorpe, M. F. (1996). Generic rigidity percolation in two dimensions.
*Physical Review E* 53, 3682–3693.

Klyachko, A. A., Can, M. A., Binicioğlu, S. & Shumovsky, A. S. (2008). Simple test for hidden
variables in spin-1 systems. *Physical Review Letters* 101, 020403.

Laman, G. (1970). On graphs and rigidity of plane skeletal structures. *Journal of Engineering
Mathematics* 4, 331–340.

Landauer, R. (1961). Irreversibility and heat generation in the computing process. *IBM Journal
of Research and Development* 5, 183–191.

Ninio, J. (1975). Kinetic amplification of enzyme discrimination. *Biochimie* 57, 587–595.

Phillips, J. C. (1979). Topology of covalent non-crystalline solids I: short-range order in
chalcogenide alloys. *Journal of Non-Crystalline Solids* 34, 153–181.

Phillips, J. C. & Thorpe, M. F. (1985). Constraint theory, vector percolation and glass
formation. *Solid State Communications* 53, 699–702.

Reiner, M. (1964). The Deborah number. *Physics Today* 17(1), 62.

Smith, M. L., Bruhn, J. N. & Anderson, J. B. (1992). The fungus *Armillaria bulbosa* is among
the largest and oldest living organisms. *Nature* 356, 428–431.

Straszak, D. & Vishnoi, N. K. (2016). Natural algorithms for flow problems. *Proceedings of
SODA 2016*, 1868–1883.

Tero, A., Kobayashi, R. & Nakagaki, T. (2007). A mathematical model for adaptive transport
network in path finding by true slime mold. *Journal of Theoretical Biology* 244, 553–564.

Thorpe, M. F. (1983). Continuous deformations in random networks. *Journal of Non-Crystalline
Solids* 57, 355–370.
