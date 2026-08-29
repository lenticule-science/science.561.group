---
title: "Ossification as the State Variable: Rigidity Percolation in a Two-Phase Ionic Substrate"
description: "Corrects the zeolite phase's role from transport medium to ossified, over-constrained record-bearing phase; states rigidity percolation as the composite's state variable and names the graphic-vs-rigidity-matroid gap."
date-created: 2026-07-25
kind: research-note
keywords:
  - rigidity-percolation
  - constraint-counting
  - ossification
  - zeolite
  - matroids
status: design
declared-by: claude-interactive-session-supplying-lenticule-science
---
# Ossification as the State Variable: Rigidity Percolation in a Two-Phase Ionic Substrate

## Abstract

We correct a misintegration in a family of upstream design documents and state the device
they describe. The error is one of role assignment: the zeolite phase was treated as the
transport medium, and the resulting formulation then had to solve an impossible problem —
bonding a rigid filler to a matrix while keeping an ionic path through it. The zeolite's
actual role is the opposite. It is the **ossified phase**: a four-connected aluminosilicate
framework at mean coordination $\langle r\rangle = 4$, well above the Phillips–Thorpe
rigidity threshold $\langle r\rangle_c = 2.4$, hence *over*-constrained and stressed-rigid.
Transport happens in the flexible matrix, in the region the ossified phase has not yet
claimed. The state variable is therefore not conduction through the filler but the **degree
of ossification** — the position of the composite relative to its rigidity percolation
threshold — and the gyrobifastigium ($J_{26}$) is the correct space-filling geometry for the
rigid domain, not a block copolymer mesophase. We give the corrected picture, identify what
each upstream document must change, and state the one mathematical gap this opens: the
governing transition is *rigidity* percolation, whose matroid is the generic rigidity
matroid of Laman, while the available formalization counts the graphic matroid's cycle rank.
These differ, and the difference is the frontier.

**Keywords:** rigidity percolation, constraint counting, floppy modes, ossification,
vitrimer, zeolite, glass-ceramic, gyrobifastigium.

---

## 1. The misintegration

Four upstream documents propose a siloxane–zeolite composite and describe it as a transport
network: zeolite particles surface-grafted into a polydimethylsiloxane matrix, percolating
to form channels, with the cover-nerve cohomology of that channel network as the governing
mathematics.

Read that way, the design is self-defeating, and the defects compound. A hydrophobic
vinylsilane graft is the right fix for interfacial voiding — but an insulating interphase
between particles is exactly what blocks the ionic path the device is supposed to use. The
formulation must simultaneously choose hydrophobic high-silica MFI (which has almost no
exchangeable cations, so it cannot conduct ions) and hydrophilic Na-LTA (which is a
desiccant that poisons the platinum cure). Loading must reach a percolation threshold that
drives the modulus far past the stated target. Every one of these is a genuine
contradiction, and together they mean the transport reading cannot be repaired by
adjustment.

They dissolve on the correct reading. **The zeolite is not the conductor. It is the thing
that stops flowing.**

## 2. Ossification, stated as constraint counting

Phillips and Thorpe's constraint-counting theory gives the rigidity transition of a network
glass in terms of mean coordination $\langle r\rangle$. Counting bond-stretching and
bond-bending constraints per atom against three degrees of freedom, the isostatic point —
constraints exactly balancing freedoms, zero floppy modes and zero redundant stress — falls
at

$$\langle r \rangle_c = 2.4 .$$

Below it a network is **floppy₍₃₎**: it has internal degrees of freedom that cost no energy,
and it flows or deforms. Above it the network is **stressed-rigid₍₃₎**: it is
over-constrained, carries internal stress, and is brittle rather than compliant.

The subscript records the rank density of the matroid in play. Here it is $k = 3$: the
bond-bending count on a three-dimensional atomic network, three constraints per atom at the
isostatic point. It is carried throughout this note because §6 turns entirely on the
difference between that reading and the $k = 1$ one, and because every word in this family —
floppy, rigid, jammed, load-bearing, percolating, critical — is matroid-relative and says
nothing definite without it. When a term is matroid-relative, carry the matroid.

This places the two phases of the composite exactly.

| phase | coordination | Phillips–Thorpe regime | behaviour |
|---|---|---|---|
| PDMS matrix, Si–O backbone | $\langle r\rangle = 2$ | far below 2.4, floppy₍₃₎ | flows, compliant, ion-permissive |
| zeolite framework, 4-connected aluminosilicate | $\langle r\rangle = 4$ | far above 2.4, stressed-rigid₍₃₎ | does not flow, brittle, over-constrained |

So the zeolite is ossification in the precise technical sense — not by analogy. It is the
maximally over-constrained end of the same axis whose floppy end is the matrix. A composite
of the two is a system with a tunable position on that axis, set by how much of the volume
the rigid phase has claimed.

This also explains, without any additional assumption, why the upstream documents' own
failure vocabulary is correct. A system driven to Deborah number
$\mathrm{De} = \tau_{\text{relax}} / \tau_{\text{observe}} \gg 1$ — relaxing far slower than
it is watched, hence solid over any window in which it is used — arrives at a fully
crystallized, over-constrained, brittle state that cannot rearrange. That is *premature
ossification*, and it is a real materials pathology, not a metaphor for one.

## 3. What the device actually is

**A two-phase rigidity system.** A floppy, ion-permissive, dynamic-covalent matrix, within
which a rigid crystalline phase nucleates and grows. The nearest established material class
is the **glass-ceramic**: controlled devitrification of a crystalline phase out of an
amorphous host, where the property of interest is set by crystalline volume fraction,
morphology, and connectivity rather than by chemistry alone.

**The state variable is the degree of ossification.** Specifically, the composite's position
relative to its rigidity percolation threshold — whether the rigid phase forms a
load-bearing₍₃₎ spanning cluster, and how far past that threshold it sits.

**Transport is in the complement.** Ions move through the floppy matrix, in the volume the
rigid phase has not claimed. Growing the rigid phase therefore does two things at once: it
raises mechanical rigidity, and it constricts and re-routes the conducting volume. A single
physical process moves both the mechanical and the electrical readout, in opposite
directions. That coupling is the device.

**The rigid phase is a recorder.** Ossified regions do not rearrange. Where the rigid phase
has grown, the configuration is frozen; where it has not, the matrix can still flow. So the
composite's crystalline morphology is a written record of its own thermal and mechanical
history, and the floppy complement is the part still able to change.

**Reading and writing.** Read mechanically (dynamic modulus, or the loss peak position) and
electrically (impedance across an electrode pair) — the two must move in opposition, which
is the design's signature. Write by controlling local devitrification: Joule heating to
nucleate or to re-dissolve rigid domains in a region addressed by the same electrodes, or
mechanical strain above the matrix's topology-freezing temperature.

**Why $J_{26}$ is right here.** The gyrobifastigium is the unique space-filling Johnson
solid, and the question it answers is how rigid domains tile the volume they claim — a
packing question about the ossified phase. That is a legitimate and consequential role, and
it is entirely separate from block copolymer self-assembly, which is where the upstream
documents mistakenly placed it. The available formalization treats $J_{26}$ as an oriented
combinatorial cell complex with a dimension-drop property, which is exactly the right kind
of object for a space-filling rigid domain and exactly the wrong kind for a mesophase claim.

## 4. The matrix chemistry: delete Si–H rather than manage it

The matrix must do two things at once — cure into a network, and remain able to rearrange
above a topology-freezing temperature $T_v$. The obvious route, platinum-catalysed
hydrosilylation for the cure plus a dynamic siloxane or silyl-ether chemistry for the
exchange, runs into a structural conflict: platinum catalyses Si–H + O–H → Si–O + H₂, and
essentially every exchangeable-bond chemistry worth having requires an alcohol somewhere.
The conflict can be managed — pre-form and rigorously purify the silyl ether before any Si–H
is introduced, or site it in a crosslinker core with vinyl arms outward, or cure fully and
install the exchange catalyst afterwards — but each of those is a purity argument, and
purity arguments fail silently.

**The better move is to remove one term of the conflict.**

**Cure by thiol–ene.** Vinyl-terminated PDMS with a multifunctional thiol under radical
initiation gives anti-Markovnikov addition to thioether crosslinks. No Si–H exists in the
system, so the dehydrogenative path is absent by construction rather than avoided by
control. Four consequences follow together:

- No platinum, hence no catalyst sequestration on the high-surface-area filler and no
  inhibitor-to-catalyst ratio to balance.
- Radical cure is moisture-tolerant, so §5's calcination requirement relaxes from
  mandatory-and-strict to ordinary good practice — residual micropore water no longer
  consumes crosslinker or foams the part.
- Thiol–ene is **oxygen-tolerant**, unlike acrylate systems: the thiyl radical does react
  with O₂, but the resulting peroxy radical abstracts hydrogen from another thiol and
  regenerates thiyl, so the chain is diverted rather than terminated. No inert blanket is
  required.
- Initiation can be optical, hence spatially addressable — aligned with the thin-film
  electrode geometry the device needs.

**Take the exchange chemistry from the same element.** Aromatic disulfide metathesis is an
established vitrimer motif and is catalyst-free at moderate temperature [Odriozola et al.
2014], removing the imbibe-and-bake catalyst step entirely.

**Both crosslink populations come from one component.** Formulate with SH:vinyl above unity.
Thiol–ene consumes all vinyl groups, forming permanent thioether junctions; residual thiols
are then oxidised, by air or a mild oxidant, to disulfides forming the exchangeable
population. The ratio is set by a stoichiometric coefficient rather than by blending two
reagents and relying on even distribution.

This has a useful consequence for §2's state variable. A tetrathiol junction has $f = 4$; a
disulfide merely joins two chains, so $f = 2$. The two populations therefore enter
$\langle r\rangle$ with different weights, making the exchangeable fraction and the mean
coordination *partly independent* knobs — position relative to the rigidity threshold can be
moved without proportionally changing how fast the network rearranges.

**Two design tensions, both real.**

*The aromatic/aliphatic choice is $T_v$.* Aromatic disulfide systems exchange at room
temperature, which is what makes them self-healing and what makes them wrong for a substrate
meant to hold a written state: room-temperature exchange is room-temperature creep.
Aliphatic disulfides carry a higher barrier and hold state, at the cost of requiring heat or
catalyst to write. This must be settled against operating temperature before any other
formulation parameter is fixed.

*Ultraviolet initiation and aryl disulfides conflict, and the conflict is the write
mechanism.* Aryl disulfides absorb in the ultraviolet and undergo homolysis — the basis of
photo-induced disulfide metathesis. Curing under UV in their presence would cleave what is
being built. The resolution inverts the problem: cure the thioether network thermally,
oxidise to disulfides, then use UV as the **write head** for spatially addressed reshuffling.
Writing proceeds through an optical path, and the electrodes are not required to double as
heaters.

**One unknown to screen first.** Na-LTA carries exchangeable Na⁺ and thiolate is a competent
ligand, so thiol may ion-exchange onto the zeolite surface. This could be favourable —
near-covalent anchoring that addresses interfacial adhesion without a separate silane graft
— or unfavourable, quietly consuming thiol and displacing the cure stoichiometry. It is not
answerable from the literature. A titration of free thiol against filler loading, with TGA
on recovered particles, settles it directly.

**The framework does not depend on this substitution**, which is a point in its favour. §2's
state variable and §3's read/write scheme rest on $\langle r\rangle = \sum_i x_i f_i$ and on
the existence of a topology-freezing temperature, neither of which references siloxane
chemistry. The zeolite-as-ossification claim does not require the matrix to be a silicone.

## 5. What each upstream document must change

**Reassign the zeolite's role, everywhere.** It is the ossified, over-constrained,
record-bearing phase. It is not the channel, not the transport medium, and not the thing
whose interior ions traverse. Every passage describing ionic conduction *through* the
zeolite network should describe conduction through the *matrix*, constricted by the zeolite.

**Delete the block copolymer self-assembly framing entirely.** This is the single largest
excision. It brought in $\chi N \ge 35.5$ and $\phi_{\text{eff}} = 0.382$, neither of which
belongs. The second number is diagnostic of how the error propagated: $0.382 = (3-\sqrt5)/2
= 2 - \varphi$ is exactly the non-crystallographic quadratic surd $\lambda_5$ from the
pentagon and crystallographic-restriction argument elsewhere in the same corpus,
transplanted intact into a polymer formulation sheet as a volume fraction. Removing the BCP
framing removes the whole $d/L_0$ particle-localization problem with it, since nothing needs
to sit at a domain interface any more.

**Keep $J_{26}$, and re-site it.** It is the space-filling geometry of the rigid phase. It
is not a self-assembly target and no $\chi N$ gate produces it.

**Replace the graft.** The vinylsilane graft was chosen to co-cure the filler into the
network and solve interfacial voiding, and for the ossification role that is broadly right —
the rigid phase should be well bonded. What it must not do is form a continuous insulating
shell, since the conducting volume is now the matrix around the particles rather than the
path between them. This is a much weaker constraint than the transport reading imposed, and
it is satisfiable.

**Drop the loading requirement.** No percolation threshold in the filler needs to be
reached. The threshold that matters is the *rigidity* threshold of the composite, and it is
approached by growing the rigid phase, not by compounding more of it. This also removes the
modulus conflict, since the design no longer demands both 15–25 vol% hard filler and a soft
elastomer.

**Fix the residual chemistry.** Two defects survive the reframing and must still be
corrected. Sodium silanolate and Si–H cannot coexist in one formulation: they react
dehydrogenatively, and at elevated temperature unquenched alkali silanolate back-bites the
network into volatile cyclics. Use acid-catalysed silyl ether metathesis for the exchange
chemistry instead. And zeolite 4A holds 20–22 wt% water, which under platinum catalysis
consumes Si–H and evolves hydrogen, falsifying the zero-volatile-byproduct property that
motivated addition cure; calcine at 450–550 °C and handle dry, since silane grafting
functionalizes only the external surface and cannot empty a 4 Å micropore.

**Correct two errors of statement.** The Flory–Stockmayer gel point is
$\alpha_c = 1/(f_{\text{avg}} - 1)$, not $1/\sqrt{f_{\text{avg}} - 1}$; the stated form is
wrong by 40% at $f = 3$. And a five-step loop first closes after six traversals at
$5 \times 6 = 30$ steps, which is what the formalization proves; the figure of $36 = 6\times6$
appearing in one corollary contradicts both.

**Remove citations to declarations that do not exist.** Several passages cite a `PDK`
namespace, a `J26Mesh` type, a `D2d` geometry group, a percolation-channel predicate, and a
`ReflTower` module, none of which are present. Two of the quoted Lean snippets end in
`sorry`. Most seriously, one asserts a theorem whose named source module proves the
negation: the settling-cohomology model glues unconditionally and its $H^1$ vanishes, while
the non-vanishing cycle rank lives in a different object entirely. Two unrelated $H^1$'s
have been merged by name, and that merge should be undone explicitly rather than quietly.

## 6. The mathematical gap this opens

The corrected physics sharpens a discrepancy in the formalization that the transport reading
obscured.

The available percolation module uses rigidity vocabulary throughout — floppy, jammed,
load-bearing, the jamming click — and cites rigidity percolation and contact networks, none
of it subscripted. On the ossification reading that vocabulary is *correct*: mechanical
rigidity is exactly the phenomenon, and the terms are meant at $k \ge 2$. But the
implemented object is the cycle rank

$$b_1 = |E| - |V| + c ,$$

which is the nullity of the **graphic** matroid, and its transition is the appearance of the
first cycle: continuous, sharp at a single contact count, one redundant contact raising the
rank by exactly one. What the module certifies is therefore load-bearing₍₁₎ — a redundant
*connection* — while what it says, and what §3's state variable needs, is load-bearing₍₃₎: a
redundant *constraint* in the bulk.

Mechanical rigidity is not that matroid. Generic rigidity in the plane — load-bearing₍₂₎,
the case with a combinatorial test — is governed by Laman's condition and the **rigidity
matroid**, of rank $2|V| - 3$. The generic rigidity matroid exists in every dimension — it is
the matroid of the rigidity matrix evaluated at a generic configuration, well defined by
genericity — but in three dimensions only the rank count $3|V| - 6$ is available and no
combinatorial characterization is known: Laman's condition fails in 3D, the double-banana
graph being the standard counterexample. The correct algorithmic test for whether an added
contact is independent or redundant is the pebble game, not union–find. And Laman's condition
is hereditary — every subgraph on $n'$ vertices carries at most $2n' - 3$ edges — so
redundancy is a nonlocal property, undetectable by any per-site or per-vertex count.

The order of the transition is not part of the gap. Rigidity percolation's order is
lattice-dependent and was contested: on the two-dimensional triangular lattice, generic
rigidity percolation is measured as **continuous** — second-order, with its own universality
class distinct from connectivity percolation (Jacobs & Thorpe 1995, 1996), a result that
overturned the earlier mean-field expectation. First-order behaviour is the Bethe-lattice and
mean-field result, attributed in the literature to the Moukarzel–Duxbury–Leath line of work —
an attribution not checked against primary sources here. A continuous rise in the rigid
fraction is therefore what two-dimensional generic rigidity is expected to give, and is no
evidence that the underlying matroid is graphic.

So the gap is precise and worth stating as a frontier rather than a defect, and the subscript
states it in one line: **the vocabulary and the physical referent are load-bearing₍₂₎ and
above; the implemented instrument counts load-bearing₍₁₎.** Closing it means replacing the
graphic independence oracle with a rigidity one — a strictly harder object, whose
independence test is nonlocal — and the payoff is that the ossification state variable would
then be computed by the mathematics that actually governs it.

A second, smaller gap: the placement measure. Constraint counting gives a threshold in mean
coordination, and any derivation of a *critical fraction* from a per-site occupation rate
additionally requires a joint law over sites. Invariance of a single-site distribution does
not force independence across sites, and a correlated placement can cross a coordination
threshold at a very different density than an independent one. Any critical-fraction claim
must state which joint law it assumes.

## 7. What would falsify this

1. **The opposition signature.** Grow the rigid phase incrementally in a single sample while
measuring dynamic modulus and ionic conductivity together. The design predicts they move in
opposition — rigidity up, conduction down — through a single controlled process. If they
move together, or if conduction is insensitive to crystalline fraction, the two-phase reading
is wrong.
2. **The universality class of the rigidity threshold.** Measure the floppy-to-rigid
transition against crystalline volume fraction and extract its critical exponents. The order
of the transition discriminates nothing — in two dimensions both matroids give a continuous
rise — but the exponent set does, since two-dimensional generic rigidity percolation sits in a
universality class distinct from connectivity percolation (Jacobs & Thorpe 1995, 1996).
Connectivity exponents would show the implemented graphic matroid is adequate here; rigidity
exponents would show the gap of §6 is doing real work and the formalization needs upgrading.
The direct combinatorial form of the same test runs the pebble game and union–find as
independence oracles over the measured contact network and looks for the configurations on
which they disagree.
3. **Reversibility.** Determine whether ossified regions can be re-dissolved, and over how
many cycles. If ossification is one-way, the substrate is write-once and its computational use
is limited to a record, not a reconfigurable state.
4. **History dependence.** Prepare samples at identical composition but different thermal
histories and test whether morphology and readout differ. If they do not, the rigid phase is
not recording anything.

Experiment 1 is the one to run first: it is cheap, it needs no fabrication beyond a cast
film with two electrodes, and it tests the only claim here that is genuinely new.

---

## References

Jacobs, D. J. & Hendrickson, B. (1997). An algorithm for two-dimensional rigidity
percolation: the pebble game. *Journal of Computational Physics* 137, 346.

Jacobs, D. J. & Thorpe, M. F. (1995). Generic rigidity percolation: the pebble game.
*Physical Review Letters* 75, 4051.

Jacobs, D. J. & Thorpe, M. F. (1996). Generic rigidity percolation in two dimensions.
*Physical Review E* 53, 3682.

Laman, G. (1970). On graphs and rigidity of plane skeletal structures. *Journal of
Engineering Mathematics* 4, 331.

Montarnal, D., Capelot, M., Tournilhac, F. & Leibler, L. (2011). Silica-like malleable
materials from permanent organic networks. *Science* 334, 965.

Nishimura, Y., Chung, J., Muradyan, H. & Guan, Z. (2017). Silyl ether as a robust and
thermally stable dynamic covalent motif for malleable polymer design. *Journal of the
American Chemical Society* 139, 14881.

Oxley, J. (2011). *Matroid Theory*, 2nd ed. Oxford University Press.

Phillips, J. C. (1979). Topology of covalent non-crystalline solids I: short-range order in
chalcogenide alloys. *Journal of Non-Crystalline Solids* 34, 153.

Phillips, J. C. & Thorpe, M. F. (1985). Constraint theory, vector percolation and glass
formation. *Solid State Communications* 53, 699.

Thorpe, M. F. (1983). Continuous deformations in random networks. *Journal of
Non-Crystalline Solids* 57, 355.

Tretbar, C. A., Neal, J. A. & Guan, Z. (2019). Direct silyl ether metathesis for vitrimers
with exceptional thermal stability. *Journal of the American Chemical Society* 141, 16595.

Zheng, P. & McCarthy, T. J. (2012). A surprise from 1954: siloxane equilibration is a
simple, robust, and obvious polymer self-healing mechanism. *Journal of the American
Chemical Society* 134, 2024.
