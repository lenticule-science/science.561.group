---
title: "Group 14 Divergence: Carbon and Silicon Chemistry"
description: "A chemist's inquiry program on why carbon and silicon, tetravalent neighbors in the same group, diverge so completely in behavior: catenation and bond-energy asymmetry, redox versus condensation transformation regimes, silicic acid speciation and biosilicification, the silicate weathering thermostat as a planetary carbon-silica coupling, and silicon carbide as their one direct union."
date-created: 2026-08-21
type: notes
name: 2026-08-21-note-on-group-14-divergence-carbon-and-silicon-chemistry
authors:
  - claude-sonnet-5
keywords:
  - chemistry
  - silicon
  - carbon
  - catenation
  - bond-energy
  - biosilicification
  - carbon-cycle
  - silicon-carbide
  - inquiry-program
---

# Group 14 Divergence: Carbon and Silicon Chemistry

## 0. The question a chemist actually asks

Carbon and silicon sit one above the other in group 14: both have four
valence electrons, both bond tetrahedrally in their common compounds, both
form the basis of an entire kingdom of chemistry (organic chemistry;
silicate/silicone chemistry). A chemist does not find "they diverge
completely" surprising in the way a first glance might suggest — group
trends are full of elements that share a valence configuration and diverge
sharply in behavior down a column — but *why*, specifically, mechanistically,
quantitatively, is a real and answerable question, not a metaphor waiting for
grounding. This note works through five sub-questions in the order a
chemist would actually reach for them: bond energetics, catenation, reaction
mechanism class (redox vs. condensation), aqueous silicate speciation and its
biological exploitation, and the one direct silicon-carbon compound.

## 1. Bond-energy asymmetry: why silicon doesn't catenate the way carbon does

Average bond dissociation energies, drawn from standard sources and
corroborated this session against a literature search:

| bond | approx. energy (kJ/mol) |
|---|---|
| C–C | ≈ 356 |
| Si–Si | ≈ 327 |
| Si–O | ≈ 444 |
| C–O | ≈ 358 (comparable to C–C) |

**The decisive number is Si–O, not Si–Si.** Si–Si is only modestly weaker
than C–C (roughly 8% lower) — catenation weakness alone would predict silicon
chains merely somewhat less stable than carbon chains, not the near-total
absence of a silane-based "organic chemistry" that is actually observed.
What actually suppresses silicon catenation is the **very large energetic
preference for Si–O over Si–Si**: forming one Si–O bond in place of one Si–Si
bond releases roughly 100+ kJ/mol, and because silicon is both abundant in
combination with oxygen (as SiO₂ and silicates) and *kinetically* accessible
to oxidation/hydrolysis (Si–H bonds are far more reactive toward O₂ and H₂O
than C–H bonds are — silanes are pyrophoric or at least aggressively
hydrolyzed, while alkanes are kinetically inert to both under ordinary
conditions), any Si–Si chain formed is thermodynamically and kinetically
primed to react itself into a network of Si–O–Si bridges the moment oxygen or
water is present. Carbon chains are not under comparable pressure: C–O is not
dramatically more stable than C–C the way Si–O is dramatically more stable
than Si–Si, so there is no strong thermodynamic driving force pushing every
C–C chain toward oxidative disassembly, and C–H's kinetic inertness toward O₂
at ambient temperature (combustion requires ignition energy) means carbon
chains are kinetically persistent even where they are not thermodynamically
the most stable arrangement. **The asymmetry is therefore not primarily a
catenation-strength story; it is a combined thermodynamic-driving-force and
kinetic-barrier story, and the driving force is specifically the anomalous
strength of the Si–O bond.** This is a sharper and more mechanistic claim than
"silicon barely catenates," and it is the one worth carrying forward if the
estate wants to build anything on the bond-energy asymmetry rather than just
gesture at it.

This framing makes a testable prediction: if the Si–O-preference account
is right, silicon catenation should be *much* more stable and accessible in
rigorously anhydrous, anaerobic conditions than the ordinary-conditions
picture suggests — and this is in fact exactly what is observed: long-chain
polysilanes (Si_nH_{2n+2} analogues of alkanes, and substituted
polysilanes with organic side groups) are synthesizable and reasonably stable
*specifically* under controlled, oxygen/moisture-free synthesis, which is
strong independent support for the thermodynamic-driving-force account over a
pure bond-strength account.

## 2. Redox chemistry versus condensation chemistry: different verbs, and why

This is a real and useful distinction, cleanly statable in oxidation-state
terms. Carbon's chemistry of interest — combustion, respiration,
photosynthesis, fermentation, essentially all of metabolism — is a chemistry
of **oxidation-state change**: carbon cycles between roughly −4 (methane) and
+4 (CO₂) across its various compounds, and the energy that powers life is
substantially the energy released or captured in moving carbon (and
associated hydrogen/oxygen) between oxidation states. Silicon's chemistry of
interest at ordinary planetary conditions — silicate weathering, biogenic
silica formation, zeolite and clay chemistry, opal diagenesis — occurs with
silicon **fixed at +4** throughout: dissolved orthosilicic acid Si(OH)₄ is
Si⁴⁺; quartz is Si⁴⁺; every silicate mineral silicon sits at is Si⁴⁺. What
changes is purely **connectivity** — how many Si–O–Si bridges a given silicon
center participates in — via condensation (Si–OH + HO–Si → Si–O–Si + H₂O,
releasing water) and its reverse, hydrolysis. This is why the estate's
"fire versus water" framing of the two chemistries, while informal, tracks a
real mechanistic distinction: carbon's transformations are driven by
electron transfer (a "fire" process in the loose sense of releasing or
requiring energy via bond reorganization at the electronic level); silicon's
transformations under ordinary aqueous, ambient-temperature conditions are
driven by solubility equilibria and condensation/hydrolysis (a "water"
process in the literal sense — it is water molecules being made or consumed
at every step). **The important caveat a chemist adds:** silicon *does* have
real redox chemistry — elemental silicon (0 oxidation state, as in
semiconductor-grade Si or ferrosilicon) is industrially significant, and the
reduction of SiO₂ to Si (as in the Siemens process, or in the carbothermic
reduction used to make both elemental silicon and silicon carbide, §5 below)
is exactly a redox transformation. What is true is that silicon's chemistry
*at the ambient aqueous planetary surface conditions where biology and
geology mostly operate* is overwhelmingly the +4, condensation-only regime;
the redox regime is real but is a high-temperature, industrial, or
deep-geological regime, not the ambient one. This distinction — regime-
dependent, not element-inherent — matters for exactly the same reason the
mineralogy note's regime-dependence point about opal diagenesis matters (see
that note, §4): claims of the form "element X only does chemistry of kind Y"
are almost always claims about a *regime*, and stating the regime explicitly
is what makes the claim checkable.

## 3. Silicic acid speciation, supersaturation, and biosilicification

Orthosilicic acid, Si(OH)₄, is the monomeric species dissolved silica
takes in water at near-neutral pH, and its solubility and speciation are
unusually well quantified in the geochemistry literature, which gives this
sub-question the most concrete numbers of any in this note:

- **Solubility of amorphous silica at 25 °C, near-neutral pH:** commonly
  cited as ≈ 115 ppm SiO₂, with a real reported range of roughly 70–150+ ppm
  depending on particle size, hydration state, and impurities (this range is
  itself informative — amorphous silica's solubility is not a single sharp
  number but depends on the exact surface/structural state of the solid,
  which is a live variable in any biosilicification or diagenesis argument).
- **pH dependence:** solubility is essentially flat (pH-independent) below
  pH ≈ 9, then rises sharply above pH ≈ 9 as silicic acid begins to
  deprotonate and ionize (reported values run from ≈ 138 ppm at pH 9 up to
  ≈ 876 ppm at pH 10.6) — the practical consequence is that silica solubility
  behavior is dominated by whether a system is above or below pH 9, a single
  clean threshold.
- **Supersaturation and polymerization:** solutions in contact with solid
  amorphous silica readily become and *stay* supersaturated — steady-state
  supersaturation in the range 120–170 ppm has been observed to persist for
  months — because nucleation of new silica particles from a supersaturated
  solution has a real kinetic barrier (an induction time) distinct from
  simple thermodynamic instability; higher supersaturation shortens that
  induction time. This is the precise chemical content behind the estate's
  informal "settling is a precipitation word" observation (silica-and-carbon
  note, §2): supersaturation is a real, measurable, sometimes long-lived
  state, and "settling" — polymerization crossing from monomer through
  oligomers to solid — is a real kinetic event with its own rate law, not an
  instantaneous consequence of merely exceeding solubility.

**Biosilicification: how organisms actually do this chemistry.** Diatoms
and siliceous sponges do not merely wait for silica to precipitate on its
own; they use dedicated organic machinery to control nucleation, rate, and
morphology at ambient temperature and near-neutral pH — conditions under
which *industrial* silica synthesis typically requires much more extreme pH
or temperature to achieve comparable structural control. Two specific,
independently characterized mechanisms:

- **Silaffins** — polycationic, post-translationally modified peptides
  isolated from diatom cell walls — directly induce condensation of silicic
  acid from supersaturated solution, apparently by locally concentrating and
  templating silicic acid via their charged, modified side chains.
- **Silicatein** — a protein isolated from the silica spicules of the sponge
  *Tethya aurantia* — actively hydrolyzes and condenses silicon-alkoxide
  precursors (demonstrated experimentally with tetraethoxysilane, a
  laboratory silicon-alkoxide analogue of the biological substrate) into
  silica structures with controlled shape, at ambient temperature and
  near-neutral pH.

Both mechanisms are consistent with a two-step model: **templated nucleation**
(an organic scaffold defines where and how silica first solidifies) followed
by **surface completion/rigidification** (further silica deposits onto and
consolidates the templated nucleus). This is the molecular-level answer to
how bamboo's phytolith and tabasheer formation (covered in full in the
companion botany inquiry note) actually happens biochemically, though this
note flags an honest gap: silaffins and silicatein are characterized in
diatoms and in one sponge species specifically; whether bamboo or other
grasses use a directly homologous peptide-templating mechanism, versus some
other route to the same net transformation (silicic acid entering
concentration gradient → supersaturation on transpirational water loss →
uncatalyzed or differently-catalyzed condensation), is a live question this
note did not resolve and flags for the botany note to take up on its own
terms.

## 4. The silicate weathering thermostat: the real planetary coupling

This is real, well-established Earth-system science, not speculative: the
**carbonate–silicate cycle** (classically Walker, Hays & Kasting 1981) is a
negative feedback loop in which chemical weathering of continental silicate
rocks consumes atmospheric CO₂ (silicate + CO₂ + H₂O → carbonate + silica in
solution, in the generalized reaction), with the carbonate ultimately
sequestered in ocean sediment; weathering rate rises with temperature and
precipitation, both of which rise with atmospheric CO₂ via the greenhouse
effect, so a warmer climate weathers faster, draws down CO₂ faster, and cools
itself back down — and a cooler climate weathers more slowly, allowing CO₂ to
accumulate and warm the system back up. This is the actual, quantitative,
literally-named "planetary thermostat," and it is exactly what the
silica-and-carbon note's §8 gestured at as an "untouched" open thread ("the
silicate weathering thermostat, in which stone slowly breathes carbon out of
the sky over geological time").

**The number that makes it checkable:** the characteristic timescale of the
silicate-weathering negative feedback on atmospheric CO₂ has been directly
estimated (Colbourn et al. 2015, *Global Biogeochemical Cycles*) at roughly
**170,000–380,000 years, averaging around 240,000 years**. This is the
timescale over which a CO₂ perturbation — a volcanic outgassing event, a mass
extinction-associated carbon release, or the current anthropogenic pulse —
gets substantially damped by this specific feedback. It is a genuinely
enormous number relative to any human institutional timescale (six orders of
magnitude longer than a human lifetime), which is worth stating plainly
alongside the diagenesis timescales in the companion mineralogy note (§4):
**both of the estate's two big "silica economy" processes — opal diagenesis
and the weathering thermostat — turn out to run on timescales of 10⁴–10⁸
years in their natural, unforced regime.** Any estate-side use of either
process as a metaphor for something operating on a timescale of days, months,
or years is, mineralogically and geochemically, importing the *shape* of a
feedback or maturation process while discarding the one number (its rate)
that made it a real physical claim rather than a resemblance.

## 5. Silicon carbide: the one direct union, and what it actually is

Silicon carbide (SiC) is the one compound in which carbon and silicon
form a direct 1:1 covalent bond throughout an extended lattice, and its
properties are exceptional and well characterized: Mohs hardness ≈ 9–9.5
(essentially tied with corundum, just below diamond's 10); it is synthesized
industrially by the **Acheson process** (Edward Acheson, 1891 — silica sand
and petroleum coke, carbothermically reduced and reacted at roughly
1700–2500 °C in a resistive-heated furnace; Acheson found it while actually
trying to synthesize artificial diamond and instead discovered an
industrially transformative abrasive). Natural SiC occurs as the mineral
moissanite, first identified in fragments of the Canyon Diablo meteorite;
synthetic moissanite is a well-known diamond simulant, with a notably higher
refractive index (≈ 2.65–2.69 vs. diamond's 2.417) and higher optical
dispersion (0.104 vs. diamond's 0.044) — meaning synthetic moissanite is
actually *more* fiery/sparkly than diamond under equivalent cut, a fact
jewelers use to distinguish the two. SiC's hardness is exactly why it is used
industrially as an abrasive and lapping compound for cutting and polishing
harder-to-shape stones, including, as the source note observes, jade itself —
this is a real, checkable, industrially unremarkable fact, not a poetic
flourish.

**Why SiC's bond energy sits where it does:** the Si–C bond energy (≈ 318
kJ/mol by most tabulations, broadly comparable to Si–Si and somewhat below
C–C) is not itself unusually strong; SiC's exceptional hardness comes instead
from its crystal structure — a fully tetrahedrally-bonded, close-packed
covalent network (analogous to diamond's carbon network, but with alternating
Si and C atoms) in which every atom is rigidly locked into four strong
directional bonds with no weaker secondary structure anywhere in the lattice
to serve as a slip plane or cleavage plane. This is the same "no cleavage
plane, but for the opposite reason to jade" case worth flagging explicitly:
diamond and SiC are hard/tough because they are single, essentially
defect-free covalent networks with directionally-locked bonding throughout;
jade is tough (not especially hard) because it is the *opposite* structural
extreme — many small, locally perfect but mutually misaligned domains. Group
14 chemistry, on this reading, supplies both ends of the toughness spectrum's
structural explanation from the same starting element.

## 6. Open questions

A corrective worth stating plainly for anyone using the "fire versus water"
framing elsewhere in the estate: the redox-versus-condensation contrast in
§2 is a real and useful mechanistic distinction, but it is regime-dependent
(silicon does have real redox chemistry, just not at ambient aqueous
conditions) rather than an element-inherent law, and naming the regime
explicitly is what keeps the distinction a checkable chemical claim rather
than an elemental essentialism.

Whether bamboo or grasses generally use a silaffin/silicatein-homologous
peptide-templating mechanism for phytolith and tabasheer formation, versus
an uncatalyzed or differently mediated route, is left open here for the
companion botany note to take up. More broadly, the templating picture in
§3 rests on two well-characterized cases (diatom silaffins, sponge
silicatein); if a well-characterized biological silica-precipitating system
were found operating with no organic templating machinery at all, that
picture would need restating as "biosilicification is usually, not always,
templated" — a real but more modest claim.

A smaller open thread: whether the Si–O driving-force account of catenation
asymmetry (§1) is the standard account in the physical-organic/inorganic
chemistry literature, or is this note's own synthesis of separately-reported
bond-energy and kinetic-inertness facts. It reads as standard chemical
reasoning, but a single source stating it in exactly this integrated form
was not located this session, and that is worth a follow-up literature
check rather than an assumption either way.
