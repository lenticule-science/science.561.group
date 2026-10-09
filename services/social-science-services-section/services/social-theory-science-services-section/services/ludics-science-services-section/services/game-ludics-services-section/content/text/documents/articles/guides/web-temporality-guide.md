---
title: "Guide: Web Temporality"
description: "An orientation to the literature on browser-native and always-on games — idle/incremental play, tick-based persistent worlds, asynchronous social mechanics, and daily-instance puzzles — for a reader arriving cold."
date-created: 2026-08-22
---

For the underlying questions, source status, bridges, and reading debts, see [the related research note](../notes/2026/08/22/2026-08-22-note-on-web-temporality.md).

# A Guide to Web Temporality

## 1. The story of the field

Every strand of this literature is answering some version of the same
question: what happens to a game when its clock does not stop for the
player? Five disciplinary habits converge on that question from different
directions — HCI/design ethnography, media-theoretic and psychoanalytic
theory, MMORPG labor studies, content-analytic games research, and
journalism about long-running worlds — and the convergence is itself
useful: the observation is not an artifact of any one methodology.

The clearest entry point is designer-perspective ethnography: Katta Spiel,
Sultan A. Alharthi, and five co-authors, "'It Started as a Joke': On the
Design of Idle Games" (CHI PLAY 2019), which interviewed six people who
make idle games for a living — Ian Bogost (Cow Clicker), Frank Lantz
(Universal Paperclips), Jake Hollands (Spaceplan), the designer known as
bloodrizer (Kittens Game), Eric Fredricksen (Progress Quest), and Lucas
Mills (Tap Titans) — to build a working definition of the genre. Quoting
the earlier, harder-to-obtain Alharthi et al. taxonomy paper, idle games
"require players to leave the game and return to it at a later,
unspecified point, where the game progresses on its own during that time
and opens up different options for further play upon return." That
sentence is the field's shared starting axiom; everything else is
commentary on what it costs and what it is for.

The commentary that pushes hardest on the "what it costs" side comes from
inside the same interview study, in the voice of its most famous
respondent. Ian Bogost — who built Cow Clicker as enacted satire after
Zynga's FarmVille won a Game Developers Choice award — put the genre's
temporal signature precisely: "It's not just the asynchrony between
players, like, I play a hand or something, but it's asynchrony with the
state, with the game itself. Like, you're there and then you're not and
you're there again." Bogost is also the field's sharpest internal critic.
His own account of Cow Clicker (triangulated here rather than read
directly — see Section 3) names four "disturbing, dangerous aspects" that
social games distill and idle games make explicit: Enframing (friends
reduced to extraction resources), Compulsion (slot-machine variable-reward
psychology), Optionalism (mechanics technically skippable for cash, so the
game presents itself as a choice you are not meant to exercise), and
Destroyed Time — compulsive obligation persisting through the player's
absence, imposing symmetrical upkeep costs on the developer too. Cow
Clicker ran until the "Cowpocalypse" of September 2011, when every cow was
permanently replaced with a blank space: a designed, irreversible ending,
deliberately unlike the genre's usual refusal to end.

Set against Bogost's critique is a body of theory that treats the same
structure not as exploitation but as a distinct, coherent pleasure. Sonia
Fizek's "Interpassivity and the Joy of Delegated Play in Idle Games" (2018)
imports Robert Pfaller and Slavoj Žižek's concept of interpassivity —
delegated pleasure, the VCR that "passively enjoys for me" — arguing idle
games are the form built to exploit exactly this delegation. Her
genre-defining move, borrowed from Alexander Galloway's "ambience acts,"
distinguishes games that merely animate themselves while the player is
elsewhere (Grand Theft Auto III characters idling on-screen, where "the
machine's micromovements have no effect" once play resumes) from idle
games proper, where "the game plays itself and the changes in the
gameworld are permanent and significant, whether the human player
participates in their execution or not." Björk and Juul's agency criterion
draws the same boundary from the other side — "unless players have some
agency to affect the outcome of a game and can intentionally exercise it,
they are not really … playing a game" — and Fizek's genre history shows it
tested deliberately, from Progress Quest (2002), an "automated game which
cannot be affected by the player's actions at all" except at character
creation, through Cow Clicker and Cookie Clicker to Dreeps (2016), back to
Conway's Game of Life (1970) as the ur-example of a zero-player game.

Bloodrizer, one of the CHI PLAY interviewees, gives the phenomenology in a
line worth holding onto: "You are, essentially, not a center of the world
but a spectator, world goes on with or without you" — the felt experience
Fizek's theory formalizes and Bogost's critique worries about, the same
fact of design read three ways.

A parallel but distinct argument runs through the persistent-world
literature, where the absent-player problem is architectural rather than a
genre gimmick. Urban Dead (Kevan Davis, 2005–2025) ran nearly twenty years
on a strict action-point economy — fifty points a day, half an hour to
regenerate each one — with a philosophy stated starkly by one retrospective
essay: "There is no way for the game to end other than quitting… There is
no end," its real antagonist named directly: "The biggest threat in
Malton isn't zombies, it's entropy." Kingdom of Loathing (Zack "Jick"
Johnson, 2003) solves the same problem differently — a capped, banking
daily-turn allowance ("forty turns to play… you cannot exceed two hundred
turns") — producing a daily ritual with a ceiling on hoarding rather than
slow continuous accrual. Neither is an idle game, but both share the
premise that the world's clock runs independent of any single player's
presence, which is what this note tracks across both sub-genres.

Stefano De Paoli's "Automatic-Play and Player Deskilling in MMORPGs" (2013)
pushes the persistent-world thread further, into MMORPGs where bots and
levelling macros perform the grinding cycle without the player present at
all. Framed through Marx on industrial automation and Latour's
actor-network theory, his argument is a matched pair: "the deskilling of
players with the transfer of human skills to automatic-play software,"
answered by an "enskilling of machines," in which bots come to embody
judgment — timing, risk assessment, resource management — once exclusively
human. Where the idle-game literature treats the world continuing without
the player as a designed feature, De Paoli treats it as labor substitution
with real economic stakes and a real question about whose skill the game
actually tests.

Two design responses close the arc. Mia Consalvo's content analysis of
seventy Facebook-era social games, "Using your friends" (2011), catalogues
the asynchronous mechanics — the silent friend bar, gifting split into
"peripheral" and "critical," and especially "visiting/tending," where
players perform small unpaid chores in a friend's space the friend was not
present to see — that made this generation of games feel social while
mostly reducing sociality to "a 'click' that helps one player, or requests
help from others." Josh Wardle's own account of designing Wordle, given to
TechCrunch in January 2022, reads as a conscious rejection of everything
Bogost diagnosed. He capped the game at one shared word a day — "It's
something about the fact that it's one puzzle, and everybody is solving
it" — refused push notifications ("Why don't you just forget about Wordle
for a little bit?") and monetization ("I like giving it away for free"),
stating the philosophy plainly: "I think people have an appetite for
things that transparently don't want anything from you." Where Cow Clicker
distilled the extraction, Wordle distills the gift, using the identical
daily-return structure to opposite ends. Julien Thiennot, Cookie Clicker's
creator, sits between the two poles: his game "wasn't meant to be fun,"
but he draws the ethical line at substance — "It only becomes abusive when
the repetition is devoid of substance and sincerity," particularly when
paired with microtransactions, which Cookie Clicker avoids.

## 2. The load-bearing concepts

**Interpassivity.** Fizek's central theoretical import, from Pfaller and
Žižek, names a pleasure structure in which enjoyment itself is delegated
rather than felt directly — the VCR that "passively enjoys for me," canned
laughter, the photocopier that "reads" a text so the scholar does not have
to. Applied to idle games, the player is not failing to play; the player
is exercising a specific, coherent kind of agency whose object is the
decision to delegate play itself — reframing apparent passivity as a real
choice with a real texture.

**Ambience acts, and the line that actually defines the genre.** Borrowed
from Alexander Galloway, an ambience act is any moment the game plays
itself while waiting for the player; every game with idle-animation has
some. What makes an idle game an idle game, on Fizek's account, is not the
presence of ambience acts but their consequence: in an idle game, what
happens during them is "permanent and significant," changing the state the
player returns to; in an ordinary game, the machine's micromovements "have
no effect." This is the sharpest boundary between a game with a waiting
animation and a game that plays itself — about consequence, not
appearance.

**The Björk–Juul agency criterion.** Björk and Juul supply the test idle
games are designed to fail on purpose: "unless players have some agency to
affect the outcome of a game and can intentionally exercise it, they are
not really … playing a game." Idle games run right up against this line
without quite crossing it — the player retains enough intentional agency
(deciding when to check in, what to buy, when to prestige) to still count
as play, while ceding as much moment-to-moment execution as the design
allows.

**Bogost's four sins.** Enframing, Compulsion, Optionalism, and Destroyed
Time interlock rather than standing independently. Enframing turns
relationships into extraction resources; Compulsion supplies the
psychological engine; Optionalism disguises the compulsion as a free
choice by making it technically skippable for money; Destroyed Time is the
temporal consequence of all three — obligation persisting through the
player's absence, with symmetrical upkeep costs imposed on the people who
built the system. Any idle-adjacent design can be read against this
quartet as a checklist — which is exactly how Wordle reads as a
counter-design rather than merely a different game.

**Deskilling and enskilling.** De Paoli's paired concept describes a
transfer, not merely a loss: as bots take over levelling, human players
lose practiced skill while the software gains a functional equivalent —
judgment about timing, risk, and resource management now lives in the
automaton. This is the literature's only sustained attempt to ask what
changes, formally, when the entity executing a strategy against a
persistent world is not a human holding what Suits calls a lusory
attitude but delegated software. The literature answers this as a labor
question; whether it can also be answered as a formal one is the
note's own open problem.

**Return-scheduling regimes.** No single source offers a comparative
typology, but five distinct regimes recur: the continuous tick (Urban
Dead's half-hourly action points), the banked daily allowance (Kingdom of
Loathing's forty-turns-a-day cap), the appointment (cooldowns and
ready-to-harvest crops), the shared daily instance (Wordle), and pure idle
accrual (Cookie Clicker, Kittens Game). Each imposes a different rhythm on
a life played against it. Building this typology out, with its design
consequences stated precisely, is the note's central unfinished task,
not something the literature already supplies.

## 3. How to read this literature

Start with Spiel et al., "It Started as a Joke" (CHI PLAY 2019), read in
full: it is the field's own vocabulary in designers' own words, and gives
the working definition of the genre plus the five organizing themes
(Attending to the Absurd; Non-Commital Invitations to Play; Paradigm
Shifts as Narrative Beats; Being Care-ful in Design; Personal Play as
Motivator) that everything downstream elaborates. Extract the definition,
the Bogost and bloodrizer quotes, and the Lantz/Hollands material on
deliberately engineered endings.

Read Fizek's "Interpassivity and the Joy of Delegated Play" (2018) second,
also read in full and the richest theoretical source in the set — the
interpassivity concept, the ambience-acts distinction that actually
defines the genre, the Björk–Juul boundary, and the genre lineage from
Progress Quest through Conway's Life all live here.

Read the Bogost material third, with a caveat held in mind: what you have
is triangulated, not primary. His own essay, "Cow Clicker: The Making of
Obsession," was never fetched directly, so the four concerns and their
quotes come from his site's game-description page, Wikipedia, and
citations inside Fizek and Spiel et al. — well-triangulated, but the
exact sentence-level argument remains unread, and so does the exact
context of the "asynchrony with the state" quote used in Section 4.

Read Wardle's TechCrunch interview fourth, directly against Bogost — short,
read in full, and most useful as a reply: the same appointment structure,
with every one of Bogost's four sins deliberately declined. Read De
Paoli's "Automatic-Play and Player Deskilling" (2013) fifth, for the
literature's only sustained treatment of what happens when the entity
playing in the player's absence is a delegated automaton rather than the
game's own tick. Read Consalvo's "Using your friends" (2011) sixth, as the
empirical backbone for the social-mechanics side of the genre — friend
bars, gifting, and especially visiting/tending, cited later against the
corpus's admission-codec and boundary work. Read the Urban Dead material
(KRITIQAL and Dead Entertainment) and the JayIsGames review of Kingdom of
Loathing together, seventh, as journalism-grade case studies of the tick
and the bank; then the Neopets and Kanoplay pieces last, for genre and
business context rather than argument.

Several items in the bibliography are held only at second hand and should
be read with that caveat foregrounded rather than cited as settled —
Alharthi et al.'s original taxonomy paper, Grimes and Shade on Neopets,
Hjorth and Richardson's Ambient Play, and Pecorella's GDC talks chief
among them. One further item, Peper and Wettmann's "Synchronising times"
(2025), is available only as a public abstract; it is the single most
on-topic recent scholarly source located for this note and the one
most worth chasing down in full.

## 4. Where this touches the corpus

The related note grades its obsmetrological bridge conservatively:
the connections below are all graded **rhyme** — a resemblance the
literature's own language invites, not an established or reported result.

The idle game and the tick world are read as arenas whose Opponent-side
causal development does not pause for the Player's absence: the settling
climbs on its own clock, and the Player's strategy is receptive to an
arena that has been doing work between sessions. Two pieces of the
literature's own phrasing invite this reading directly. Bogost's line —
"it's asynchrony with the state, with the game itself" — locates the gap
not between players but between the Player and the underlying event
structure itself, close to naming a strategy's receptivity to an arena
that continues its own causal development independent of any single
session. Bloodrizer's "you are not a center of the world but a spectator,
world goes on with or without you" gives the same formal signature in a
designer's own vocabulary — read as rhyming with the corpus's model of
arenas as polarized causal event structures, not as evidence for it.

Urban Dead's own self-description — "There is no way for the game to end
other than quitting… There is no end" — is read the same way: plain
testimony to a settlement process with no least fixed point reachable
from outside continued play, the closure operator climbing on its own
clock rather than reaching a final state — the "open front," against a
finite regime like Conway's Life where a finished game becomes a number.
Again, a rhyme, not a proof the two formalisms coincide.

The Wordle daily instance is read as a circle drawn in time: one shared
arena-instance synchronizing millions of otherwise disjoint sessions,
offered as why its results are socially exchangeable in a way an idle
game's private progress is not.

Two further hooks are offered more cautiously, with the source material's
own notes explicit against over-reading them. The CHI PLAY finding that
designers such as Lantz and Hollands deliberately engineer endings into an
otherwise-endless structure is noted as adjacent to, not identical with,
the corpus's treatment of irreducible disagreement — "a
design-discourse-level tension… rather than forcing it into the
cohomological apparatus," in the source material's own words. Consalvo's
catalogue of visiting/tending mechanics is offered as raw material for the
corpus's admission-codec and boundary work, with the caveat that the
literature itself frames these mechanics as thin, instrumentalized
sociality (Bogost's "enframing") rather than in any codec vocabulary of
its own — the mapping is the note's, not the literature's.

One connection is posed as a question rather than a reading. De Paoli's
bots raise the note's formal question: when a receptive, courteous
sub-event-structure is executed by a delegated automaton rather than a
human holding a lusory attitude, what distinguishes the player's strategy
from the player's absence — which agent holds the handedness? The
literature treats this entirely as a labor question; no formal treatment
exists on either side. It is not a graded connection at all — it is the
clearest open bridge the note has identified.

## 5. What we don't know yet

The literature has instances of return-scheduling design — tick, bank,
appointment, daily instance, pure idle — but no comparative theory that
states their design consequences precisely against one another. Building
that typology is the note's central open task, not a summary of
something already written.

It is not known whether "the game plays itself" admits an ordering of
degrees — from incidental idle animation, through offline accrual, to full
automation — and if so, whether that ordering coincides with the ordering
of delegated agency that De Paoli's deskilling/enskilling pair describes.
The two might track each other exactly, or come apart in instructive ways;
nothing in the current source material settles it either way.

The tick-based strategy PBBGs of 2000–2005 — Planetarion, OGame, Travian,
Utopia — are genuinely under-documented. Searches beyond Wikipedia-level
facts turned up no substantial journalism or scholarship on any of the
four, which reads as a real gap in the available record rather than a
failure to look. Primary-source recovery — postmortems, operator
interviews, archived tick engines — is worth doing before it disappears
entirely, given that a close relative, Urban Dead, has already shut down
after twenty years.

The full list of unread and second-hand sources lives in the bibliography's
Reading debts section; most worth flagging here are Alharthi et al.'s
original "Playing to Wait" taxonomy, never read in primary text, and
Bogost's own "Cow Clicker" essay, never fetched directly — meaning the
"asynchrony with the state" quote used in Section 4 is verified only
against an interview transcript, not against Bogost's own prose, and
should be checked before it is leaned on further.

Finally, the note has posed a question its formalism cannot yet answer:
when a bot executes what looks like a receptive, courteous strategy on a
player's behalf, does that change what "the player's strategy" means, or
only who stands behind it? The literature answers this as a labor
question; whether it can also be answered as a formal one is, at present,
entirely open.
