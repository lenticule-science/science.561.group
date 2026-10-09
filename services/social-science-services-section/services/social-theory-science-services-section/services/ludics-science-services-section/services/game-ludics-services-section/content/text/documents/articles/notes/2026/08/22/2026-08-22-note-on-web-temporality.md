---
title: "Note on Web Temporality"
description: "Research questions and sources on the native game-forms of the always-on web: idle and incremental games, tick-based persistent browser games, appointment mechanics, shared daily instances — play in the player's absence."
date-created: 2026-08-22
---



## Scope

Catalogue and theorize the temporal structures peculiar to browser-native and
always-on games — games whose clock keeps running when nobody is looking, and
whose design problem is scheduling the player's returns rather than filling
the player's sessions.

## Motivating questions

1. What is a game that plays itself? Where is the boundary of play when the
   player's chief exercise of agency is deciding when to be absent?
   (Fizek's interpassivity; the Björk–Juul agency criterion as the boundary
   the genre tests.)
2. What distinct temporal regimes does the web host, and what does each do to
   the rhythm of a life played against it? Known regimes: the continuous tick
   (Urban Dead's action points), the banked daily allowance (Kingdom of
   Loathing), the appointment (social-game crops and cooldowns), the shared
   daily instance (Wordle), and pure idle accrual.
3. What is the ethics of scheduled returning — the same structure appearing
   as extraction (Bogost's four sins) and as gift (Wardle's counter-design)?
4. What happens to the strategy formalism when the executing agent is a
   delegated automaton (bots, macros, the idle game's own loop)?

## Objects of study

Idle/incremental games and their design discourse; persistent browser-based
games and the tick; social-game asynchronous mechanics (gifting,
visiting/tending); daily-puzzle temporality; automatic play and MMO botting;
the zero-player limit (Conway's Life as ur-case).

## State of knowledge (2026-08-22 sweep)

- **The genre definition** (Alharthi et al. relayed via the CHI PLAY 2019
  interview study, which was read in full): idle games "require players to
  leave the game and return to it at a later, unspecified point, where the
  game progresses on its own during that time."
- **The phenomenology** (read): bloodrizer — "You are, essentially, not a
  center of the world but a spectator, world goes on with or without you";
  Bogost — "it's asynchrony with the state, with the game itself" (verified
  to the CHI PLAY 2019 interview, not the unread Cow Clicker essay).
- **The theory** (Fizek read in full): interpassivity — delegated enjoyment —
  with Galloway's "ambience acts" doing the formal work; the genre-defining
  distinction is that an idle game's absent-time changes are *permanent and
  significant* where an ordinary game's idle animation "has no effect."
- **The lineage** (read): Progress Quest (2002) → Cow Clicker (2010) →
  Cookie Clicker (2013) → Dreeps; Thiennot's own verdict that Cookie Clicker
  "wasn't meant to be fun" and that repetition "only becomes abusive when...
  devoid of substance and sincerity."
- **The tick worlds** (read, journalism-grade): Urban Dead's twenty-year run
  and action-point economy ("There is no end"; "The biggest threat in Malton
  isn't zombies, it's entropy"); Kingdom of Loathing's capped turn banking.
  The 2000–2005 tick-based strategy PBBGs (Planetarion, OGame, Travian,
  Utopia) are genuinely under-documented — a finding about the literature,
  not just a sweep failure.
- **The counter-designs** (read): Lantz engineering an ending into Universal
  Paperclips ("at the end, it's done and it lets you go"); Wardle's Wordle —
  one shared daily word, no notifications, no monetization ("things that
  transparently don't want anything from you").
- **Automation in persistent worlds** (De Paoli read in full): bot-driven
  "deskilling of players" and "enskilling of machines" — the world's state
  advancing through delegated non-human agency.

## Obsmetrological bridge

All graded **rhyme**: the idle game and the tick world are arenas whose
Opponent-side causal development does not pause for Player absence — the
settling climbs on its own clock, and the player's strategy is receptive to
an arena that has been doing work between sessions. The Wordle daily instance
is a circle drawn in time: one shared arena-instance synchronizing millions
of otherwise disjoint sessions, which is why its results are socially
exchangeable. De Paoli's bots pose the note's formal question: when a
receptive, courteous sub-event-structure is executed by a delegated
automaton, what distinguishes the player's strategy from the player's
absence — i.e., which agent holds the handedness? The literature treats this
as a labor question; no formal treatment exists.

## Open problems

- A typology of return-scheduling regimes (tick / bank / appointment / daily
  instance / pure idle) with their design consequences stated precisely —
  the literature has instances but no comparative theory.
- Whether "the game plays itself" admits degrees that can be ordered (from
  idle animation through offline accrual to full automation), and whether
  that ordering is the same as the delegation-of-agency ordering.
- The under-documented PBBG era: primary-source recovery (postmortems,
  operator interviews, archived tick engines) before it is lost.

## Reading debts

Alharthi et al.'s "Playing to Wait" taxonomy in primary text (every current
citation is secondhand); Bogost's own "Cow Clicker: The Making of Obsession"
prose; Hjorth and Richardson's *Ambient Play* (to establish whether it bears
on absence-settlement at all); Pecorella's GDC idle-math talks; Peper and
Wettmann's "Synchronising times" (2025) — the single most on-topic recent
scholarly source found, paywalled at sweep time; Grimes and Shade on Neopets'
immersive advertising.

## Annotated sources

Annotated sources on idle/incremental games, tick-based persistent browser worlds, asynchronous social mechanics, and daily-instance puzzles, graded by how each was actually accessed.


### Sources

**Bogost, Ian. *Cow Clicker* (Facebook game, 2010), with associated design
account, triangulated via bogost.com/games/cow_clicker/, Wikipedia, and
citations in Spiel et al. (2019) and Fizek (2018).**
URL: https://bogost.com/games/cow_clicker/
Status: reported at second hand.
Bogost built Cow Clicker — click a cow every six hours, friends' cows in a
shared pasture generate more, a real-money currency called Mooney lets
players skip the wait — as a satirical enactment of Facebook social games,
distilling the genre to a single mechanic in order to expose it. He named
four "disturbing, dangerous aspects" the game embodies: Enframing (friends
reduced to resources in a system optimized for extraction), Compulsion
(slot-machine variable-reward psychology), Optionalism (mechanics
technically skippable for cash, so the game is a "choice" you are not
meant to actually exercise), and Destroyed Time (compulsive obligation
persisting through the player's absence, with symmetrical upkeep costs
imposed on the developer). The project ended deliberately and irreversibly
with the "Cowpocalypse" of September 2011, when every cow was replaced
with a blank space. The note needs this framework as the sharpest
extant critique of the genre it studies, but the exact wording has been
triangulated across secondary sources rather than read from Bogost's own
essay, and should be verified against his primary text before further
phrases from it are treated as settled quotation.

**Consalvo, Mia. "Using your friends: Social mechanics in social games."
Foundations of Digital Games 2011 (ACM/MIT, Bordeaux, France).**
URL: https://dspace.mit.edu/bitstream/handle/1721.1/100463/Using_Your_Friends.pdf?sequence=1&isAllowed=y
Status: read in full.
A content analysis of seventy top Facebook-era social games identifying
five recurring "social" mechanics — the silent friend bar, gifting (split
between "peripheral," cosmetic gifting and "critical," quest-required
gifting that drives "friend-requesting frenzies"), visiting/tending
(traveling to a friend's space to perform unpaid chores they were not
present to see), rare and mostly non-real-time challenge/competition, and
weak, mostly one-way communication. Consalvo's conclusion is that despite
branding as social, these mechanics mostly reduce to "a 'click' that helps
one player, or requests help from others" — a thin proxy for sociality
organized around each player's private, asynchronously visited space. The
note needs this as its empirical backbone for the asynchronous
social-mechanics side of the genre, and as raw material — with real
caveats about how far the mapping can be pushed — for its admission-codec
and boundary work.

**Dead Entertainment. "Looking Back at Urban Dead, 13 Years Later" (2018).**
URL: https://deadentertainment.com/2018/07/09/looking-back-at-urban-dead-13-years-later/
Status: read in full.
A retrospective on Urban Dead (Kevan Davis, launched July 2005) covering
its creation, its action-point economy, and its player-driven world-building
over thirteen years at time of writing. It documents the mechanic that
throttles play independent of desire — "Players get 50 action points each
day… it then takes half an hour to replenish one action point" — and the
fact that the game's lore was almost entirely player-authored: "the
majority of the game's lore and backstory has been created by its players
over the years," because Davis "set up the basic framework… and then
turned it over to the playerbase." The note needs this as a concrete,
long-lived case of the continuous-tick regime and of community authorship
filling a world its designer deliberately left unauthored.

**De Paoli, Stefano. "Automatic-Play and Player Deskilling in MMORPGs."
*Game Studies* 13, no. 1 (2013).**
URL: http://gamestudies.org/1301/articles/depaoli_automatic_play
Status: read in full.
Analyzes gold-farming bots and levelling macros in MMORPGs as a
labor-automation process: human skills (timing, judgment, dexterity) are
transferred into automatic-play software that then performs the levelling
cycle — move, target/kill, loot, heal — with the nominal player absent or
inattentive. De Paoli's central, paired claim, drawn through Marx on
industrial automation and Latour's actor-network theory, is "the
deskilling of players with the transfer of human skills to automatic-play
software," met by a converse "enskilling of machines" as bots come to
embody judgment that was previously exclusively human. The note needs
this as its only sustained source on what happens, in a persistent world,
when the agent executing play in the player's absence is not the game's
own tick but a delegated, owned automaton — the source of its open
question about which agent holds the handedness of a strategy.

**Fizek, Sonia. "Interpassivity and the Joy of Delegated Play in Idle
Games." Draft for *Transactions of the Digital Games Research Association*
(ToDiGRA), 2018.**
URL: https://gamephilosophy2017.wordpress.com/wp-content/uploads/2017/11/fizek_interpassivity-and-the-joy-of-delegated-play_draft.pdf
Status: read in full.
Applies Robert Pfaller and Slavoj Žižek's concept of interpassivity —
delegated pleasure, delegated consumption, the VCR that "passively enjoys
for me" — to idle games, arguing that the idling player is not failing to
play but exercising a specific, coherent kind of delegated agency. Its
load-bearing move is a definition of idle games via Alexander Galloway's
"ambience acts," distinguishing incidental self-play with no lasting
consequence (background animation in Grand Theft Auto III or Final Fantasy
X) from idle games proper, where changes made during the player's absence
are "permanent and significant." It supplies a genre lineage from Progress
Quest (2002) through Cow Clicker, Cookie Clicker, and Dreeps back to
Conway's Game of Life as the ur-example of a zero-player game, and invokes
Björk and Juul's agency criterion as the boundary the genre tests. The
note needs this as its richest and most precisely stated theoretical
source — the piece that actually defines the genre rather than merely
describing it.

**Grimes, Sara M., and Leslie Regan Shade. "Neopian economics of play:
Children's cyberpets and online communities as immersive advertising in
NeoPets.com." *International Journal of Media and Cultural Politics* 1,
no. 2 (2005): 181–198.**
URL: https://www.ingentaconnect.com/content/intellect/mcp/2005/00000001/00000002/art00002
Status: reported at second hand.
A scholarly critique of Neopets' commercialization of children's online
culture, described only through search-result-level abstracts since the
full text is paywalled. It is understood to examine Neopets as a children's
community shaped by corporate advertising practices, with attention to
privacy, intellectual property, and the ethics of embedding brand content
inside play. The note needs it — unread — as the scholarly counterweight
to the mostly celebratory journalism available on Neopets, and lists it as
an open reading debt.

**History of the Web, The. "The History of Neopets."**
URL: https://thehistoryoftheweb.com/neopets/
Status: read in full.
A narrative history of Neopets (created November 1999 by Donna Williams
and Adam Powell) covering its virtual-pet-care loop, its volatile
Neopoints economy, its player-run Neopian Times newspaper, and its
corporate history through Viacom and Jumpstart. It documents the pet-care
loop's core temporal demand — "If you neglected your pet, it would get
sad" — and the introduction of "immersive advertising," where "Neopians
might play a game featuring a character from their favorite breakfast
cereal." The note needs this as accessible narrative context for
Neopets' economy-and-neglect mechanic, a temporal structure distinct from
both idle accrual and the PBBG tick.

**Hjorth, Larissa, and Ingrid Richardson. *Ambient Play*. MIT Press,
Playful Thinking series, 2020.**
URL: https://mitpress.mit.edu/9780262044363/ambient-play/
Status: reported at second hand.
Proposes "ambient play" and "digital wayfaring" to describe how mobile
gameplay diffuses into everyday domestic, urban, and social life, known
here only through publisher description and third-party review abstracts.
Its stated frame — becoming "digital wayfarers, moving constantly among
digital, material, and social worlds" — concerns the spatial and
attentional diffusion of casual mobile play, which is adjacent to but not
demonstrably the same question as this note's concern with a world that
continues settling while unobserved. The note needs it, unread, to
determine whether it in fact bears on absence-settlement at all, or only
sounds as if it might.

**Kanoplay. "Persistent Browser-based Games (PBBG)."**
URL: https://articles.kanoplay.com/persistent-browser-based-games/
Status: read in full.
A practitioner-level definitional overview of the PBBG concept, stating
its core criterion plainly: a PBBG "store[s] the state of every object and
character on the server" so that logging back in returns the world
"exactly how it was when you logged out." It traces mainstream awareness
of the term to Zynga's FarmVille and Mafia Wars and identifies mafia and
farming themes as the dominant early PBBG genres. The note needs this
as its clearest concise statement of the definitional criterion that
separates a persistent browser game from an ordinary one — state that
survives the session regardless of what the player does with it.

**KRITIQAL. "6,303 days in quarantine" (essay on Urban Dead).**
URL: https://kritiqal.com/articles/urban-dead
Status: read in full.
A personal/critical essay on Urban Dead covering its action-point economy,
its designed lack of an endpoint, and its two decades of community-authored
lore. It states the game's philosophy of endlessness directly — "There is
no way for the game to end other than quitting… There is no end" — and
names its real threat in a line the note returns to repeatedly: "The
biggest threat in Malton isn't zombies, it's entropy." The note needs
this as its clearest verbal statement of a settlement process with no
externally reachable stopping point, offered as the literature's own
description of what the note calls an open front.

**Pecorella, Anthony. "Idle Games: The Mechanics and Monetization of
Self-Playing Games" (GDC 2015) and "Quest for Progress: The Math and
Design of Idle Games" (GDC Europe 2016).**
URL: https://www.gdcvault.com/play/1022065/Idle-Games-The-Mechanics-and
Status: reported at second hand.
Practitioner talks on the mechanics and monetization math of idle games,
known here only through secondary listings, since the talk video is
paywalled on GDC Vault and the companion slide deck is an unextractable
image-based PDF. Secondary sources indicate the talks cover core and
metagame loops, retention mechanics, and monetization viability, alongside
a published three-part companion article series on the math of idle-game
design. The note needs this, unread, as the foundational practitioner
treatment of idle-game numerical balancing that no scholarly source in
this set covers.

**Peper, Frederik, and Nico Wettmann. "Synchronising times: Waiting as a
relational mechanism in simulative browser games." *Convergence: The
International Journal of Research into New Media Technologies* (December
2025).**
URL: https://journals.sagepub.com/doi/10.1177/13548565251410486
Status: key passages verbatim; not read in full.
The single most directly on-topic recent scholarly source located for
this note, accessible only as a public abstract behind a SAGE paywall.
The abstract characterizes the genre by "persistent game worlds,
asynchronous interaction and limited control over the flow of time," and
argues that "waiting emerges not as a passive void but as a dynamic and
constructive process" through which players "synchronise their actions to
align the game's demands with their daily rhythms." The note needs the
full text badly: this is the only source in the set that treats waiting
itself, rather than the mechanics that produce it, as the object of
theoretical analysis.

**Preston. Review of *Kingdom of Loathing*. JayIsGames.**
URL: https://jayisgames.com/review/kingdom-of-loat.php
Status: read in full.
An early review and walkthrough of Kingdom of Loathing (Zack "Jick"
Johnson, 2003) describing its daily-turn allowance, its absurdist humor,
and its DHTML browser-persistence design. Its load-bearing content is the
turn-banking mechanic itself: "Each day you are given forty turns to play.
They do rollover from day to day, but you cannot exceed two hundred
turns" — a capped, banking daily economy distinct from Urban Dead's
continuous real-time tick. The note needs this as its clearest
documented instance of the banked-daily-allowance regime, contrasted
directly against the tick.

**Spiel, Katta, Sultan A. Alharthi, Andrew Jian-lan Cen, Jessica Hammer,
Lennart E. Nacke, P. O. Toups Dugas, and Theresa Jean Tanenbaum. "'It
Started as a Joke': On the Design of Idle Games." CHI PLAY '19 (ACM,
2019).**
URL: https://par.nsf.gov/servlets/purl/10174274
Status: read in full.
An interview study with six idle-game designers — Ian Bogost, Frank Lantz,
Jake Hollands, bloodrizer, Eric Fredricksen, and Lucas Mills — building a
designer-perspective definition of the genre. It supplies the field's
working definition, quoting the otherwise-inaccessible Alharthi et al.
(2018) taxonomy paper: idle games "require players to leave the game and
return to it at a later, unspecified point, where the game progresses on
its own during that time and opens up different options for further play
upon return." Its five organizing themes — Attending to the Absurd,
"Letting it run" as Form of Play, Paradigm Shifts as Narrative Beats,
Being Care-ful in Design, and Personal Play as Motivator — structure much
of how this note talks about the genre, including the finding that
designers such as Frank Lantz and Jake Hollands deliberately engineer
endings into an otherwise endless form as an ethical design choice. The
note needs this as its central scholarly anchor and its main channel of
access to the unread Alharthi et al. taxonomy.

**Vice. "Cookie Clicker Wasn't Meant to Be Fun. Why Is It So Popular 8
Years Later?" (2021), quoting creator Julien "Orteil" Thiennot.**
URL: https://www.vice.com/en/article/cookie-clicker-wasnt-meant-to-be-fun-why-is-it-so-popular-8-years-later/
Status: read in full.
A retrospective on Cookie Clicker (2013) covering its creation as a joke,
its creator's stated design philosophy, and its enduring use as ambient,
comfort play. Thiennot states plainly that the game "wasn't meant to be
fun" and drew instead on "the core psychological appeal" of visible
progress, while distinguishing acceptable repetition from exploitative
design: "It only becomes abusive when the repetition is devoid of
substance and sincerity," particularly when paired with microtransactions,
which Cookie Clicker deliberately avoids. It also traces the genre's
lineage back to Progress Quest (2002) as originator. The note needs this
for a designer's own ethical line between idle-game repetition and the
abusive version of the same mechanic, stated independently of Bogost's
framework.

**Wardle, Josh, interviewed by TechCrunch. "A conversation with Josh
Wardle, creator of viral hit Wordle" (January 12, 2022).**
URL: https://techcrunch.com/2022/01/12/josh-wardle-interview-wordle/
Status: read in full.
Wardle's own account of designing Wordle's single daily shared word,
framed explicitly as a rejection of standard growth and engagement
tactics. "It's something about the fact that it's one puzzle, and
everybody is solving it," he says of the shared-word design's unintended
viral effect, adding that "I think people have an appetite for things that
transparently don't want anything from you" and that he "deliberately did
what you're not meant to do if growth is your goal" — refusing push
notifications and monetization by name. The note needs this as its
clearest counter-design case: the identical daily-return, appointment-style
structure used against extraction rather than for it.

**Wikipedia. "Browser game."**
URL: https://en.wikipedia.org/wiki/Browser_game
Status: read in full.
A general encyclopedia history of browser games from 1995 origins through
the Flash era to the .io era. It is notably silent on persistent
browser-based games, tick-based design, and specific tick-based titles
such as Planetarion or Neopets — a silence that turns out to be
consistent with the broader search record for that sub-genre. The note
needs it less for content than as confirmation that the tick-based PBBG
era is under-documented even at the level of the general encyclopedic
record, not merely inaccessible to this sweep's search tools.

## Reading debts

Alharthi, Alsaedi, Toups Dugas, Tanenbaum, and Hammer's "Playing to Wait: A
Taxonomy of Idle Games" (CHI 2018) is the priority unread source for this
note. Every quotation of it in current circulation comes secondhand
through the CHI PLAY 2019 follow-up paper; the taxonomy's own
categorization axes and its full sixty-six-game corpus have never been
independently verified. ACM Digital Library, ResearchGate, and Semantic
Scholar were all tried and returned blocked or empty results.

Ian Bogost's own essay, "Cow Clicker: The Making of Obsession," has never
been read directly. The four-concern framework it supplies (Enframing,
Compulsion, Optionalism, Destroyed Time) is well triangulated across
multiple independent secondary sources that agree closely with one
another, but his paragraph-level argument has not itself been read.
Relatedly, the specific quote used elsewhere in this note's writing —
"it's asynchrony with the state, with the game itself" — is verified
against a transcript of the CHI PLAY interview, not against any Bogost
primary text, and its exact wording and context should be checked against
his own prose before it is leaned on further as evidence of anything.

Larissa Hjorth and Ingrid Richardson's *Ambient Play* (MIT Press, 2020)
remains unread beyond a publisher description and third-party review
abstracts; whether it engages the "world settles without observation"
question this note centers, or is purely about the spatial diffusion
of mobile play into daily life, is not yet known.

Anthony Pecorella's two GDC talks on idle-game mechanics and math have
not been read: the talk video is paywalled on GDC Vault and the companion
slide deck is an image-based PDF that could not be extracted as text.

Sara Grimes and Leslie Shade's 2005 scholarly paper on Neopets'
"immersive advertising" is paywalled and known only at the level of title
and abstract description.

Frederik Peper and Nico Wettmann's "Synchronising times" (*Convergence*,
December 2025) — the single most directly on-topic recent scholarly source
located for this note — is paywalled beyond its public abstract. It
should be the first item chased down once access is available.

Substantial journalism, postmortems, or scholarship on the tick-based
strategy PBBGs of 2000–2005 — Planetarion, OGame, Travian, and Utopia
specifically — could not be located beyond Wikipedia-level facts, despite
repeated targeted search. This reads as a genuine gap in the available
literature for that sub-genre, not a search failure, and primary-source
recovery (postmortems, operator interviews, archived tick engines) is
worth doing while it is still possible.
