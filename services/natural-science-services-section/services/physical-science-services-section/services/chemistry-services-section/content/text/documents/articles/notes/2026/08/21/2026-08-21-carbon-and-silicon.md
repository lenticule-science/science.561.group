---
title: "Carbon and Silicon Chemistry"
description: "A comparative review of carbon and silicon chemistry — bond energetics and catenation, the CO2/SiO2 structural divergence, redox versus condensation reaction regimes, silicic acid speciation and biosilicification, the carbonate-silicate weathering thermostat, silicon carbide, silicon's biological roles, and the silicon-based-life question."
date-created: 2026-08-21
type: notes
name: 2026-08-21-carbon-and-silicon
authors:
  - claude-sonnet-5
keywords:
  - chemistry
  - silicon
  - carbon
  - catenation
  - bond-energy
  - silica
  - biosilicification
  - carbon-cycle
  - silicon-carbide
  - astrobiology
---

# Carbon and Silicon Chemistry

Carbon and silicon are the two elements of group 14 light enough to matter
chemically at planetary surface conditions (germanium, tin, and lead sit
further down the group and are chemically marginal by comparison). Both have
four valence electrons and a strong preference for tetrahedral, four-bond
coordination in their common compounds. Both anchor an entire domain of
chemistry — organic chemistry for carbon, silicate and siloxane chemistry for
silicon — built on chains and networks of that element bonded to itself and
to oxygen, hydrogen, and a handful of other light elements. Despite this
shared starting point, the two chemistries look almost nothing alike in
practice: carbon supports a vast diversity of self-bonded chains, rings, and
polymers under ordinary conditions; silicon does not, and instead builds its
diversity into oxygen-bridged networks. This review works through the
mechanisms behind that divergence — bond energetics, oxide structure, reaction
regime, aqueous speciation, biological exploitation, planetary-scale feedback,
the one compound where the two elements bond directly, and the question of
whether an alternative, silicon-based biochemistry is plausible at all.

## 1. Bond energetics and catenation

"Catenation" is the capacity of an element to form extended chains of atoms
bonded to themselves. Carbon catenates prolifically — straight chains,
branched chains, rings, cages, and combinations of all three, stable enough
to isolate, handle, and build a body out of. Silicon catenates only weakly:
silicon self-chains longer than a few atoms are rare outside specialized
synthesis, and no natural silicon chemistry analogous to petroleum or
biological polymers exists at ambient surface conditions.

The first thing to check is whether this is simply a bond-strength story —
whether Si–Si bonds are just too weak to hold chains together. They are
somewhat weaker than C–C bonds, but not dramatically so. Reported average
bond dissociation energies (compilations vary by several percent depending on
whether they average across many compounds or report a single reference
molecule's bond, and different standard tabulations put single bonds a bit
differently — the ranges below span the commonly cited values):

| bond | approx. bond energy (kJ/mol) |
|---|---|
| C–C | ≈ 345–356 |
| Si–Si | ≈ 215–327 (tabulations vary substantially here; commonly cited "average" values run 310–330, while some single-molecule dissociation energies run as low as 215) |
| Si–O | ≈ 445–460 |
| C–O | ≈ 358 |
| C–H | ≈ 411–414 |
| Si–H | ≈ 314–318 |

Even taking the more conservative comparison, Si–Si is only modestly weaker
than C–C — on the order of 10-25% depending on which tabulation is used —
which by itself would predict silicon chains somewhat less stable than carbon
chains, not the near-total absence of a silane-based "organic chemistry" that
is actually observed. Something else is doing most of the work.

That something is the size of the **Si–O bond energy relative to Si–Si**, a
gap much larger than the C–O/C–C gap. Forming one Si–O bond in place of one
Si–Si bond releases on the order of 100-150 kJ/mol; forming one C–O bond in
place of one C–C bond is close to energetically neutral. Silicon is also
abundant in combination with oxygen at Earth's surface (as SiO2 and
silicates, roughly a quarter of the crust by mass) and, critically,
*kinetically* accessible to oxidation and hydrolysis: Si–H bonds react with
O2 and H2O far more readily than C–H bonds do. Silanes (SiₙH2ₙ₊2) are
pyrophoric or aggressively hydrolyzed in air; alkanes are kinetically inert to
both under ordinary conditions (combustion requires an ignition source
precisely because the kinetic barrier, not the thermodynamics, is what
protects a hydrocarbon at room temperature). The result: any Si–Si chain that
forms is both thermodynamically driven and kinetically primed to react itself
into a network of Si–O–Si bridges the instant oxygen or water is present.
Carbon chains are under no comparable pressure, because C–O is not
dramatically more stable than C–C the way Si–O is dramatically more stable
than Si–Si, and because C–H's kinetic inertness toward O2 at ambient
temperature means carbon chains persist even where they are not the
thermodynamically most stable arrangement available.

This account makes a specific, checkable prediction: silicon catenation
should become far more accessible under rigorously anhydrous, anaerobic
conditions, where the Si–O driving force cannot act. That prediction is
confirmed. Long-chain polysilanes — SiₙH2ₙ₊2 analogues of alkanes, and
substituted polysilanes carrying organic side groups in place of some
hydrogens — are synthesizable and reasonably stable specifically when made
and kept oxygen- and moisture-free, and polysilanes with dozens of silicon
atoms in the backbone are known laboratory materials (used, among other
things, as photoresists and ceramic precursors, since pyrolysis of a
polysilane backbone is one industrial route to silicon carbide, discussed in
§7 below). Silicon's catenation weakness at the planetary surface is
therefore best understood as a combined thermodynamic-driving-force and
kinetic-vulnerability story specific to the presence of O2 and H2O — not as
an intrinsic incapacity for element-element bonding. Silicon-silicon multiple
bonding (disilenes, analogues of alkenes) was also long thought impossible by
a rule of thumb called the "double bond rule," but stable, isolable disilenes
with bulky protecting substituents have been synthesized since the 1980s,
underscoring that many of silicon's apparent chemical limits are limits of
the ambient aqueous-oxidizing regime rather than absolute limits of the
element.

## 2. Why silicon does not build carbon-style chains at surface conditions

Putting §1's mechanism together with planetary chemistry: Earth's surface is
an oxidizing, aqueous environment. Any silicon exposed there is thermodynamically
and kinetically funneled toward the Si–O bond — toward silicate minerals,
dissolved silicic acid, and silica, all of which lock silicon into +4 oxidation
state, oxygen-bridged structures (§4). There is no reservoir of "free," reduced,
self-bonded silicon sitting around at the surface the way there is a reservoir of
reduced, self-bonded carbon (as biomass, kerogen, coal, and petroleum) — because
carbon's chains are kinetically protected from oxidation at ambient temperature
while silicon's are not. This is the concrete, mechanistic content behind the
casual observation that "silicon doesn't have an organic chemistry": it isn't
that silicon atoms can't bond to each other, it's that any silicon-silicon bond
formed at the surface is racing against a strong, always-available oxidation
pathway that carbon's analogous bonds are not.

## 3. The oxide contrast: CO2 gas versus SiO2 network solid

Carbon dioxide and silicon dioxide have the same stoichiometry — one atom of
the group-14 element to two of oxygen — and almost nothing else in common.
CO2 is a small, linear, triatomic molecule (O=C=O) that is a gas at room
temperature and only solidifies (as dry ice) below about −78 °C. SiO2 has no
discrete molecular form under ordinary conditions at all: it is a covalent
network solid, an essentially infinite three-dimensional lattice of SiO4
tetrahedra, each silicon bonded to four oxygens and each oxygen bridging two
silicons, extending indefinitely through a crystal (or, in glass, through a
disordered but still fully connected network). Quartz — the most familiar
polymorph — is only one of at least eleven distinct crystalline SiO2
polymorphs plus two well-known non-crystalline (glassy) forms, all sharing
the same tetrahedral-network principle but differing in how the tetrahedra
are linked and tilted relative to one another. Melting SiO2 requires breaking
covalent Si–O bonds throughout the lattice, which is why quartz melts only
around 1713 °C, versus CO2's sublimation point nearly 1,800 degrees lower.

The structural reason for this split is a difference in the character of the
carbon–oxygen versus silicon–oxygen bond. Carbon is small enough, and its 2p
orbitals compact and well-matched enough in size to oxygen's 2p orbitals,
that carbon and oxygen readily form strong pi bonds on top of the sigma bond
— giving CO2 its two genuine C=O double bonds, and letting each carbon
satisfy all four of its bonding "slots" (two sigma, two pi) with just two
oxygen neighbors. Silicon is a full row lower in the periodic table: its
valence 3p orbitals are more diffuse and sit further from the nucleus, and
silicon–oxygen bonds are correspondingly longer than carbon–oxygen bonds.
That extra bond length means the p orbitals on silicon and oxygen do not
overlap side-on nearly as effectively, so a genuine, stable Si=O pi bond
analogous to C=O essentially does not form under ordinary conditions (this
size/overlap argument for why period-2 elements pi-bond far more readily than
their period-3 and heavier congeners is sometimes called, informally, the
"double bond rule," and its electronic basis has been treated in detail in
the physical-inorganic literature, including analyses of the closely related
question of why isolable Si–Si multiply-bonded compounds require bulky
stabilizing substituents to exist at all — a subtlety around exactly how
"weak" the pi contribution in such compounds really is has itself been
debated in the recent literature, but the basic contrast between carbon's
routine double-bond chemistry and silicon's near-absence of it under ordinary
conditions is not in dispute). Lacking a stable pi-bonding option, each
silicon instead satisfies its four bonds with four *separate* oxygen
neighbors — one sigma bond each — which is exactly the tetrahedral SiO4 unit,
and because each of those oxygens has a second bond left over, it bridges to
a second silicon, and the whole structure propagates into an extended
network rather than terminating as a small molecule. The single-bonded,
four-around-each-atom network is also why SiO2 has no simple molecular
analogue of "dry ice": there is no small, saturated, electrically neutral
SiO2 molecule that pi-bonding would let terminate cleanly, the way pi-bonding
lets two oxygens terminate a single carbon.

Density and hardness track this same network logic further. Ordinary quartz
(density ≈ 2.65 g/cm3) already reflects a fully four-coordinate,
tetrahedrally bonded network; under the very high pressures found in deep
subduction zones or generated momentarily by meteorite impact, SiO2 can be
forced into denser polymorphs — coesite, and at still higher pressure
stishovite, in which silicon coordination rises from four oxygens to six
(density ≈ 4.29 g/cm3 for stishovite) — a coordination change that has no
carbon-dioxide analogue at any pressure regime carbon dioxide is normally
found in, because carbon's small size and pi-bonding preference keep it
comfortable at two-coordinate, molecular CO2 (or, at extreme pressure,
its own family of extended polymeric carbon-dioxide phases, which are a
separate, high-pressure research topic in their own right and not treated
further here).

## 4. Redox-driven carbon transformation versus condensation-driven silica chemistry

The most useful single organizing distinction between the two chemistries is
this: **carbon's important surface-condition transformations are
oxidation-state changes; silicon's are not.** Carbon's chemistry of
interest — combustion, respiration, photosynthesis, fermentation, and
essentially all of metabolism — is a chemistry of moving carbon between
oxidation states, roughly −4 (as in methane) and +4 (as in CO2), with the
energy that powers most of life on Earth substantially *being* the energy
released or captured in that movement. Silicon's chemistry of interest at
ordinary planetary surface conditions — silicate weathering, biogenic silica
formation, clay and zeolite chemistry, opal diagenesis — occurs with silicon
fixed at +4 throughout every step: dissolved orthosilicic acid Si(OH)4 is
Si4+, quartz is Si4+, every silicate mineral's silicon is Si4+. What changes
instead is purely connectivity — how many Si–O–Si bridges a given silicon
center participates in — via **condensation** (Si–OH + HO–Si → Si–O–Si + H2O,
releasing water) and its reverse, **hydrolysis** (the same reaction run
backward, consuming water to break a bridge). Every step of ordinary silica
chemistry is a water molecule being made or unmade; no electron is
transferred and no oxidation state changes anywhere in the cycle.

This regime is not an absolute law of the element, and stating that caveat
explicitly is what keeps the distinction a real chemical claim rather than an
essentialism. Silicon does have genuine redox chemistry: elemental silicon
(oxidation state 0, as in semiconductor-grade silicon or ferrosilicon) is
industrially indispensable, and its production — the carbothermic reduction
of SiO2 by carbon at high temperature (the Siemens process refines this
further for electronics-grade silicon) — is exactly a redox transformation,
silicon moving from +4 to 0. The same carbothermic-reduction chemistry, run
with a slightly different carbon:silica ratio and temperature profile, yields
silicon carbide instead of elemental silicon (§7). What is true, and what the
condensation/redox contrast is actually claiming, is that silicon's chemistry
*at the ambient aqueous surface conditions where geology and biology mostly
operate* is overwhelmingly a +4, condensation-only regime, while the redox
regime is real but confined to high-temperature industrial or deep-geological
conditions. Claims of the shape "element X only does chemistry of kind Y" are
almost always claims about a regime rather than the element as such, and
naming the regime explicitly is what makes such a claim checkable.

## 5. Silicic acid: speciation, solubility, supersaturation

Dissolved silica in water at near-neutral pH exists predominantly as the
monomer orthosilicic acid, Si(OH)4, and its aqueous behavior is unusually
well quantified, going back to classic physical-chemical work by Alexander,
Heston, and Iler in the 1950s and consolidated in Iler's standard reference
*The Chemistry of Silica* (1979).

- **Solubility of amorphous silica at 25 °C, near-neutral pH:** commonly cited
  around 100-120 ppm SiO2, with reported values across the literature ranging
  roughly 70-150+ ppm depending on the solid's particle size, hydration
  state, and impurity content — amorphous silica's solubility is not one
  sharp number but depends on the exact surface and structural state of the
  solid, a live variable in any biosilicification or diagenesis question.
- **pH dependence:** solubility is essentially flat below pH ≈ 9, then rises
  sharply above it as silicic acid begins to deprotonate and ionize to
  silicate species. Reported values run roughly 138 ppm at pH 9, 180 ppm at
  pH 9.5, 310 ppm at pH 10, and 876 ppm at pH 10.6 — a striking rise
  concentrated almost entirely above a single threshold near pH 9.
- **Supersaturation and polymerization kinetics:** solutions in contact with
  solid amorphous silica readily become, and can remain, supersaturated —
  steady-state supersaturation in the 120-170 ppm range has been observed to
  persist for months — because nucleating new silica particles out of a
  supersaturated solution carries a real kinetic barrier (an induction
  time) distinct from simple thermodynamic instability. Higher
  supersaturation shortens the induction time but does not eliminate it. This
  is the quantitative content behind treating silica "settling" as a real
  kinetic event — oligomerization and polymerization crossing from monomer
  through colloidal particles to a solid phase, with its own measurable
  rate — rather than an instantaneous consequence of merely exceeding the
  solubility limit.

## 6. Biosilicification: how organisms actually do this chemistry

Several organisms do not merely wait for supersaturated silicic acid to
precipitate on its own; they deploy dedicated organic machinery that controls
nucleation site, rate, and final morphology at ambient temperature and
near-neutral pH — conditions under which comparable industrial silica
synthesis typically needs far more extreme pH or temperature to achieve
similar structural control. Two mechanisms are independently characterized in
detail:

**Silaffins.** Polycationic, post-translationally modified peptides isolated
from diatom cell walls, first structurally characterized from *Cylindrotheca
fusiformis* by Kröger, Deutzmann, and Sumper (*Science*, 1999; further
structural work through the early 2000s). Silaffins generate networks of
silica nanospheres from supersaturated silicic acid solution within seconds
of contact — an extraordinarily fast precipitation for a system otherwise
governed by the slow induction kinetics described in §5. Lysine and arginine
residues, along with domains rich in modified (phosphorylated) serine, are
thought to template an organic supra-structure that concentrates and
positions silicic acid, on which silica then nucleates and consolidates.

**Silicatein.** A structural protein first isolated and sequenced from the
silica spicules of the marine sponge *Tethya aurantia*, identified as a
cathepsin L-like protease homolog by Shimizu, Cha, Stucky, and Morse (*PNAS*,
1998), with a follow-up study (Cha, Shimizu, Zhou, Christiansen, Chmelka,
Stucky, and Morse, *PNAS*, 1999) demonstrating that silicatein filaments
actively catalyze the hydrolysis and condensation of silicon-alkoxide
precursors — demonstrated experimentally using tetraethoxysilane (TEOS), a
laboratory silicon-alkoxide analogue of the sponge's natural precursor — into
silica and silicone polymer networks with controlled shape, at neutral pH and
room temperature (about 20 °C).

Both mechanisms fit a common two-step model: **templated nucleation** (an
organic scaffold defines where and how silica first solidifies) followed by
**surface completion and rigidification** (further silica deposition
consolidates the templated nucleus into a mechanically coherent structure).
It remains an open question how general this templating requirement is
across other biosilicifying lineages beyond diatoms and this one sponge
species — see §9.

## 7. Silicon in biology beyond biosilicification

**Diatoms and the marine silica cycle.** Diatoms are the dominant biological
silicifiers in the modern ocean; global oceanic biogenic silica production is
estimated at roughly 240 ± 40 Tmol Si per year (Tréguer and De La Rocha,
*Annual Review of Marine Science*, 2013, synthesizing the modern marine
silicon-cycle literature), with a compositional silicon:carbon molar ratio
around 0.13, tightly coupling the ocean's silicon and carbon cycles because
diatoms contribute an estimated 30-40% of surface-ocean primary production.
Most diatom frustule silica dissolves in the upper water column or in
surface sediments and is recycled back to dissolved silicic acid rather than
being permanently buried, so the "flux" figure describes a rapidly cycling
biological pool, not a one-way burial rate.

**Grasses and terrestrial phytoliths.** Grasses (family Poaceae) are
hyperaccumulators of silicon, taking up dissolved silicic acid from soil
water through root membrane transporters and depositing it as solid
phytoliths (opaline silica bodies) in and between plant cells. The uptake
mechanism has been worked out in molecular detail in rice by Ma, Yamaji, and
colleagues: **Lsi1**, a member of the Nod26-like intrinsic protein (NIP)
subfamily of aquaporins, is a passive influx channel that lets silicic acid
into root cells; **Lsi2**, an unrelated putative anion transporter, actively
pumps silicon (using a proton-gradient-driven mechanism) out of those cells
and into the vascular stele for transport to the shoot, where it
polymerizes as the transpiration stream concentrates it. Both transporters
are concentrated in the root's mature zone rather than the root tip. Silica
content in grass tissue commonly runs from under 1% up to more than 10% of
dry weight (most other terrestrial angiosperms run closer to 0.5-1%), and
phytolith deposition functions as a physical anti-herbivore and structural
defense — a hardened barrier in leaf and stem tissue. At the ecosystem
scale, terrestrial phytolith silica fixation is estimated at roughly
60-200 Tmol Si per year (Conley, *Global Biogeochemical Cycles*, 2002),
a flux of the same order as the marine biogenic silica cycle described
above, making land plants — grasses especially — a major, comparably-sized
partner to the ocean in the planet's biological silicon cycling.

**Vertebrate connective tissue.** Silicon has a documented, though still
incompletely mechanistically resolved, essential trace-nutrient role in
vertebrates. Foundational work by Edith Carlisle (chick, 1972) and Klaus
Schwarz (rat, with Milne, 1972) established silicon deficiency effects on
skeletal and connective-tissue development: silicon-deficient animals show
reduced collagen and glycosaminoglycan content in bone and cartilage matrix,
with the organic matrix itself more severely affected than mineralization.
Carlisle's cultured embryonic chick bone experiments found roughly a 100%
increase in collagen content in silicon-supplemented bone over silicon-low
bone after 12 days. Schwarz's proposed mechanism holds that silicon
participates in stabilizing the glycosaminoglycan network of the
extracellular matrix, forming silanolate crosslinks that help regulate that
network's structure. The precise molecular mechanism remains less fully
characterized than the diatom/sponge biosilicification machinery of §6, and
this is flagged here as a genuine open area rather than settled biochemistry;
more recent in vitro work (e.g., studies of orthosilicic acid stimulating
collagen type I synthesis in human osteoblast-like cells) extends but does
not fully resolve the mechanistic picture.

## 8. The silicate weathering thermostat

The carbonate-silicate cycle is Earth's principal long-term (geological
timescale) climate stabilizing feedback, and it is the one point in this
review where carbon and silicon chemistry are directly, planetarily coupled.
Continental silicate rock, exposed to weathering, reacts with atmospheric
CO2 dissolved in rainwater (schematically: silicate + CO2 + H2O → carbonate
+ dissolved silica), consuming atmospheric CO2 in the process; the resulting
bicarbonate and dissolved silica are carried by rivers to the ocean, where
the carbon is ultimately sequestered as marine carbonate sediment. Because
chemical weathering rate increases with temperature and precipitation, and
both of those increase with atmospheric CO2 via the greenhouse effect, the
feedback is self-correcting in both directions: a warmer climate weathers
silicate rock faster, drawing down CO2 faster and cooling the system back
down; a cooler climate weathers more slowly, letting CO2 accumulate and
warm the system back up. This mechanism was first proposed in essentially
its modern form by Walker, Hays, and Kasting (*Journal of Geophysical
Research*, 1981), as a negative feedback capable of stabilizing Earth's
surface temperature against the steady long-term increase in solar
luminosity.

The feedback's characteristic timescale has since been directly estimated:
Colbourn, Ridgwell, and Lenton (*Global Biogeochemical Cycles*, 2015) find
the silicate-weathering negative feedback damps a CO2 perturbation with a
characteristic response time of roughly 170,000-380,000 years, averaging
around 240,000 years. That is the timescale over which this specific
mechanism substantially works down a CO2 pulse — from a large volcanic
outgassing event, a mass-extinction-associated carbon release, or, in
principle, the current anthropogenic pulse, though on human-relevant
timescales the thermostat is far too slow to be climatically relevant to
anthropogenic warming; it operates on a timescale roughly six orders of
magnitude longer than a human lifetime and is a geological regulator, not a
near-term one.

## 9. Silicon carbide: the one direct union

Silicon carbide (SiC) is the one compound in which carbon and silicon form
a direct, extended covalent lattice together, in roughly 1:1 stoichiometry,
and its properties are exceptional and well characterized.

**Discovery and synthesis.** Edward Acheson discovered SiC in 1891 while
attempting to synthesize artificial diamond, heating a mixture of clay
(aluminum silicate) and powdered coke in an iron bowl; he patented the
production method in 1893 and, on the mistaken belief the new material
combined carbon and corundum, named it "carborundum." The modern industrial
process — still called the Acheson process — carbothermically reduces silica
sand with petroleum coke in a resistive-heated furnace at roughly
1700-2500 °C, producing alpha-phase SiC; it has been in continuous
industrial production since 1893, initially and still substantially as an
abrasive.

**Structure and hardness.** SiC's Si–C bond energy (commonly tabulated
around 315-320 kJ/mol) is not itself unusually strong — comparable to Si–Si
and somewhat below C–C. Its exceptional hardness instead comes from crystal
structure: a fully tetrahedrally-bonded, close-packed covalent network
(analogous to diamond's all-carbon network, but with alternating silicon and
carbon atoms) in which every atom is locked into four strong, directional
bonds with no weaker secondary structure anywhere in the lattice to serve as
a slip or cleavage plane. The result is a Mohs hardness of roughly 9-9.5 —
essentially tied with corundum (sapphire/ruby), just below diamond's 10 —
and SiC held the record as the hardest known synthetic material from its
discovery until 1929.

**Natural occurrence and gemology.** Natural SiC occurs as the mineral
moissanite, first identified in fragments of the Canyon Diablo meteorite.
Synthetic moissanite is a well-known diamond simulant with a notably higher
refractive index (about 2.65-2.69, versus diamond's 2.417-2.418) and
substantially higher optical dispersion (about 0.104, versus diamond's
0.044) — more than double diamond's dispersion — meaning cut synthetic
moissanite actually throws more spectral "fire" than a diamond of equivalent
cut, a real, checkable optical fact jewelers use (along with moissanite's
double refraction, which diamond, a cubic and therefore singly-refractive
crystal, does not show) to distinguish the two under magnification.

**Uses.** Beyond abrasives and lapping compounds (including for polishing
harder-to-shape stones such as jade), silicon carbide is an important
wide-bandgap semiconductor material in modern power electronics, valued for
high-voltage, high-temperature switching applications where silicon-only
devices underperform, and it is used as a structural ceramic in high-
temperature and armor applications where its hardness and thermal stability
are decisive. Industrially, an alternative synthesis route pyrolyzes
preceramic polysilane or polycarbosilane polymers (the same class of
compounds discussed in §1) into SiC ceramic fiber, a route used to make
continuous SiC fiber for composite reinforcement.

## 10. The silicon-based-life question

Whether an alternative biochemistry could be built around silicon instead of
carbon is a genuine question in the astrobiology literature, not only a
science-fiction premise, and it has recently received a systematic treatment.
Petkowski, Bains, and Seager (*Life*, 2020, "On the Potential of Silicon as a
Building Block for Life") reviewed silicon's chemical capacity across
several candidate solvent environments and reached a broadly pessimistic
conclusion: in no environment they examined is silicon-based life a plausible
primary biochemical scaffold, though narrower roles for silicon remain
possible.

Their reasoning by environment:

- **Water.** Silicon's chemical capacity in a water-rich environment is
  highly limited because silicon is thermodynamically and kinetically
  driven toward forming silica and silicate minerals (exactly the Si–O
  driving-force mechanism of §1-§2), trapping it in unreactive rock rather
  than leaving it available for the sustained self-bonding and functional-
  group diversity complex biochemistry requires. Silicon could function only
  as a rare, specialized heteroatom in a water-based system, at real
  thermodynamic cost.
- **Concentrated sulfuric acid.** Somewhat counterintuitively, a larger
  fraction of silicon's chemical space is stable in concentrated sulfuric
  acid than in water — of interest because Venus's cloud layer is exactly
  such an environment — raising the theoretical possibility of silicon
  functioning as something closer to a common heteroatom there, rather than
  a marginal one.
- **Cryogenic solvents (e.g., liquid nitrogen).** Silicon compounds are
  chemically more stable at very low temperature, but even the simplest
  silicon compounds have very low solubility in cryogenic solvents such as
  liquid nitrogen, which the authors identify as an independent,
  solubility-driven barrier distinct from chemical stability.

The paper also restates, in an astrobiological framing, the same structural
limits developed mechanistically above: silicon forms weaker Si–Si bonds
than carbon's C–C bonds (§1), strongly favors Si–O connectivity over
Si–Si chains, and does not form stable double bonds comparable to carbon's
C=C and C=O (§3) — together preventing any straightforward substitution of
silicon for carbon in biology's existing molecular toolkit. The authors do
note silicon's theoretical capacity to form diverse polymers, including
complex copolymers with varied side groups, meaning the barrier is
specifically about solvent-environment stability rather than an intrinsic
lack of structural or combinatorial richness in silicon chemistry itself.
More speculative proposals in the wider literature — silicon-based
autotrophic virus-like particles as a minimal candidate system, for
instance — exist but remain unconfirmed hypotheses rather than established
findings, and are noted here as such.

## 11. Open problems

Several questions in this comparison remain genuinely unresolved rather than
merely under-cited:

- **Generality of templated biosilicification.** Silaffins and silicatein
  are independently characterized in diatoms and in one sponge species
  specifically (§6). Whether grasses, or other phytolith-forming lineages,
  use a directly homologous peptide-templating mechanism for silica
  deposition, versus an uncatalyzed or differently mediated route (silicic
  acid concentrated by transpirational water loss to supersaturation,
  followed by uncatalyzed condensation), has not been established with the
  same molecular specificity as the diatom and sponge cases. If a
  well-characterized biological silica-precipitating system were found
  operating with no organic templating machinery at all, the general claim
  "biosilicification requires templating" would need restating as
  "biosilicification is usually, but not always, templated" — a real but
  more modest claim.
- **Mechanistic detail of silicon's vertebrate connective-tissue role.**
  The Carlisle/Schwarz-era physiological findings (§7) are well established,
  but the precise biochemical mechanism by which silicon stabilizes
  glycosaminoglycan and collagen matrix structure is less fully resolved
  than the diatom/sponge biosilicification mechanisms, and remains an area
  where more recent molecular work has extended but not closed the
  question.
- **Whether the Si–O driving-force account of catenation asymmetry (§1) is
  standard.** The bond-energy-and-kinetics argument developed here is
  believed to represent standard chemical reasoning, but a single source
  stating the argument in exactly this integrated form (rather than as
  separately reported bond-energy tables and separately reported kinetic
  observations about silane reactivity) was not located in this review; it
  is worth a dedicated literature check rather than treating the synthesis
  as an established citation.
- **The stability limit of period-3 pi bonding.** The extent to which
  isolable silicon-silicon or silicon-oxygen multiply-bonded compounds
  represent "real" pi bonds versus weak, substituent-stabilized
  approximations of one has itself been an active and somewhat contested
  question in the recent physical-inorganic literature; the qualitative
  contrast between carbon's routine double-bond chemistry and silicon's
  near-absence of it under ordinary conditions is settled, but the finer
  electronic-structure characterization of the exceptional cases is not.
- **Terrestrial versus marine silica flux reconciliation.** The terrestrial
  phytolith flux (60-200 Tmol Si/yr) and marine biogenic flux (240 ± 40
  Tmol Si/yr) are reported from separate literatures (Conley 2002; Tréguer
  and De La Rocha 2013) using different methodologies; a more current,
  directly reconciled global budget than what this review located would be
  useful for anyone wanting a single authoritative planetary silicon-cycle
  number.

## A note on relevance to this research program

This comparison gives the estate's broader interest in material transformation
and self-organization a concrete, checkable backbone: two elements sharing a
valence structure diverge into an oxidation-driven chemistry (carbon) and a
connectivity-driven chemistry (silicon) for identifiable, quantifiable
reasons — bond-energy asymmetry, orbital-overlap-dependent pi bonding, and
regime-dependent reaction chemistry — rather than for reasons that stay at
the level of resemblance or metaphor. Where the estate wants to reason about
biological or geological silica processes (biosilicification, weathering,
phytoliths) on timescales shorter than their natural ones, or wants to treat
the carbon/silicon contrast as illustrative of some other domain, this review
is the place to check the actual numbers and mechanisms first.
