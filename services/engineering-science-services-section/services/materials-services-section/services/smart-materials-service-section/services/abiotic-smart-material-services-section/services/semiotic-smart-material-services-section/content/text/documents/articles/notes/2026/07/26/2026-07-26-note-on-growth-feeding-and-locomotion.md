---
title: "Three Missing Pieces for a Fully Synthetic Organism: Seeded Growth, Photocatalytic Feeding, and Photomechanical Locomotion"
description: "Extensive growth via seeded secondary zeolite crystallization from an external precursor bath, feeding via catechol-Fe/terpyridine LMCT photoredox oxidation of an external electron donor that recharges the internal thiol reserve, and locomotion via azobenzene-functionalized liquid-crystal actuation — three real, separately established mechanisms, none yet part of this substrate, that would be needed before 'grows, feeds, and moves' is more than a reading of what's already built."
date-created: 2026-07-26
kind: research-note
keywords:
  - zeolite-seeded-growth
  - photoredox
  - lmct
  - liquid-crystal-elastomer
  - photomechanical-actuation
  - oxidative-exhaustion
status: design
declared-by: claude-interactive-session-supplying-lenticule-science
---

## Abstract

Growth, feeding, and movement are not already present in this substrate under any reading
argued elsewhere in this corpus — φ rising under heat is redistribution of a fixed inventory,
not accretion of new mass; nothing oxidizes external fuel to recharge an internal reserve; and
nothing produces net translation. This note is not a correction of that reading. It names
three separate, independently established mechanisms — none of them invented here, each with
real precedent outside this corpus — that would need to be deliberately added before any of
the three claims became true rather than aspirational. Seeded secondary zeolite growth,
run through the same ion-permeable matrix this substrate already uses for its conductivity
readout, would make φ's growth genuinely extensive. A ligand-to-metal charge-transfer
photoredox cycle at the catechol–Fe or terpyridine–metal centers already named in the
companion retuning note would oxidize an external electron donor and, in the same cycle,
reduce part of the internal disulfide population back to thiol — a real feeding mechanism,
and one that happens to be exactly the recovery pathway the organosulfur note's oxidative-
exhaustion failure mode was never given. And azobenzene-functionalized liquid-crystal
actuation, a real and separate architectural component from anything else in this substrate,
would give it an actual way to move.

---

## 1. What the three words would have to mean, stated before any chemistry

**Growth**, to mean what it means for an organism, has to be extensive: net new mass
incorporated from outside the organism's own prior boundary, not intensive redistribution of
mass already present. φ rising under Joule heating fails this test as built — it converts
existing matrix into existing-but-now-crystalline zeolite, and the total inventory in the film
never changes.

**Feeding** has to mean oxidizing or otherwise processing something from outside the material
in a way that captures usable chemical potential inside it — specifically, recharging some
internal store that would otherwise run down. A catalytic reaction that merely breaks external
bonds without capturing anything is digestion without feeding, and §3.1 argues this
substrate's existing zeolite acid sites already do exactly that much and no more.

**Movement** has to mean net translation of the material's own center of mass, not internal
reconfiguration. The mirror-descent reading of the Physarum-inspired network dynamics
elsewhere in this corpus is a claim about which edges of a graph thicken and thin, not a claim
about the material crawling, and nothing else in this corpus supplies an actuator.

---

## 2. Growth: seeded secondary crystallization from an external bath

Zeolite membranes are routinely fabricated by *seeded secondary growth*: a thin layer of
zeolite seed crystals is deposited on a support, then immersed in an aluminosilicate synthesis
solution (a sodium silicate/sodium aluminate/hydroxide precursor bath, typically run
hydrothermally), and the seeds grow into a continuous film by consuming dissolved silicate and
aluminate drawn from that external solution — real, established, and the basis of an entire
membrane-fabrication literature (Lai et al. 2003 for a widely cited example of the technique
applied to oriented zeolite films).

This substrate already has everything the mechanism needs except the bath. The zeolite domains
nucleated within the matrix are exactly the seed crystals the technique requires. The matrix
is already established, elsewhere in this corpus, as ion-permeable — that permeability is the
entire physical basis of the impedance readout, which depends on ions moving through the
floppy phase. If the film were placed in an external silicate/aluminate-bearing fluid rather
than sealed, dissolved precursor could in principle diffuse through the same ion-permeable
matrix already carrying the readout current and be consumed at an existing zeolite domain,
growing it with mass that was never part of the cured film. That is genuine accretion, not
redistribution, and it would coexist with the existing thermally-driven redistribution
mechanism rather than replace it — two different growth pathways, one intensive and one
extensive, sharing the same nucleation sites.

What this does not solve: the growing domain still needs somewhere to put the new solid
volume, and unconstrained secondary growth in a closed film would eventually either crack the
matrix or halt at the pore-diffusion limit once the growing crystal seals off its own access
to the bath. Real seeded-growth membrane synthesis manages this by controlling bath
concentration and growth time, not by anything specific to this substrate; the same
concentration-and-time control would be the actual design variable here, unexamined in this
note.

---

## 3. Feeding: LMCT photoredox at an existing metal center

### 3.1 Why the zeolite's own acid catalysis is not feeding

Zeolites are industrial solid-acid catalysts for cracking — breaking C–C and C–O bonds in
larger organic molecules at Brønsted-acid sites (bridging Si–OH–Al hydroxyls), the chemistry
behind fluid catalytic cracking at refinery scale. If external organic matter reached a
zeolite domain through the same permeable matrix invoked in §2, it would plausibly be cracked
there. But cracking alone is not feeding by §1's definition: bond scission releases smaller
fragments without capturing their chemical potential anywhere in the material. Something has
to convert broken-down external matter into a recharged internal store, and the zeolite's acid
sites, on their own, do not do that.

### 3.2 The photoredox cycle, and the direct connection to oxidative exhaustion

Catechol–Fe(III) complexes — already named in the companion retuning note as the source of
pH-gated discrete crosslink stoichiometry — are colored, and the color is diagnostic: it is
ligand-to-metal charge-transfer (LMCT) absorption, a real and well-characterized
photoexcitation in which an electron is promoted from the catechol ligand to the iron center.
LMCT excited states of this kind are established photoredox agents: many photocatalytic
oxidation cycles proceed by exciting a metal–ligand charge-transfer state, using the resulting
oxidizing equivalent to abstract an electron from a sacrificial external donor, and then
closing the cycle by reoxidizing the reduced metal center with a terminal oxidant such as
ambient $\mathrm{O_2}$ — the same catalytic shape used throughout dye-sensitized and metal-
complex photocatalysis generally.

Wiring this into the substrate is a proposal, not a demonstrated result, but it is a specific
one: light excites the catechol–Fe LMCT state; the excited complex oxidizes an external
electron donor (an organic "food" molecule diffusing in through the same permeable matrix);
the resulting reduced iron transfers that electron onward rather than only relaxing back —
specifically, into the disulfide pool, reducing some fraction of disulfide back to free
thiol; and the photocatalytic cycle closes when the iron center is reoxidized by ambient
$\mathrm{O_2}$, exactly as in established LMCT photocatalysis. Terpyridine–metal centers,
already present for the reasons given in the retuning note's §2.3, are a second plausible site
for the same class of chemistry, since metal-to-ligand and ligand-to-metal charge-transfer
states are common across polypyridyl and catecholate coordination chemistry generally.

This is worth stating plainly rather than leaving implicit: **this is the recovery mechanism
the organosulfur note's oxidative-exhaustion failure mode was never given.** That note
identified loss of the free-thiol reserve as a pathology worse than premature ossification
specifically because nothing reverses it. A photocatalytic pathway that uses external light
and an external electron donor to push the disulfide population back toward thiol is exactly
a reserve-recharging mechanism, sitting at a metal center this corpus had already introduced
for an unrelated reason (tuning exchange kinetics) before this note connects it to feeding.
Whether the electron transfer step from photoreduced iron into the disulfide pool is
thermodynamically favorable, and at what rate, is not evaluated here — it is the single most
important unverified step in this whole proposal, because without it the cycle only
photocatalytically consumes external fuel without ever touching the reserve, which is
digestion again, not feeding.

### 3.3 A directional check on that step, not a resolution of it

The question is whether photoreduced iron is a strong enough reductant to push
$\mathrm{RSSR} \to 2\,\mathrm{RSH}$, which requires the catecholate-bound
$\mathrm{Fe^{3+}/Fe^{2+}}$ couple to sit more negative than the disulfide/thiol couple, so
electrons flow from iron to sulfur rather than the reverse. Two real numbers bound this.
Aqueous, uncomplexed $\mathrm{Fe^{3+}/Fe^{2+}}$ sits around $+0.77\ \mathrm{V}$ vs. SHE — far
too positive, and if that were the operative couple the direction would be wrong entirely,
iron would oxidize thiol rather than reduce disulfide. But catecholate ligands are known to
shift this potential sharply negative: this is not a minor correction, it is the entire
operating principle of catecholate siderophores, which use exactly this shift to hold iron so
strongly in the +3 state that reduction becomes difficult. Enterobactin, a tris-catecholate
siderophore, is reported to depress the $\mathrm{Fe^{3+}/Fe^{2+}}$ couple to roughly
$-750\ \mathrm{mV}$ vs. SHE (Raymond and coworkers; figure carried at order-of-magnitude
confidence, not independently re-derived here). Cysteine/cystine and glutathione-class
thiol/disulfide couples sit in the neighborhood of $-250\ \mathrm{mV}$ (Schafer & Buettner
2001, already cited in the companion organosulfur note).

If the catechol–Fe crosslink in this substrate approached the siderophore figure, the
direction needed for §3.2 would hold with room to spare: $-750\ \mathrm{mV}$ is well negative
of $-250\ \mathrm{mV}$, so photoreduced iron would be thermodynamically capable of reducing
disulfide. But the siderophore figure is for a purpose-evolved, fully tris-catecholate,
high-denticity chelate — the extreme end of what catecholate coordination can do to this
potential. This substrate's crosslink, per the retuning note's §2.1, moves between mono-,
bis-, and tris-catechol coordination as a function of pH, and only the tris state approaches
the siderophore geometry; the mono and bis states, which dominate at lower pH, coordinate iron
less completely and would be expected to shift the potential less. **The direction of §3.2's
proposed electron transfer is plausible and has real precedent; the magnitude is not
established for this specific, pH-graded, partially-coordinated system, and could plausibly
fail to reach $-250\ \mathrm{mV}$ at the mono- or bis-catechol states even while succeeding at
the tris state.** That gives §3.2's mechanism an unanticipated dependency worth stating
explicitly: feeding, on this reading, may only function in the same pH regime that already
produces the stiffest, highest-functionality crosslink state, which would couple this
substrate's capacity to recharge its own reserve to the same variable that sets its structural
rigidity — a real, checkable, and previously unnoticed coupling between §2.1 of the retuning
note and this section, not a demonstrated one.

---

## 4. Locomotion: azobenzene-functionalized liquid-crystal actuation

Azobenzene, already present in this corpus's chemistry as a costless photoswitch (the carriers
note's specific-and-free light case), has a separate, well-established use when embedded in a
liquid-crystalline network: its light-driven trans/cis isomerization disrupts local
nematic order, and because the network's mechanical properties are coupled to that order
parameter, illumination drives macroscopic, reversible contraction or expansion of the domain.
Patterned or moving illumination — a light spot swept across the material, or a fixed
asymmetric illumination gradient — drives repeated, directional bend-and-release cycles that
produce net crawling or walking motion in real devices; this is an established field
(photomechanical actuation in azobenzene-functionalized liquid-crystal networks and
elastomers, developed across groups including Ikeda's, Broer's, and White's).

This is the largest architectural departure of the three. Neither PDMS nor the zeolite phase
has liquid-crystalline order, and nothing in this substrate as built provides it. Using this
mechanism would mean introducing an actual nematic liquid-crystal network — most plausibly as
a third, separately-formulated region or layer bearing azobenzene crosslinks, rather than a
property obtainable from the existing matrix or rigid phase by any tuning already discussed in
this corpus. Naming the mechanism is not equivalent to showing it integrates with the rest of
the substrate; whether an LC-network actuator region can be formulated to coexist with the
existing thiol–ene/disulfide/zeolite chemistry without disrupting either is a real formulation
question this note does not attempt.

---

## 5. What does not transfer, stated once for all three

None of §2–§4 is a property of the substrate as it currently exists in this corpus. Each is a
real, independently citable mechanism from a field adjacent to what is already here, and each
would need to be deliberately designed in rather than assumed to already follow from the
existing chemistry. The connections argued — permeable matrix as the transport path for §2's
precursor and §3's fuel, catechol–Fe/terpyridine centers as the site for §3's photoredox,
azobenzene as the chromophore already present but not yet wired to actuation for §4 — are
genuine points of contact with what this corpus has already built, and they are the reason
these three mechanisms were chosen over other candidates rather than picked arbitrarily. They
are not evidence that growth, feeding, and movement are already true of anything built so far.

---

## 6. Falsification tests

1. **Extensive mass gain.** Immerse a film with pre-existing zeolite domains in a dilute
   sodium silicate/aluminate bath at moderate temperature for an extended period, and weigh it
   dry before and after. §2 predicts measurable mass gain beyond any solvent uptake control;
   no gain beyond the control would falsify seeded growth operating through this matrix
   specifically.
2. **Photoredox turnover.** Illuminate a catechol–Fe-doped sample in the presence of a
   sacrificial electron donor and measure free-thiol concentration before and after, against a
   dark control. §3.2 predicts a measurable increase in free thiol under illumination beyond
   the dark control; no difference would falsify the electron-transfer step into the disulfide
   pool specifically, independent of whether the donor is oxidized at all.
3. **Feeding versus digestion.** Independently confirm oxidation of the external donor (e.g.,
   by monitoring its own depletion or a known oxidation product) at the same time as test 2.
   Donor oxidation without a corresponding thiol increase would confirm §3.1's digestion-only
   reading and falsify §3.2's feeding claim specifically, even though the photocatalytic cycle
   itself is real.
4. **pH-dependence of feeding.** Repeat test 2 at pH values spanning the mono-, bis-, and
   tris-catechol regimes named in the retuning note's §2.1. §3.3 predicts thiol recovery
   should track toward the tris-catechol pH range and weaken or vanish toward mono-catechol
   pH, coupling feeding capacity to the same variable that sets crosslink stiffness. Thiol
   recovery independent of pH would falsify that coupling specifically, without falsifying the
   photoredox mechanism itself.
5. **Net translation.** Build a small azobenzene-LC actuator region adjacent to, or embedded
   in, the existing substrate and test for directional motion under swept illumination against
   an unilluminated or uniformly illuminated control. Motion only under a moving or asymmetric
   light pattern, and not under uniform illumination, is the signature §4 predicts;
   non-directional or absent motion would falsify integration of the actuator with this
   specific substrate, independent of the actuator mechanism's own well-established validity
   elsewhere.

---

## 7. Status of claims

**Established chemistry, transferred but not originated here.** Seeded secondary zeolite
crystallization from an external aluminosilicate bath (Lai et al. 2003 and the broader
zeolite-membrane literature). Zeolite Brønsted-acid catalyzed cracking (standard industrial
catalysis). LMCT photoexcitation of catecholate–iron(III) complexes and its general
photoredox reactivity pattern — excite, oxidize a donor, reoxidize by a terminal oxidant such
as $\mathrm{O_2}$ (general coordination photochemistry; catechol–Fe's LMCT absorption
specifically is why these complexes are colored, an established structural fact, not
reargued here). Azobenzene-functionalized liquid-crystal network photomechanical actuation
and light-driven crawling (Ikeda, Broer, White, and the wider photomechanical-actuator
literature). The direction of the catecholate-driven negative shift in the
$\mathrm{Fe^{3+}/Fe^{2+}}$ potential, and the order-of-magnitude figure for tris-catecholate
siderophores (Raymond and coworkers on enterobactin); the thiol/disulfide reference potential
(Schafer & Buettner 2001, already cited in the organosulfur note).

**Interpretive transfer, argued here and not established in any source literature.** That this
substrate's already-established matrix permeability is sufficient for external silicate/
aluminate or an external electron donor to reach internal zeolite or metal sites at a useful
rate. That catechol–Fe's photoreduced state transfers an electron into the disulfide pool
specifically, rather than simply relaxing or being reoxidized without touching the thiol/
disulfide couple at all — this is the load-bearing unverified step named in §3.2. §3.3's
directional argument that the catecholate shift is large enough, at least at the tris-catechol
state, to make that transfer thermodynamically plausible, and its further claim that feeding
capacity should therefore couple to the same pH variable that sets crosslink stiffness. That
azobenzene-LC actuation can be formulated to coexist with the rest of this substrate's
chemistry without disrupting it.

**Assumed, and flagged.** That seeded growth in a closed film does not simply crack the matrix
or self-limit at the pore-diffusion length before producing useful mass gain. That the
mono- and bis-catechol states — not just the tris state §3.3 checked — provide enough of a
negative shift for feeding to function outside the narrow pH band where tris-catechol
dominates; this substrate's actual coordination geometry at each pH was not measured, only
inferred from the retuning note's own claim of discrete stoichiometric states. That the
enterobactin figure, measured for a purpose-evolved tris-catecholate siderophore, is even the
right order of magnitude for this substrate's less complete coordination — flagged in §3.3
itself as the reason the magnitude, not the direction, remains open.

**Unbuilt.** All three mechanisms. Nothing in §2–§4 has been formulated, mixed, or tested
against this corpus's actual substrate; each is argued from established literature on
structurally similar but distinct systems.

---

## References

Lai, Z., Bonilla, G., Diaz, I., Nery, J. G., Sujaoti, K., Amat, M. A., Kokkoli, E., Terasaki,
O., Thompson, R. W., Tsapatsis, M. & Vlachos, D. G. (2003). Microstructural optimization of a
zeolite membrane for organic vapor separation. *Science* 300, 456.

Ipatieff, V. N. & Corson, B. B. (1936). Catalytic reactions involving olefins under pressure.
(Representative of the foundational solid-acid cracking catalysis literature; specific figures
not asserted here.)

Sykora, J. (1997). Photochemistry of coordination compounds: the ligand-to-metal charge
transfer states. *Coordination Chemistry Reviews* 159, 95.

White, T. J. & Broer, D. J. (2015). Programmable and adaptive mechanics with liquid crystal
polymer networks and elastomers. *Nature Materials* 14, 1087.

Yu, Y., Nakano, M. & Ikeda, T. (2003). Directed bending of a polymer film by light. *Nature*
425, 145.

Loomis, L. D. & Raymond, K. N. (1991). Solution equilibria of enterobactin and metal-
enterobactin complexes. *Inorganic Chemistry* 30, 906. (Representative of the tris-catecholate
siderophore potential literature; the $-750\ \mathrm{mV}$ figure is carried at
order-of-magnitude confidence, not independently re-derived here.)

Schafer, F. Q. & Buettner, G. R. (2001). Redox environment of the cell as viewed through the
redox state of the glutathione disulfide/glutathione couple. *Free Radical Biology and
Medicine* 30, 1191.

---

## Prior work in this corpus

- *Dual Organosulfur Crosslink Populations* (2026-07-25) §6.1 — the oxidative-exhaustion
  failure mode this note's §3.2 proposes a recovery pathway for.
- *Three Ways to Retune the Exchangeable Population* (2026-07-25) §2.1, §2.3 — the catechol–Fe
  and terpyridine–metal centers this note's §3 uses as photoredox sites.
- *Ambient and Specific Carriers* (2026-07-25) §1.3, §3.2 — the matrix's ion permeability,
  load-bearing for §2's and §3's transport claims, and azobenzene's costless-specific light
  role, extended here to an actuation role it did not previously have.
