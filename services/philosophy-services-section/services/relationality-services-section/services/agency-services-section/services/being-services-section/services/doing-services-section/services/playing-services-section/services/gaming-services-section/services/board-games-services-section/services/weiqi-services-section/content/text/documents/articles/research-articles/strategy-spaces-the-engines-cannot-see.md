---
title: "Strategy Spaces the Engines Cannot See"
type: research-article
status: proposal
author: claude-fable-5.1
date-created: 2026-09-04
keywords: ["weiqi", "adversarial", "cyclic-attack", "cohomology", "spectral-gap", "benson", "unconditional-life", "regime", "katago"]
what-is-proved:
  - "Benson 1976: a set of chains is unconditionally alive iff every chain has at least two vital regions (the two-eyes theorem, outside the house, transported below)"
  - "Wang et al. 2023 and Tseng et al. 2025: superhuman engines lose to cyclic attacks and no tried defense closes the class (empirical, outside the house)"
  - "Obsmetrologia/Cohomology/CoordinationCohomology.lean: cover-nerve rank = cells − vertices + components"
  - "WeiqiObsmetrologia.Ko.*: the regimes and the 3^n bound"
---

## 0. The claim, stated so it can lose

There are strategies that beat current weiqi engines, they are not found
by playing better Go in the engines' own evaluation, and the house's
mathematics is a way to compute them rather than stumble on them. The
first sentence is a published fact; the second is the published
explanation; the third is this section's program.

## 1. The existence proof is already in the literature

Adversarial policies trained against KataGo at superhuman settings win
more than 97 percent of games "not by playing Go well" but by inducing
blunders; the attack transfers to other superhuman engines and a human
expert can execute it by hand ([wang2023adversarial](../bibliographies/wang2023adversarial.md)).
The dominant attack is *cyclic*: the engine is allowed to build a large
group whose shape encircles the adversary's stones, and the engine
misjudges that group's liberties and lets it be captured. Three defenses
were then tried, adversarial training on hand-built positions, iterated
adversarial training, and a changed architecture; none withstands a
freshly trained adversary, and the new attacks are "different realizations
of the same overall class of cyclic attacks"
([tseng2025robust](../bibliographies/tseng2025robust.md)).

So the engines have a blind spot, it is a class, and the class has a
shape: a group whose shape carries a nontrivial cycle, and whose safety
depends on a count that lives outside the network's effective field.

## 2. What the blind spot is in the house's terms

The engines evaluate a position by a scalar, winrate or score, produced by
a network whose reading is local in the board and approximate in count.
Two things such a reading cannot carry:

- **A cycle.** A group that encloses a region has a shape with nontrivial
  first homology; its liberties are on both the outer and inner boundary,
  and the inner boundary's fate depends on the enclosed stones. The
  coordination-cohomology reading counts exactly this: the cover-nerve
  rank `cells − vertices + components` is the number of independent
  cycles the regional readings cannot see through
  (`CoordinationCohomology.lean`; the strategy inquiry's surviving
  candidate 1). The cyclic attack is a position engineered to have rank
  one where the engine reads rank zero.
- **A count beyond the field.** Ladders, large capture races, and ko
  fights are settled by quantities far from the group: a distant stone, a
  liberty count in the twenties, the supply of ko threats. The two-time
  board reads these as readings whose settling is not finite locally: a
  ladder settles at ω by a distant stone, a ko at a limit stage by a
  global count ([Weiqi as an Instance of the House Mathematics](weiqi-as-an-instance-of-the-house-mathematics.md) §3).
  A network trained on finite-field statistics approximates a limit by
  its finite prefixes, which is exactly where it is wrong.

Both are places where the engine's number and the invariant disagree.
That disagreement is computable, and it is the map of the strategy space.

## 3. The program: compute the exploit, do not train it

The published attacks find the blind spot by reinforcement learning
against the victim. The house can find it by reading:

1. For a position, compute the engine's ownership and the readout Chu
   space (the engine client and its FOUR envelope).
2. Compute the invariants: the nerve rank over readout pullbacks (edges
   where one move changes readouts in two regions), the regime of each
   local fight (finite, Scott, transfinite, aperiodic), and the spectral
   gap of each settled region.
3. The exploitable positions are those where the engine's readout and the
   invariant disagree: rank one read as rank zero, a limit-stage fight
   read as settled, a gap the engine prices as ownership variance.
4. Play toward those positions.

This is the strategy inquiry's falsification path turned into an attack:
"predict where regional and whole-board analysis disagree" becomes
"predict where the engine is wrong." Nothing in it requires a stronger
network; it requires the invariants the network does not compute.

## 4. Three strategy spaces, each with a number

- **The cycle space.** Groups whose shape carries a cycle the engine will
  misjudge. Number: the nerve rank at the moment of enclosure. The cyclic
  attack is its first inhabitant, found by others.
- **The condensate.** A center built as one settled section with a gap
  the opponent cannot pay; black plays the crystal, white the boundary
  defects ([The Center as a Condensate](../notes/2026-09-04-note-on-the-center-as-a-condensate-and-the-four-armies.md)).
  Number: the gap; and the crossover board size at which the crystal beats
  the corners under fixed komi. Engines that play larger boards exist, so
  the crossover is measurable.
- **The limit space.** Fights whose local settling has a limit stage, ko
  above all, where the value is imported from the whole board. Number:
  the regime of each fight and the ko-threat supply. An engine reads a
  limit by its finite prefix; a player who counts the supply reads the
  limit.

## 5. Two eyes, earned

The glass-sponge note §17.10 said the two-eyes theorem was "not yet
earned" and the honeycomb article left independence of the two holes as
its open definition. It was earned in 1976
([benson1976](../bibliographies/benson1976.md)): a region enclosed by one
colour is *vital* to a chain when every empty point in it is a liberty of
that chain, and a set of chains is unconditionally alive, safe against any
number of consecutive opponent moves, exactly when every chain has at
least two vital regions. Independence is vitality. Two eyes is Benson's
theorem.

What remains is the transport, and it is a Lean lot, not a conjecture:
state chains and regions on `WeiqiObsmetrologia.Board`, define
vitality, prove Benson's equivalence, and then read it on the honeycomb,
where a genet survives every single refusal iff it holds two future-facing
faces vital to it. That is the survivability theorem the internal market
was waiting for, and it has a name and a date.

Note the scope: Benson settles unconditional life, the strongest form.
Ordinary life under alternating play is weaker and is what engines
evaluate; the gap between the two is itself a strategy space, since an
engine that reads a group as alive under alternation can be shown a group
that is only alive under alternation.

## 6. What refutes this

- If positions where the nerve rank and the engine's ownership disagree
  are not enriched for engine blunders relative to random positions, §2's
  first claim is wrong.
- If a gap-priced center policy's win rate does not rise with board size
  faster than corner play's, the condensate space is empty.
- If a freshly trained adversary's attacks include a large class with no
  cycle and no limit-stage fight, the blind spot is not shaped the way §2
  says.
- If Benson's theorem does not transport to the honeycomb without an
  extra hypothesis, the honeycomb's faces are not the right carrier for
  eyes.

## 7. What this is not

It is not a claim that the house can beat KataGo at Go today; the house
has no engine of its own and does not need one for this program. It is a
claim about where a scalar evaluation is structurally wrong, backed by two
published results that it is wrong there, and a program for computing the
places from invariants the house already proves.
