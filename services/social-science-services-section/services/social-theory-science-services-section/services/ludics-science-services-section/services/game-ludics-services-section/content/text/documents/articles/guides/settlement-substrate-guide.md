---
title: "Guide: Settlement Substrate"
description: "A reading guide to the distributed-systems and networking literature that treats how shared game state actually settles, and to what it can and cannot support in the obsmetrological corpus."
date-created: 2026-08-22
---

For the underlying questions, source status, bridges, and reading debts, see [the related research note](../notes/2026/08/22/2026-08-22-note-on-settlement-substrate.md).

# A Guide to Settlement Substrate

## 1. The story of the field

Ask a distributed-systems engineer building a multiplayer game how everyone
ends up agreeing on what happened, and you get two incompatible answers,
arrived at independently by people solving the same problem in different
genres. This literature is the record of that split, plus a scattering of
hybrids and neighbors that try to have it both ways.

The first answer, developed for first-person shooters, is **predict now,
correct later**. Gabriel Gambetta's widely cited explainer series lays out
the shape of it plainly: the server is unconditionally authoritative, but a
client that waited for the server's word on every input would feel
unbearably laggy, so the client runs its own local copy of the simulation
the instant an input is sampled, using "similar logic" to the server's — in
Half-Life's case literally the same `pm_shared` code compiled into both
sides. Yahn Bernier's 2001 Valve paper, the primary source Gambetta's series
and the Source engine's own documentation both descend from, gives the
mechanism its full name: client-side prediction, entity interpolation, and
lag compensation. Every input carries a sequence number; the server
periodically reports the last one it processed along with authoritative
state at that point; and the client discards its own guessed history, snaps
to what the server said, and replays only the inputs the server hasn't
acknowledged. Bernier is candid this is not a gentle correction: "the
server's results will eventually correct the client's incorrect
simulation... this can cause a very perceptible shift in the player's
position." Other players' avatars get gentler treatment — entity
interpolation deliberately renders them about 100 milliseconds in the past,
blended between two real authoritative snapshots, trading currency for
smoothness rather than predicting at all.

The strangest piece of this family is lag compensation. To let a shooter
fairly hit a target they are aiming at where they *see* it — already a
stale position, because of network delay — the server, on receiving a fire
command, rewinds its own authoritative world backward to the exact instant
the shooter issued the command, adjudicates the shot against that
historical state, and then restores the present. Bernier calls this
plainly "a step back in time." This is not evidence accumulating toward a
settled answer; it is the server deliberately re-instantiating a state it
has already superseded to answer one local question, then discarding it
again. Bernier names the resulting artifact outright — "shot around a
corner," where a player who has already ducked behind cover can still be
killed, from the shooter's rewound point of view — and presents it as an
accepted cost of the design, not a bug awaiting a fix.

The second answer, developed for real-time strategy games, rejects the
whole predict-and-correct apparatus. Paul Bettner and Mark Terrano's
account of Age of Empires networking — "1500 Archers on a 28.8," still one
of the most cited game-networking talks ever given — describes **agree in
advance** instead: rather than replicating state, every peer runs the
*identical* simulation on the *identical* stream of player commands, with
commands issued on turn N executing everywhere on turn N+2. There is no
divergence to reconcile, because the causal history is shared by
construction; divergence, when it happens, is a checksum mismatch — a bug,
not a routine event with its own handling machinery. Achieving this took
real discipline: seeded random numbers and elimination of any locally
varying code path, down to frame-rate-dependent sound triggers. Bettner and
Terrano are frank about how hard-won this was: "there is one stubborn bug
that goes all the way to the wire — I think out-of-sync is going to be it."

Rollback netcode, documented in Tony Cannon's GGPO project, sits between
the two families. Like Age of Empires it depends on total determinism —
"with full determinism, the game is guaranteed to play out the same way on
all players computers if we simply feed them the same inputs" — but like
the shooter family it predicts unknown remote input rather than waiting a
fixed delay. When a real input later contradicts an earlier guess, GGPO
"rolls back the state of the game to the last correct state, then replays
all players' revised inputs back until the current frame," invisibly,
without rendering the intermediate frames — retraction in the fullest
sense, accepted as the price of near-zero perceived input latency.

Trailing State Synchronization, from Eric Cronin, Anthony Kurc, Burton
Filstrup and Sugih Jamin, is the literature's one architecture that is
*literally* a graded family of increasingly settled copies of the same
history. Their baseline, TimeWarp, keeps one execution state, snapshots it
before every event, and on a late-arriving event rolls back to the snapshot
and replays forward — a process that can cascade, since undoing
already-propagated effects requires "anti-messages" that can trigger
further rollbacks elsewhere. TSS instead keeps a small fixed set of *live,
continuously executing* copies of the same simulation at increasing
synchronization delays: the leading copy, rendered to the player, is least
settled and most exposed to reordering, while trailing copies have had
strictly more time to receive commands in order. Correction copies not from
a static snapshot but from "a second copy of the same game that is running
at a delay" — an already-more-settled, dynamically updated source — built
explicitly as an alternative to TimeWarp's retraction cascade.

A wholly different literature answers the settlement question with algebra
rather than engineering craft. Marc Shapiro, Nuno Preguiça, Carlos Baquero
and Marek Zawirski's Conflict-free Replicated Data Types paper proves,
rather than merely illustrates, that a certain class of replicated object is
a monotonic join-semilattice: the payload forms a partial order, merge
computes the least upper bound, and state only ever grows (Theorem 1). Any
object satisfying this achieves what the paper names Strong Eventual
Consistency — replicas that have delivered the same updates are not just
eventually equal but *equivalent*, which "avoids the complexity of conflict
resolution and roll-back." But the paper proves SEC and sequential
consistency strictly incomparable, using an add-wins set where concurrent
`add(e)` and `remove(e)` on different replicas merge to a state — both
present and absent — that "would never occur in a sequentially-consistent
execution." Add-wins, remove-wins, and reset-to-bottom are all equally
valid resolutions; the join is a chosen arbitration policy, not a
recovered ground truth.

Werner Vogels' "Eventually Consistent" is the informal ancestor of this
formalism, and its one concrete game-adjacent case is Amazon's shopping
cart, which under partition lets both sides keep accepting writes and
merges them once the partition heals — "the cart application assists the
storage system with merging the carts." Abel Dantas and Carlos Baquero's
BrickSync prototype is the literature's one direct attempt to apply CRDTs
to real-time game objects, and its value is in how it fails: rotating an
object with an operation-based CRDT broke immediately, because
"non-commutative operations... can lead to divergent outcomes if applied in
different order" — quaternion rotation does not commute. They fell back to
a state-based design tracking auxiliary ownership metadata and
last-writer-wins heuristics alongside the lattice, not derived from it.

The last strand concerns not *what* state settles to but *who gets to see
what*. Ashwin Bharambe, Jeffrey Pang and Srinivasan Seshan's Colyseus gives
every mutable object one authoritative primary and weakly consistent
replicas, fetched by nodes whose "area of interest" overlaps the object,
and reports staleness under 100 milliseconds for 93 percent of node pairs.
Graham Morgan and Fengyun Lu survey the two classical schemes it improves
on — region partitioning and MASSIVE's aura/focus/nimbus model, where
objects exchange messages only once their auras collide — and Boulanger's
thesis states the motive plainly: "interest management is the process of
determining which information is relevant to each player," because naive
full-broadcast sharing scales combinatorially.

Read end to end, the literature supports treating CRDT merge as a literal
join-semilattice climb, proved rather than gestured at, and
area-of-interest subscription as a literal, staleness-bounded local cover.
It does not support calling settlement monotone across the board: GGPO,
TimeWarp, and lag compensation all retract shown or computed state, so the
monotone-closure language survives only applied to the underlying
deterministic causal history — once all inputs are known — not to whatever
was displayed along the way.

## 2. The load-bearing concepts

**Monotonic join-semilattice with least-upper-bound merge.** This is not a
metaphor borrowed from the corpus's own vocabulary — Shapiro et al. prove it
as a literal theorem about a class of replicated objects. A payload sits in
a partial order; merging two states computes their least upper bound; and
no update or merge ever moves the state backward in that order. "Settling"
for a state-based CRDT is not an analogy for climbing toward agreement, it
*is* climbing toward agreement, formally.

**Strong Eventual Consistency, and its proven incomparability with
sequential consistency.** SEC promises more than plain eventual
consistency — replicas that have seen the same updates are not just
eventually equal but equivalent now — yet it is proven strictly
incomparable with sequential consistency. The add-wins set example carries
the concept's whole weight: two replicas each make a locally reasonable
update, and their honest merge is a state no sequential history could ever
produce. SEC does not recover a hidden ground truth; it commits to
whichever arbitration policy was chosen in advance and calls that policy
the merge.

**Determinism as a rival answer to reconciliation.** Deterministic lockstep
does not solve the divergence problem — it declines to have one. By
replicating inputs rather than state and requiring every peer to compute
identically, Bettner and Terrano's architecture makes divergence a
programming bug rather than a routine event. Nothing is ever glued back
together, because nothing is permitted to have separated in the first
place; the cost is total intolerance of nondeterminism anywhere in the
simulation.

**Retraction, and the two levels it forces you to distinguish.** Rollback
netcode and TimeWarp both take back state already shown or computed. Read
carelessly, this looks like a counterexample to monotone settlement
generally. Read carefully, it forces a distinction the sources gesture at
but never name: the underlying causal history, once every input is known,
never actually changes and could fairly be called monotone; what changes,
repeatedly and visibly, is the *presentation* of that history before all
the relevant inputs have arrived. Lag compensation is sharper still,
because what is reconstructed is not a global history but a single
observer's local, already-superseded view.

**Graded settledness as an engineered object, not just a theoretical
convenience.** Trailing State Synchronization is a shipped design, with a
least-settled copy that gets shown and progressively more-settled trailing
copies consulted for correction — demonstrating that holding several live
stages of one history at once is a workable engineering choice, not merely
a mathematical nicety.

**Area-of-interest filtering as a bounded local cover.** Colyseus's
single-primary, weakly-consistent-replica model, subscribed to by spatial
range predicates, is a genuine instance of local sections of a larger
shared object store — but the gluing is never exact. Colyseus reports
staleness under 100 milliseconds for 93 percent of node pairs, not all of
them, and the "conit" it borrows from TACT names that bound explicitly. Any
sheaf-like reading of this material has to carry the bound along with it.

## 3. How to read this literature

Start with **Gambetta's "Client-Server Game Architecture" overview** for
orientation — the four-part taxonomy (prediction, reconciliation,
interpolation, lag compensation) everything else in this family fills in.

Follow with **Gambetta's "Client-Side Prediction and Server
Reconciliation."** It is the accessible, worked-example version of the core
mechanism; extract the discard-and-replay correction model here, in a
gentler form, before meeting it in denser prose.

Then read **Bernier's GDC paper in full**, the primary source behind
Gambetta's series, with the prediction pseudocode and full
lag-compensation mechanism including "shot around a corner" — the single
most load-bearing document in this family.

Round out the family with **Gambetta's "Entity Interpolation,"** which
explains the deliberately different tradeoff applied to other players'
avatars: rendering the past for smoothness rather than predicting forward.

Cross to the opposite pole with **Bettner and Terrano's "1500 Archers on a
28.8."** Read it for the contrast: no correction machinery exists at all,
because divergence is built to be a bug rather than an expected event, and
notice what determinism costs to achieve.

**Cannon's GGPO documentation** comes next because it needs both families'
commitments at once — determinism from lockstep, prediction from the
shooter family. Read it for the precise mechanics of invisible
rewind-and-replay.

**Cronin, Kurc, Filstrup and Jamin on Trailing State Synchronization**
belongs right after GGPO: it is written against TimeWarp, the rollback
approach GGPO's cousin uses, and proposes several live, differently-settled
copies instead.

Move to the formal core with **Shapiro, Preguiça, Baquero and Zawirski's
CRDT paper.** Read Theorem 1 and the SEC definition carefully, and do not
skip the add-wins set example in §3.3 — the paper's own honest limit case
and the most important passage for anyone asking whether settlement is
truth-tracking.

Read **Vogels' "Eventually Consistent"** as the informal ancestor of that
formalism and the source of the one production example worth remembering:
Amazon's shopping cart, merged after a partition heals.

Then read **Dantas and Baquero's BrickSync paper**, which applies the CRDT
apparatus to an actual game object and breaks on rotation — read it for its
honesty about where the pure algebra stops working.

Turn to interest management with **Bharambe, Pang and Seshan's Colyseus
paper**, read for its architecture and reported staleness bound — the
concrete number behind "gluing holds only up to a bound." Follow with
**Morgan and Lu**, for the region and aura/focus/nimbus taxonomy Colyseus
improves on, and finish with **Boulanger's thesis** — *only its
introduction and background chapter have been read, so treat it as read in
substantial part* — for the plainest statement of why interest management
exists at all.

Last, be aware of **Shapiro, Preguiça, Baquero and Zawirski's companion
technical report, RR-7506.** It is listed among this note's sources
because its existence was confirmed by search and by the SSS 2011 paper's
own reference to it, but it has not actually been read — treat anything
said about it as reported at second hand.

## 4. Where this touches the corpus

The note's own state-of-knowledge record grades these connections
explicitly, and the grades should travel with any use of them.

The strongest connection is that **CRDT merge algebra has exactly the
corpus's shape** — a partial order with least-upper-bound merge, proven
monotone. That the external object has this shape is a theorem in the cited
source, not an interpretive stretch. That this shape means CRDT merge and
the corpus's settlement operator are *the same subject*, rather than two
things that merely look alike, is the note's own reading, held at that
weight and no further. The CRDT literature's own honest limit case — that
merge at a genuine conflict is a chosen arbitration policy, not a recovery
of one true answer — sharpens a real corpus question: whether settlement at
its `top` junctures is truth-tracking or merely policy-committed. Whether
that can be settled by re-checking against Belnap's own four-valued logic,
rather than the CRDT paper's citation of Belnap, is an open reading debt.

Rollback netcode, TimeWarp, and lag compensation together stand as
**established counterexamples** to monotone settling at the level of what
is actually shown or committed to a player. The resolution the note
proposes — a monotone underlying causal history once all inputs are known,
separate from a retractable, time-indexed presentation of partial progress
toward it — is held as a **rhyme**: something the sources support without
ever stating it in those terms. The corpus currently has no presentation
layer of its own, and this literature is the note's stated reason it
needs one.

Trailing State Synchronization is read as an **engineered existence
proof** of a graded family of settlement stages belonging to one history —
again a **rhyme**, not a claim the paper itself makes in this vocabulary;
Cronin et al. built TSS to solve a latency problem, not to illustrate a
closure-ordinal structure.

Deterministic lockstep's checksum-detected desync is read as **gluing
failure between independently computed local sections**, prevented by
construction rather than repaired after the fact — a further **rhyme**,
treated as the strict-finite-regime answer to settlement, with
determinism-discipline as its price.

Area-of-interest filtering is read as a **fiber-local cover**, again a
**rhyme**, to be carried always together with its staleness bound — the
gluing Colyseus reports is probabilistic, not exact, and nothing in the
source material licenses dropping that qualifier.

## 5. What we don't know yet

The literature swept for this note covers the join-semilattice paradigm
in depth and says almost nothing about its major rival: consensus protocols
in the Lamport/Paxos/Raft tradition, which settle shared state by electing a
single authoritative total order rather than by defining a merge. Without
that material the contrast this note wants to draw — join-driven against
vote-driven settlement — is only half built.

Whether any MUD-scale or persistent, tick-based world has ever actually
been built on CRDT state is an open question rather than a settled
negative; no such system turned up in the material gathered, which may mean
the area is genuinely thin — an opening for the section's own engineering
work rather than a gap in the reading.

EVE Online's Time Dilation is confirmed to exist and sits exactly on this
note's theme — a single persistent shard slowing its own server clock to
preserve settlement consistency under load — but no primary account of it
has been read yet.

The formal object this note is missing on the mathematics side is named
but not supplied: an arena with growing event support, no maximal
configuration, an operator morphism extending the arena mid-play, and a
presentation layer distinct from the monotone underlying history. This
note supplies the phenomena that motivate that object; building it is
not this note's work to do.

Finally, the identification that gives this note its sharpest edge —
that CRDT arbitration policy at a concurrent conflict and the corpus's
four-valued treatment of a "both" charge are the same kind of problem —
rests on an analogy not yet checked against Belnap's own primary papers.
Until that reading happens, the correspondence should be treated as
structurally suggestive, not confirmed identical.
