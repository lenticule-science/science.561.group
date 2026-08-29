---
title: "Three Ways to Retune the Exchangeable Population: Metal–Ligand Coordination, Diselenide Substitution, and a Second Exchange Register"
description: "Metal-ligand coordination (catechol-Fe, histidine-metal, terpyridine-metal) separates crosslink schema from swappable, non-covalent, runtime-tunable kinetics; diselenide substitution is the covalent-tuning contrast on the same rate axis; Diels-Alder/retro-Diels-Alder is a second, dissociative exchange mechanism on a different axis entirely. Stacking populations at separated timescales extends the existing exchangeable-fraction bound to a genuine multi-tier spectrum rather than one number."
date-created: 2026-07-25
kind: research-note
keywords:
  - metal-ligand-coordination
  - diselenide
  - diels-alder
  - dynamic-covalent-chemistry
  - crosslink-density
  - vitrimers
status: design
declared-by: claude-interactive-session-supplying-lenticule-science
---
# Three Ways to Retune the Exchangeable Population: Metal–Ligand Coordination, Diselenide Substitution, and a Second Exchange Register

## Abstract

The organosulfur note settled one exchangeable population — aliphatic disulfide, associative,
one barrier, one timescale — and left the aromatic/aliphatic choice as the only tuning knob it
named. Three more knobs exist, and they are not the same kind of knob. Metal–ligand
coordination retunes exchange rate without touching the covalent network at all: the ligand is
fixed at synthesis, a swappable metal ion sets the kinetics afterward, non-covalently and
reversibly, over a range the Irving–Williams series already quantifies. Diselenide substitution
retunes the same rate by the opposite method — a covalent, synthesis-time change, one row down
group 16. Diels–Alder/retro-Diels–Alder is not a rate knob on this axis at all; it is a second,
dissociative exchange mechanism, and mixing it in gives the substrate a clean full-reset
register alongside disulfide's local-rewrite one. Stacking these at genuinely separated
timescales does not just add capacity to the existing exchangeable fraction — it extends the
semiotic-foam note's single-population bound (Prop 5.2 there) into a real multi-tier
relaxation spectrum, and gives that same note's timescale-separation requirement
(Prop 7.1 there) a three-way version instead of a two-way one.

---

## 1. Two axes, not one

Everything that retunes an exchangeable population does one of two structurally different
things, and the distinction is worth stating before naming any chemistry, because it is what
organizes the rest of this note.

**Rate-tuning.** The mechanism stays associative — a third party attacks, displaces, leaves
free to catalyze again, connectivity never drops mid-exchange — and only the barrier height
changes. This is a dial: turn it, and the same qualitative behavior happens faster or slower.

**Mechanism-type change.** The exchange stops being associative at all. A dissociative
mechanism passes through a genuinely disconnected intermediate; a coordinative one is not a
covalent bond in the first place. These are not faster or slower versions of the same thing —
they are different things, with different guarantees (associative exchange never drops
connectivity; dissociative exchange does, briefly, by design).

§2 (metal–ligand) and §3 (diselenide) are both rate-tuning, by two different routes — one
non-covalent and swappable, one covalent and fixed. §4 (Diels–Alder) is a mechanism-type
change and does not belong on the same axis as the other two; keeping it separate is the
point of §4, not an oversight.

---

## 2. Metal–ligand coordination: the schema/instance separation

### 2.1 Catechol–Fe(III): one intensive variable, discrete stoichiometric states

Mussel byssus threads achieve near-covalent elastic moduli from reversible coordination bonds
by exploiting the pH-dependent stoichiometry of catechol (from DOPA, 3,4-dihydroxy-
phenylalanine) binding Fe³⁺: mono-catechol complexes dominate at low pH, bis- around
neutral-to-mildly-basic pH, and tris-catechol complexes — the stiffest, highest-functionality
state — dominate above roughly pH 9.5 (Holten-Andersen et al. 2011). This is not a continuous
rate change. It is a single intensive variable, pH, driving the crosslink through discrete
functionality states — mono ($f \approx 1$), bis ($f \approx 2$), tris ($f \approx 3$) — with
measurably different bulk modulus at each state, approaching covalent-network stiffness at
the tris state despite every bond remaining reversible and non-covalent.

This is a third instance of the pattern this corpus's carriers note already found twice: a
single intensive variable (there, $T$ for rate and $E_h$ for census) setting a population's
behavior. Catechol–Fe adds a third case that neither of the first two has — the variable sets
not a rate and not a fraction, but a *discrete crosslink functionality*, stepwise, with
directly measurable mechanical consequences at each step. pH is addressable and reversible in
a way $E_h$ is argued to be but $T$'s Joule-heating delivery is not (§2.1 of the carriers
note): a pH shift can in principle be delivered locally, by a photoacid or photobase generator
exactly as already used for the disulfide system, giving catechol–Fe crosslink density the
same optical write path already built for the sulfur chemistry, for free.

### 2.2 Histidine–metal: the Irving–Williams series as a swap-in rate dial

Histidine's imidazole nitrogen coordinates divalent first-row transition metals with relative
complex stability set by the Irving–Williams series: $\mathrm{Mn^{2+} < Fe^{2+} < Co^{2+} <
Ni^{2+} < Cu^{2+} > Zn^{2+}}$ (Irving & Williams 1953), an ordering set by ligand-field
stabilization energy that rises across the first half of the series and by Jahn–Teller
stabilization at $\mathrm{Cu^{2+}}$, then drops sharply at $\mathrm{Zn^{2+}}$, whose filled
$d^{10}$ shell carries zero ligand-field stabilization at all. Zero LFSE is exactly what makes
$\mathrm{Zn^{2+}}$ complexes kinetically labile — ligand exchange proceeds with essentially no
crystal-field barrier to overcome — while $\mathrm{Ni^{2+}}$ complexes, with substantial
octahedral LFSE, are comparatively inert. The practical consequence, already exploited in
engineered metal-coordinating hydrogels: the same histidine-bearing scaffold, unmodified,
exchanges on a timescale set entirely by which metal salt it was equilibrated with.

The underlying rate trend is mechanistically specific, not a bare correlation: water exchange
on octahedral first-row divalent aqua ions proceeds by a dissociative-interchange ($I_d$)
pathway (Eigen & Wilkins 1965), whose rate is set by how much LFSE is lost on the way to the
lower-coordinate transition state. Reported water-exchange rate constants for
$[\mathrm{M(H_2O)_6}]^{2+}$ span roughly five orders of magnitude across the series
commonly used in these hydrogels — $\mathrm{Ni^{2+}} \sim 10^4\ \mathrm{s^{-1}}$ (highest LFSE
loss, slowest), through $\mathrm{Co^{2+}}$ and $\mathrm{Fe^{2+}}$ in the $10^6\ \mathrm{s^{-1}}$
range, to $\mathrm{Zn^{2+}}$ and $\mathrm{Mn^{2+}}$ near $10^7\ \mathrm{s^{-1}}$ (zero LFSE at
$d^{10}$ and high-spin $d^5$ respectively) — with figures given to order of magnitude only, not
independently re-derived here (Richens 1997; standard inorganic-chemistry compilations).
$\mathrm{Cu^{2+}}$ is the trend's own counterexample and is worth keeping rather than smoothing
over: it is anomalously fast, near $10^9\ \mathrm{s^{-1}}$, because dynamic Jahn–Teller
distortion of its $d^9$ octahedron continuously lowers the effective barrier rather than
raising it the way a static LFSE argument alone would predict. Ligand-exchange rate on a fixed
histidine scaffold is therefore not merely "tunable by metal choice" in the abstract; it is
tunable across roughly five decades by a mechanism with a named exception, and the exception
is itself informative — it says the schema/instance separation of §2.4 inherits whatever
irregularities the guest ion's own electronic structure has, not a clean monotonic dial.

This is the schema/instance separation named in the plan for this note, stated exactly. The
ligand — histidine, covalently part of the network from synthesis — is the schema. The metal
ion is not part of the network's covalent structure at all; it occupies a coordination site
the ligand was built to offer, and it can be exchanged for a different metal after the fact,
non-destructively, by exposing the material to a different metal salt solution. Every other
rate-tuning knob named anywhere in this corpus's chemistry — aliphatic vs. aromatic disulfide,
mono- vs. poly-sulfidic bridges, §3's diselenide — requires resynthesis to move. This one does
not. The tunable parameter lives in the instance, not the type.

### 2.3 Terpyridine–metal: a chromophore-selective, thermally-mediated write mechanism

Bis-terpyridine complexes of $\mathrm{Zn^{2+}}$ or lanthanide ions, used as chain-end
crosslinks in telechelic metallosupramolecular polymers, are optically healable: irradiating
the material heals scratches and cuts at the metal-ligand junction specifically, without
melting or damaging the bulk polymer around it (Burnworth et al. 2011). The mechanism as
reported is not direct photochemical bond cleavage in the sense §2.3 of the carriers note
describes for a PAG or an aryl disulfide — it is the metal-ligand complex's own strong,
localized absorption converting the incident light rapidly to heat concentrated exactly at
the junction, transiently exceeding the local dissociation temperature there while the bulk
matrix, which does not absorb at that wavelength, stays cool.

This looks, at first, like a case the carriers note's own §2 taxonomy has no clean slot for:
it is *specific* in the sense that matters there — addressed to the chromophore, not diffuse
through the bulk, exactly because the absorption cross-section is localized to the
metal-ligand stack — but the actual bond-breaking event is ordinary thermal dissociation, the
mechanism of §2.1 there, not a quantized photochemical step with a quantum-yield ceiling.
Chromophore-selective *local heating* is a third light *mechanism*, distinct from both diffuse
Joule-equivalent heating and quantum-yield-limited photochemistry: it inherits spatial
precision from having a localized absorber, and it inherits its actual chemistry — an ordinary
thermal process, no quantum yield ceiling, no catalytic turnover — from being heat once it
arrives.

It does not, on inspection, need a new cell. The carriers note's four-cell grid sorts by two
questions only — is the event addressed to something specific or diffuse through the bulk, and
is something genuinely spent — and answers neither by asking whether the physical mechanism
delivering the event is photochemical or thermal. Terpyridine–metal healing is addressed
(localized to the chromophore) and costed (the absorbed energy is dissipated as heat and not
recovered): specific-and-costed, the same cell PAG/PBG release and direct aryl-disulfide
cleavage already occupy, populated here by a third, mechanistically distinct route into it.
What is new is not a fifth cell but a demonstration that the grid's two questions are coarser
than "which physical mechanism did this" — two events can land in the same cell by unrelated
physics, which is a stronger claim for the grid's generality than a taxonomy that needed a new
cell for every new mechanism would have been.

### 2.4 What none of this required: the covalent network never changed

Across §2.1–2.3, the covalent backbone — whatever matrix it is grafted to — is never touched.
Every tuning event is: expose to a different pH, expose to a different metal salt, or shine
light on an already-present chromophore. This is the structural fact worth carrying forward:
metal–ligand coordination is not a fourth chemistry alongside disulfide, diselenide, and
Diels–Alder in the sense of being one more option to formulate with at synthesis. It is a
tuning mechanism that operates entirely after synthesis, on a network that was fixed the
moment it cured.

---

## 3. Diselenide: the covalent-tuning contrast

Selenium sits one row below sulfur in group 16, and the $\mathrm{Se-Se}$ bond is
substantially weaker than $\mathrm{S-S}$ — bond dissociation energies in the general
neighborhood of 170 and 240 kJ/mol respectively, by standard inorganic bond-energy
compilations; exact values are compound-dependent and not independently re-derived here.
Diselenide undergoes the same associative exchange mechanism as disulfide — a third
selenolate or thiolate-equivalent nucleophile attacks, displaces, leaves free — at
measurably lower barrier, sometimes proceeding without added catalyst under ambient or mild
photochemical conditions given the weaker bond and the better radical-stabilizing,
more polarizable selenium orbitals.

Diselenide is therefore the same rate axis as §2, tuned by the opposite method: a covalent
substitution, decided at synthesis, immovable afterward without resynthesis. The pairing with
§2 is the point. Both retune the identical rate axis — how fast the exchangeable population
rearranges — and they occupy opposite ends of a second axis this note has not yet named:
whether the tuning is available before the network exists (diselenide: choose the chalcogen)
or after it exists (metal–ligand: choose the occupant). A formulation is not required to pick
one; §5 asks what stacking both gets.

One thing diselenide inherits directly from the organosulfur note's own argument against
aromatic disulfide: a bond this labile, used as the *entire* exchangeable population, risks
the same room-temperature-creep failure aromatic disulfide was rejected for. Diselenide's
use case is not as a replacement for the aliphatic disulfide population but as an additional,
faster-exchanging tier alongside it — which is exactly §5's question.

---

## 4. Diels–Alder / retro-Diels–Alder: a second exchange register

Furan–maleimide Diels–Alder chemistry is the canonical thermally reversible cycloaddition
used in remendable polymer networks (Chen et al. 2002): the adduct forms readily at moderate
temperature and undergoes clean retro-Diels–Alder at elevated temperature, with no catalyst,
no radical intermediate, and no side reaction competing for the same bond. Unlike thiol–ene
addition or disulfide exchange, both of which are treated in this corpus as associative
processes that never pass through a state in which the record is unheld, Diels–Alder cycling
genuinely disconnects: the retro reaction breaks the bond completely before the forward
reaction, run at lower temperature, remakes it.

The organosulfur note names thermal homolysis — the dissociative alternative to associative
disulfide exchange — as "precisely the unauthorized route," the failure mode the whole
associative apparatus exists to prevent. Diels–Alder/retro-Diels–Alder is the same
topological event, dissociation before reconnection, made clean, catalyst-free, and
thermally sharp rather than radical and uncontrolled. It is not a better version of
associative exchange; it is the legitimate version of the route associative exchange was
built to avoid, available when a full disconnection is actually wanted rather than merely
tolerated.

That gives the substrate two qualitatively different write operations rather than one:

| | mechanism | passes through disconnection | use |
|---|---|---|---|
| disulfide exchange | associative | never | local rewrite, connectivity preserved throughout |
| Diels–Alder cycling | dissociative, clean | yes, by design | full reset, deliberate and bounded |

Local patch versus full rebuild, both sanctioned, distinguished by which one is permitted to
pass through a disconnected intermediate — echoing this note's own §1 distinction between
rate-tuning and mechanism-type change, but at the level of two entire exchange chemistries
rather than one dial.

---

## 5. Stacking populations: three timescales, not one exchangeable fraction

The semiotic-foam note's Prop 5.2 bounds a single exchangeable fraction between a floor (enough
mobility for the pinned phase to reorganize) and a ceiling (creep tolerance) — one number,
one population. §§2–4 give three populations with structurally different relaxation times:

$$\tau_{\text{pinned}} \;\gg\; \tau_{\text{disulfide/diselenide}} \;\gg\; \tau_{\text{metal-ligand}}$$

covalent-immobile, covalent-exchangeable-but-slow, and non-covalent-exchangeable-and-fast,
in that order — with Diels–Alder available as a fourth, qualitatively distinct operation
(full disconnection, thermally gated) rather than a fourth point on this timescale axis.

This is not merely more capacity inside the same bound. The semiotic-foam note's Prop 7.1
requires wall relaxation times separated by at least the ratio of write interval to retention
interval for a structure to be simultaneously a record and a workspace — stated there for
*two* populations, pinned and exchangeable. Three populations at three separated timescales
give that requirement a second, independent margin: a fast metal–ligand tier can absorb
frequent, small, reversible rewrites without ever calling on the slower disulfide population,
which is then free to hold state at a longer retention interval than a single-population
design could offer, because it is no longer also the layer absorbing every small write. The
metal–ligand tier is not competing with disulfide for the same job; it is taking a job — high-
frequency, low-consequence rewrite — off disulfide's timescale entirely, the same relief that
motivated separating $T$ from $E_h$ as independent knobs in the organosulfur note's §5, applied
here to relaxation time rather than to rate versus census.

Whether this actually holds under load — whether a real three-tier network shows genuinely
separated relaxation peaks rather than one broadened one — is an empirical question §6 states
as a test, not a conclusion asserted here.

---

## 6. Falsification tests

1. **Discrete stoichiometric states, not a continuum.** Measure bulk modulus of a catechol–Fe
   network across a pH sweep. §2.1 predicts step-like plateaus at the mono/bis/tris
   transitions, not a smooth monotonic rise — a smooth curve would mean the discrete-state
   reading is wrong and the system behaves as an ordinary continuous binding equilibrium
   instead.
2. **Metal-swap without resynthesis.** Equilibrate one histidine-bearing sample against
   $\mathrm{Zn^{2+}}$ and a second against $\mathrm{Ni^{2+}}$ from the same parent network,
   and measure stress-relaxation time for each. §2.2 predicts a large, measurable difference
   with no other change to the material; a null result would falsify the schema/instance
   separation as stated.
3. **Local versus bulk heating in terpyridine–metal healing.** Measure bulk temperature rise
   during optical healing against the temperature at the junction itself (e.g., by IR
   thermography at high spatial resolution). §2.3 predicts the junction transiently exceeds
   the bulk by a wide margin; comparable heating throughout would mean the mechanism is
   ordinary bulk absorption, not chromophore-localized heating, and §2.3's claimed hybrid
   light-regime does not actually apply to this system.
4. **Diselenide barrier, measured rather than assumed.** Compare stress-relaxation time of a
   matched diselenide- and disulfide-crosslinked sample at fixed temperature. §3 predicts the
   diselenide sample relaxes measurably faster; comparable relaxation would mean the
   assumed BDE gap does not translate to a measurable kinetic difference in this network.
5. **Three separated relaxation peaks.** Run a frequency sweep (dynamic mechanical analysis)
   on a network stacking a pinned covalent phase, a disulfide population, and a metal–ligand
   population. §5 predicts three distinguishable relaxation processes at three separated
   frequencies; a single broadened peak would falsify the separated-timescale reading and
   suggest the populations are not kinetically independent in practice.

---

## 7. Status of claims

**Established chemistry, transferred but not originated here.** Catechol–Fe³⁺ pH-dependent
mono/bis/tris stoichiometry and its near-covalent stiffness at the tris state
(Holten-Andersen et al. 2011). The Irving–Williams series and its ligand-field-stabilization
basis (Irving & Williams 1953). The Eigen–Wilkins dissociative-interchange mechanism for
octahedral water exchange and its LFSE-set rate trend, including the Jahn–Teller-driven
exception at $\mathrm{Cu^{2+}}$ (Eigen & Wilkins 1965; Richens 1997 for the compiled rate
constants, order-of-magnitude only). Optically healable terpyridine–metal metallosupramolecular
polymers and their localized-heating mechanism (Burnworth et al. 2011). Furan–maleimide
Diels–Alder as a clean, catalyst-free, thermally reversible cycloaddition used in remendable
networks (Chen et al. 2002). The general ordering $\mathrm{Se-Se}$ weaker than
$\mathrm{S-S}$, from standard inorganic bond-energy compilations; exact values not
verified here.

**Interpretive transfer, argued here and not established in any source literature.** Catechol–
Fe read as a third instance of the single-intensive-variable pattern this corpus has already
used for $T$ and $E_h$. The schema/instance framing of §2.2 and §2.4, and the reading of its
Cu²⁺ exception as evidence the separation inherits the guest ion's own irregularities rather
than offering a clean monotonic dial. The rate-tuning/mechanism-type axis of §1, and the
before-synthesis/after-synthesis axis named in §3, as the two organizing distinctions for this
whole family of chemistries. §5's reading of three separated timescales as extending Prop 7.1
and Prop 5.2, both of the semiotic-foam note, rather than merely adding capacity within a
single-population bound.

**Resolved in this pass.** §2.3's terpyridine–metal healing does not need a new cell in the
carriers note's grid: it is specific-and-costed by that grid's own two sorting questions
(addressed, and something is genuinely spent), populating the same cell as PAG/PBG release and
direct aryl-disulfide cleavage by a mechanistically distinct route — evidence the grid sorts
by locality and cost rather than by which physical mechanism is doing the work, which is a
stronger form of the same claim than "a third carrier also fits" was on its own.

**Assumed, and flagged.** That the specific numeric BDE gap between $\mathrm{Se-Se}$ and
$\mathrm{S-S}$ translates into a proportionate, measurable kinetic gap in this network
specifically, rather than being masked by a different rate-limiting step. That §5's three
timescales are actually well separated in a real stacked network rather than overlapping —
asserted as a design goal, not shown. That the Eigen–Wilkins water-exchange rate ordering
transfers cleanly to histidine-imidazole coordination rather than only to aqua ligands, which
is the literature it is actually measured on.

**Unbuilt.** None of §2–§4 has been formulated or measured in this corpus's actual substrate.
Everything here is a proposal for what to add and what it should do, checked against
established literature for each chemistry in isolation, not against each other in
combination.

---

## References

Holten-Andersen, N., Harrington, M. J., Birkedal, H., Lee, B. P., Messersmith, P. B.,
Lee, K. Y. C. & Waite, J. H. (2011). pH-induced metal-ligand cross-links inspired by mussel
yield self-healing polymer networks with near-covalent elastic moduli. *PNAS* 108, 2651.

Irving, H. & Williams, R. J. P. (1953). The stability of transition-metal complexes.
*Journal of the Chemical Society*, 3192.

Eigen, M. & Wilkins, R. G. (1965). The kinetics and mechanism of formation of metal
complexes. *Advances in Chemistry Series* 49, 55.

Richens, D. T. (1997). *The Chemistry of Aqua Ions*. Wiley. (Compiled water-exchange rate
constants for first-row divalent transition-metal aqua ions.)

Burnworth, M., Tang, L., Kumpfer, J. R., Duncan, A. J., Beyer, F. L., Fiore, G. L.,
Rowan, S. J. & Weder, C. (2011). Optically healable supramolecular polymers. *Nature* 472, 334.

Chen, X., Dam, M. A., Ono, K., Mal, A., Shen, H., Nutt, S. R., Sheran, K. & Wudl, F. (2002).
A thermally re-mendable cross-linked polymeric material. *Science* 295, 1698.

Housecroft, C. E. & Sharpe, A. G. (2018). *Inorganic Chemistry*, 5th ed. Pearson.
(General bond-energy compilation, chalcogen-group trends.)

---

## Prior work in this corpus

- *Dual Organosulfur Crosslink Populations* (2026-07-25) §4, §4.1, §5 — the
  associative/dissociative distinction §4 of this note restates for Diels–Alder, and the
  $T$/$E_h$ independent-knobs argument §5 of this note's own §5 echoes for relaxation time.
- *Ambient and Specific Carriers* (2026-07-25) §2, §2.1–§2.3 — the ambient/specific light
  taxonomy §2.3 of this note finds a boundary case in, via chromophore-localized thermal
  healing.
- *The Structure of Semiotic Foam* (2026-07-25) §5, Prop 5.2, §7, Prop 7.1 — the
  single-population exchangeable-fraction bound and the two-timescale record/workspace
  separation requirement, both of which §5 of this note extends to three tiers.
