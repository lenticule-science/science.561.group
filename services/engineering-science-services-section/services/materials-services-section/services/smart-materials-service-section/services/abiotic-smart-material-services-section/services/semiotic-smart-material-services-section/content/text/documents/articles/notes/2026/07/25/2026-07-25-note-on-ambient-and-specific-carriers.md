---
title: "Ambient and Specific Carriers: The Free/Costed Bifurcation Shared by Water and Light"
description: "Water and light each play two roles in the existing substrate — ambient/diffuse and specific/addressed — and which role a given molecule or photon takes is set externally (pore confinement for water, chromophore absorption cross-section for light), not by the carrier's identity. Crossing that axis against free/costed gives four cells; mechanical strain and redox potential each independently close all four, water alone leaves one open, and a fixed-inventory-versus-flux distinction explains why and names what would close it — an external, continuously-resupplied water source, proposed but not verified."
date-created: 2026-07-25
kind: research-note
keywords:
  - water
  - photochemistry
  - nanoconfinement
  - photoacid-generators
  - chemically-amplified
  - hydrophobic-effect
  - ossification
status: design
declared-by: claude-interactive-session-supplying-lenticule-science
---

## Abstract

The existing design already uses water and light in two structurally different ways each,
without naming the difference. Water is both the bulk solvent that drives hydrophobic
collapse and, inside the zeolite's micropores, a stoichiometric reagent that reacts with
Si–H and must be calcined out. Light is both the thing that thermalizes into ordinary Joule
heat and the thing that, absorbed by a specific chromophore, either cleaves a bond directly
or releases a catalyst that turns over many downstream events per photon. Both carriers
bifurcate along the same axis — ambient/diffuse versus specific/addressed — and in neither
case is the bifurcation a property of the carrier's identity. For water it is set by pore
confinement; for light it is set by whether a chromophore with the right absorption cross-
section is present to receive the photon. Crossing that axis against a second one, free
versus costed, gives four cells. Two further carriers checked independently later in this
note — mechanical strain and redox potential — each close all four cells on their own; water
alone leaves one, an ambient, costed role, the water-side analogue of ordinary resistive
heating. A fixed-inventory-versus-flux distinction explains why: a closed, conserved pool
cannot simultaneously read as too large to deplete and register as measurably depleting, while
a continuously resupplied or dissipated flux carrier can. That names what would close the
cell — an external, continuously-resupplied water source — without yet showing that it does.

---

## 1. Water's two roles, and what switches between them

### 1.1 Ambient: water as the medium exposed structure pays a tax to

The bulk-solvent reading is already established in this corpus's own account of the
hydrophobic effect: exposing unstructured content forces the surrounding water into
low-entropy clathrate ordering, and compacting that content into pores releases the water
back to a high-entropy bulk state. Nothing about this consumes a water molecule. Bulk water's
thermodynamic activity is, to good approximation, 1 in the regimes this design otherwise
discusses, and it does not appear as a limiting reagent in any rate law written for a process
run in its presence. This is water functioning as a diffuse, unmetered medium — read
elsewhere in this corpus as attention — and the read is chemically literal: nothing is being
spent, only reorganized.

### 1.2 Specific: water as a reagent the formulation already has to remove

The same molecule behaves completely differently once confined. Zeolite 4A holds 20–22 wt%
water in its micropores (stated already, without further citation, in the companion
ossification note). That water is not inert: under platinum catalysis it reacts with Si–H and
evolves hydrogen, consuming crosslinker and falsifying the zero-volatile-byproduct property
the addition-cure route depends on — which is exactly why calcination at 450–550°C is a
mandatory step in that note's formulation rather than good practice. This is water behaving as
a countable, stoichiometric participant, not a medium: it is produced and consumed in a
specific reaction with a specific partner, and there is a finite quantity of it to run out.

### 1.3 The switch is confinement, not the water

Sub-nanometer to few-nanometer pore confinement is known, independent of anything asserted
here, to alter water's hydrogen-bond network structure, mobility, and effective activity
relative to the bulk liquid — this is standard ground in zeolite and MOF physical chemistry,
typically probed by quasi-elastic neutron scattering or NMR relaxometry, and it is cited here
as established background, not re-derived. What changes between §1.1 and §1.2 is not the
identity of the water molecule. It is the volume it has been given. The same substance is
ambient and free when the volume is large and unstructured, and specific and costed when the
volume is a zeolite cage small enough to restructure its hydrogen-bonding and put it in direct
reach of one particular reactive site.

---

## 2. Light's two roles, and what switches between them

### 2.1 Ambient: absorbed light that becomes heat

Most light absorbed by a material that is not tuned to receive it simply thermalizes —
electronic excitation relaxes through the phonon bath and the energy ends up as heat,
indistinguishable in its downstream effect from resistive Joule heating. This is light in its
diffuse role: undirected, unaddressed, and — because it costs electrical or optical power to
generate in the first place — costed rather than free. It sets no local write; it just warms
the bulk.

### 2.2 Specific: light absorbed by a tuned chromophore

A photon absorbed by a chromophore whose transition it matches delivers energy in one
quantized jump, and the jump is large against the thermal scale available at operating
temperature: a 365 nm photon carries approximately 3.4 eV, a 254 nm photon approximately 4.9
eV, against $k_BT \approx 0.026$ eV at 300 K. A specific absorption event therefore reaches a
bond-breaking or catalyst-releasing transition state directly, without waiting on the
Boltzmann tail of a thermal ensemble to supply the same energy by chance collision, and it
lands exactly where the chromophore is rather than wherever heat happens to have diffused.
This is the physical reason optical addressing in this design is spatially precise in a way
resistive heating is not: the two mechanisms are not the same delivery method at different
convenience, they access the same energy scale by genuinely different statistics.

### 2.3 Cleaving the record versus summoning a witness, made quantitative

The companion organosulfur note already chose between two specific-photon mechanisms and
gave a qualitative reason. Direct UV homolysis of an aryl disulfide is a specific, addressed
photon event whose quantum yield is bounded at one bond event per absorbed photon — it spends
the photon on the record itself. A photoacid or photobase generator (PAG/PBG) is the same
class of specific, addressed photon event, but what it releases is a catalyst, and the
catalyst then turns over many downstream exchange events — silyl-ether metathesis, imine
exchange — before it is consumed or quenched. This is not a new mechanism invented for this
note: it is the established basis of chemically amplified photoresist chemistry (Ito &
Willson, 1980s), where the entire point of the photoacid-generator architecture is that one
absorbed photon triggers a catalytic chain of many deprotection events rather than one. The
qualitative claim already in this corpus — "light summons a witness, it does not break a
bond" — has an exact quantitative reading: one route is quantum-yield-limited at 1
event/photon, the other is turnover-number-limited by catalyst lifetime, and the two can
differ by orders of magnitude in events delivered per unit of light spent.

---

## 3. The shared structure

Both carriers cross an ambient/specific axis against a free/costed axis. The claim that this
crossing is the same structure on two different physical carriers is this note's own
synthesis and is argued, not established in the literature of either field — no source in
either §1 or §2 states the two carriers this way jointly.

| | free | costed |
|---|---|---|
| **ambient** | bulk water at rest; unabsorbed or transmitted light | thermalized absorbed light — ordinary Joule heating |
| **specific** | hydration-shell reorganization around one exposed surface (§3.1); photoisomerization (§3.2) | pore-confined water consumed at Si–H (§1.2); PAG/PBG catalyst release, direct UV cleavage (§2.3) |

### 3.1 The water-side match to a costless specific event

Hydration-shell reorganization — water's hydrogen-bond network ordering into a clathrate cage
around one specific exposed hydrophobic surface, and releasing when that surface is buried —
is addressed to exactly the exposed region, not diffuse across the bulk, and it is fully
non-covalent: no water molecule is created or destroyed, the same population cycles in and
out reversibly. This is specific and free, and it was already present in this corpus's own
account of the hydrophobic effect (§1.1 above) without being distinguished from bulk water at
rest. Separating them is what populates this cell.

### 3.2 The light-side match

Photoisomerization — azobenzene's trans/cis switch about the N=N bond under UV or visible
light, spiropyran's ring-opening under UV — is a specific, chromophore-selective, addressed
event that consumes no stoichiometric reagent and generates no byproduct. It is reversible
either photochemically at a second wavelength or thermally, and it is the cheapest possible
register in this whole family: specific without being costed.

### 3.3 The open cell

No mechanism is identified here for water behaving ambiently and costed — an undirected, bulk
process in which water is genuinely spent, the water-side counterpart to resistive heating.
Bulk hydrolysis run to completion in a large water excess does consume water, but the excess
is exactly what keeps its activity near 1 and its role reading as ambient; a process that is
both truly bulk-scale and rate-limited by water's own depletion is not identified in this
substrate. This may be a real asymmetry between the two carriers rather than a gap in the
account — light has a genuinely lossy diffuse channel that water may simply lack at the scales
this design uses — and it is left open rather than closed by assertion.

---

## 4. Water as its own catalyst

Water autoionizes, $K_w \approx 1.0 \times 10^{-14}$ at 25 °C, and any water-mediated
hydrolysis — imine or hydrazone exchange among them — is catalyzed by the $\mathrm{H^+}$ or
$\mathrm{OH^-}$ that water supplies to itself. Water is therefore both the reagent consumed in
its own hydrolytic reactions and the source of the catalyst that drives that consumption. This
is a real structural loop and it is stated here only as that: it is not claimed to be
autocatalysis in the formal sense this corpus's chemical-reaction-network note requires
(§5 there), which needs an explicit stoichiometric matrix and a Perron–Frobenius eigenvalue
argument.

### 4.1 Checked against that formal sense: it is not autocatalysis, it is a T-invariant

Write the acid-catalyzed imine hydrolysis this note has been using as an example as a small
reaction network: protonation ($\mathrm{Im + H^+ \to ImH^+}$), water attack
($\mathrm{ImH^+ + H_2O \to Hemi^+}$, the rate-determining step), and collapse
($\mathrm{Hemi^+ \to Ald + Am + H^+}$). $\mathrm{H^+}$ is consumed by the first reaction and
regenerated in equal number by the third. Every firing of the three-step sequence returns the
$\mathrm{H^+}$ count to where it started: that is a T-invariant, $N\sigma = 0$ for the firing
vector $\sigma$ that fires each step once, in the exact sense of §4 of the chemical-
reaction-network note — a cycle, not a fixed point of a growth map.

Autocatalysis in that note's §5 sense requires a step where the catalyst's own coordinate is
produced in excess of what is consumed — $N[\mathrm{H^+}, r] \ge 2$ for some reaction $r$ —
so that the positive part of the dynamics has a leading eigenvalue $\lambda > 1$ and the
population grows in magnitude while holding its composition fixed. No step in acid-catalyzed
hydrolysis does this: protonation consumes exactly one $\mathrm{H^+}$, collapse regenerates
exactly one. The mechanism is the same shape as the chain-reaction propagation typing that
note's §6.1 gives — a tight, support-small T-invariant that closes every turnover, priced
against the substrate (here, the imine and water) rather than against the catalyst — and not
the branching regime that section reserves for genuine population growth. Water's
self-catalysis of its own hydrolysis is therefore a catalytic cycle in the ordinary sense,
correctly named a loop in §4 above, and not autocatalysis in the CRN note's formal sense. The
open question that section left is closed: not by finding a hidden branching step, but by
checking that the mechanism has none.

---

## 5. What this makes explicit that was previously asserted

The organosulfur note's choice of a photoacid/photobase route over direct aryl-disulfide UV
cleavage — "addressing the third party rather than the record" — was argued there on grounds
of consistency with the corpus's own author-exclusion law. §2.3 above gives the same
conclusion an independent physical reason that does not depend on that law at all: the two
routes differ in quantum yield ceiling versus catalytic turnover, a fact about photochemistry
alone. The two arguments agreeing from unrelated premises is evidence for the design choice,
not a restatement of it.

---

## 6. Naming the carriers, and what changes when the backbone changes

Everything above was argued generically — "the siloxane matrix," "the zeolite." The
formulation this corpus has already committed to has real names, and naming them exposes
assumptions §1–§3 were making silently.

### 6.1 The named substrate as it stands

The matrix is a divinyl-terminated poly(dimethylsiloxane) — vinyl-PDMS, backbone
$-[\mathrm{Si(CH_3)_2O}]_n-$, $T_g \approx -120\,^\circ\mathrm{C}$ — cured by thiol–ene
addition against pentaerythritol tetrakis(3-mercaptopropionate) (PETMP), the standard
tetrafunctional thiol crosslinker of the thiol–ene literature. PETMP is the real molecule
behind the abstract claim, made in the companion organosulfur note, that "a tetrathiol
junction has $f=4$" — it is not a generic tetrathiol, it is this one, and naming it fixes the
crosslink functionality to a specific, purchasable compound rather than a free parameter.
The rigid phase is either zeolite 4A (Linde Type A / LTA framework,
$\mathrm{Na_{12}(AlO_2)_{12}(SiO_2)_{12} \cdot 27H_2O}$, Si/Al = 1, strongly hydrophilic, the
20–22 wt% water-bearing case §1.2 uses) or ZSM-5 (MFI framework, high-silica, weakly or
non-hydrophilic depending on Si/Al ratio) — both already distinguished, without being
separately named for their consequences here, in the companion ossification note's own
account of why the transport-reading formulation could not simultaneously want both.

### 6.2 What changes if the matrix backbone changes

§2.2's "spatially precise" claim for chromophore-addressed light silently assumes the matrix
itself does not compete for the addressing photon. PDMS earns this for free: it has no
significant chromophore in the near-UV/visible range the design uses, so a photon aimed at a
disulfide or a PAG is not lost to the backbone. Replace the matrix with a polyurethane
network of the kind used in vinylogous-urethane vitrimers — an aromatic diisocyanate residue
(e.g. from MDI or TDI) linked through carbamate — and this stops being free: aromatic
isocyanate-derived carbonyls absorb in the same near-UV region, and the backbone now competes
with the intended chromophore for every photon, an ordinary inner-filter effect that reduces
effective penetration depth by Beer–Lambert competition rather than by anything wrong with
the chromophore itself. PDMS was not a neutral choice of "a matrix"; it was a choice that
kept §2's whole argument clean by being optically silent.

§1.3's confinement account assumes the matrix itself has no intrinsic water affinity, so the
ambient/specific split stays sharply binary — bulk water is ambient, pore water is specific,
nothing between. A poly(ethylene glycol) matrix breaks this. PEG's ether oxygens coordinate
water (and cations) distributively along the whole chain, the same weak-Lewis-base
coordination that makes PEG a cryoprotectant and a crown-ether relative; every repeat unit is
a mild, non-saturating water-binding site. A PEG matrix would not have a bulk phase in §1.1's
sense at all — the "ambient" region would already be doing weak, distributed, specific-style
binding everywhere, and the sharp two-state switch of §1.3 would have to be replaced with
something graded. This is not a small caveat: it says the clean bifurcation of §1 is a
property of having chosen a hydrophobic backbone, not a property of water in this class of
material generally.

### 6.3 What changes if the rigid phase changes: adsorption is not reaction

Replacing zeolite 4A with amorphous silica gel (from TEOS or TMOS hydrolysis-condensation)
keeps the same element chemistry — $\mathrm{Si-O}$ throughout — but removes the crystalline
pore structure, and with it removes §1.2's mechanism outright: there is no defined micropore
forcing water into reach of a specific Si–H bond. What silica gel has instead is a high
density of surface silanols ($\mathrm{Si-OH}$), well characterized since Zhuravlev's
systematic work on the silica surface, which hydrogen-bond water reversibly and strongly at
the surface without necessarily reacting with it. This is specific — addressed to the
silanol-bearing surface, not diffuse through the bulk — but it is not obviously costed in
§1.2's sense: nothing is consumed, the water desorbs on drying the way the clathrate cage of
§3.1 releases on burial. Silanol-bound surface water is therefore a second instance of
specific-and-free, alongside hydration-shell reorganization, not a variant of the
specific-and-costed zeolite case — and this is a genuine correction to §3's table as written:
it conflated *reactive* confinement (water consumed at a specific site — the zeolite/Si–H
case) with *adsorptive* confinement (water bound at a specific site without being consumed —
the silanol case), and only the first belongs in the costed column.

### 6.4 Resolving the PEG question: an isotherm, not more prose

§6.2 asserted that PEG breaks §1.3's sharp switch without saying what would actually
distinguish "broken into a continuum" from "merely narrowed." A functional form settles it.

Model each ethylene-oxide repeat unit as an independent, identical, non-cooperative
water-binding site — a bare Langmuir isotherm, $\theta = K[\mathrm{H_2O}]/(1 + K[\mathrm{H_2O}])$,
with $\theta$ the per-site occupancy and $K$ a single weak association constant for a simple
H-bond acceptor. Independent-site Langmuir binding has no critical point at any density of
sites: occupancy rises smoothly and monotonically with water activity, first-order throughout,
Hill coefficient $n = 1$. That is the mathematical signature of a genuine continuum — there is
no threshold to cross, at any backbone length or site density, because nothing in the model
cooperates.

This gives §6.2 the discriminator it lacked. If PEG–water sorption is measured (by dynamic
vapor sorption or a comparable isotherm technique) and returns $n \approx 1$, non-cooperative,
the continuum reading is correct: §1.3's sharp switch really is absent, not narrowed, for this
backbone. A Hill coefficient measurably above 1 — cooperative binding, an emergent sigmoidal
transition from many weak sites acting in concert — would instead support the narrowed-switch
reading, since cooperativity is exactly what turns a graded population of weak sites back into
something with a threshold. Which of the two actually holds for PEG is not settled here; what
is settled is which single number decides it, and it is a standard, already-existing
measurement rather than a new one.

### 6.5 The framework-level consequence

None of §1–§3's claims are properties of "water in a two-phase siloxane-zeolite composite"
in general. They are properties of the specific choice already made — a hydrophobic PDMS
matrix (keeps the water split sharp, keeps the backbone optically silent) paired with
zeolite 4A specifically rather than ZSM-5 (supplies the reactive-confinement water that
actually gets consumed, rather than a low-water framework in which §1.2 would have little to
say). Every named alternative in this section is a live formulation choice already adjacent
to material the corpus has considered, and each one moves a different piece of §1–§3 rather
than leaving the framework intact. The framework is real; it is not backbone-independent, and
should not be described as if it were.

---

## 7. A third carrier, tested rather than assumed: mechanical strain

§3's grid was built from two carriers. Whether the ambient/specific × free/costed crossing
is real structure or an artifact of having picked water and light specifically is testable by
trying a third carrier this substrate already uses: mechanical strain.

### 7.1 Ambient and costed

The matrix ($T_g \approx -120\,^\circ\mathrm{C}$) and the zeolite have grossly mismatched
thermal expansion coefficients, so cooling from cure temperature to operating temperature
stores real, undirected elastic stress throughout the bulk — ordinary CTE-mismatch stress in
a filled composite, quantifiable by standard inclusion mechanics (Eshelby-type treatments).
It addresses no particular bond, and it is costed: the stress is stored strain energy, drawn
from whatever cooled the part, and it is released as heat or damage if it exceeds a local
yield. This matches thermalized absorbed light exactly — diffuse and costed.

### 7.2 Specific and costed

A mechanophore — diarylbibenzofuranone and the wider class studied since Caruso, Sottos,
Moore and coworkers — is a bond pre-distorted by its own geometry so that macroscopic strain
concentrates onto it preferentially over the bulk, lowering its activation barrier for
homolysis well below the thermal value. It reports optically (the radical is colored) without
being queried, the same self-reporting property noted for it earlier. Addressed, and costed:
the strain energy that triggers it is spent at that one site.

### 7.3 Specific and free

Between crosslinks, a chain segment under localized load extends and relaxes by entropic,
reversible conformational change — ordinary rubber elasticity — with no bond broken or formed.
This is addressed (the extension concentrates exactly where the local stress is) and, in the
ideal affine or phantom-network limit, non-dissipative: the chain returns its stored
conformational entropy on unloading. Real elastomers show finite hysteresis, so "free" here is
the idealized low-loss limit rather than an exact statement about any real network; the
qualitative match to hydration-shell reorganization and photoisomerization — specific,
reversible, no stoichiometric cost — still holds to the extent that limit is approached.

### 7.4 Ambient and free

At equilibrium, thermal (Brownian) conformational fluctuation is present everywhere in the
network, does no net work, and addresses nothing in particular — the mechanical match to bulk
water at rest and to unabsorbed light.

### 7.5 What the test shows

Mechanical strain populates all four cells without forcing, including the one water left
open in §3.3. That is evidence the ambient/specific × free/costed crossing is a real
structural fact rather than a coincidence of the two carriers §1–§3 happened to use — a third,
mechanically unrelated carrier fits the same grid on independent grounds. It does not explain
why water specifically has no ambient-costed case; if anything, mechanical strain closing
cleanly where water didn't makes that asymmetry look more like a fact about water in
particular than a gap in the framework. What decides, in general, which carriers can populate
which cells is not answered here and is worth its own treatment rather than a guess.

---

## 8. A fourth carrier: redox potential, tested the same way

$E_h$ is already load-bearing elsewhere in this corpus as the census variable for the sulfur
crosslink population, so it is the obvious next carrier to check against the grid, and it is
independent of both prior tests: it shares no mechanism with water or light, and only a loose
family resemblance to strain.

**Ambient and costed.** A compartment's bulk redox potential — the organosulfur note's own
example, the cytosol held reducing at $E_h \approx -240\ \mathrm{mV}$ — is a whole-volume,
undirected property, and holding it against constant oxidative leak is not free: it is
maintained by continuous NADPH regeneration and the glutathione/thioredoxin reductase
systems, real ongoing expenditure with no addressed target. Diffuse and costed, matching
thermalized light and CTE-mismatch stress.

**Specific and costed.** A single redox-active site driven away from equilibrium — one
electrode surface held at an applied potential, or the specific cysteine oxidized in the
ladder this corpus already develops — is addressed to that one site, and the electron
transfer does real work against or with a gradient there specifically.

**Specific and free.** A redox couple held exactly at its own standard potential undergoes
reversible electron exchange at zero net driving force by the definition of equilibrium —
Nernstian reversibility. Addressed to one couple, and free because $\Delta G = 0$ there
exactly, the redox match to a chain segment's reversible entropic extension under load.

**Ambient and free.** At equilibrium and away from any applied potential, forward and reverse
electron transfer continue at equal, non-zero rates throughout the bulk — microscopic
reversibility, zero net current, zero net work — the redox match to Brownian conformational
fluctuation and to bulk water at rest.

$E_h$ closes all four cells as cleanly as strain did. That is a second, independent
carrier confirming the grid after the first one did, and the honest count against water's
single unfilled cell is now three carriers closing fully against one carrier leaving a
genuine gap — evidence enough to treat the ambient/specific × free/costed structure as the
default expectation for a carrier in this substrate, with water's missing cell the thing
that needs explaining rather than the framework.

---

## 9. What decides which cells a carrier can populate, and closing §3.3

§7.5 asked what general property separates a carrier that populates all four cells from one
that structurally cannot, and left it unanswered even after a second confirming carrier in
§8. There is an answer, and it also closes §3.3.

Being ambient requires reading as effectively unlimited — activity near 1, no local depletion
signal. Being costed requires that something is genuinely, irreversibly spent. For a carrier
that is a **fixed, closed inventory** — a finite population of one conserved substance with no
external resupply — those two requirements are in direct tension at bulk scale: the property
that makes a pool read as ambient (so vast it never runs low) is exactly what prevents it from
also registering as measurably consumed there. A pool cannot simultaneously be too large to
deplete and observably depleting, in the same place. Light, strain, and redox are not fixed
inventories in this sense. Each is a **flux** — a rate of photons, of mechanical work, of
electron transfer — that can be continuously resupplied or continuously dissipated without
drawing down a finite, closed store. Ambient-and-costed light is ordinary loss to heat,
resuppliable by more incident light; ambient-and-costed redox is continuous NADPH-driven
maintenance against continuous leak, resuppliable by continued metabolism. Water, as read
throughout §1–§8, has no external resupply named anywhere in this note — it is exactly the
fixed-inventory case, and the argument above says a fixed inventory cannot populate the
ambient-and-costed cell, not that this note simply failed to find where it does.

That makes §3.3 a closed question rather than an open one, with the closure pointing directly
at what would change it: **the missing cell is missing because this substrate, as read here,
is closed to external water.** Open it — give the film access to a continuously-resupplied
external water source, humidity or immersion, rather than only the water sealed in at
synthesis — and diffuse hydrolysis running throughout the bulk, drawing on that resupply
rather than on a fixed internal pool, would populate the cell by the same logic that gives
light and redox theirs. This is exactly the move the companion note on growth, feeding, and
locomotion makes independently, for its own external precursor and fuel baths, without having
been written to solve this problem — the same open-system reasoning closing two different
notes' open questions is itself a small piece of evidence that the reasoning is doing real
work rather than being fitted after the fact. Whether opening this substrate to an external
water reservoir produces genuine bulk-scale, non-depleting hydrolysis, or merely relocates the
confinement boundary from "inside the zeolite pore" to "inside the film," is not shown here —
it is the same kind of question §6 of the companion note is built to test for its baths, and
the discriminator is the same one used there: does the process show a critical, saturating
limit (confinement-like, and therefore not really ambient after all), or does it run
indefinitely at constant rate as long as the external reservoir is maintained (genuinely
ambient-and-costed).

---

## 10. Falsification tests

1. **Confined-water mobility.** NMR relaxometry or QENS on the actual zeolite formulation,
   comparing pore water to bulk water under the same conditions. If pore water shows no
   measurable difference in mobility or activity from bulk, §1.3's confinement mechanism does
   not operate in this material at the pore sizes used, and the water bifurcation of §1 needs
   a different account.
2. **Turnover amplification.** Measure quantum yield for a PAG/PBG-driven exchange event
   (silyl-ether metathesis or imine exchange) against quantum yield for direct aryl-disulfide
   UV cleavage under matched photon flux. §2.3 predicts the former measurably exceeds 1
   event/photon and the latter does not exceed it. A PAG/PBG yield at or below 1 would falsify
   the turnover-amplification claim specifically, independent of the rest of this note.
3. **The open cell, and §9's proposed closure.** Expose the film to a continuously-resupplied
   external water source (humidity or immersion) and run a bulk hydrolysis reaction throughout
   it. §9 predicts one of two outcomes distinguishes a genuine ambient-costed case from a
   relocated confinement case: a rate that holds constant indefinitely as long as the external
   reservoir is maintained (genuinely ambient-and-costed, populating §3.3) versus a rate that
   saturates or falls off at a critical extent (the confinement boundary has simply moved from
   "inside the pore" to "inside the film," and the cell remains unpopulated). Either outcome is
   informative; no result at all would leave §3.3 exactly where §1–§8 left it.
4. **Adsorptive versus reactive water.** TGA on silica-gel silanol water against zeolite-4A
   pore water under matched heating. §6.3 predicts the silica-gel water desorbs at low
   temperature without a corresponding mass-independent chemical signature (no evolved H₂),
   while zeolite pore water's reaction with Si–H is not a simple desorption. Indistinguishable
   traces would falsify the adsorptive/reactive distinction §6.3 draws.
5. **Backbone optical silence.** Measure UV–vis absorbance of the neat matrix polymer, cured
   with no chromophore added, at the wavelength used to address the disulfide or PAG. Nonzero
   absorbance falsifies the "optically silent matrix" assumption §2 and §6.2 make for PDMS,
   and would need to be checked again for any backbone substituted in.
6. **Mechanophore versus bulk activation.** Compare the strain at which a doped-in
   mechanophore activates (colorimetric onset) against the strain at which bulk mechanical
   damage (crazing, macroscopic yield) appears in an undoped control. §7.2 predicts the
   mechanophore fires measurably below the bulk damage threshold; a mechanophore that only
   activates at or above bulk failure is not functioning as a specific, addressed site and
   §7.2's cell is not actually populated by it.
7. **PEG water-sorption cooperativity.** Measure the Hill coefficient of PEG–water sorption
   by dynamic vapor sorption. §6.4 predicts $n \approx 1$ if the continuum reading is correct;
   measurable cooperativity ($n > 1$) would instead support the narrowed-switch reading and
   overturn §6.2's continuum claim specifically, leaving the rest of §6 unaffected.
8. **Redox cost at rest.** Measure the metabolic or electrochemical maintenance cost of
   holding a compartment's bulk $E_h$ against oxidative drift, independent of any specific
   reaction run inside it. §8 predicts this cost is nonzero and continuous, matching ambient
   Joule heating and CTE stress; a compartment found to hold its redox potential at zero
   ongoing cost would falsify the ambient-and-costed reading of bulk $E_h$ specifically.

---

## 11. Status of claims

**Established chemistry, transferred but not originated here.** Water activity near 1 in
dilute bulk solution; altered water dynamics and hydrogen-bonding under sub-nanometer
confinement (zeolites, MOFs), by NMR/QENS; water autoionization and $K_w$; photon energy
versus $k_BT$ at 300 K; chemically amplified photoresist chemistry and the catalytic-turnover
architecture of photoacid/photobase generators (Ito & Willson); azobenzene and spiropyran
photoisomerization as reversible, non-consumptive, chromophore-selective switches. The 20–22
wt% zeolite 4A water figure and the calcination requirement are carried from the companion
ossification note, not re-derived. PETMP as the real tetrafunctional thiol–ene crosslinker;
divinyl-PDMS as the real matrix precursor; ZSM-5/MFI as a genuinely low-water, high-silica
zeolite framework distinct from LTA (Flanigen et al.); silica surface silanol density and
its water-binding behaviour (Zhuravlev); PEG's distributed ether-oxygen water and cation
coordination; vinylogous-urethane vitrimer chemistry and the near-UV absorbance of aromatic
isocyanate-derived carbonyls (Denissen, Winne & Du Prez, for the vitrimer chemistry; the
absorbance itself is ordinary aromatic-carbonyl photophysics, not separately sourced here).
Mechanophore strain-selective activation and its colorimetric self-reporting (Caruso, Davis,
Shen, Odom, Sottos, White & Moore); rubber elasticity as reversible, entropy-driven chain
extension in the ideal affine/phantom-network limit (Treloar; Flory); CTE-mismatch stress in
filled composites as ordinary inclusion mechanics (Eshelby-type treatments, not separately
sourced here). The Langmuir isotherm and its non-cooperative, no-critical-point behaviour
(Langmuir); Nernstian reversibility of a redox couple held at its standard potential, and
microscopic reversibility at redox equilibrium (standard electrochemistry, Bard & Faulkner);
the metabolic cost of maintaining compartmental redox homeostasis against oxidative drift
(NADPH/glutathione-reductase and thioredoxin systems, carried from the companion organosulfur
note's citation of Schafer & Buettner, not re-sourced here).

**Derived here, using definitions this corpus already has.** §4.1's check of water's
self-catalysis loop against the chemical-reaction-network note's own formal definitions of
T-invariant and autocatalysis — a derivation from an existing stoichiometric-matrix framework
applied to a new mechanism, not a new mathematical result.

**Interpretive transfer, argued here and not established in either source literature.** That
water and light share one bifurcation (ambient/specific) rather than two unrelated ones; the
free/costed crossing and the four-cell table of §3; hydration-shell reorganization as the
water-side match to photoisomerization; confinement and absorption cross-section as the
general mechanism that sets which role a carrier takes, rather than a fact particular to this
substrate. §6's claim that §1–§3 describe a specific formulation choice rather than a
backbone-independent law, and the reactive/adsorptive refinement of §6.3, which revises §3's
table rather than merely extending it. §7's and §8's reading of mechanical strain and redox
potential each populating all four cells as evidence for the grid's generality, and the
inference that water's open cell is therefore more likely a fact about water than a gap in
the framework — now weighed three-carriers-closing against one-carrier-open rather than two
against one. §6.4's Langmuir-isotherm model of PEG water-binding as the right model to test,
which is a modelling choice, not a measurement.

**Resolved in this pass.** Whether §4's self-catalysis loop is autocatalytic in the CRN
note's formal sense — no, per §4.1: it is a T-invariant, the propagation-typing case, not the
branching-typing case that formal autocatalysis requires. Whether §6.2's PEG claim has a
functional form to test against — yes, per §6.4, though the isotherm has not itself been
measured here. What general property of a carrier determines which of the four cells it can
populate — per §9, fixed-inventory carriers cannot populate ambient-and-costed, because being
ambient (unlimited-reading) and being costed (measurably depleting) contradict each other for
a closed, conserved pool; flux carriers (light, strain, redox) have no such contradiction,
since resupply or dissipation keeps them ambient without requiring a fixed store. Why §3.3 is
specifically empty — because this substrate, as read in §1–§8, keeps water a closed inventory,
per §9's application of the same argument to water itself.

**Proposed but unverified.** §9's specific closure of §3.3: that opening the substrate to a
continuously-resupplied external water source would populate the missing cell. This is a
mechanism, not a measurement — §10 test 3 states what would confirm or refute it, and the
same open-system move is used independently in the companion note on growth, feeding, and
locomotion for its own external baths, which is weak but real corroborating evidence that the
reasoning generalizes rather than having been fitted to this one case.

**Open, not closed by assertion.** Whether real PEG–water sorption actually returns the
non-cooperative Hill coefficient §6.4's model predicts. Whether §9's fixed-inventory/flux
distinction itself has counterexamples among carriers not yet checked against the grid.

---

## References

Ito, H. & Willson, C. G. (1983). Chemical amplification in the design of dry developing
resist materials. *Polymer Engineering & Science* 23, 1012.

Fréchet, J. M. J., Eichler, E., Ito, H. & Willson, C. G. (1983). Poly(p-tert-
butoxycarbonyloxystyrene): a convenient precursor to p-hydroxystyrene resins. *Polymer* 24,
995.

Crivello, J. V. & Lam, J. H. W. (1977). Diaryliodonium salts. A new class of photoinitiators
for cationic polymerization. *Macromolecules* 10, 1307.

Bakulin, A. A. et al. (2011). Hydrophobic hydration and dynamics of water at protein
interfaces probed by ultrafast infrared spectroscopy. (Representative of the confined/
interfacial water dynamics literature; specific figures not asserted here.)

Bordat, P. & Brown, R. (2002). Prediction of the dynamics of the confined water monolayer at
the surface of a mesoporous material via molecular dynamics. *Journal of Chemical Physics*
116, 3753.

Hartmann, M. (2005). Ordered mesoporous materials for bioadsorption and biocatalysis.
*Chemistry of Materials* 17, 4577. (Water/silanol confinement context.)

Bandara, H. M. D. & Burdette, S. C. (2012). Photoisomerization in different classes of
azobenzene. *Chemical Society Reviews* 41, 1809.

Klajn, R. (2014). Spiropyran-based dynamic materials. *Chemical Society Reviews* 43, 148.

Zhuravlev, L. T. (2000). The surface chemistry of amorphous silica. Zhuravlev model.
*Colloids and Surfaces A* 173, 1–38.

Flanigen, E. M., Bennett, J. M., Grose, R. W., Cohen, J. P., Patton, R. L., Kirchner, R. M. &
Smith, J. V. (1978). Silicalite, a new hydrophobic crystalline silica molecular sieve.
*Nature* 271, 512–516.

Israelachvili, J. & Wennerström, H. (1996). Role of hydration and water structure in
biological and colloidal interactions. *Nature* 379, 219–225.

Denissen, W., Winne, J. M. & Du Prez, F. E. (2016). Vitrimers: permanent organic networks
with glass-like fluidity. *Chemical Science* 7, 30.

Caruso, M. M., Davis, D. A., Shen, Q., Odom, S. A., Sottos, N. R., White, S. R. & Moore, J. S.
(2009). Mechanically-induced chemical changes in polymeric materials. *Chemical Reviews* 109,
5755.

Treloar, L. R. G. (1975). *The Physics of Rubber Elasticity*, 3rd ed. Oxford University
Press.

Eshelby, J. D. (1957). The determination of the elastic field of an ellipsoidal inclusion,
and related problems. *Proceedings of the Royal Society A* 241, 376.

Langmuir, I. (1918). The adsorption of gases on plane surfaces of glass, mica and platinum.
*Journal of the American Chemical Society* 40, 1361.

Bard, A. J. & Faulkner, L. R. (2001). *Electrochemical Methods: Fundamentals and
Applications*, 2nd ed. Wiley.

---

## Prior work in this corpus

- *Physarum zeosemiocenum: A Formal Monograph* (2026-07-25) §3.1 — the hydrophobic-effect
  reading of bulk water as attention, which §1.1 and §3.1 of this note separate from the
  confined-water case that was never distinguished from it.
- *Ossification as the State Variable* (2026-07-25) §4 — the 20–22 wt% zeolite water figure
  and the calcination requirement, carried here as §1.2's specific-costed water case.
- *Dual Organosulfur Crosslink Populations* (2026-07-25) §4.1, §5, §6 — the UV/aryl-disulfide
  write-head decision and the photoacid/photobase fallback, given an independent physical
  grounding in §2.3 and §5 of this note; and the redox-potential-as-second-intensive-variable
  reading and compartment $E_h$ figures §8 of this note tests as a fourth carrier.
- *Fixed Points in Chemical Reaction Networks* (2026-07-25) §4, §5, §6.1 — the T-invariant
  and autocatalysis definitions §4.1 of this note checks water's self-catalysis loop against,
  and the propagation/branching typing §4.1 identifies the loop with.
- *Three Missing Pieces for a Fully Synthetic Organism* (2026-07-26) §2, §3 — reached
  independently, but using the same open-system move §9 of this note applies to close §3.3:
  an external, continuously-resupplied bath as what a closed reading of a carrier is missing.
