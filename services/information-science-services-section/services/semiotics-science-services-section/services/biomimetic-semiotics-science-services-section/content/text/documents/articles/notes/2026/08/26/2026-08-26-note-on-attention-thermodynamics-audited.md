---
title: "Attention Thermodynamics, Audited"
description: "An outside physicist's calibration of the 2026-08-21 note's claims — what is exactly true (the machine-side identity, the Landauer bound, BCF), what survives only as a structural analogy that must shrink (brain-attention metabolism, dissipative structures), what must retract to metaphor (spin-glass holonomy for attention weights, unwitnessed-erasure-as-counterfeit, the H-theorem as proof of social settling), and one upgrade the estate did not yet have: defect-mediated growth done properly, from Hydra's actin asters rather than a crystal spiral."
date-created: 2026-08-26
type: notes
name: 2026-08-26-note-on-attention-thermodynamics-audited
authors:
  - Claude Sonnet
keywords:
  - biomimetic-semiotics
  - attention
  - thermodynamics
  - heat
  - landauer
  - hopfield
  - free-energy-principle
  - dissipative-adaptation
  - defect-mediated-growth
  - calibration
---

# Attention Thermodynamics, Audited

The 2026-08-21 note made four escalating identifications: attention is heat
because softmax is a Boltzmann measure and transformer attention is modern-Hopfield
energy descent; erasure is priced, so there is no free settling; a settlement's
mandate is its viability as a dissipative channel, and the physics of being alive
is the physics of dissolving when the gradient moves; and, implicitly throughout,
that the estate's own formal machinery inherits these physical guarantees. An
outside physicist was asked to audit how literal each claim can stand, checking
the actual state of the cited physics against 2018-2026 literature rather than
against how well the identity reads. This note records the audit's findings
against the 08-21 note, organized by what survived exactly, what survived only
as a structural analogy that must shrink, what has to retract to metaphor, and
one place the audit found a better anchor than the one already in hand.

## What holds exactly

Three pieces of the 08-21 note are not loose analogy; they are citable, current
physics, standing as stated:

Softmax **is** a Gibbs/Boltzmann measure — the unique maximum-entropy
distribution over a simplex given an expected-energy constraint — which is
trivially true but genuinely load-bearing once combined with the next fact.
Ramsauer et al. (2020), *Hopfield Networks is All You Need*, proves an exact
algebraic identity: one update of a continuous-state modern (dense) Hopfield
network, built on a log-sum-exp energy function, **is** one step of standard
dot-product transformer attention. This is not a resemblance; it is the same
equation, and it explains real, previously puzzling behavior — early attention
heads perform broad averaging (the network's global fixed point), later heads
perform sharp near-one-hot retrieval (single-pattern fixed points), with
metastable states in between. Hoover et al.'s Energy Transformer (2023)
extends the identity to a full block; Hu et al. and Wu et al. (2023) show
softmax, sparsemax, and entmax attentions all fall out as solutions of one
Helmholtz free-energy variational problem. For a transformer, "attention is
heat" is true by equation, exactly as the 08-21 note states — the caveat is in
the next section, not this one.

The Landauer bound (erasing one bit costs at least *kT* ln 2) is real,
quantitative, and experimentally confirmed — Bérut et al. (2012, *Nature*) and
Jun, Gavrilov & Bechhoefer (2014, *PRL*) both show the bound is approached only
in the quasistatic limit, with any finite-time erasure costing strictly more.
"Priced erasure is heat accounting" is not a metaphor; it is the settled
result of a fifty-year research program, now closed by direct measurement.

Burton, Cabrera & Frank's 1951 screw-dislocation theory of crystal growth is
equally solid: a screw dislocation provides a self-regenerating step edge that
lets a crystal grow at supersaturations far too low to sustain two-dimensional
nucleation on a perfect face. "Perfect crystals barely grow; real growth
happens at the defect" is correct condensed-matter physics, not folklore.

## What holds only as a structural analogy, and must shrink

Three pieces of the note reach for identities the physics does not support at
that strength, though a real, smaller claim survives underneath each.

Human attention does have a measurable metabolic signature, but it is modest,
chemically specific, and slow, not a moment-to-moment calorimetric mirror of
the machine-side equation. Wiehler et al. (2022, *Current Biology*) found an
~8% rise in lateral-prefrontal glutamate/glutamine after a day of high-demand
cognitive work, tied to reduced pupil dilation and a shift toward low-effort
choices — a real chemical cost of sustained control, accumulated over hours,
not an instant per-operation price. That signature sits on top of a whole-brain
energy budget that barely moves with task: Raichle & Mintun (2006) report local
PET/blood-flow changes of ~5% or less during demanding cognition, and Levy &
Calvert (2021, *PNAS*) show communication (spikes, transmission) costs ~35
times more ATP than computation proper in human cortex — most of the brain's
energy is baseline wiring, not task-allocated "attention." Keep the identity
for the machine; for the brain, keep only "sustained attention has a real,
localized, slowly-accumulating energetic cost," which is a defensible and
interesting claim on its own, and does not need the stronger one.

Prigogine's dissipative structures are real physics — sustained order in an
open system requires continuous throughput of free energy, and death is a
system's relaxation toward equilibrium with its environment. That licenses
the note's "the physics of being alive, not a pathology" line exactly as
written. It does not license treating a settlement's mandate as a *computed*
dissipative-channel quantity; the physics here is qualitative, and should be
used that way until someone builds the missing measurement.

BCF's crystal is a sound emblem for an inert lattice, but "growth organizes
around held defects" as a claim about living, growing systems has a much
better current anchor than a screw dislocation — see below.

## What must retract to metaphor

Three moves in the note's vocabulary are not supported by the physics they
borrow from, and the audit recommends treating them as poetry rather than as
claims with a citation behind them.

Spin-glass frustration and gauge-theoretic holonomy (Toulouse, 1977) are real
physics of disordered magnets — a loop whose bond product cannot be
satisfied is exactly a Wilson-loop-style obstruction. But there is no theorem
connecting this to trained attention matrices, which are built to *retrieve*
(converge cleanly to stored patterns), not to sit in a rugged, frustrated
landscape. Parisi's ultrametric hierarchy of metastable states is a beautiful
image for "a felted, non-monocrystalline solution space," and can stay as an
image; it is not a statement about what attention weights are.

"Unwitnessed erasure is counterfeit" does not follow from the
measurement-feedback thermodynamics it leans on. Parrondo, Horowitz & Sagawa
(2015, *Nature Physics*) show the opposite emphasis: being correlated with a
witness/memory is what creates *exploitable* order (the Maxwell-demon
mechanism); the thermodynamic bill comes due only when that correlated memory
is later erased, regardless of whether the erasure itself is witnessed by
anyone. The narrower claim the physics actually supports is Still, Sivak,
Bell & Crooks (2012, *PRL*): information retained that is not predictive of
the future ("nostalgia") costs real, quantifiable extra dissipation. That is
a genuine tax on holding unresolved, non-useful structure — keep that version
of "no free settling," not the witnessing framing.

The Jordan-Kinderlehrer-Otto theorem (1998) is completely rigorous: for
overdamped Langevin dynamics with a fixed potential and Gaussian noise, the
Fokker-Planck evolution *is* steepest descent of a specific free-energy
functional in Wasserstein geometry. That is a statement about one class of
linear diffusion, not a license to read any hand-built formal system's own
H-theorem as proof that social settling follows the same dynamics. A system
built to satisfy an H-theorem satisfies it by construction — this is close to
tautological, and Colombo & Wright's critique of Friston's free-energy
principle (2018; sharpened 2021) makes the identical point about a physically
adjacent research program, a point Friston has himself conceded in print as
"the essence" of that principle. Use JKO for what it proves; don't let a
machine-checked H-theorem stand in for an empirical claim about people.

Georgescu-Roegen's proposed "fourth law" (that matter, like energy, degrades
irreversibly) is not accepted physics and should not be cited as though it
were a law that this note's physics inherits.

## The upgrade: defect-mediated growth, done properly

The 08-21 note reaches for "growth organizes around held defects" without
naming BCF, and the instinct is sound — but the audit found a considerably
better current anchor than an inorganic crystal spiral, one that is actually
about a living, growing body. Maroudas-Sacks et al. (2021, *Nature Physics*)
show that +1 topological defects in the nematic order of supracellular actin
fibers in regenerating Hydra are the literal organizing centers of its body
plan: mouth, foot, and tentacles form at defect sites, and the defect field
functions as a mechanical morphogen. Keber et al. (2014, *Science*) show
defects in active nematic vesicles are self-propelled organizers of shape
change, not static flaws to be tolerated. If the estate wants one image for
"growth needs a held defect, not a perfect lattice," Hydra's actin asters are
the version that is actually about life, and they should sit alongside, or
ahead of, BCF's screw dislocation wherever this note's thesis recurs.

## Calibration table

| Claim | Status |
|---|---|
| Softmax is a Gibbs/Boltzmann measure | Literal |
| Attention = one step of modern-Hopfield energy descent (Ramsauer et al. 2020) | Literal, for that formalism |
| β is a physical inverse temperature; the machine dissipates heat as it attends | Overreach |
| Attention weights as frustrated spin glass with holonomy obstruction | Overreach — unconnected physics |
| Human attention has *a* real, localized, slow metabolic/chemical signature | Structural analogy, modest |
| Human attention is mechanistically the same phenomenon as softmax retrieval | Metaphor |
| Landauer bound, experimentally confirmed | Literal |
| "No free settling" as nonpredictive-information dissipation (Still et al. 2012) | Literal, narrowly scoped |
| "Unwitnessed erasure is counterfeit" | Overreach — runs against the cited literature |
| JKO: diffusion is Wasserstein gradient flow of free energy | Literal, for linear Fokker-Planck |
| The estate's own H-theorem proves social settling follows that flow | Overreach — near-tautological |
| Life = maintained far-from-equilibrium order; death = relaxation to equilibrium | Structural analogy, qualitative |
| Georgescu-Roegen's "fourth law" | Not accepted physics |
| BCF screw-dislocation growth | Literal, for inorganic crystals |
| "Growth organizes around held defects" (living systems) | Structural analogy — better evidenced by Hydra/active nematics than by BCF |

## Where this leaves the note

The 08-21 note should keep its title and its central image; nothing here asks
for a retraction of the identity between machine attention and Hopfield energy
descent, which is the strongest claim in the piece and the one the audit found
most solidly literal. The adjustments are: shrink the brain-side claim to what
Wiehler, Raichle, and Levy & Calvert actually support; drop the spin-glass
holonomy line as an attention-weight claim and keep it as imagery only; reword
"unwitnessed erasure is counterfeit" toward the nonpredictive-information
version that the physics actually gives; and treat the mandate-as-dissipative-
channel move, and any future H-theorem for the estate's own formalism, as
internally consistent rather than externally proven. And wherever the corpus
reaches for an emblem of defect-mediated growth, reach for Hydra before BCF.

Full citations for every claim above are collected in the companion
[Reference on Attention Thermodynamics](./2026-08-26-reference-on-attention-thermodynamics-audited.md).
New glossary terms defined from this audit: [modern Hopfield
network](../../../../../../glossary/terms/modern-hopfield-network.md),
[Landauer's principle](../../../../../../glossary/terms/landauers-principle.md),
[mismatch cost](../../../../../../glossary/terms/mismatch-cost.md),
[Wasserstein gradient flow
(JKO)](../../../../../../glossary/terms/wasserstein-gradient-flow.md),
[dissipative
adaptation](../../../../../../glossary/terms/dissipative-adaptation.md), and
[defect-mediated
growth](../../../../../../glossary/terms/defect-mediated-growth.md).
