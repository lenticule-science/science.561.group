---
title: "The Center as a Condensate, and the Four Armies"
description: "Two owner movements of 2026-09-04, carried in the owner's words and read in the house's objects: the center tiled cosmic-moyo style as a condensate with a spectral gap, the opponent's outside play as the whirling dervish that the crystal excludes; and the four strategy spaces got by splitting black and white (who moves first) by the two time directions (red receding, blue approaching), matched against the house's four armies. Proposals with stated refutations."
date-created: 2026-09-04
date-updated: 2026-09-04
type: text
status: proposal
authors:
  - emsenn
  - claude-fable-5.1
keywords: ["weiqi", "moyo", "condensate", "spectral-gap", "dervish", "four-armies", "initiative", "saturation", "transfer"]
---

## 1. The movements, verbatim

Owner, 2026-09-04: "tiling the center of the board, cosmic moyo style, the
outside, the other player, is a whirling dervish. treat it as a whirling
dervish, sit unbothered in the center. like i'm seeing some like... new
strategy space our math can open up, but treat the center of the board as
trying to do bose condensation, basically?"

And: "weiqi only has black and white, pieces BUT get this: light goes red and
blue based on speed/time/whatever, and that gives us the four strategy
spaces, because i know black and white are fundamentally different game
strategy spaces because of who goes first."

## 2. The center as a condensate

Three facts already on disk make the first movement exact rather than
figurative.

**Stones are identical.** Glass-sponge §17.7: weiqi "pieces have almost no
intrinsic differentiated power. Strategic force arises from position,
connection, enclosure, liberties, and future response shape." Stones of one
colour are indistinguishable particles. A structure of indistinguishable
particles that all occupy one state is a condensate; the word is not
borrowed, it is the definition.

**The one state is the settled global section.** A moyo is a region whose
readout is one coherent global section: every point in it carries the same
owner, fixed under both nuclei (the two-time board's territory, Fix σ ∩
Fix Δ). `Obsmetrologia/Cohomology/LawvereHarmonicCohomology.lean` proves the
settled section is the harmonic kernel of the order Laplacian. A condensate
is a region where the whole population sits in the kernel.

**A condensate has a gap.** The smallest nonzero eigenvalue of the Laplacian
on the region (`Obsmetrologia/Dynamics/Flow/LawvereLaplacianSpectralGap.lean`)
is the least energy any excitation costs. An invasion is an excitation: a
stone that is not in the kernel. So the reading is: **a moyo holds iff the
invader cannot pay the gap**, and its value is not its point count but its
gap times its area. "Sit unbothered in the center" is a statement that the
gap exceeds what the opponent can spend.

**The outside is the dervish.** The honeycomb that tiles the center is
crystallographic, rotation orders 2, 3, 4 (the gyrobifastigium, J26.lean).
The one obstruction the crystal cannot discharge is fivefold, the dervish
(the 2026-07-19 note in the obsmetrological section). The corners and edges
are where the tiling terminates against a boundary, and the opponent's
counterplay that the crystal cannot absorb lives on the shroud, never in the
interior. Territory-first play (corners gold, sides silver) is playing the
boundary defects; cosmic-style play is playing the crystal and pricing the
boundary by its gap. Both are correct; they are correct about different
regions, and the gap says which region a given board favours.

**What is new here.** Engines evaluate a moyo by expected ownership and its
variance. A spectral gap is not an ownership statistic; it is a property of
the region's readout sheaf that says how much an invasion must cost. That is
a quantity no shipped engine computes, and it is computable from the readout
Chu space once the engine client's readouts exist.

**Refutation.** Take moyos from real games, compute the gap of each region's
readout sheaf at the moment of invasion, and compare with whether the
invasion lived. If the gap does not predict invasion outcomes better than
ownership variance does, the condensate reading is decoration. If it does,
cosmic style has a number, and Takemiya was measuring something.

### 2a. Black plays the crystal, white plays the defects

Owner, 2026-09-04: "black is probably meant to play center and white
corners." Read on the honeycomb this is not a style preference but the
natural division of the board between the two players the rules already
make different.

Black moves first. The first move is the only one made on an empty board,
so it is the one move that can seed a crystal with no defect yet present:
tengen, or a high central stone, starts the condensate. White moves second
and holds komi. White cannot seed a second crystal that black's growth will
not enclose, so white's lawful home is where the crystal cannot go: the
boundary. A corner group that lives with two eyes is exactly a **protected
defect** in the territory audit's sense, a region the crystal's relaxation
detects and can never discharge. White's corners are the dervish's stable
form: fivefold whirling that the crystal's own law excludes from the
interior and that therefore survives on the shroud.

The game is then the market of the territory audit, played out: black's
condensate expands and relaxes every repairable defect it meets; white's
protected defects hold the boundary and the surplus komi buys; the score
is the crystal's area against the defects' enclosed area plus komi. Komi is
the price of the crystal seed.

**The prediction this makes, which nothing else makes.** The crystal's area
grows with the square of the board's side; the boundary grows with the
side. So the balance between center and corners depends on board size.
Under a fixed komi there is a crossover side length below which
corner-first play (white's dervish) wins and above which the condensate
(black's crystal) wins. On 19×19 under komi 7.5 the engines say corners
win, and the condensate reading agrees: the boundary is a large fraction
of a 19-line board. The claim is that the crossover exists and is
computable from the gap, and that on a large enough board the cosmic style
is not a style but the correct play.

**Refutation.** Engines that play boards larger than 19 exist. Play a
gap-priced center policy for black against a strong engine across board
sizes at fixed komi. If black's win rate with center-first play does not
rise with board size faster than with corner-first play, there is no
crossover and the crystal reading is wrong. If it does, the crossover side
length is a measured constant of the game, and the dervish is the right
name for white.

## 3. The four strategy spaces

Black and white are not symmetric: black moves first, and komi is the price
the rules put on that asymmetry. That is the owner's "fundamentally
different strategy spaces because of who goes first", and it is already in
the kernel as `komi` and in the honeycomb reading as initiative.

The second split is time. Light red-shifts when its source recedes and
blue-shifts when it approaches. The house already has the two directions
as nuclei: σ, the past cone, saturation, what the history has settled;
Δ, the future cone, transfer, what lawful future play can still change
(org-layering, EAVT custody; eavt 0.6.0 `saturate`, `transfer`). Red is
receding: a colour's settled claims, what its stones have already fixed.
Blue is approaching: a colour's open futures, its liberties and aji. So the
four strategy spaces are

| | receding (σ, settled) | approaching (Δ, open) |
|---|---|---|
| **black** (moves first) | what black's initiative has already fixed | what black's initiative can still force |
| **white** (moves second, holds komi) | what white has settled by answering | what white can still reverse |

and a position is read as four sections, not two. A player's lineage
signature (the lineages article) splits the same way: how much of a
player's play is spent fixing (red) versus opening (blue), and whether they
play the same way with and without the first move.

**Against the house's four armies.** The executive-army section defines
four checking roles: white examines a work product's internal structure at
rest; black checks it against a named external standard; blue probes it
adversarially and live; red rehearses a planned traversal before it runs
and predicts where it would deviate. Read on the board: white is the
position at rest, the σ-settled section; black is the ruleset and komi, the
standard the position is judged against; blue is the opponent's live play,
Δ realized; red is reading, Δ simulated before it is played, tsumego. The
colour names do not line up with the Doppler names (the house's blue is the
live future, the Doppler blue is the approaching future; those agree; the
house's red is rehearsal, the Doppler red is the settled past; those do
not), so the correspondence is between roles and nuclei, not between colour
words. The four roles are the four causal positions of an utterance the
quartet law names, and the board is the smallest place all four are
distinct and cheap to compute.

**Refutation.** If the two red/blue splits of a real player's move stream
carry no more information than the single black/white split (no lineage
separates on the σ/Δ balance that does not already separate on colour), the
four spaces collapse to two and the Doppler reading is decoration.

## 4. What these two ideas share

Both put the same object in the middle: the settled section and its gap. A
condensate is a region where the σ and Δ readings agree everywhere and the
gap keeps them agreeing. The four spaces are what a colour has fixed and can
still open. The strategy space the owner is seeing is the one where a player
chooses moves by their effect on the gap, not on the count.

## 5. Carriers

- glass-sponge note §17.7 and §17.10 (engineering-services-section, 2026-08-01)
- `Obsmetrologia/Cohomology/LawvereHarmonicCohomology.lean`, `Dynamics/Flow/LawvereLaplacianSpectralGap.lean`, `AperiodicOrder` J26.lean (obsmetrological section)
- the 2026-07-19 whirling-dervish note (obsmetrological section)
- the two-time board and the atari note (this section's research articles)
- the executive-army glossary: white, black, blue, red army (561-group-executive-army-services-section/content/glossary/terms/)
- `.claude/rules/org-layering.md`, EAVT custody (σ and Δ as separate nuclei; the quartet)
