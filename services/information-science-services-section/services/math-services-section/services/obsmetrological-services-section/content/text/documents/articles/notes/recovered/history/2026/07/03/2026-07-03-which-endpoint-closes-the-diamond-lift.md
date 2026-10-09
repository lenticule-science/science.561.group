---
title: "Which endpoint closes the diamond lift? A duality between readout position and pullback direction"
description: "An investigation of the Diamond-Lift Closure Conjecture's failure mode on a three-event chain: a genuine topological obstruction under the future-pointing pullback, its complete resolution under the past-pointing one, and the resulting conjecture that the closing direction is determined by where the readout sits."
date: 2026-07-03
status: research-frontier
packages:
  - sites/infography.emsenn.net
  - sites/infomaterial.emsenn.net
lean-anchors:
  - "Infomaterial/Relational/Spacetime/Boundary/DiamondLiftClosure.lean"
  - "Infomaterial/Cohomology/AlexandrovHusainov.lean"
---

# Which Endpoint Closes the Diamond Lift?

## Setup: tiles, holes, and the space of diamonds

Recall the shape of a post-hole FOUR tile. We are given a finite causal set $C$ — a set of events
together with a causal precedence relation, generated here the way the corpus always generates its
causal sets: as the prefix chain of one act of articulation, built by pairing utterances onto a
tail. We choose a *readout region* $R \subseteq C$: the set of events that "announce themselves,"
in the sense that any event causally preceding a member of $R$ is deemed to have already reached
the outside world. The complement of that reachability — the events from which no member of $R$ is
in the causal future — is the *hole*: the region of $C$ that never announces itself. A tile
structure on the hole consists of a proper FOUR-colouring of the hole's own causal-adjacency graph
(no two causally comparable hole events share a colour), together with a connected "future core":
a single coherent piece of the hole that every hole event eventually flows into. When both pieces
exist, we say the hole is a genuine *post-hole tile*.

The smallest instructive example is a three-event chain: a floor $c_0$, a middle event $c_1$
directly above it, and a top $c_2$ directly above that, with $c_0 \prec c_1 \prec c_2$. Put the
readout at the floor alone, $R = \{c_0\}$. Then the hole is exactly $\{c_1, c_2\}$ — neither reaches
back down to $c_0$ — and it is a genuine tile: colour $c_1$ and $c_2$ differently (they are the
chain's one comparable hole pair), and anchor the future core at $c_2$, which every hole event
reaches. Small, but everything about the general theory is already visible in it.

Now recall the deeper construction this note is really about. Every causal set $C$ carries a second,
derived causal set: the space of its own causal diamonds. A *causal diamond* over $C$ is a pair of
events $(a,b)$ with $a \prec b$ — the interval it spans, thought of as a single point of a new,
higher space. Two diamonds are ordered by **sequencing**: one diamond precedes another when its own
upper endpoint has already reached the lower endpoint of the next, $(a,b) \prec^\diamond (a',b')$
iff $b \preceq a'$. This is the *only* order that works here — the more obvious "nesting" order
(one diamond contained inside another) has a self-loop at every diamond, since every diamond
trivially nests inside itself, and a causal set cannot carry a reflexive precedence relation.
Sequencing has no such defect: it is genuinely acyclic, and it packages the diamonds of $C$ as a
causal set of their own, which we call the *kinematic space* $K(C)$.

The natural question, then: if $C$ carries a post-hole tile, does $K(C)$? Given a readout $R$ and a
colouring $\chi$ on $C$, there is an obvious way to try to lift them to $K(C)$ — read a diamond's
membership and colour off one of its two endpoints. Which endpoint, though, is exactly the question
this note is about.

## The future-pointing lift, and where it breaks

The first attempt is the more natural-sounding one: read a diamond $(a,b)$'s readout membership and
colour off its *upper* endpoint $b$, the point furthest in its own causal future. Call this the
future-pointing lift. Two facts hold for it completely generally, over any causal set at all, not
just our worked example. First, the map sending a diamond to its upper endpoint is monotone from
$K(C)$ into $C$: if one diamond sequences before another, their upper endpoints inherit the same
order, because a diamond's own lower endpoint always reaches its own upper endpoint, so
$b \preceq a' \preceq b'$ whenever $(a,b) \prec^\diamond (a',b')$. Second, and as a direct
consequence, hole membership pulls back correctly along this map: if a diamond's upper endpoint sits
in $C$'s hole, the diamond itself sits in $K(C)$'s pulled-back hole. Both of these are unconditional.
Where the trouble starts is in what the pulled-back hole actually *looks like*, on a specific
example.

Return to the three-event chain, readout at the floor. The diamonds of this chain are exactly the
three pairs of causally related events: the short interval $[c_0,c_1]$, the short interval
$[c_1,c_2]$, and the long interval $[c_0,c_2]$ spanning the whole chain. Since the floor never
appears as anyone's upper endpoint — nothing reaches back down to it — none of the three diamonds'
upper endpoints can equal the floor, so all three lift into the hole of $K(C)$: the pulled-back hole
is the full three-point space. Sequencing relates exactly one pair among them: $[c_0,c_1]$ precedes
$[c_1,c_2]$, because the upper endpoint of the first ($c_1$) is exactly the lower endpoint of the
second. The long interval $[c_0,c_2]$, though, sequences with *neither* of the other two, in either
direction. It cannot follow $[c_0,c_1]$ or $[c_1,c_2]$, because nothing at all is reachable onward
from the top of the chain — $c_2$ is maximal, so no diamond can have it as a lower endpoint. And it
cannot precede either of them, because sequencing into a diamond requires reaching that diamond's
own lower endpoint, and the only diamonds with lower endpoint below the long interval's own upper
endpoint would themselves have to start at the floor — which, again, nothing reaches back down to.
The long interval is, provably, a fully isolated point of the sequencing order: no predecessor, no
successor, entirely disconnected from the rest of $K(C)$.

This is not a gap in an argument; it is a genuine topological fact about the space, and it is fatal
to the future-pointing lift as a tile. A post-hole tile's future core has to be one *connected* piece
that every hole event eventually reaches. With the long interval sitting off on its own, reachable
from nowhere and reaching nowhere, no single connected core can be cofinal for the whole three-point
hole — any candidate core either excludes the long interval (failing cofinality) or includes it
(failing connectedness, since nothing links it to the rest). The colouring, incidentally, survives
this collapse just fine: the long interval and the second short interval both terminate at the
chain's top and so are forced to the same colour by the lift, but since they are never
causally adjacent that coincidence never has to be resolved — it is invisible to the colouring
obligation, and only surfaces once one asks about connectivity.

## Flipping to the past-pointing lift

The natural next move is to try the dual construction: read a diamond's readout membership and
colour off its *lower* endpoint instead, the point furthest in its own causal past. Everything
proved for the future-pointing lift has an exact mirror here, by an entirely symmetric argument —
monotonicity of the lower-endpoint map follows from the same chain of inequalities read the other
direction ($a \preceq b \preceq a'$ whenever the first diamond sequences before the second), and
hole membership pulls back along it the same way.

On the worked example, though, this single change of perspective inverts the whole picture. Pulled
back through the lower endpoint, a diamond's hole membership now depends on whether its own *start*
avoids the readout, not its end. The short interval $[c_0,c_1]$ starts at the floor — so it lands
squarely in the readout's reach and drops out of the hole entirely, and so, for the same reason,
does the long interval $[c_0,c_2]$, which also starts at the floor. What remains is a single point:
the second short interval $[c_1,c_2]$, the only diamond whose lower endpoint is not the floor. And a
one-point hole is, trivially and for free, a connected tile: there is no pair of distinct hole events
left to colour, so the colouring obligation is vacuous, and a single point is its own connected
future core with no argument required beyond the fact that a one-point space admits no nontrivial
separation at all. The lift closes completely — the same base tile that could not be lifted through
the future-pointing endpoint lifts perfectly through the past-pointing one.

It is worth pausing on how sharp this reversal is. The obstruction found in the future-pointing
direction was not a weak or borderline failure — the long interval was *provably* isolated, cut off
in both directions at once. And yet flipping one design choice, with no other change to the tile,
the causal set, or the readout, turns a three-point hole with a disconnected component into a
one-point hole with nothing left to disconnect. The lift did not almost fail and almost succeed; it
failed completely in one direction and succeeded completely in the other.

## The emerging duality

This asymmetry is too clean to be an accident of the particular example, and it suggests a
structural explanation rather than a coincidence. Notice where the readout sat: at the floor, the
*source* of the chain, the event nothing causally precedes. And notice which lift succeeded: the one
reading off each diamond's *lower*, past-facing endpoint — the endpoint on the same side of the
chain as the readout. The lift that failed read off the endpoint on the *opposite* side from the
readout.

That pairing suggests a general conjecture: **the endpoint-reflecting lift closes when it reads off
the endpoint on the same side as the readout, and threatens to fail — by exactly the kind of
isolated-point obstruction found above — when it reads off the opposite one.** If the readout sits
near a source of the causal order, pull back through the past-pointing (lower) endpoint; if it sits
near a sink, the conjecture predicts the future-pointing (upper) endpoint should be the one that
closes, by a mirror-image argument to the one given here. The intuition is that a diamond whose
readout-facing endpoint is close to the readout gets "caught" by it early and folded into a small,
well-behaved region near the readout itself, while a diamond read from its *other* end has to reach
all the way across itself before the readout can catch it — and it is exactly the diamonds that
span the most structure (like the long interval here) that end up isolated, because they are too
big to be caught locally and too extremal (touching both a source and a sink at once) to be linked
to anything else in the sequencing order.

If this is right, it reframes the whole Diamond-Lift Closure Conjecture. The question stops being
"does the lift of a post-hole tile to the space of causal diamonds always close" — the three-event
chain already shows that the honest answer, for a fixed choice of endpoint, is no. The real question
becomes: is it always true that *at least one* of the two endpoint-reflecting lifts closes, and is
the choice between them always determined, as it appears to be here, by which side of the causal
order the readout sits on? That would be a genuinely stronger and more satisfying statement than the
existence witness this note has produced so far — a structural criterion, not merely an example.

## What would confirm or break this

The immediate test is cheap and direct: move the readout on the very same three-event chain from the
floor to the top, and check the dual prediction — that the *future*-pointing lift is now the one that
closes, with the past-pointing lift now exhibiting the isolated-point failure in mirror image (this
time it should be the diamond starting at the floor, $[c_0, c_1]$ or the long interval $[c_0,c_2]$,
that finds itself with no predecessor and no successor in the pulled-back order). If that mirrors
cleanly, it is two independent data points for the same duality on the same underlying space, which
is good evidence without yet being a proof.

Beyond that, the honest open problem is to find the general argument — over an arbitrary causal set,
an arbitrary post-hole tile, and an arbitrary readout position, not just this one small chain — for
why the source-or-sink position of the readout should force the choice of closing endpoint. The
worked example suggests the mechanism (extremal diamonds spanning "too much" of the chain become
isolated under the wrong pullback), but a mechanism visible in one three-point example is a
conjecture, not yet a theorem. Whether that argument goes through in general, or breaks down on a
richer causal set with more branching, more sources, or more sinks than a simple chain, is the real
content still standing open behind the Diamond-Lift Closure Conjecture.
