---
title: "Note on Lakota Weiqi Strategy"
description: "Owner-stated 2026-09-03 (Theory Thursday) hypothesis, verbatim: traditional Lakota spatial logic and tactical tradition, mapped onto the 19x19 grid, would produce an expansive, center-dominant, whole-board-coordinating style. Turns each paragraph into a measurable feature of a player's move stream in the readout Chu space's own vocabulary, names the nearest known styles (Shin Fuseki, Takemiya's cosmic style), and states what would settle the question empirically once Lakota players' own games exist as data."
date-created: 2026-09-04
date-updated: 2026-09-04
type: text
status: proposal
authors:
  - emsenn
  - claude-sonnet-5
keywords: ["weiqi", "lakota", "strategy", "lineage", "signature", "moyo", "fuseki", "cosmic-style", "readout-chu-space"]
---

# Note on Lakota Weiqi Strategy

Owner, 2026-09-03, Theory Thursday: the hypothesis below is reproduced
unedited in §1, exactly as stated, and read in this note against this
section's own instruments — the readout Chu space of
[Readouts as a Chu Space, Coordination as Cohomology](../research-articles/readouts-as-a-chu-space-coordination-as-cohomology.md)
and the lineage-as-signature reading of
[Whole-Board Reading as a Gluing Problem, and Lineages as Signatures](../research-articles/whole-board-reading-as-gluing-lineages-as-signatures.md).
Nothing in §1 is this section's claim; §2 onward is.

## 1. The owner's hypothesis

If traditional Lakota spatial logic, tactical traditions, and
philosophical concepts were mapped onto the 19×19 Go grid, their school
of play would diverge sharply from conventional territory-first
(corner-and-edge) styles. It would favor an expansive, fluid,
center-dominant game built around mobility, wide encirclement, and
whole-board coordination.

**The Sacred Hoop Over the Orthogonal Grid.** Standard opening theory
(fuseki) teaches that the corners are gold, the sides silver, and the
center grass. In Lakota cosmology, power moves in circles (Čhaŋgléška
Wakȟáŋ, the Sacred Hoop), radiating outward in balance across the four
directions. A Lakota player would likely treat the corners not as
fortified strongholds, but as restrictive pockets that limit
flexibility. They would naturally gravitate toward high, central stones
(4th- and 5th-line plays, or opening around Tengen), projecting outward
influence (moyo) that views the board as an unbroken, contiguous
landscape rather than isolated territories to partition.

**The Communal Surround (Tȟatȟáŋka Tactics).** In the traditional
communal buffalo hunt, hunters did not engage animals head-on; they used
horse-mounted wings to sweep wide, funneling the herd into an enclosed
depression or choke point. In Weiqi, this translates into indirect,
multi-stone leaning attacks. Rather than launching a direct strike to
capture a group, a Lakota player would build loose, sweeping nets (geta)
from afar. They would drive the opponent's stones into cramped shapes
while naturally solidifying colossal territory on the perimeter,
securing the game through guided containment rather than local
slaughter.

**Decoys, Feigned Retreats, and Sacrifices.** Plains tactical doctrine,
exemplified by leaders like Crazy Horse during the Battle of the Hundred
in the Hand, excelled at the decoy strike: presenting a seemingly
vulnerable, fleeing vanguard to lure an opponent into overextending
their lines. On the board, this would manifest as aggressive, light
sacrifice play (sute-ishi). A Lakota strategist would willingly toss
stones into the opponent's sphere of influence to serve as bait. Once
the opponent spent moves greedily swallowing the isolated stones, the
player would seal the exterior perimeter or sever the opponent's cutting
points.

**Mobility, Light Shape, and Dispersion (Tiyóšpaye).** Lakota social and
survival structures relied on the autonomy of the tiyóšpaye (extended
family bands), which could disperse across the plains to preserve
resources and assemble rapidly when unified action was required.
Clumping stones into heavy, overconcentrated shapes (dango) would be
viewed as an existential vulnerability. Their style would master
sabaki: light, flexible shapes with wide, skipping jumps (tobi) and
knight's moves (keima). If a group came under pressure, they would treat
the stones as expendable messengers, floating across the board rather
than getting bogged down in static trench defense.

**The Ethos of Counting Coup.** In Plains warfare, the highest honor was
not maximizing casualties, but counting coup: touching an enemy in
combat and escaping unharmed, demonstrating superior control and
composure. Translated to Weiqi, this would produce a psychological style
built on sharp forcing moves (kikashi) that seize initiative (sente). A
Lakota master would disdain brutal, zero-sum capture races (semeai)
where both sides risk destruction. Instead, they would tap the
opponent's vital shapes just enough to dictate the rhythm, leaving the
opponent alive but permanently constrained.

**Holistic Connection (Mitákuye Oyásʼiŋ).** The foundational worldview
that "all are related" aligns cleanly with zenkyoku (whole-board
thinking). Every stone placed is viewed as an active relative to every
other stone on the board. Local tactical skirmishes would never be
fought in isolation; a trade on the bottom-right would always be
engineered to activate a dormant influence on the upper-left.

## 2. The signature this hypothesis predicts

[Whole-Board Reading as a Gluing Problem, and Lineages as
Signatures](../research-articles/whole-board-reading-as-gluing-lineages-as-signatures.md)
§3 reads a **lineage** as a cluster in the space of distributions over
the readout Chu space's own [readout](../research-articles/readouts-as-a-chu-space-coordination-as-cohomology.md)
questions — which readouts a player's moves tend to settle, hold open,
or leave contested, and how often. Read this way, §1's hypothesis is not
a mood or a preference; it is a claim about where a Lakota lineage's
move-stream distribution would sit, on seven named coordinates, relative
to a territory-first baseline distribution. Each coordinate below is
named for the §1 paragraph it comes from, states what data computes it,
and states what the hypothesis predicts.

**Opening line distribution**, from "The Sacred Hoop." The share of the
first twenty moves played on the 4th line or higher, and the frequency
of openings at or adjacent to tengen, the center
[hoshi](../../../glossary/terms/hoshi.md). This is read directly
off move coordinates in the kernel's replayed position record
(`positionFromSgf`/`coordToPoint`, the same fold [The Two-Time
Board](../research-articles/the-two-time-board.md) §1 uses to recover a
position at any move) — a move's line number is board geometry, not a
semantic event, so no readout is needed to compute it. The hypothesis
predicts a higher 4th-line-and-above share and more tengen-adjacent
openings than a territory-first baseline, which the section's own
[fuseki](../../../glossary/terms/fuseki.md) and
[hoshi](../../../glossary/terms/hoshi.md) terms describe as favoring the
corner 3-3 and 4-4 points first.

**Encirclement ratio**, from "The Communal Surround." Of a player's
captures, the share won by net or loose enclosure
([geta](../../../glossary/terms/geta.md)) rather than by a direct
[ladder](../../../glossary/terms/liberty.md) chase or forcing
[atari](../../../glossary/terms/atari.md) sequence. The kernel's semantic
event layer, [events.mts](../../../../../apps/weiqi-kernel/src/events.mts),
already fires a `capture` event per capture; classifying a given capture
as encirclement rather than direct chase needs the readout-pullback
distinction [Readouts as a Chu Space, Coordination as
Cohomology](../research-articles/readouts-as-a-chu-space-coordination-as-cohomology.md)
§4 names for a ladder breaker — whether a stone outside the immediate
liberty-adjacency of the captured group (the [shared-liberty
nerve](../../../../../scripts/derive-shared-liberty-nerve.mts)'s own
acceptance test) decided the outcome. The hypothesis predicts a higher
encirclement ratio and a lower direct-ladder-chase ratio than baseline.

**Sacrifice rate**, from "Decoys, Feigned Retreats, and Sacrifices." The
share of a player's captured stones that were
[sute-ishi](../../../glossary/terms/sute-ishi.md) — placed with the plan of
being captured, in exchange for [sente](../../../glossary/terms/sente.md)
or an outer wall — rather than stones lost to a misread. This is
computed by joining the kernel's `capture` events against the readout
Chu space's own sente reading: a sacrifice is a capture where the
readout Chu space's pullback (§1 of the readouts article) shows the
sacrificing player retained sente or gained outer
[thickness](../../../glossary/terms/thickness.md) immediately after the
loss, rather than losing the initiative along with the stones. The
hypothesis predicts a higher sacrifice rate than baseline.

**Shape lightness**, from "Mobility, Light Shape, and Dispersion." Mean
[liberties](../../../glossary/terms/liberty.md) per stone in contact
fights, and the frequency of [tobi](../../../glossary/terms/tobi.md) and
[keima](../../../glossary/terms/keima.md) relative to solid connections
(the [dango](../../../glossary/terms/dango.md) shape avoided). Liberty
counts per group are the same instrument
[scripts/derive-liberty-chu-space.mts](../../../../../scripts/derive-liberty-chu-space.mts)
already computes from a replayed SGF record; jump-versus-connection
frequency is read from the coordinate offset between successive
same-color stones in the move stream, again board geometry rather than a
semantic event. The hypothesis predicts higher mean liberties per stone
in contact fights, a higher tobi/keima share, and a lower solid-connection
share than baseline.

**Forcing ratio**, from "The Ethos of Counting Coup." The share of
[kikashi](../../../glossary/terms/kikashi.md) that are answered, and sente
retained per exchange. A candidate forcing move is read against the
readout Chu space's own account of sente in §1 of [Readouts as a Chu
Space, Coordination as
Cohomology](../research-articles/readouts-as-a-chu-space-coordination-as-cohomology.md):
sente holds when the pullback of "opponent has a profitable reply here"
onto the pre-move position is empty, the same object [Atari as One Local
Future](../research-articles/2026-09-03-note-on-atari-as-one-local-future.md)
§4 names for a forced move. The hypothesis predicts a higher forcing
ratio (more kikashi answered, more sente retained per exchange) than
baseline.

**Semeai avoidance**, also from "The Ethos of Counting Coup." Capturing
races ([semeai](../../../glossary/terms/semeai.md)) entered per game. This
feature is stated honestly as not yet computable: `events.mts`'s own
header names life-and-death-shaped detection — which the current kernel
does not attempt — as exactly the missing capability a semeai count
would need (distinguishing a genuine mutual capturing race from an
ordinary exchange requires reading whether either group can make two
eyes, not a per-move diff). Computing this feature is therefore future
kernel work, not a current instrument; the hypothesis predicts, once it
exists, a lower semeai-entry rate than baseline.

**Whole-board coupling**, from "Holistic Connection." How often a local
exchange changes readouts (via `bwd`) in a distant region at the same
time — the coordination measure [Readouts as a Chu Space, Coordination
as
Cohomology](../research-articles/readouts-as-a-chu-space-coordination-as-cohomology.md)
§4 names as the readout-pullback nerve's cycle rank, `Ȟ¹ = |E| − |V| +
|C|`. The existing [shared-liberty
nerve](../../../../../scripts/derive-shared-liberty-nerve.mts) computes
this rank over spatial liberty adjacency only, which the readouts
article's §4 states cannot see a ladder-breaker-shaped coupling; the
feature this coordinate needs is the readout-pullback nerve §4 calls for
and has not yet been built. The hypothesis predicts, once that nerve
exists, a higher rate of cross-region readout coupling — more moves
whose pullback reaches a region with no shared liberty to the move
itself — than baseline.

## 3. Nearest known signatures

Stated plainly, and against this section's own honesty law: the
center-and-influence style §1 describes is not unique to a Lakota
lineage. It is, most directly, the **Shin Fuseki** ("New Fuseki")
movement of **Go Seigen and Kitani Minoru**, 1933 — already named in
this glossary's own [influence](../../../glossary/terms/influence.md) term
as "centre-facing, influence-first opening play" against the earlier
territorial orthodoxy — and, more closely still, **Takemiya Masaki's
cosmic style** (*uchū-ryū*), a twentieth-century professional style built
on large center-facing frameworks (moyo) rather than early territorial
enclosure
[shinfuseki-wikipedia](../bibliographies/shinfuseki-wikipedia.md)
[takemiya-wikipedia](../bibliographies/takemiya-wikipedia.md). [National
and Historical Play Styles](../research-articles/national-and-historical-play-styles.md)
verifies both against a wider comparison set, including the finding that
both are documented as *thick*, not light — a qualifier on how close
"more closely still" actually reads against §2's shape-lightness
coordinate.

What would distinguish a Lakota lineage empirically from Shin Fuseki or
the cosmic style is not center-facing play alone — both named
predecessors already play that way — but the **combination** §2 names:
encirclement over direct capture, a high sacrifice rate, a high forcing
ratio, and semeai avoidance, held together as one signature rather than
any single coordinate alone. And above all: the games of Lakota players,
which do not yet exist as data this section can compute against. Naming
a resemblance to Shin Fuseki or the cosmic style is not the same claim
as computing a signature; §2's instrument is what would tell the two
apart.

## 4. What settles it

The owner's own stated program settles this, not further theory: teach
Lakota players weiqi; the platform records their games; the signature
of §2 is computed from those games, not asserted from §1's cosmology
alone.

**What would refute it.** If Lakota players' measured signatures,
computed by §2's instrument once it exists and once real games exist to
run it on, do not cluster apart from a cosmic-style baseline on the
combination features named in §3 — encirclement, sacrifice, forcing,
and semeai avoidance, taken together — then the hypothesis is a style
preference available to any player who studies center-facing play, not
a lineage effect traceable to Lakota spatial logic and tactical
tradition specifically. A cluster that only reproduces existing
cosmic-style numbers would be exactly that outcome.

## 5. The Lakota concepts

The Lakota concepts named in §1 — Čhaŋgléška Wakȟáŋ (the Sacred Hoop),
the communal buffalo hunt, counting coup, tiyóšpaye, and Mitákuye
Oyásʼiŋ — are the owner's own, stated as a Lakota nation leader. This
section holds no outside citation for any of them and invents none here.
Outside citations for each are to be supplied or verified by the owner;
until then, each is marked as owner-stated only, per the placeholder
list below.

## Citations to verify

Marked for the next stage to fill; nothing above is asserted as sourced
until this list is resolved.

- [x] Shin Fuseki (New Fuseki), Go Seigen and Kitani Minoru, 1933 — §3.
      Verified: [shinfuseki-wikipedia](../bibliographies/shinfuseki-wikipedia.md).
- [x] Takemiya Masaki's cosmic style (*uchū-ryū*) — §3.
      Verified: [takemiya-wikipedia](../bibliographies/takemiya-wikipedia.md).
- [ ] Čhaŋgléška Wakȟáŋ, the Sacred Hoop — §1, §5; owner-supplied.
- [ ] The traditional communal buffalo hunt, Plains hunting tactics — §1, §5; owner-supplied.
- [ ] Counting coup; the Battle of the Hundred in the Hand and Crazy
      Horse — §1, §5; owner-supplied.
- [ ] Tiyóšpaye, the extended family band — §1, §5; owner-supplied.
- [ ] Mitákuye Oyásʼiŋ, "all are related" — §1, §5; owner-supplied.
