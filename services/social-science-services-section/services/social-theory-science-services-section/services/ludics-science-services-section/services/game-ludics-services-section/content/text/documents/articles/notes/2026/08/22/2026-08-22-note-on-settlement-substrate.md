---
title: "Note on Settlement Substrate"
description: "Research questions and sources on how shared game state actually reaches agreement — netcode families, CRDTs, interest management — treated as the empirical wing of the obsmetrological settlement mathematics."
date-created: 2026-08-22
---



## Scope

Treat the distributed-systems engineering of multiplayer games as a body of
evidence about settlement — how a shared world's state climbs toward
agreement, where the climb is monotone and where it retracts, and what
locality structure the climb actually has. This is the note that runs
closest to the obsmetrological mathematics, and the one where identifications
can be tested hardest, because both sides are formal.

## Motivating questions

1. Which real synchronization architectures are monotone (join-only) and
   which retract shown state — and what level-distinction reconciles the
   retracting ones with a monotone underlying history?
2. Is state-based CRDT merge the settlement operator's algebra, or merely
   shaped like it? What does the CRDT literature's own limit case (the
   arbitration-policy character of concurrent-conflict merges) say about
   settlement at `top` junctures?
3. Is area-of-interest filtering a fiber-local cover, and with what bound
   does its gluing actually hold?
4. What is per-observer local time (lag compensation's rewind) evidence of,
   formally?

## Objects of study

Client-side prediction and server reconciliation; entity interpolation; lag
compensation; rollback netcode (GGPO); deterministic lockstep and desync;
Trailing State Synchronization; TimeWarp; CRDTs and Strong Eventual
Consistency; eventual consistency and quorum systems; interest management
(regions, aura/focus/nimbus, conits); MMO single-shard architecture.

## State of knowledge (2026-08-22 sweep)

Two families, split on monotonicity, with three structures between them:

- **Predict-and-correct** (Gambetta, Bernier — read): authoritative server;
  client predicts locally, and on divergence discards predicted state, snaps
  to authoritative state, and replays unacknowledged inputs. Overwrite, not
  blend. Lag compensation has the server "step back in time" to adjudicate a
  shot against what the shooter saw, with the "shot around a corner" artifact
  acknowledged as undissolved.
- **Agree-in-advance** (Bettner and Terrano — read): deterministic lockstep
  replicates *inputs*, not state; every peer runs the identical simulation;
  divergence is detected by checksum and is a bug, not an event with
  reconciliation machinery.
- **Rollback** (GGPO documentation — read): determinism plus input
  prediction plus invisible rewind-and-replay on late contradicting input —
  explicit retraction of shown state as a deliberate design trade.
- **Trailing State Synchronization** (Cronin et al. — read): several live,
  continuously executing copies of one simulation at increasing
  synchronization delays; the leading copy is rendered and least settled;
  corrections copy from a more-settled *live* state. Built explicitly as an
  alternative to TimeWarp's retraction cascade.
- **CRDTs** (Shapiro et al. — read): state-based CRDTs are *required* to be
  monotonic join-semilattices with LUB merge; Strong Eventual Consistency is
  a theorem; SEC is proved incomparable to sequential consistency via the
  add-wins set; add-wins/remove-wins/reset-to-⊥ are all equally valid —
  merge at a concurrent conflict is a chosen arbitration policy. Vogels's
  shopping-cart partition-merge (read) is the production instance. The one
  direct games application (Dantas and Baquero — read) breaks honestly on
  non-commutative rotation and bolts arbitration metadata alongside the
  lattice.
- **Interest management** (Colyseus, Morgan and Lu, Boulanger — read):
  per-object single primary plus weakly consistent replicas under spatial
  range subscriptions; staleness empirically bounded (<100ms for 93% of node
  pairs), named as a "conit" — the gluing holds only up to a bound.

## Obsmetrological bridge

The most load-bearing gradings in the portfolio:

- CRDT merge algebra = the settlement operator's algebra: **theorem in the
  cited source** that the external object has exactly the corpus's shape
  (partial order, LUB merge, monotone); that they are *the same subject* is
  the corpus's reading. The arbitration-policy limit case sharpens a real
  corpus question — whether settlement at `top` junctures is truth-tracking
  or policy-committed — and the Belnap-side re-verification (the four values
  as derived from Scott approximation lattices) is an open reading debt.
- Rollback/TimeWarp/lag-compensation = **established counterexamples** to
  monotone settling at the presentation level; the two-level resolution
  (monotone underlying causal history vs. retractable committed-so-far
  presentation) is a **rhyme** the sources support but do not state. The
  corpus currently lacks a presentation layer; this note says it needs one.
- TSS = an engineered graded family of settlement stages of one history —
  **rhyme**, held as an existence proof.
- Lockstep desync = gluing failure between independently computed local
  sections, prevented by construction — **rhyme**; the strict-finite-regime
  answer, with determinism-discipline as its cost.
- Area-of-interest = fiber-local cover with staleness-bounded gluing —
  **rhyme**, to be carried always with its bound.

## Open problems

- The unclosed arena (filed formally in the obsmetrological note of
  2026-08-22): growing event support, no maximal configuration, an operator
  morphism extending the arena mid-play, and a presentation layer distinct
  from the monotone history. This note supplies the phenomena; the
  mathematics section owes the object.
- The strong-consistency rival: the sweep covered the join-semilattice
  paradigm and not consensus (Lamport, Paxos/Raft) — the other real answer
  to how shared state settles, needed for the contrast to be honest.
- EVE's Time Dilation: a single-shard world slowing its own clock server-side
  to preserve settlement consistency under load — confirmed to exist, exactly
  on-theme, unread.
- Whether any MUD-scale or tick-based persistent world has ever been built on
  CRDT state (the sweep found none — possibly a genuinely thin area, i.e. an
  opportunity for the section's own engineering wing).

## Reading debts

Shapiro et al.'s comprehensive CRDT technical report (RR-7506); Liu and
Theodoropoulos's interest-management survey; Cannon's original GDC rollback
material; Lamport's "Time, Clocks, and the Ordering of Events" and one
consensus-protocol primary source; CCP's Time Dilation devblog; Belnap 1977
re-read against the arbitration question.

## Annotated sources

Annotated sources on how multiplayer game state actually settles, from client-side prediction and rollback netcode through CRDT theory to area-of-interest filtering.


### Sources

**Bernier, Yahn W. (Valve Corporation). "Latency Compensating Methods in
Client/Server In-game Protocol Design and Optimization." GDC 2001.**
URL: http://web.cs.wpi.edu/~claypool/courses/4513-B03/papers/games/bernier.pdf
Status: read in full.
This is the primary industry account of client-side prediction, entity
interpolation, and lag compensation for Half-Life-engine games, and the
direct technical ancestor of both Gabriel Gambetta's later explainer series
and the Source engine's own networking documentation. It gives the
prediction algorithm's pseudocode, explains why client and server share the
same `pm_shared` movement code to keep predictions accurate, and defines lag
compensation as the server taking "a step back in time" to adjudicate a shot
against the world as the shooter saw it. It is candid that this produces an
undissolved artifact — "shot around a corner" — rather than closing the
inconsistency away, which makes it the note's clearest primary evidence
that predict-and-correct architectures accept, rather than eliminate,
retraction at the presentation level.

**Bettner, Paul, and Mark Terrano (Ensemble Studios). "1500 Archers on a
28.8: Network Programming in Age of Empires and Beyond." GDC 2001.**
URL: https://zoo.cs.yale.edu/classes/cs538/readings/papers/terrano_1500arch.pdf
Status: read in full.
The canonical account of deterministic lockstep for real-time strategy
games: every peer executes an identical simulation on an identical, delayed
stream of player commands, so there is no state to reconcile and no
correction machinery of any kind. Divergence is detected by checksum and
treated purely as a bug — "the one stubborn bug that goes all the way to the
wire." The paper documents exactly what determinism costs to achieve
(seeded random numbers, elimination of any frame-rate-dependent code path),
which is the note's primary evidence for lockstep as a genuinely
different settlement regime from every other architecture in this
bibliography: nothing here is ever glued back together, because nothing is
permitted to separate.

**Bharambe, Ashwin, Jeffrey Pang, and Srinivasan Seshan. "Colyseus: A
Distributed Architecture for Online Multiplayer Games." NSDI 2006.**
URL: https://www.comp.nus.edu.sg/~bleong/hydra/related/bharambe06colyseus.pdf
Status: read in full.
Describes a distributed game-object architecture built directly on
area-of-interest filtering: every mutable object has exactly one
authoritative primary and a set of weakly consistent read replicas,
fetched by nodes whose subscribed spatial range query overlaps the object,
and validated by modifying Quake II. The paper reports rather than merely
asserts its consistency bound — staleness under 100 milliseconds for 93
percent of node pairs — and imports TACT's "conit" to name that bound
explicitly. It supplies the note's concrete evidence that area-of-interest
subscription behaves like a local cover, and just as importantly, its
concrete evidence that the gluing this produces is probabilistic and bounded
rather than exact.

**Boulanger, Jean-Sébastien. "Interest Management for Massively Multiplayer
Games." M.Sc. thesis, McGill University.**
URL: https://www.cs.mcgill.ca/~jboula2/thesis.pdf
Status: read in substantial part (introduction and background chapter only).
Gives the plainest available framing of interest management as the core
scalability technique for massively multiplayer games — "the process of
determining which information is relevant to each player" — motivated by
the fact that naive full-broadcast state sharing scales combinatorially with
player count. It also notes that real perception is often occlusion-aware,
which pure-proximity aura and region schemes miss. The thesis's later
chapters compare eight interest-management algorithms against real
player-movement traces, but that comparison has not been read for this
note; only the framing material has been used.

**Cannon, Tony. GGPO rollback netcode developer documentation (pond3r/ggpo
README).**
URL: https://raw.githubusercontent.com/pond3r/ggpo/master/doc/README.md
Status: read in full.
GGPO's own explanation of rollback netcode: full determinism, plus
prediction of unknown remote input, plus invisible rewind-and-replay when a
late input contradicts an earlier guess. The documentation is explicit that
this is retraction in the fullest sense — the game "rolls back the state of
the game to the last correct state, then replays all players' revised
inputs back until the current frame" without rendering the intervening
frames. It supplies the note's cleanest account of an architecture that
combines the two rival families' commitments (determinism from lockstep,
prediction from the client/server family) and pays for it with deliberate,
routine retraction of shown state. Note that only the current README
documentation has been read, not Cannon's original GDC talk material on
GGPO's design.

**Cronin, Eric, Anthony R. Kurc, Burton Filstrup, and Sugih Jamin. "An
Efficient Synchronization Mechanism for Mirrored Game Architectures"
(Trailing State Synchronization). Multimedia Tools and Applications, 2004
(extended version of NetGames 2001).**
URL: https://www.comp.nus.edu.sg/~bleong/hydra/related/cronin03efficient.pdf
Status: read in full.
Introduces Trailing State Synchronization: instead of one execution state
corrected by snapshot-and-rollback (the paper's own detailed account of
TimeWarp, including the cascading "anti-messages" needed to cancel
already-propagated effects), TSS keeps a small fixed set of live,
continuously executing copies of the same simulation running at increasing
synchronization delays, and corrects the least-settled leading copy from an
already-more-settled trailing copy's current state. It is the note's
single clearest instance of an engineered, working system that holds
several simultaneously live stages of settledness of one history, built
explicitly as an alternative to TimeWarp's retraction cascade.

**Dantas, Abel, and Carlos Baquero. "CRDT-Based Game State Synchronization
in Peer-to-Peer VR." PaPoC 2025.**
URL: https://arxiv.org/pdf/2503.17826
Status: read in full.
A direct, honest application of CRDTs to real-time game object state via
"BrickSync," a Unity/WebRTC peer-to-peer VR prototype. Its operation-based
design broke on object rotation, because non-commutative operations "can
lead to divergent outcomes if applied in different order," forcing a switch
to a state-based design that resolves conflicts through auxiliary
ownership metadata and last-writer-wins heuristics rather than a pure
lattice join. The paper also names "Global Rules" — un-authored physics and
spawn events — as a category the actor-centric CRDT model does not natively
cover. It is the note's primary evidence for where the pure CRDT algebra
stops working in practice and arbitration has to be bolted on beside it.

**Gambetta, Gabriel. "Client-Server Game Architecture."**
URL: https://www.gabrielgambetta.com/client-server-game-architecture.html
Status: read in full.
An orientation piece laying out the naive authoritative-server model and the
four techniques — prediction, reconciliation, interpolation, lag
compensation — that the rest of the series and Bernier's paper implement in
detail. Its load-bearing content is the taxonomy itself and the framing
claim that the game state is managed by the server alone, both of which the
note uses as the entry point into the predict-and-correct family.

**Gambetta, Gabriel. "Client-Side Prediction and Server Reconciliation"
(Fast-Paced Multiplayer series).**
URL: https://www.gabrielgambetta.com/client-side-prediction-server-reconciliation.html
Status: read in full.
The accessible, worked-example account of the core predict-and-correct
mechanism: sequence-numbered client inputs, a server acknowledgment of the
last processed command, and a client correction that discards predicted
state, snaps to the server's authoritative state, and replays only
unacknowledged inputs. Its worked numeric example (predicted position
corrected backward, then replayed forward to the same result) is the
note's clearest illustration of overwrite-and-replay as distinct from
blending.

**Gambetta, Gabriel. "Fast-Paced Multiplayer (Part III): Entity
Interpolation."**
URL: https://www.gabrielgambetta.com/entity-interpolation.html
Status: read in full.
Explains why other players' avatars are rendered roughly 100 milliseconds in
the past, interpolated between the last two authoritative server snapshots,
rather than predicted forward the way the local player's own avatar is. It
supplies the note's account of a second, deliberately different
tradeoff — currency traded for smoothness — living inside the same overall
architecture as client-side prediction.

**Morgan, Graham, and Fengyun Lu. "Predictive Interest Management: An
Approach to Managing Message Dissemination for Distributed Virtual
Environments." Newcastle University.**
URL: fetched via search result PDF; Newcastle University CS technical paper (exact venue/year not separately verified)
Status: read in full.
Surveys the two classical interest-management schemes — region-based
partitioning (SPLINE/DIVE) and the aura/focus/nimbus model (MASSIVE), where
objects exchange messages only once their auras collide — and proposes a
predicted-area-of-influence refinement so that objects moving at very
different speeds still exchange messages in time. Its load-bearing content
for the note is the aura/focus/nimbus taxonomy itself, which gives a
second, independent vocabulary for the same local-cover structure Colyseus
implements architecturally.

**Shapiro, Marc, Nuno Preguiça, Carlos Baquero, and Marek Zawirski. "A
Comprehensive Study of Convergent and Commutative Replicated Data Types."
Inria Research Report RR-7506, 2011.**
URL: https://inria.hal.science/inria-00555588/en/
Status: reported at second hand.
The extended technical-report companion to the authors' SSS 2011 paper,
promising a wider catalogue of concrete CRDT constructions than the
conference paper has room for. Its existence, authorship, and general
framing were confirmed through search and through the SSS 2011 paper's own
reference to it, but the document itself has not been fetched or read for
this note. Nothing in this bibliography or the accompanying guide should
be taken to describe its content firsthand; it is carried as a known,
wanted, unread source.

**Shapiro, Marc, Nuno Preguiça, Carlos Baquero, and Marek Zawirski.
"Conflict-free Replicated Data Types." SSS 2011.**
URL: https://gsd.di.uminho.pt/members/cbm/members/cbm/ps/sss2011.pdf
Status: read in full.
The formal core of the CRDT literature: state-based (CvRDT) objects are
required to form a monotonic join-semilattice under a partial order, with
merge computing the least upper bound, proved commutative, associative,
idempotent, and monotone (Theorem 1); op-based (CmRDT) objects are proved
equivalent under a commutativity requirement on concurrent operations. Both
are proved to guarantee Strong Eventual Consistency, which the paper proves
strictly incomparable with sequential consistency using an add-wins Set
CRDT, where a concurrent add and remove of the same element merge to a state
no sequential execution could produce. This is the single most load-bearing
source in the note: it gives the settlement-operator identification a
literal theorem to point to, and its own honest limit case — that the merge
at a genuine conflict is a chosen arbitration policy, not a recovered
ground truth — is the sharpest open question the note carries forward.

**Vogels, Werner. "Eventually Consistent." Communications of the ACM 52(1),
January 2009.**
URL: https://cs.brown.edu/courses/cs227/archives/2012/papers/weaker/p40-vogels.pdf
Status: read in full.
The informal, industry-facing precursor to the CRDT/SEC formalism, defining
the consistency spectrum through an "inconsistency window" and the N/W/R
quorum framework, and refining eventual consistency into causal,
read-your-writes, session, and monotonic-read/write variants understood as
properties of a single client's view. Its one game-relevant example is
Amazon's shopping cart, a write-always system that, under partition, lets
both sides keep accepting writes and merges the carts once the partition
heals — a real production instance of independently evolved local sections
being glued back together, doing in practice what Shapiro et al.'s
least-upper-bound merge does formally.

## Reading debts

Several sources this note wants have not yet been read, and one document
already entered above (Shapiro et al.'s RR-7506) is only known at second
hand rather than actually opened. The remaining debts, drawn from the source
material's own gap notes and from the critic's report, are:

Liu and Theodoropoulos's "Interest Management for Distributed Virtual
Environments: A Survey" (ACM Computing Surveys, 2014) — the canonical
taxonomy paper for this subfield, paywalled and not accessed; Morgan & Lu
and Boulanger were used as freely available substitutes covering related
ground, but the survey's own classification scheme remains unverified.

Tony Cannon's original GDC talk or slide deck on GGPO's design, distinct
from the project's current README documentation, which is authoritative but
is written documentation rather than the original conference presentation.

Leslie Lamport's "Time, Clocks, and the Ordering of Events in a Distributed
System" (CACM, 1978), together with one primary source on Paxos- or
Raft-style consensus. The sweep behind this note covered the
join-semilattice paradigm for settlement in depth and has essentially no
coverage of its major rival — a single authoritative total order reached by
voting or leader election — which is needed before any contrast between the
two paradigms can be drawn honestly.

CCP Games' documentation of EVE Online's Time Dilation mechanism (the
original "Introducing Time Dilation" devblog, and related material such as
the EVE University wiki entry and CCP/Hadean's "EVE: Aether Wars"
demonstration). A single persistent shard slowing its own server clock to
preserve settlement consistency under load is confirmed to exist and sits
exactly on this note's theme, but no primary account of it has been read.

Nuel Belnap's own primary papers, "A Useful Four-Valued Logic" and "How a
Computer Should Think" (both 1977). The note's identification of CRDT
arbitration policy with the corpus's four-valued treatment of a "both"
charge currently rests on the CRDT paper's own citation of Belnap's
four-valued logic (itself derived from Dana Scott's approximation lattices)
rather than on a direct reading of Belnap's formulation — the critic's
report flags this analogy as unverified, and it should not be treated as
confirmed until Belnap is read directly.

Donnybrook (Bharambe et al., on peer-to-peer high-speed games), which
surfaced during search as adjacent MMO-scaling literature but was not
fetched or read, and so is not represented anywhere in this note's
findings beyond this note.

Game-specific applications of eventual consistency or CRDTs to persistent,
tick-based, MUD-scale worlds. None turned up in the search behind this
note; this may be a genuinely thin area of the literature rather than a
search failure, but that has not been confirmed.

For the published CRDT reference, see [Shapiro et al. (2011)](../../../../bibliographies/shapiro-et-al2011.md).
