---
title: "FOAM: A Field of Actor Models, and Why the Phase Depends on Who's Watching"
description: "Defines FOAM (Field of Actor Models): a four-valued order-parameter field over autonomous message-driven actors (ActivityPub actors, EVM accounts, Capability Cells, ludic designs) that separates into foam-like cells and walls; states the permanent/exchangeable/pinned wall chemistry against real vitrimer thioether/disulfide chemistry; states phase as a function of the chosen observer set (operational, organizational, ludic); and names MetroFOAM as Red Cup Engineering's AP+EVM implementation of FOAM. Every claim carries its formula and a worked numeric example."
date-created: 2026-07-26
kind: research-note
in-service-of: lib/emsenn/services/561-group/services/science-services-section
tags:
  - foam-physics
  - field-theory
  - actor-model
  - activitypub
  - evm
  - vitrimers
  - plateau-equilibrium
  - coarsening
  - obstruction
  - metro-enterprise
status: design
declared-by: claude-interactive-session-supplying-lenticule-science
---

# FOAM: A Field of Actor Models, and Why the Phase Depends on Who's Watching

## Editorial standard for this note

1. **State the object, not the discovery.** When two domains share a structure, name the shared
   structure and use it immediately. Write "X is an instance of Y." Do not narrate noticing the
   resemblance, and do not mark the moment as surprising, coincidental, or independently
   arrived at.

2. **Every term carries a formula or a procedure.** Define a term once, at first use, with the
   equation, the mechanism, or the check that makes it operational. After that point, use the
   term exactly as defined — do not restate or re-explain it in new words.

3. **Every mechanism gets a worked example, immediately.** A definition or a formula is followed
   in the same section by at least one concrete case run to a specific number or a specific
   result. A mechanism with no worked example is incomplete, not merely abstract.

4. **Label illustrative data as illustrative, in the sentence that introduces it.** A worked
   example built for this note to demonstrate a mechanism is marked as constructed, once, at
   first use. It is never phrased so it could be mistaken for a citation of external or private
   evidence.

5. **Every section closes with what would prove it wrong.** A claim that cannot fail is not a
   claim. State the specific measurement, count, or comparison that would falsify it.

6. **Write for a technical reviewer, not a reader to be won over.** A sentence states a
   definition, a mechanism, a formula, a derived consequence, or a result. It does not comment
   on how interesting, elegant, or surprising the adjacent sentence is, and it contains no
   rhetorical question.

7. **Hold density constant under revision.** A pass for tone, length, or standalone clarity
   preserves every formula, every table, and every worked number already in the text. Cuts
   remove framing; they do not remove content.

Before adding a sentence, run it against all seven. If it fails one, fix the sentence, not the
rubric.

---

## 0. Scope and terms

This note defines FOAM, an expansion of Field of Actor Models. FOAM identifies three
previously separate accounts as one structure: a corpus of definitions distinguished by the
tokens that name them, a set of Girard designs interacting over a game tree, and the bound
pair of an ActivityPub actor and an Ethereum smart contract that constitutes a Capability
Cell. These are stated here as one object, by identity, not inferred from resemblance.

A **field** is a value assigned at every point of a space: a temperature reading over a plate,
a magnetic orientation over a block of iron. A **foam** is the structure a field takes once it
has separated into regions of agreement (bulk) divided by regions of disagreement (walls). A
field precedes a foam. The coarsening law, the wall chemistry, and the survival of a given
claim are properties of what a field of message-passing actors does once it separates, and
sections 3 and 4 derive that separation from the field definition given in section 2.

**Actor** names Carl Hewitt's 1973 model of concurrent computation: an entity with no shared
memory, holding private state, that communicates only by message and can spawn further actors.
An ActivityPub actor, an Ethereum smart contract account, and a Girard ludic design are each
an actor in this exact sense. Section 1 states the identification for each of the three cases
and works out its consequences.

Every actor commits values at addresses. At a given address, the actors watching it produce
exactly four possible outcomes: none of them have said anything; all who have spoken agree on
one value; all agree on the opposite value; or at least one has asserted a value another
denies. These four outcomes are Belnap's logic FOUR (§2) and the four phases a two-phase foam
requires: void, one bulk phase, the other bulk phase, and an interface. Section 2 states this
correspondence as a field definition; sections 3 and 4 state it as a foam.

**Phased foam** (§7) is the claim that a fixed field over a fixed population of actors does not
have one cell-and-wall structure. It has one structure per choice of which actors are treated
as observers. Watching a Capability Cell through its live service endpoints produces one wall
structure (operational); watching it through its office and duty registers produces a second
(organizational); watching it through the strategies its actors are presently playing produces
a third (ludic). Section 11.3 states the test for whether these three structures are one graph
under three labels or three distinct structures sharing a substrate.

Method: a term is used only where the underlying mathematical object is stated, not inferred
from resemblance to the phenomenon it names. Every claim below carries its formula and at
least one worked numeric example, and section 11 states the measurement that would falsify
each one.

---

## 1. Actors: entities that hold their own state and communicate only by message

### 1.1 The 1973 definition

In 1973, Carl Hewitt, Peter Bishop, and Richard Steiger defined a model of computation built
around a single primitive, the actor. An actor is a computational entity that, in response to
a message it receives, can do exactly three things: send messages to other actors it knows
about, create new actors, and determine how it will respond to its next message. There is no
shared memory in the model. Two actors cannot read each other's internal state; the only
channel between them is a message, sent by one and eventually processed by the other. An
actor's internal state between one message and the next is not observable by any other actor,
and changes only in response to a message it accepts.

The model has no shared memory by construction, so two actors cannot race to write the same
memory cell, there is no lock to release, and no actor has access to a notion of "the current
global state of the system." Concurrency is the default condition the model specifies, not a
hazard added on top of a sequential base.

### 1.2 Three specifications of this definition in current use

The actor model is not an analogy for how a federated, on-chain system works; it is a literal
specification, verifiable component by component. Three of its instances are load-bearing
infrastructure in technology deployed at scale today.

**An ActivityPub actor.** The ActivityPub protocol defines an actor as an entity — a person, a
group, an application, a service — with an inbox and an outbox. Messages arrive in the inbox;
the actor determines, by rules internal to it, what to do with them, and publishes its own
activities to its outbox. No other actor can reach into a given actor's internal processing to
force a particular response; the protocol specifies only how messages are delivered and how
activities are represented, not what an actor does upon receipt. This is Hewitt's actor,
specified in the vocabulary of a federated social-web protocol.

**An EVM account.** An Ethereum smart contract is code paired with a private storage slot set,
addressed by a fixed account address, that executes only when a transaction is sent to it, that
can send messages (transactions, or internal calls) to other contract accounts, and that can
deploy new contracts — spawn new actors — during execution. Two contracts cannot read each
other's storage directly; the only channel between them is a call, processed atomically to
completion before control returns. This is Hewitt's actor, specified in the vocabulary of a
virtual machine built to make computation on a shared ledger deterministic and resistant to a
hostile network.

**A Girard design.** In game semantics, a design is one player's strategy in an interaction: a
partial specification of moves committing to what this player will do at each point in a play,
without inspecting the opposing design's internal structure. Two designs interact only through
the moves they make; a design cannot query its counter-design's unplayed branches. This is
Hewitt's actor, specified in the vocabulary of proof theory: private state is the unplayed
branches, invisible to the opponent; message passing is the exchange of moves; and, in the
richer higher-order settings, a design's continuation can spawn sub-designs that handle further
interaction.

Federated social computing, blockchain execution, and proof theory each specify this identical
primitive. The identification is licensed by that shared specification, not by resemblance. A
**Capability Cell** — this note's name for the composite — is the entity formed by binding one
actor of the ActivityPub kind to one actor of the EVM kind under a single identity, so that
neither can be swapped out without the whole cell losing its identity. A Capability Cell is a
composite actor: an actor built by wiring two simpler actors together at a shared address, the
way a compound sentence is built by wiring two simpler sentences together at a shared
conjunction. Section 9 states what "wiring together" means and why both faces, not either
alone, are required.

Concurrent game semantics — the branch of the same field giving denotational meaning to
concurrent, not merely sequential, programs — models a process as a set of event structures:
partially ordered sets of events carrying an explicit conflict relation for mutual exclusion
between alternatives, exchanging moves under Hewitt's no-shared-memory discipline. The
mathematical object used to describe concurrent computation and the mathematical object used
to describe a strategy in a game are one object.

### 1.3 Incarnation and ballast: an actor's unvisited state has no observable effect

A design commits values across the entire address tree it has access to. In any interaction
with one specific counter-design, only some of those loci are visited — reached by a move the
counter-design actually makes. The rest is committed but never touched. This note names it the
design's **ballast**, using the foam-physics term directly: a wet foam's liquid content, which
never participates in the load-bearing film network, is present, real, and dynamically
irrelevant to the foam's surface structure. The restriction of a design to only its visited
loci is its **incarnation**: the material part, stripped of everything no counter-design ever
reaches.

Two designs with the same incarnation — the same visited loci, committed the same way — are
indistinguishable to every counter-design that could interact with either of them, however
different their unvisited ballast is. This is Diderot's 1773 paradox of the actor, restated as
a theorem: the great performer's interior is unwitnessed and has no effect on the audience,
because the audience has no channel to it; two performers with the same surface are
indistinguishable however different their private interiors. The theorem licenses working
entirely in the incarnation, ballast-stripped, for the rest of this note: the field of §2 is
defined over commitments, and commitments never visited by any actor in a chosen $\mathcal D$
do not affect the computed field, regardless of what they were.

### 1.4 What an actor commits, and where

Every actor of the three kinds does the same thing: at some address — a locus, defined
precisely below — it commits a value. An ActivityPub actor commits an activity to its outbox
at the address given by that activity's identifier. An EVM contract commits a value to a
storage slot at the address given by that slot's key. A Girard design commits a move at the
address given by its position in the game tree. In every case, the commitment has the same
form: this actor, at this address, asserts this.

Fix a rooted tree whose nodes are addresses. A filesystem path, a nested JSON key, a smart
contract's storage layout, and a game tree's move sequence are each literally a tree of
addresses, and nothing below depends on which one is meant. Call a node in this tree a
**locus**. An actor's commitments are a partial assignment of a value to some subset of loci —
the ones it has said something about — leaving every other locus unaddressed. This tree of
addresses, and a population of actors each committing values at some subset of them, is the
substrate the rest of this note builds on.

---

## 2. The field: four values, and two different orders on them

### 2.1 Four values, not two

The value a locus carries, once more than one actor may have an opinion about it, answers two
independent questions at once: has anyone committed a positive assertion at this locus, and
has anyone committed a negative one. Both no gives silence. Positive only gives an ordinary
true claim. Negative only gives an ordinary false claim. Both gives a locus where one actor has
asserted something and another has asserted its negation, at the same address, with neither
commitment withdrawn.

Write the four values as $\{\bot, t, f, \top\}$: $\bot$ for silence, $t$ for an uncontested
positive, $f$ for an uncontested negative, $\top$ for the contested case where both have been
said and neither retracted. This is Nuel Belnap's logic FOUR (1977), specified for a database
fed contradictory reports by multiple unreliable informants — a federation of independent
actors is the same situation, formalized for protocol-scale software rather than human
witnesses.

These four values carry two orderings, and the two do not agree with each other.

### 2.2 Two orders on the same four values

The **knowledge order**, $\le_k$, ranks the four values by how much has been asserted,
independent of whether the assertions agree:

$$\bot \;\le_k\; t, f \;\le_k\; \top$$

Silence is the least-informed state. A single committed assertion, on either side, is more
informed than silence. The contested state, where both sides have committed, is the most
informed: more has been asserted about that locus than about a locus where only one side has
spoken. This order is monotone: an actor's assertion at a locus is a historical fact, and no
later event lowers the locus's knowledge-rank. A locus moves from $\bot$ to $t$ when someone
speaks, or from $t$ to $\top$ when someone else contradicts them; it does not move back.

The **truth order**, $\le_t$, ranks the same four values by which disposition the locus
currently supports, with $f$ as bottom and $t$ as top, and the two uncommitted-or-contested
values $\bot$ and $\top$ between them:

$$f \;\le_t\; \bot, \top \;\le_t\; t$$

This order does not track how much has been asserted; it tracks which way the locus currently
leans. A locus under this order can be revised: brought from an uncertain reading toward a
confirmed one, or the reverse. This is the order a piece of mutable state — a variable, a
ledger balance, a contract's storage slot — is under. It rises when new evidence supports the
positive reading, falls when new evidence supports the negative reading, and is not required
to move in one direction only.

### 2.3 The order-swap, worked with a sequence

An operation $\sigma$ maps each of the four values to one of the four values, converting every
true statement about the knowledge order into a true statement about the truth order, term by
term:

$$\sigma(\bot) = \bot, \qquad \sigma(\top) = \top, \qquad \sigma(t) = t, \qquad \sigma(f) = f$$

$\sigma$ fixes every individual value; what it changes is which order the same four values are
read under. Worked example: two actors, $A$ and $B$, watch one locus and commit in sequence —
first nobody speaks ($\bot$), then $A$ commits positively ($t$), then $B$ commits negatively
without $A$ retracting ($\top$).

Under the knowledge order, this sequence is $\bot \le_k t \le_k \top$: monotonically
increasing, stating that more has been asserted about this locus at each step. Under the truth
order, the same sequence is $\bot \le_t \top$: a legitimate move in that order, since both are
between $f$ and $t$, but stating that the locus is becoming more contested, not more true or
more false. $\sigma$ states that these are the same four points read under two different
orders: a theorem about $\le_k$ translates to a theorem about $\le_t$ term for term, because
$\bot$ and $\top$ occupy corresponding extremal-in-tension positions under both orders while
$t$ and $f$ swap their roles between "which side spoke" and "which side is currently
supported."

### 2.3b The full join and meet tables

$\S$2.4 uses the knowledge-order join, $\vee_k$, on two values at a time. Stated in full, for
all declared requiredteen ordered pairs of $\{\bot, t, f, \top\}$:

| $\vee_k$ | $\bot$ | $t$ | $f$ | $\top$ |
|---|---|---|---|---|
| $\bot$ | $\bot$ | $t$ | $f$ | $\top$ |
| $t$ | $t$ | $t$ | $\top$ | $\top$ |
| $f$ | $f$ | $\top$ | $f$ | $\top$ |
| $\top$ | $\top$ | $\top$ | $\top$ | $\top$ |

Reading the $t$-row against the $f$-column: $t \vee_k f = \top$, the single fact §2.4's join
rule depends on. $\bot$ is the identity of $\vee_k$: every entry in the $\bot$-row and
$\bot$-column returns the other operand unchanged, stating that silence contributes no
information when combined with anything. $\top$ is absorbing: every entry in the $\top$-row
and $\top$-column is $\top$, stating that once a locus is contested, no further commitment from
any additional actor un-contests it — a fourth actor agreeing with either side does not resolve
a dispute the join has already recorded as $\top$.

The knowledge-order meet, $\wedge_k$, is the corresponding lower bound:

| $\wedge_k$ | $\bot$ | $t$ | $f$ | $\top$ |
|---|---|---|---|---|
| $\bot$ | $\bot$ | $\bot$ | $\bot$ | $\bot$ |
| $t$ | $\bot$ | $t$ | $\bot$ | $t$ |
| $f$ | $\bot$ | $\bot$ | $f$ | $f$ |
| $\top$ | $\bot$ | $t$ | $f$ | $\top$ |

Here $\bot$ is absorbing and $\top$ is the identity, the mirror of the join table. $\wedge_k$
computes the common ground of two actors' commitments: $t \wedge_k \top = t$ states that where
one actor commits $t$ and another is in the contested state, what they can be certain they
agree on is $t$ itself.

The truth-order join and meet, $\vee_t$ and $\wedge_t$, follow by applying $\sigma$ (§2.3) to
every entry above, since $\sigma$ fixes each value while swapping which order is being read;
concretely, $\vee_t$ replaces $\bot$'s role as knowledge-identity with $t$ and $f$ swapping
into the extremal-under-tension positions that $\bot$ and $\top$ occupy under $\vee_k$:

| $\vee_t$ | $f$ | $\bot$ | $\top$ | $t$ |
|---|---|---|---|---|
| $f$ | $f$ | $\bot$ | $\top$ | $t$ |
| $\bot$ | $\bot$ | $\bot$ | $\top$ | $t$ |
| $\top$ | $\top$ | $\top$ | $\top$ | $t$ |
| $t$ | $t$ | $t$ | $t$ | $t$ |

$f$ is the identity of $\vee_t$ and $t$ is absorbing, matching $\le_t$'s stated order
($f \le_t \bot, \top \le_t t$): a locus already at $t$ stays at $t$ under further combination,
the truth-order counterpart of $\top$'s absorption under $\vee_k$.

### 2.4 The field definition

A field is a value assigned at every point of a space. Fix a set of actors $\mathcal D$ — which
actors are treated as observers, the parameter section 6 onward makes central — and define, for
every locus $\xi$ in the address tree:

$$\Phi_{\mathcal D}(\xi) \;=\; \bigvee\nolimits_k \{\, \mathfrak a(\xi) : \mathfrak a \in
\mathcal D \,\}$$

Take every actor in $\mathcal D$ that has committed a value at $\xi$ and combine their
commitments by the knowledge-order join: the operation returning $\bot$ if none spoke, the
single value if exactly one side spoke, $\top$ if both sides spoke. This join requires two
facts about the four values: $t$ joined with $f$ under the knowledge order gives $\top$, and
$\bot$ joined with anything returns that thing unchanged. $\Phi_{\mathcal D}$ is a function
from every address in the tree to one of four values, computed by watching a chosen population
of actors — a field in the ordinary physics sense, structurally identical to a temperature
field over a metal plate, with the "temperature" a four-valued commitment status and the
"plate" a tree of addresses continually written to by independent, message-driven actors.

---

## 3. From field to foam: phase separation

### 3.1 Phase separation, as a general process

A field with local variation separates into large regions taking roughly one value, divided by
thin boundaries where the value changes rapidly. This is phase separation, a process studied
in condensed-matter physics independent of foams. Oil and vinegar shaken together separate into
droplets of one phase suspended in the other, with sharp interfaces, the droplets growing over
time by absorbing smaller neighbors. A ferromagnet cooled below its critical temperature
organizes its microscopic magnetic moments into domains — regions of uniform orientation
separated by domain walls where the orientation flips. Neither example involves soap; both are
stated here to fix that "a field condensing into regions plus walls" is general, and a soap
foam is one instance of it.

A two- or three-dimensional foam is the case where the condensed structure is space-filling:
every point of the space is inside a cell or on a wall, because the cells partition the whole
space between them. An oil droplet in vinegar leaves most of the container as vinegar; a foam
has no phase left over once the cells have packed in. An address tree with actors committing
values across it is this kind of totally-committed space: every locus exists in the tree
whether or not any actor addresses it, and "nobody has said anything" ($\bot$) is one of the
foam's four phases — the **void** — not a gap in the structure.

### 3.2 The four regions, worked with a concrete population

Fix three actors: the ActivityPub actor $P$, the EVM contract $Q$, and a monitoring service $R$
that reads what both publish. All three can commit values at a shared set of loci stating
claims about one Capability Cell's status.

At locus $\xi_1$ ("the cell's manifest is valid"), $P$ commits $t$ and neither $Q$ nor $R$ says
anything. The join, by the rule of §2.4, is $t$: an uncontested positive, interior to the
**Proponent bulk** — the phase where every actor with an opinion agrees on the positive
reading.

At locus $\xi_2$ ("the cell's EVM face is bound"), $Q$ commits $t$ and $P$ also commits $t$
(its own manifest references the same binding): again $t$, again interior bulk, this time from
two actors agreeing rather than one speaking alone. The field does not distinguish "one
witness" from "several witnesses in agreement"; both are $t$.

At locus $\xi_3$ ("the cell is safe to invoke"), $P$ commits $t$ (its manifest says yes) while
$R$, having audited the EVM face, commits $f$ (the audit failed). The join is $\top$: an
**interface**, the state in which at least two actors watching the same address have committed
opposite values with neither retracted.

At locus $\xi_4$ — an address none of $P$, $Q$, or $R$ has addressed — the join is $\bot$: the
**void**, outside the foam's cell/wall structure, an address no actor has spoken about.

Four loci produce four outcomes, exhausting the four values, because the join operation has
only four possible outputs. **Proponent bulk** ($t$): the interior of a cell where the positive
reading holds without contest. **Opponent bulk** ($f$): the interior of a cell where the
negative reading holds without contest, present whenever a population of actors agrees on a
negative claim (an audit failing, a manifest missing a required face, a strategy refusing a
move). **Interface** ($\top$): a wall, where two actors watching the same address disagree and
neither has yielded. **Void** ($\bot$): outside the foam, an address no actor has addressed.

### 3.3 The interface carries the structure

The equilibrium condition, the coarsening law, and the material's response to stress (§4) are
statements about walls, not bulk. A bulk phase is stable by definition: every actor inside
agrees, so nothing changes there until the wall around it moves. A wall is where two
disagreeing commitments are held in active tension, and the wall's own geometry — how many
other walls it meets, at what angle, how fast it moves — determines whether the cell it bounds
grows, shrinks, or holds steady. A locus reading $t$ states that nothing is contested there; a
locus reading $\top$ states where the live disputes are.

### 3.4 Field precedes foam: the separation mechanism, stated

The standard equation for how a scalar field $\phi(x, t)$ — a continuous quantity varying over
space and time, not yet four-valued — separates into two phases is the Cahn-Hilliard equation:

$$\frac{\partial \phi}{\partial t} = M \nabla^2 \left( \frac{\partial f}{\partial \phi} -
\kappa \nabla^2 \phi \right)$$

$f(\phi)$ is a double-well energy: two low-energy troughs, one per phase, separated by a
high-energy hill, so a point between the two phases is energetically unfavorable and does not
remain there. $M$ is a mobility term, setting how fast material moves to relieve that
unfavorable position. The $\kappa \nabla^2 \phi$ term penalizes sharp gradients, giving
interfaces a finite width and a finite cost. An initially near-uniform field with small random
fluctuations, evolved under this equation, separates unprompted into regions near each energy
trough, connected by walls of width and cost set by $\kappa$. This is **spinodal
decomposition**: the mechanism by which a field with only local information about itself
becomes a foam with global cell-and-wall structure, with no external sorting process required.

Applied to §2's knowledge/truth pair: a locus's charge does not evolve in a continuum, but the
qualitative structure transfers directly. $t$ and $f$ are the two low-energy troughs
(uncontested agreement, cheap to sustain); $\top$ is the unfavorable, high-cost intermediate a
locus leaves as soon as enough actors have weighed in to break a tie. A locus at $\top$ remains
there exactly as long as the actors watching it keep it genuinely contested. Changing which
actors are watched — changing $\mathcal D$ — changes which loci currently read as walls and
which read as settled bulk, because what counts as a well and what counts as a hill in this
energy landscape is a fact about which actors' commitments are summed into it. This states, as
a consequence of the same double-well mechanism producing any phase separation, that phase is
a readout relative to the observer set, not a fixed property of the substrate.

Worked example: take a toy double-well $f(\phi) = (\phi^2-1)^2$, with minima at $\phi = -1$
and $\phi = +1$ and a local maximum at $\phi = 0$ where $f(0) = 1$. A locus computed at
$\phi = 0$ sits at the top of the hill — the $\top$-analogue — and the gradient
$\partial f/\partial \phi = 4\phi^3 - 4\phi$ is zero there only because $\phi=0$ is an unstable
equilibrium: any actor tipping the local average to $\phi = 0.1$ gives
$\partial f/\partial \phi = 4(0.001) - 0.4 \approx -0.396$, a restoring push toward the $\phi=-1$
well, not back to $\phi=0$. Removing one actor from $\mathcal D$ that was holding the local
average near $\phi=0$ is exactly this perturbation: the locus does not return to contested: it
falls into whichever well the remaining actors' commitments are already closer to.

---

## 4. Foam mechanics: equilibrium, coarsening, and the six-neighbor rule

### 4.1 Plateau's laws, as force balance

Joseph Plateau observed, and Jean Taylor proved (1976), that any area-minimizing arrangement
of soap films obeys two rules: films meet exactly three at a time along a line, at $120°$, and
those lines meet exactly four at a time at a point, at the tetrahedral angle of $109.47°$.
These angles are the unique configuration at which each film's pulling tension is balanced by
its neighbors — the same reason three ropes of equal tension pulling on a single ring settle at
$120°$, since any other configuration leaves a net force still moving the ring.

This transfers to the field of §2 without appeal to soap. A wall in this foam is a locus at
$\top$, where a disagreement is actively held. A disagreement carries a maintenance cost:
defending a contested claim requires ongoing attention from at least two actors, where an
uncontested claim requires none. A system of walls under that cost pressure settles into the
configuration minimizing total wall length subject to preserving every underlying distinction —
Plateau's problem, with the cost of maintaining a disagreement in place of surface tension.
Whether this reaches the same three-fold, $120°$ local geometry is an empirical question about
this specific substrate, stated as a test in §11.1; what transfers directly is the general
shape of the claim, that equilibrium under a cost function forces a specific, rigid local
coordination rather than an arbitrary one.

**Derivation of the $120°$ angle.** At a point where three films of equal surface tension
$\gamma$ meet along a line, force balance requires the three tension vectors, each of
magnitude $\gamma$ pulling outward along its own film, to sum to zero: $\vec F_1 + \vec F_2 +
\vec F_3 = 0$. Fix $\vec F_1$ along angle $0°$. Writing $\vec F_2$ at angle $\theta$ and
$\vec F_3$ at angle $-\theta$ (symmetric about $\vec F_1$ by the equal-tension assumption), the
$x$-components must sum to zero: $\gamma + 2\gamma\cos(180° - \theta) = 0$, giving
$\cos(180° - \theta) = -\tfrac12$, so $180° - \theta = 120°$ and $\theta = 60°$ measured from
the axis opposite $\vec F_1$ — equivalently, each pair of the three films is separated by
exactly $120°$. Worked check: at $\theta = 60°$, $\vec F_2 = \gamma(\cos 120°, \sin 120°) =
\gamma(-0.5, 0.866)$ and $\vec F_3 = \gamma(-0.5, -0.866)$; summed with $\vec F_1 = \gamma(1,0)$,
the total is $\gamma(1 - 0.5 - 0.5,\ 0 + 0.866 - 0.866) = (0,0)$ exactly. Any other angle leaves
a nonzero residual force, which is why $120°$ is not a convention but the unique zero of this
vector equation for three equal tensions.

### 4.2 Von Neumann's law, worked with two cells

John von Neumann derived, in 1952, that a cell's growth rate in a two-dimensional dry foam
depends on exactly one quantity: its number of neighboring cells, equivalently its number of
walls.

$$\frac{dA_n}{dt} = \kappa (n - 6)$$

$A_n$ is a cell's area, $n$ its number of sides, $\kappa$ a positive material constant. Not the
cell's size, shape, or the identity of its neighbors. Only $n$.

Worked example: cell $A$ has four neighbors, $n=4$, so $dA/dt = \kappa(4-6) = -2\kappa$: it
shrinks, regardless of its starting size or shape. Cell $B$ has nine neighbors, $n=9$, so
$dA/dt = \kappa(9-6) = +3\kappa$: it grows, regardless of any other property. A cell with
exactly six neighbors sits at $dA/dt = 0$: stationary, for as long as it holds exactly six
neighbors. Six is not a fitted parameter; it follows from Plateau's law (three walls per
vertex) combined with Euler's formula ($V-E+F=2$), which together force the average number of
sides across a large two-dimensional foam to equal six. A cell below the average loses
territory to its neighbors; a cell above it gains.

Applied to the field of §2, with a cell read as a maximal bulk region and its sides as the
number of adjacent bulk regions it shares a wall with: a claim's growth rate is set by its
neighbor count, not by the strength of its support. Cell $A$ above may be the most rigorously
evidenced claim in the system and still shrinks, because the formula has a term for neighbor
count and no term for evidentiary quality. A weakly supported claim with nine neighboring
claims grows, because it shares the cost of holding its boundary with more neighbors, which is
a structural fact independent of rigor.

### 4.3 What the coarsening claim states, and what it does not

Coarsening is a claim about loss of a specific, checkable kind. It does not claim loss of
information overall: as low-neighbor cells vanish, their territory transfers to their
remaining neighbors, who each gain a side (having absorbed territory that used to touch the
now-vanished third party), and total area is conserved throughout. A coarsening foam is
consolidating — trading many small cells for fewer, larger ones — losing only the count of
distinct boundaries. Coarsening reduces total wall length monotonically, since wall length is
the quantity under cost pressure, so a system left alone loses its low-neighbor cells and does
not regain them without external input, for the same reason a hot object left alone cools and
does not spontaneously reheat: the reverse process moves against the cost gradient that defines
the forward process.

### 4.4 Isostaticity: equilibrium as balanced constraint

Plateau's laws fix the local geometry at a foam vertex. At a dry-foam vertex in three
dimensions, four Plateau borders meet at a point with three translational degrees of freedom.
Each incident border pulls with fixed-magnitude tension along its own direction, and force
balance requires the four tensions to sum to zero: three independent scalar equations, one per
spatial direction. Three freedoms, three constraints: an exact match, which is what
"equilibrium" states at a point where nothing is free to drift and nothing is over-determined.

James Clerk Maxwell's 1864 rule for stiff frameworks names the general case of this count.
For a pin-jointed framework of $N$ joints and $E$ bars in $d$ dimensions, each joint carries
$d$ translational freedoms before any bar is attached, so the raw freedom count is $dN$; fixing
$C$ of those freedoms externally (supports) and adding $E$ bars, each removing one relative
freedom, gives Maxwell's count:

$$m \;=\; dN - C - E$$

where $m$ is the number of floppy modes if positive, and $|m|$ is the number of redundant
(self-stressing) constraints if negative. A structure with more freedoms than constraints
($m>0$) is **floppy**: it has at least one direction it deforms in at zero cost. A structure
with more constraints than freedoms ($m<0$) is **over-constrained**: it carries internal
stress with no external load, and its hallmark is brittleness — it cannot absorb a new demand
without cracking, having no slack to absorb it with. The balance point, $m=0$, is
**isostatic**: no floppy mode, no redundant internal stress.

Worked example: a single triangle of three joints and three bars in the plane ($d=2$, $N=3$,
$E=3$), pinned at one joint so it cannot translate or rotate as a rigid body ($C=3$):
$m = 2(3) - 3 - 3 = 0$. The triangle is isostatic — rigid, with no internal slack and no
redundant bar. Remove one bar ($E=2$): $m = 2(3)-3-2 = 1$, one floppy mode, and the triangle
folds like a hinge. Add a diagonal bar to an already-rigid square of four joints ($N=4$, and a
square alone has $E=4$ bars forming a floppy quadrilateral, $C=3$): before the diagonal,
$m = 2(4)-3-4 = 1$ (the well-known floppiness of an unbraced square); after adding one diagonal,
$E=5$, $m = 2(4)-3-5=0$: isostatic, the standard reason a single diagonal brace rigidifies a
square frame.

Plateau's vertex (§4.1) is counted differently from a Maxwell truss but reaches the same
isostatic conclusion: the vertex has $d=3$ translational freedoms, and the force-balance
closure condition $\sum \vec F_i = 0$ supplies exactly $3$ scalar constraints — one per spatial
component — regardless of how many border vectors ($4$, here) enter the sum, since it is the
dimension of the equation's target space, not the number of terms summed, that fixes the
constraint count. Three freedoms against three constraints is isostatic by the same
freedoms-equal-constraints criterion as the truss examples above, even though the mechanism
supplying the constraints (a vector closure condition) differs from a truss's mechanism (fixed
bar lengths).

The same count applies elsewhere. Two independently authored definitions of one concept, each
internally consistent, are a redundant constraint on one boundary: the isostatic count states
this produces not a visible contradiction but stress — work touching both definitions fails for
reasons no single inspection explains, because neither definition alone is wrong and the
failure is a property of the pair. A structure with a floppy mode has the complementary
problem: a distinction that could be silently absorbed by its neighbor with no effect on
anything checked. The two departures from isostatic are opposite pathologies: a structure
exhibiting one is, by this count, not exhibiting the other, and correcting one (adding a
constraint) can produce the other (a redundant stress) unless the count is recomputed after
the correction.

### 4.5 Two ways a foam's topology changes

Coarsening (§4.2) shrinks and grows existing cells continuously. The topology — which cells
border which — changes by exactly two discontinuous events.

A **T1 event** is a neighbor switch: a short wall between two cells shrinks to zero length and
reopens running the other way, so two cells that shared a border stop sharing one and two that
did not now do. No cell disappears; adjacency changes. In a population of actors, this is a
newcomer's admission redistributing the standing relationships among actors already present —
adding one participant changes which existing participants are found to agree with each other,
with no participant's own position changing. This is Jacques Rancière's **dissensus**: a
newcomer's admission redistributing what counts as agreed, distinguished from **consensus**, in
which the newcomer was already counted and the standing structure does not move. A
redistributing newcomer performs a T1 event: no cell vanishes, adjacency changes.

A **T2 event** is a cell disappearance: a cell shrinks to zero area and vanishes, its neighbors
closing over the gap. This is the terminal case von Neumann's law predicts for a persistently
low-neighbor cell (§4.2), made discontinuous. In a population of actors, the corresponding act
is one participant ending an interaction outright — asserting and denying simultaneously at the
point of exit, terminating the exchange. Ludics names this the **daimon**. Playing it does not
increase rigidity or contest, because there is no further interaction: it removes a cell from
play entirely, with no neighbor-switch, which distinguishes a T2 event from a T1.

A foam has exactly these two elementary topological events, and dissensus and the daimon each
state one of them: one is a soap-film classification, one is a logician's move for terminating
an exchange, one is a political theorist's account of who gets counted. Section 11 states the
test for whether a structure this general always decomposes into exactly these two event types
with no third category required.

Worked example: cells $X$, $Y$, $Z$, $W$ with $X$–$Y$ and $Z$–$W$ each sharing a wall, and $X$–$Z$
not. A T1 event shrinks the $X$–$Y$ wall to zero and reopens it as an $X$–$Z$ wall: $X$ and $Y$
stop sharing a border, $X$ and $Z$ start, and all four cells still exist afterward — $n(X)$ is
unchanged in count but one neighbor is swapped for another. A T2 event instead shrinks $Y$
itself to zero area: $Y$ vanishes, $X$ and whichever cells bordered $Y$ now border each other
directly, and the foam has one fewer cell. The count that changes is different in each case —
neighbor identity in a T1, total cell count in a T2 — which is the operational test for
telling them apart in a real wall graph.

---

## 5. Wall chemistry: what makes a wall permanent, exchangeable, or pinned

### 5.1 Von Neumann's law alone does not determine a foam's lifetime

Section 4 describes a foam that ages continuously, consolidating without limit. Real foams
differ in lifetime by orders of magnitude — dish soap foam collapses in minutes, some
engineered foams are active for months — and the difference is a property of wall chemistry,
not geometry. Solid particles adsorbed onto a foam's interfaces jam there, mechanically
resisting the shape change coarsening requires, and stop the aging process regardless of what
von Neumann's law predicts. This is Pickering stabilization (S. U. Pickering, 1907), a
mechanical effect — a physical blockage — rather than a chemical bond holding the wall in
place.

A foam's walls have exactly three possible chemistries. A siloxane-zeolite vitrimer's sulfur
crosslink chemistry, developed for a thermally rewritable memory material, instantiates all
three.

### 5.2 Thioether: the permanent wall

A thiol reacting across a carbon-carbon double bond (thiol-ene addition) forms a
carbon-sulfur-carbon **thioether** linkage. Under the operating conditions this material is
designed for, this bond has no exchange chemistry: it is not hydrolyzed, metathesized, or
homolyzed at any accessible temperature. Once formed, a thioether bond is a fact about the
network that accumulates and is never retracted — the specific, experimentally grounded reason
thiol-ene chemistry is chosen for a network's permanent crosslink population.

Against the field of §2, a thioether bond is the wall chemistry of the **knowledge order**. An
actor's commitment to an outbox entry, once published, is not retracted under ActivityPub's own
rules: the outbox is append-only. A ledger's transaction log does not un-happen once a block is
finalized. Both are thioether walls: bonds formed once, under specific conditions, with no
route to break given by the system's own operating envelope. This is the **compliant
permanent** wall: permanent at the level of the individual bond, while the network as a whole
remains flexible, in the same way a rope's permanence at each individual fiber does not
prevent the rope from bending.

### 5.3 Disulfide: the exchangeable wall

Oxidizing a residual thiol one further step gives a **disulfide** bond,
carbon-sulfur-sulfur-carbon, which rearranges by thiol-disulfide exchange. A free thiolate — a
third sulfur, belonging to neither bonded sulfur — attacks one side of an existing disulfide,
displacing the other as a new thiolate. The transition state carries partial bonds to all three
sulfurs at once, so the new bond forms before the old one finishes breaking. The attacking
thiolate is not consumed: it leaves as a free thiolate, available to catalyze the next
exchange.

This mechanism, **associative exchange**, is the chemical instance of a rule any auditable,
tamper-evident system enforces by some mechanism: a rewrite requires an external witness, and
connectivity is never dropped, even momentarily, during the rewrite. A disulfide bond cannot be
remade by its own two sulfurs alone; remaking it requires a third party, present and free, not
one of the two parties whose bond is revised, and that third party is not consumed by
witnessing the exchange. Against the field of §2, this is the wall chemistry of the **truth
order**: a locus's current disposition is revisable, but only by a process requiring an
independent party to attest to the revision, and the revision never passes through a state
where the locus has no disposition — connectivity is preserved throughout, as an EVM state
transition function replaces one committed state with another atomically, never leaving the
ledger in an undefined intermediate condition.

The alternative mechanism, **thermal homolysis** — the sulfur-sulfur bond breaking under heat
with no third party present — is the **dissociative** route: bond count drops before it rises
again, the network loses connectivity for a real interval, and the change occurs by force
rather than by witness. A wall rewritten this way passes through a state with no committed
disposition; any actor consulting it during that interval receives an answer the system cannot
stand behind.

**The rate law, worked.** Thiol-disulfide exchange is second order, first order in the
attacking thiolate and first order in the disulfide:

$$\text{rate} = k[\mathrm{RS}^-][\mathrm{RSSR}]$$

with $k \approx 10\ \mathrm{M^{-1}s^{-1}}$ a representative rate constant for an unactivated
aliphatic disulfide near neutral pH. At a free-thiolate concentration
$[\mathrm{RS}^-] = 10^{-4}\ \mathrm{M}$ and a disulfide concentration
$[\mathrm{RSSR}] = 10^{-2}\ \mathrm{M}$, the rate is
$10 \times 10^{-4} \times 10^{-2} = 10^{-5}\ \mathrm{M\,s^{-1}}$: roughly one exchange event per
disulfide every $\sim 3$ minutes at this concentration. Halving the thiolate reserve to
$5\times10^{-5}\ \mathrm{M}$ halves the rate to $5\times10^{-6}\ \mathrm{M\,s^{-1}}$ with no
change to $k$ or to $[\mathrm{RSSR}]$ — the numeric form of §5.5's claim that exhausting the
free-thiolate reserve slows and eventually stops the associative route without any wall
"breaking": the rate law's own first-order dependence on $[\mathrm{RS}^-]$ drives the rate to
zero as the reserve is driven to zero, continuously, with no separate failure event required.

### 5.4 Pinning: the wall immobilized by a jammed particle

The third wall type is mechanical, not chemical, matching Pickering's original mechanism. A
solid particle — literally a small grain in emulsion chemistry; a piece of durably and
witnessed evidence, such as a signed attestation or a committed audit record, in
an actor-model system — sitting at an interface and resisting the geometric rearrangement that
would move the wall makes the wall **pinned**: immobilized not because its bond is chemically
unbreakable, but because a particle jammed in the interface blocks the rearrangement. A pinned
wall does not participate in coarsening even though nothing in its chemistry forbids
coarsening.

This states the wall trichotomy in full, each entry earned by a stated mechanism:

| wall type | mechanism | permanence | reversibility | actor-model instance |
|---|---|---|---|---|
| compliant permanent | thiol-ene addition (thioether) | never removed | none, by the operating envelope | an ActivityPub outbox entry; an append-only log line |
| exchangeable | thiol-disulfide exchange (disulfide) | may be broken and reformed | yes, associatively, with a third-party witness | an EVM state transition; a revised ledger balance |
| pinned | Pickering stabilization (jammed particle) | never removed | no, mechanically rather than chemically | a signed attestation; an independently re-derived audit finding |

### 5.5 The cost of undoing a wall: a graded reversal ladder

The trichotomy above states reversibility as a binary property of a wall type. The underlying
sulfur chemistry supplies a graded price for reversal instead.

A sulfur atom occupies a ladder of oxidation states, each rung carrying a different, measured
reversal cost. The free thiol reverses nothing, having nothing yet to reverse: the floor, free
by definition. The disulfide, one oxidation step up, reverses by thiol-disulfide exchange
(§5.3) at the cost of one free thiolate, not consumed and available afterward: a reversal free
of permanent expenditure, a temporary loan of a witness. The sulfenic acid, one step further,
is labile: it resolves toward thiol or toward further oxidation with no strong preference,
still cheap but not reliably reversible in either direction on its own. The sulfinic acid
requires a dedicated enzyme and ATP hydrolysis to reverse: a quantized, metabolically priced
cost, requiring a specialist distinct from the residue's own two atoms, strictly more expensive
than the disulfide's third-party thiolate. The sulfonic acid, at the top of the ladder, has no
reversal route: once reached, nothing recovers it, at any cost.

Stated as a general claim: the position of a wall on its own oxidation-like ladder is the price
of undoing the distinction it holds. The compliant/exchangeable/pinned trichotomy of §5.4
names two rungs of this continuum, not the only two; a free rung sits below the exchangeable
one, and a terminal rung sits above the pinned one. A wall priced above a plain disulfide
exchange but below a quantized, specialist-priced sulfinic reversal is a real intermediate
rung, not a modeling gap.

This ladder states a failure mode invisible to the trichotomy alone. A structure fails not only
when too many walls become pinned (coarsening arrested, a foam gone glassy) but when its
supply of the free, bottom-rung resource every exchange consumes as a witness is itself
consumed by the same oxidizing pressure driving walls up the ladder. The count of bonded versus
unbonded walls at any instant does not reveal this: a structure can sit below any rigidity
threshold and still have exhausted the reserve future exchanges require, at which point the
associative route (§5.3) closes — not because a specific wall broke, but because no third
party remains to lend to the next exchange. The only route left open is the dissociative one,
available to any pressure that supplies enough heat — the exact failure mode the associative
mechanism exists to close off. A reserve of free, uncommitted capacity is therefore a second
quantity to track in a structure built this way, alongside, never instead of, the wall count
itself.

### 5.6 The floor and ceiling on the exchangeable fraction

A network built entirely of permanent, thioether-style bonds has no route to revise anything: a
system with no revision route cannot correct an error once made. A network built entirely of
exchangeable, disulfide-style bonds cannot hold a shape against sustained load: every path
through it relaxes on the exchange timescale, and nothing the network commits to stays
committed beyond that timescale. The usable regime sits strictly between these extremes. The
correct target for the exchangeable fraction is a floor, not a maximum: enough exchangeable
bonds that the permanent structure can be locally reorganized when needed, and no more, since
every additional exchangeable bond is one more path along which the whole structure creeps
under sustained pressure with no change intended. Reconfigurability past this floor is a
liability to be minimized, not a virtue to be maximized.

### 5.7 Reductases: the enzymatic route back down the ladder

Section 5.5's ladder states the direction it usually gets pushed: oxidizing pressure driving a
wall from free thiol toward disulfide and beyond. A ladder with a reliable "up" and no reliable
"down" is a one-way ratchet toward exhaustion. The standing enzymatic system reversing specific
rungs supplies the "down."

**Thioredoxin and glutaredoxin** are the general-purpose reducing systems: small proteins with
a reactive cysteine pair, donating electrons to reduce a substrate's disulfide back to two free
thiols, themselves re-reduced by a dedicated reductase enzyme running on NADPH. This is the
routine reversal for the disulfide rung: cheap, fast, continuously available while NADPH
supply holds, and it is what keeps the disulfide rung exchangeable as a standing condition
rather than only in principle. A network with no reductase system retains the chemical
capacity for thiol-disulfide exchange (§5.3), driven by a stray free thiolate, but has no
dedicated, resupplied source of reducing power running as standing policy. **Sulfiredoxin**
(§5.5) sits one rung higher and is a different kind of enzyme: not a bulk system running on a
shared electron currency, but a specialist, ATP-dependent enzyme with a narrow substrate range,
reversing one specific over-oxidized state at one metered cost per event.

This states two distinct kinds of repair capacity, not one undifferentiated fact. A standing,
cheap, continuously resupplied reversal service (thioredoxin-like) keeps the ordinary
exchangeable population exchangeable as routine. A rare, metered, specialist-dependent reversal
(sulfiredoxin-like) recovers a wall drifted further up the ladder than routine maintenance
reaches, available in principle but not running continuously in the background. A structure
with only the general reducing system, allowing damage to accumulate past what that system
reaches, has no route back from over-oxidation — not because no such route could exist, but
because standing up the specialist is a distinct, separately provisioned capability that the
presence of the routine system does not supply.

### 5.8 Chain reactions: initiation, propagation, chain transfer, branching

The wall chemistry above is stated one bond at a time. The formation reaction itself, radical
thiol-ene addition, is a chain reaction, with a structure that determines whether a disturbance
stays contained or cascades.

A chain reaction has three phases. **Initiation** creates the first reactive species — a thiyl
radical, from light or heat acting on initiator molecules — from an otherwise unreactive
population. **Propagation** is the self-sustaining cycle: a thiyl radical adds across a vinyl
group, generating a carbon radical, which abstracts hydrogen from a fresh thiol, regenerating a
thiyl radical, consuming one thiol-ene pair per cycle at no further initiation cost. This is
the step performing almost all bond-forming work, continuing while fresh thiol and ene groups
remain locally available. **Termination** ends a chain when two radicals combine into a stable,
non-radical product.

Two further behaviors determine whether a disturbance stays local or cascades. **Chain
transfer**: an oxygen molecule intercepting a thiyl radical diverts the chain rather than
terminating it — the resulting peroxy radical abstracts hydrogen from another fresh thiol,
regenerating thiyl and continuing propagation, at the cost of one thiol from the reservoir per
interruption absorbed. This is a chain reaction absorbing a disturbance and continuing, while
the reservoir it draws on is not exhausted. Once that reservoir is empty, the identical
interruption event becomes terminal, with no change to any rate constant: the cycle's return
edge no longer exists (§5.5's reserve-depletion warning, restated kinetically).

**Branching**: a single reactive event producing more than one new reactive species, so the
population of active chains grows multiplicatively. Ordinary thiol-ene propagation is
non-branching by construction — one thiyl radical in, one out, every cycle — which is why the
reaction self-limits to the available thiol and ene supply. A branching chain reaction —
certain combustion chemistries, where one radical event liberates two or more new radicals —
does not self-limit the same way: the reactive population compounds until fuel runs out or a
competing termination pathway removes radicals faster than branching creates them.

Against the wall-and-foam picture: some disturbances to a network of walls stay local (a
single T1 or T2 event, §4.5, absorbed by a chain-transfer-style response), and some cascade (a
branching-style event, where resolving one contested locus creates two or more newly contested
ones). Both are chain reactions in the same formal sense. What differs is one structural fact
about the propagation step — whether it conserves or multiplies the count of potential fronts —
and that fact, not the magnitude of the triggering event, determines whether a disturbance
stays contained.

---

## 6. The clock and the census: two independent variables

### 6.1 Rate and population size are different questions

Temperature governs the rate of thiol-disulfide exchange: how quickly, once in an exchangeable
bond, that bond swaps partners. The redox potential of the surrounding medium governs a
different quantity, the equilibrium position between free thiol and disulfide — how much of
the total sulfur is in the exchangeable disulfide form at all, versus unbonded as free thiol.
Temperature is the clock. Redox potential is the census.

These are measurably orthogonal, and the pattern recurs in living cells: the cytosol is held
at a reducing potential, and its proteins accordingly hold free thiols rather than structural
disulfides; the endoplasmic reticulum is held oxidizing, and proteins destined for export
acquire disulfides specifically there, at the compartment boundary. Redox potential is a
property of location, not of rate, and crossing a compartment boundary changes the census of
bonded versus free sulfur without changing the rate at which any individual exchange proceeds.

**The census, computed.** The thiol/disulfide equilibrium is set by the Nernst equation for the
couple $2\,\mathrm{RSH} \rightleftharpoons \mathrm{RSSR} + 2\mathrm{H^+} + 2e^-$:

$$E_h = E^{\circ\prime} - \frac{RT}{nF}\ln\frac{[\mathrm{RSH}]^2}{[\mathrm{RSSR}]}$$

with $n=2$ electrons transferred, $E^{\circ\prime}$ the couple's standard potential (roughly
$-250\ \mathrm{mV}$ for a typical cytosolic dithiol), $R$ the gas constant, $T$ temperature, and
$F$ the Faraday constant, so $RT/nF \approx 12.9\ \mathrm{mV}$ at $37\,^\circ\mathrm{C}$.
Worked example: at $[\mathrm{RSH}] = 10^{-3}\ \mathrm{M}$ and
$[\mathrm{RSSR}] = 10^{-5}\ \mathrm{M}$ (a strongly reducing, mostly-free-thiol census),
$\ln([\mathrm{RSH}]^2/[\mathrm{RSSR}]) = \ln(10^{-6}/10^{-5}) = \ln(0.1) \approx -2.30$, giving
$E_h \approx -250 - 12.9(-2.30) \approx -220\ \mathrm{mV}$: within the cytosolic range. Holding
concentrations fixed and raising $T$ from $310\ \mathrm{K}$ (37°C) to $320\ \mathrm{K}$ changes
$RT/nF$ to about $13.3\ \mathrm{mV}$, shifting $E_h$ by under $2\ \mathrm{mV}$ — a negligible
move compared to shifting the disulfide concentration itself by an order of magnitude, which is
the numeric statement that $E_h$ is governed overwhelmingly by the concentration ratio (the
census) and only weakly by temperature (the clock) at physiological temperature ranges.

### 6.2 The Deborah number

The rate side of this pair has a standard name in rheology. A control parameter built as the
ratio of a material's relaxation time to the observation time is the **Deborah number**:

$$\mathrm{De} = \frac{\tau_{\text{relax}}}{\tau_{\text{observe}}}$$

At $\mathrm{De} \ll 1$, the material relaxes faster than the observation window, and it behaves
as a liquid: everything renegotiable, nothing holding shape on the timescale observed. At
$\mathrm{De} \gg 1$, the material relaxes slower than the observation window, and it behaves as
a solid: nothing moves within the window. The regime useful for a structure that is both a
durable record and an active workspace is neither extreme but $\mathrm{De} \approx 1$: the
viscoelastic regime, in which pinned walls read as solid and exchangeable walls read as fluid
on the same observation timescale. This states a design target with a number attached: a
structure is simultaneously a record and a workspace only if its wall relaxation times are
separated from the write interval and the retention interval by at least the ratio between
those two intervals — retention shorter than the record's relaxation time, or the record
dissolves before use; the write interval longer than the workspace's relaxation time, or the
workspace fails to finish revising before the next read.

Worked example: a pinned attestation with $\tau_{\text{relax}} \approx 10$ years, read on a
timescale of $\tau_{\text{observe}} = 1$ day, gives $\mathrm{De} \approx 3650$: solidly a
record. An exchangeable disulfide-style wall with $\tau_{\text{relax}} \approx 2$ hours, read
on the same 1-day timescale, gives $\mathrm{De} \approx 0.08$: solidly fluid on that timescale.
Both walls, read by the same observer on the same day, sit at opposite ends of the
$\mathrm{De}$ scale — which is the numeric content behind calling the structure simultaneously
a record and a workspace.

### 6.3 The census as the mechanism behind phased foam

Changing $\mathcal D$, the set of actors treated as observers (§2.4), does not change the rate
at which any individual actor's commitments are made or revised. Choosing to watch operational
service endpoints instead of organizational duty registers does not make any underlying actor
faster or slower. What changing $\mathcal D$ changes is the census: how much of the substrate
reads as committed bulk, how much reads as void, and where the interfaces fall, without
touching the clock. Phased foam (§7) states that which foam is observed is a census question,
not a rate question.

### 6.4 Folding: the global-shape analogue of the local landscape

Sections 3.4 through 5.8 describe events at one locus or one wall at a time. A network's whole
structure settles into one overall shape, a process with a standard name: the folding problem.

A protein chain has an astronomically large set of possible conformations. Cyrus Levinthal's
1969 observation states that a chain sampling conformations at random, one at a time, would
require longer than the age of the universe to find its correct folded shape, while real
proteins fold in milliseconds to seconds. The resolution: folding does not proceed by random
search over a flat landscape. It proceeds down a **folding funnel** — an energy landscape
shaped as a funnel, wide and rough at the top (many partially folded states, each lower in
energy than the fully unfolded chain) and narrowing to one deep well at the bottom (the native
state). Because the landscape has this shape, every local move is statistically biased
downhill toward configurations closer to native, and the chain is never lost in the
astronomical search space because it is guided the whole way down.

This is the same mechanism as §3.4's double-well field and §5.8's chain-reaction picture,
viewed at the scale of the whole structure rather than one locus. Each wall settling into $t$
or $f$ rather than $\top$ is one step down a local slope of the double-well kind (§3.4); each
chain reaction propagating and terminating is one contributing local event. The folding-funnel
picture states that many local, biased, downhill steps compose into a global settling process
that is fast and directed because the landscape as a whole points "downhill" from almost
anywhere toward roughly the same destination. This is the physical basis for the design rule:
do not commit to a conformation early. A structure — a chain, a network of walls, a colony of
actors settling into a stable arrangement — that locks into one partial configuration too soon
risks having climbed a wrong local slope of the same funnel, from which the remaining downhill
path may lead somewhere other than the correct state, and returning to the correct slope costs
the reversal-ladder prices of §5.5 and §5.7: cheap at an early, disulfide-like rung, expensive
or impossible once a wrong partial structure is locked in by something pinned-style.

This states a falsifiable claim about time-to-settle as a function of structure, not size
alone: a funnel-shaped landscape predicts that a large, well-shaped structure settles faster
than a small, badly shaped one, because settling time depends on the landscape's ruggedness and
slope, not the raw count of loci needing to settle. Section 11.6 states this as a test.

---

## 7. Phased foam: the same wall graph under three observer sets

### 7.1 The claim

Fix one substrate: a population of actors committing values across one shared address tree —
every claim any actor has made about a given Capability Cell, across every face of it (its
ActivityPub actor, its EVM account, its office registration, its A2A agent card, its ludic
strategy in whatever game it is presently playing). The field $\Phi_{\mathcal D}$ of §2.4 is
relative to a chosen subset $\mathcal D$ of that population, and its definition does not force
one canonical choice of $\mathcal D$. Different choices of $\mathcal D$ produce different
fields, and different fields produce different foams — different bulk regions, different
interfaces, different coarsening rates — computed over the identical tree of addresses and the
identical population of actors. This is a parameter the definition always carried, stated
explicitly.

Three choices of $\mathcal D$ are worked below against one shared toy example, each a real,
already-used way of watching this kind of substrate.

### 7.2 The shared toy example

Take one Capability Cell, $C$, with three loci: $\xi_{\text{ap}}$ (is $C$'s ActivityPub actor
answering as live), $\xi_{\text{evm}}$ (does $C$'s EVM account hold the balance its manifest
claims), $\xi_{\text{duty}}$ (does the office responsible for $C$'s upkeep list that duty in
its own register). Four actors watch this cell: the operational monitor $M$, pinging live
endpoints; the EVM indexer $I$, reading on-chain state directly; the corporate register $G$,
the office-and-duty ledger; and the office $O$ nominally responsible for $C$.

**Operational, $\mathcal D = \{M, I\}$.** $M$ commits $t$ at $\xi_{\text{ap}}$ and has nothing
to say about $\xi_{\text{duty}}$, not being the kind of actor that watches organizational
registration. $I$ commits $t$ at $\xi_{\text{evm}}$ and likewise has nothing to say about
$\xi_{\text{duty}}$. The field under this $\mathcal D$: $\xi_{\text{ap}} = t$,
$\xi_{\text{evm}} = t$, $\xi_{\text{duty}} = \bot$ (void, since neither watcher in this
$\mathcal D$ can have an opinion about it). This is the **operational foam**: two bulk cells,
no interface, and one locus outside the foam because these observers do not watch
organizational registration.

**Organizational, $\mathcal D = \{G, O\}$.** $G$ commits $t$ at $\xi_{\text{duty}}$ if and only
if some office's duty array names $C$'s upkeep; suppose here it does not. $O$ commits $f$ at the
same locus, stating on its own behalf that it does not carry this duty. $G$ and $O$ have
nothing to say about $\xi_{\text{ap}}$ or $\xi_{\text{evm}}$. The field under this $\mathcal D$:
$\xi_{\text{duty}} = f$ (uncontested negative), $\xi_{\text{ap}}$ and $\xi_{\text{evm}}$ both
void. This is the **organizational foam**, disagreeing with the operational foam about which
locus is void and which is bulk, over the identical underlying cell.

**Ludic, $\mathcal D = \{M, O\}$, watching the duty locus.** Suppose $M$ also logs a fact about
$\xi_{\text{duty}}$: it observes that some person or process has, in practice, been responding
to $C$'s incidents, independent of what the registers state. Read as an assertion about
$\xi_{\text{duty}}$, this is $t$: the duty is functionally carried out. $O$'s own commitment,
from the organizational reading, was $f$: the duty is not registered. Watching $M$ and $O$
together over $\xi_{\text{duty}}$, the join is $\top$: an interface. This is what a $\mathcal D$
straddling both readings produces: a wall stating the disagreement between what the paperwork
states and what is actually happening, made a $\top$-locus rather than left as an unquantified
complaint.

### 7.3 What this example states, and what it does not

The three readings share the identical underlying address tree and the identical underlying
population of actors; what differs is the subset $\mathcal D$ used to compute the join. This
sharing is what makes the question in §11.3 — whether the three readings' wall graphs are
isomorphic once restricted to what each $\mathcal D$ can observe — an empirical question with a
definite answer. The toy example above is small enough to compute by hand; the test in §11.3
requires the same computation over a real Capability Cell registry at production scale.

### 7.4 A five-locus example, with a coarsening comparison

Extend the example: five Capability Cells, $C_1$ through $C_5$, each committing a value at a
shared locus $\xi_{\text{healthy}}$ ("this cell is currently healthy"). Suppose the five
self-reports are $C_1 = t$, $C_2 = t$, $C_3 = t$, $C_4 = f$, $C_5 = t$: four positive, one
negative. Watched by $\mathcal D_{\text{self}}$ (each cell's own self-report, the cheapest
possible observer set), the field at $\xi_{\text{healthy}}$ joins to $\top$: contested, since
at least one commitment disagrees. This locus is a wall under this reading regardless of how
large the majority is, because the join of §2.4 does not weight by count, only by the presence
of both a $t$ and an $f$ somewhere in $\mathcal D$.

Change $\mathcal D$ to $\mathcal D_{\text{quorum}}$: an operational monitor committing a value
only once at least three of the five self-reports agree, and staying silent ($\bot$) if no
majority exists. Under this $\mathcal D$, the locus reads $t$: bulk, uncontested, because the
monitor's own aggregation rule resolved the minority disagreement before the join ran. Nothing
about $C_4$'s report changed between the two computations; the second $\mathcal D$ contains an
actor whose function is to pre-aggregate disagreement into a single reading before the field
computes it. This is the census effect of §6.3: identical underlying commitments, two observer
sets, two foams — one with a wall at this locus, one without — the difference traceable
entirely to which actors are watching.

Extend the same five cells to a second locus, $\xi_{\text{governed}}$ ("this cell's manifest
matches its actual behavior"), with a more even split: $C_1, C_2$ commit $t$; $C_3, C_4$ commit
$f$; $C_5$ says nothing. Under $\mathcal D_{\text{self}}$, this is $\top$: contested, with a
near-even split. Under $\mathcal D_{\text{quorum}}$'s three-of-five rule, no majority exists
(two $t$, two $f$, one silent), so the quorum actor commits nothing and the joined field is
$\bot$: void, since the aggregating rule abstains rather than force a reading on an evenly
split population. The quorum-style $\mathcal D$ does not simply turn every $\top$ into $t$ or
$f$: it turns a resolvable disagreement into bulk and leaves a genuinely unresolvable one as
void.

Running von Neumann's law (§4.2) across these two loci under each $\mathcal D$ states the
stakes concretely. A locus with four neighboring walls under $\mathcal D_{\text{self}}$ and two
under $\mathcal D_{\text{quorum}}$ (two of those walls resolving to bulk once the aggregating
actor pre-processes them) is predicted to shrink under the first reading ($n=4<6$) and to sit
closer to stationary under the second ($n$ closer to six). Which prediction holds is an
empirical question about which $\mathcal D$ actually governs the cell's survival in practice —
the question §11.3 states as a test.

---

## 8. Obstruction: when an entity's own faces disagree

### 8.1 Masks and drift loci

Section 7 watched one entity through different external observer sets. A related question:
what happens when one entity presents several faces of itself, and those faces disagree.

Call each face a **mask**: a projection of one underlying entity, addressed at its own location
in the tree. An office's mask in the operational register is one projection; the same office's
mask in the duty ledger is another; its mask in whatever agent-card or service identity it
exposes externally is a third. Each mask, on its own, is a coherent local description. The
question is whether they describe one thing: at every locus where two of an entity's own masks
both have something to say, do they say the same thing.

A locus is a **drift locus** for a given entity when two or more of that entity's own masks
commit oppositely there — a $\top$-reading computed across one entity's own several
self-descriptions, not across external observers. An entity with no drift locus is
**coherent**: its masks agree wherever they overlap. An entity with a drift locus has a wall
running through itself: its own self-description simultaneously asserts and denies the same
thing somewhere.

### 8.2 A worked illustrative example

The following is a constructed, illustrative example, not a citation of any specific
registry's real data. Consider an office-and-duty registry of forty-five duty records, each
naming the office it holds to be responsible. Suppose an audit checks each duty record against
that office's own personnel record, and finds: one duty record matches cleanly, and even that
one is trivial — a duty so broadly scoped that thirty-one of thirty-four offices bear it
simultaneously, closer to default matching than to confirmation. Of the remaining
forty-four: thirty name a real, different office than the one whose own register lists the
duty; eight name an entity that is not a seated office; six name a real office whose own
personnel array does not include the duty back; two offices carry no duty-bearing field at
all.

Read through §8.1's definition, this illustrative audit states forty-four drift loci across
forty-five checked entities: a specific, countable obstruction, structurally identical to
running the toy example of §7.2 across an entire registry rather than one cell. Obstruction
does not require the registry to be internally contradictory in a visible way. Each individual
office's own record is well-formed on its own terms; each duty's own record is well-formed on
its own terms. The obstruction appears only when one mask is checked against the other mask of
the same underlying pair — the duty's claim about who bears it, against that office's own claim
about what it bears — which is why a same-register consistency check does not find it: no
single register is internally inconsistent, so no ordinary validation pass over either register
alone surfaces the mismatch. Only a check crossing between the two masks finds the wall between
them.

### 8.3 Obstruction is not a contradiction

Obstruction is not a logical contradiction in the sense of one actor asserting $t$ and $f$ at
the same locus in the same breath, which would be an error correctable by that actor alone.
Obstruction, as illustrated in §8.2, is two different masks of one entity disagreeing, each
independently well-formed and independently maintained, by processes that have not been
reconciled against each other. This states why counting drift loci is the correct instrument
where checking each record for internal consistency is not: the illustrative forty-four
mismatches above are not caught by validating any single duty record or office record against
its own schema, since each validates individually. They are caught only by cross-referencing
one mask against another.

---

## 9. The pairing one level up: outbox and stateRoot

### 9.1 Why a Capability Cell requires both faces

Section 2 built the knowledge order and truth order from a single locus's history of
commitments. The identical pair recurs, at a coarser grain, between a Capability Cell's two
constitutive faces, which states why "AP is the knowledge carrier, EVM is the truth carrier" is
a derived assignment rather than a convenient label.

An ActivityPub actor's outbox is, by protocol design, append-only: activities accumulate, and
the protocol supplies no operation for retracting one, only for publishing further activities
that may supersede an earlier claim without erasing it — the earlier claim remains in the log,
superseded rather than deleted. This is the knowledge order at the scale of an actor's entire
history: information about what this actor has claimed only grows.

An EVM account's state — balance, storage slots, whatever a contract's variables hold — is, by
contrast, the current, revisable disposition of that account, updated by a transition function
each time a transaction executes, with no obligation to preserve a prior value once a valid
subsequent transition overwrites it. This is the truth order at the scale of a whole account:
what the account currently supports, distinct from the complete history of what has been
claimed about it.

A Capability Cell without an ActivityPub face has no accumulating, discoverable record of its
history: no knowledge-order carrier, so no actor outside the cell has a durable trail of its
past claims. A Capability Cell without an EVM face has no settled, currently actionable
disposition: no truth-order carrier, so no other actor can check a current, committed state.
Neither half alone is a weaker Capability Cell; each alone is missing one of the two orders a
field requires to be a field, in the same sense that a material with only permanent thioether
bonds and no exchangeable disulfide population is not a weaker vitrimer — it is a thermoset
with no rewrite mechanism, a different kind of material.

### 9.2 Why the two faces are independent requirements

Raising a locus's truth-order status — settling a disputed EVM state transition so the
account's current balance is no longer contested — does not by itself raise that locus's
knowledge-order status. An EVM transition settling does not constitute ActivityPub knowledge of
that settlement: the EVM face being confirmed does not substitute for the AP face's own
accumulation of a public record about it. This states why the requirement is a conjunction of
two independent conditions rather than one implying the other: if settling the truth-order
state automatically produced the knowledge-order record, requiring both faces would be
redundant rather than necessary. It is necessary because the two orders move independently, and
a cell advancing only one of them can fail to advance the other for an arbitrarily long
interval.

### 9.3 Binding the two faces to one identity: a conjunction of independent checks

Section 9.1 requires the two faces to be bound to a single identity, not merely present
side by side. Binding is verified by a conjunction of independent checks, each drawing on a
structurally different verification primitive, so that defeating the binding requires
defeating all of them at once rather than one system checked repeatedly:

$$\mathrm{bound}(\kappa) \;:\equiv\; \mathrm{Verify_{EVM}}(\kappa) \;\wedge\;
\mathrm{Verify_{AP}}(\kappa) \;\wedge\; \mathrm{Verify_{sig}}(\kappa)$$

$\mathrm{Verify_{EVM}}(\kappa)$ checks that the EVM face's account address is literally $\kappa$
itself — an equality check, not a signature. $\mathrm{Verify_{AP}}(\kappa)$ checks that the
ActivityPub actor's declared public key validates an HTTP signature or Linked-Data signature
over its own outbox activity — a cryptographic verification, structurally unrelated to address
equality. $\mathrm{Verify_{sig}}(\kappa)$ checks a third, independent artifact — for instance a
signed statement, published at a location both faces reference, asserting the binding between
the AP actor URI and the EVM address — checked by a signature-verification algorithm
independent of both prior checks. Each conjunct can be individually true or false; the AND
means all three must hold simultaneously for $\mathrm{bound}(\kappa)$ to hold. Worked example:
if $\mathrm{Verify_{EVM}}$ and $\mathrm{Verify_{sig}}$ both hold but the AP actor's key fails to
validate its own signature ($\mathrm{Verify_{AP}} = \text{false}$), the conjunction is false —
the EVM face and the cross-signed statement agreeing is not sufficient, because the AP face
itself, the knowledge-order carrier §9.1 requires, has not independently proven it controls the
identity it claims to.

---

## 10. MetroFOAM: Red Cup Engineering's AP+EVM implementation of FOAM

### 10.1 Product and package boundary

**MetroFOAM** is the brand name of Red Cup Engineering's concrete software stack for
implementing FOAM through the ActivityPub and EVM formation described in §9. The current
intended npm distribution binding is `@red-cup-engineering/metrofoam`. That package contains,
by package composition, the other packages used to realize the stack. Package composition
supplies one installable and releasable product; it does not erase the independent identities,
deployment boundaries, controllers, wallets, or market offers of the Capability Cells composed
by the product.

The package namespace, repository path, hostname, and mounted node are mutable distribution
bindings. None defines or changes the MetroFOAM concept. A later binding MAY move without
renaming the technology, provided the release manifest preserves the product and capability
identities it binds.

The name expands to **Metroplex of Foam Of Actor Models**. `Metro-` also fits the Union's
existing micro-enterprise, metro-enterprise, and macro-enterprise nomenclature. That naming fit
does not define MetroFOAM as the metro-enterprise scale, a colony-scale field, or the Union as a
whole. Those are organizational scales that software distributed through MetroFOAM may model
or serve. FOAM names the general actor-model account; MetroFOAM names the 561 Group's specific
packaged implementation of it.

### 10.2 The AP+EVM implementation boundary

MetroFOAM implements the AP+EVM formation through the conjunction established in §9: an
ActivityPub face carries accumulating, discoverable claims and an EVM face carries current
committed disposition. The stack includes the packages required to create, bind, discover,
invoke, observe, and economically settle those actors. A different implementation of FOAM
need not be MetroFOAM, and a package does not become part of MetroFOAM merely by using either
ActivityPub or EVM in isolation.

The product boundary is testable. Installing the current `@red-cup-engineering/metrofoam`
binding with its declared
constituent packages must be sufficient to expose the advertised AP+EVM formation without an
undeclared interactive agent or repository-local implementation supplying a hidden operation.
A failure of that installation-and-invocation test falsifies the claim that the release package
realizes the stack.

### 10.3 A candidate implementation-governability condition

A coordination structure — the graph whose edges are "this cell carries a live reference into
that one" — propagates a governance change (a manifest revision, an office reassignment) at a
rate bounded by the graph's connectivity, specifically its graph Laplacian's second-smallest
eigenvalue, the algebraic connectivity. Each cell drifts away from what its manifest currently
states at a rate set by how often its internal state changes without a corresponding update to
its public description. A coordination structure is governable only if its connectivity keeps
pace with the fastest individual cell's drift: if governance propagates slower than the
fastest cell drifts, no correction event closes the gap, because the gap reopens faster than
any single correction pass closes it. This is a candidate health measure for a deployed
MetroFOAM installation, not the definition of MetroFOAM: compute the installed coordination
graph's connectivity, compute the fastest-drifting cell's rate, and compare them.

**Computing $\lambda_2$ for a small colony.** The graph Laplacian is $L = D - A$, where $D$ is
the diagonal degree matrix and $A$ the adjacency matrix. For a 4-cell colony connected in a
cycle (each cell references exactly its two neighbors), every degree is 2, and:

$$L = \begin{pmatrix} 2 & -1 & 0 & -1 \\ -1 & 2 & -1 & 0 \\ 0 & -1 & 2 & -1 \\ -1 & 0 & -1 & 2
\end{pmatrix}$$

The eigenvalues of the Laplacian of a cycle on $n$ nodes are known in closed form,
$\lambda_j = 2 - 2\cos(2\pi j/n)$ for $j = 0, \ldots, n-1$. At $n=4$: $\lambda_0 = 2-2\cos(0) =
0$ (always zero, reflecting that a constant shift solves $Lx=0$), $\lambda_1 = 2-2\cos(90°) =
2$, $\lambda_2 = 2-2\cos(180°) = 4$, $\lambda_3 = 2-2\cos(270°) = 2$. Sorted, the algebraic
connectivity — the second-smallest eigenvalue — is $2$. Adding a fifth cell that only
references one existing cell (a pendant, rather than joining the cycle) lowers this
connectivity, since a pendant is the weakest way to attach a new node to a graph: the general
fact behind why a coordination graph shaped like a cycle-plus-satellite is harder to govern
than a denser one is that sparser attachment patterns push $\lambda_2$ toward zero, exactly the
regime in which the governability inequality below is hardest to satisfy.

Worked example: a colony of ten cells whose coordination graph has algebraic connectivity
$\lambda_2 = 0.4$ correction-events per day, against a fastest cell whose internal behavior
drifts from its manifest at $\delta = 0.1$ changes per day. Since $\lambda_2 = 0.4 > \delta =
0.1$, the inequality holds: governance propagates roughly four times faster than the fastest
cell drifts, and the colony is predicted governable. A second colony with the same $\delta =
0.1$ but a sparser graph at $\lambda_2 = 0.03$ fails the inequality: drift outruns correction by
roughly a factor of three, and the colony is predicted to fall out of sync with its own
paperwork regardless of how diligently any single correction pass is run.

---

## 11. Predictions

Each prediction below is stated so a negative result is informative.

**11.1 The cost functional.** Section 4.1's Plateau-style equilibrium claim requires
disagreements to carry a maintainable cost. Pick a candidate measure (messages exchanged
defending a contested locus, number of actors weighing in, duration held contested) and test
whether real interfaces in a Capability Cell registry are stationary under that measure —
whether small perturbations to which loci are contested increase or decrease it. A negative
result — no candidate measure behaves this way — states that the Plateau-equilibrium reading of
§4.1 does not hold for this substrate. This is the cheapest test and should run first.

**11.2 The six-neighbor threshold.** Build the wall graph for a real, historied set of
Capability Cells or glossary terms — vertices are bulk regions, edges are interfaces — and test
whether entries with fewer than six neighbors at a past time were disproportionately absorbed
or deprecated since, and specifically whether neighbor count at time $t$ predicts survival to
$t+\Delta$ better than an independent measure of quality does. This is a comparison: if quality
predicts survival better, §4.2's coarsening account does not govern this substrate's
attrition.

**11.3 Do the three phased-foam readings differ, or coincide?** Compute the operational,
organizational, and ludic wall graphs of §7 over a real Capability Cell registry at production
scale, restricting each computation to the loci each $\mathcal D$ can observe. Test whether the
three resulting graphs are isomorphic once restricted. If isomorphic, phased foam is one
structure under three names, real as vocabulary but not as three separately load-bearing
claims. If they differ, the phased reading performs work no single-observer account performs,
and the three should be computed and reported separately.

**11.4 Obstruction as a leading indicator.** Track the drift-locus count of §8 over time
against known coordination failures — a duty silently going undone, a cell's manifest drifting
from its actual behavior — and test whether a rising drift-locus count precedes an observed
failure rather than only correlating with it after the fact. If drift count rises only
alongside failures already independently visible, it is a redundant instrument; if it rises
measurably before the failure becomes visible by other means, it functions as an early warning.

**11.5 The governability bound.** Compute a real colony's coordination-graph algebraic
connectivity, separately estimate each cell's drift rate from how often its internal behavior
changes without a corresponding manifest update, and test whether §10.3's inequality predicts
which colonies stay governable and which fall out of sync with their own paperwork. A colony
satisfying the inequality but observed losing sync anyway falsifies the transfer of this bound
to the actor-model setting.

**11.6 The folding-funnel prediction.** Test whether large, low-obstruction registries (few
drift loci, §8) settle into stable readings faster than small, high-obstruction ones — the
actor-model analogue of a large, well-funneled protein folding faster than a smaller, poorly
funneled one.

**11.7 The topological-event count.** Test whether every topology change observed in a real
wall graph decomposes into exactly a T1 or a T2 event (§4.5), with no third category required,
across a large enough sample that a missing third category would be detectable.

**11.8 The wall-chemistry mapping.** Section 5 maps compliant-permanent, exchangeable, and
pinned walls onto an append-only log entry, a witnessed state transition, and an attested
record respectively. Test this against a real actor-model registry: classify each wall by
which of the three reversal costs of §5.5 it actually pays when a revision is attempted, and
check whether that classification matches which of the three mechanisms (never rewritten,
rewritten with a third-party witness, rewritten only by force) the wall is observed to use in
practice. A wall classified as exchangeable by cost that is never observed being rewritten
associatively would falsify the mapping for that wall type.

**11.9 Independence of the two faces.** Section 9.2 claims that an EVM transition settling
never by itself produces the corresponding ActivityPub record. Test this on a real Capability
Cell: force a truth-order settlement (confirm a disputed state transition) without any
separate AP-side action, and check whether an accumulating, discoverable AP record of that
settlement appears anyway. If it does, appearing with no independent AP-side act, the
asymmetry of §9.2 does not hold for this substrate, and the two-face requirement of §9.1
is merely thorough rather than necessary.

---

## 12. What does not transfer, and what is open

**Whether the actor-model substrate carries a cost functional at all**, rather than merely
being describable as if it did. Everything from §4 onward, about equilibrium being reached
rather than merely describable, requires a real, measurable quantity playing the role surface
tension plays in a soap film, and no such quantity is measured here. Absent that measurement,
the equilibrium language in this note states a target shape a real system's behavior might or
might not approach.

**Whether the three phased readings of §7 are distinct structures or one structure under three
names**, the open test of §11.3. The toy example demonstrates that they can differ; it does not
demonstrate that they do, at production scale, once the restriction to what each $\mathcal D$
can observe is accounted for.

**Whether "actor" performs identical work across ActivityPub, EVM, and ludic designs**, or
merely satisfies the same abstract definition without every provable consequence transferring.
Section 1 establishes that all three satisfy Hewitt's actor definition. The address-tree-and-
commitment picture of §1.4 is common to all three. Whether the deeper game-theoretic results
specific to ludic designs — canonical extension of a strategy to a well-formed strategy, for
instance — have an analogue for ActivityPub actors or EVM contracts is an open question this
note does not answer.

---

## 13. Glossary

**Actor.** An entity holding private state, reachable only by message, capable of sending
messages and creating further actors (Hewitt, 1973). ActivityPub actors, EVM accounts, and
Girard designs are instances.

**Locus.** An address in a rooted tree of addresses — a storage slot key, an outbox entry's
identifier, a position in a game tree.

**Charge.** The four-valued status of a locus: $\bot$ (silence), $t$ (uncontested positive),
$f$ (uncontested negative), $\top$ (contested, both asserted and denied).

**Knowledge order ($\le_k$).** Ranks charge by how much has been asserted, monotonically:
$\bot \le_k t, f \le_k \top$.

**Truth order ($\le_t$).** Ranks charge by current disposition, freely revisable:
$f \le_t \bot, \top \le_t t$.

**Field.** An assignment of charge to every locus, computed by joining the commitments of a
chosen set of actors $\mathcal D$.

**Foam.** The cell-and-wall structure a field takes once it separates into bulk regions
(uncontested charge) and interfaces (contested charge).

**Bulk / void / interface.** $t$ and $f$ are bulk; $\bot$ is void, outside the foam's
structure; $\top$ is interface, a wall.

**Von Neumann's law.** A two-dimensional foam cell's growth rate depends only on its number of
neighbors $n$: $dA_n/dt = \kappa(n-6)$.

**Isostatic.** The state in which a structure's degrees of freedom exactly match its
constraints: no floppy mode, no redundant stress.

**T1 / T2 event.** A T1 event is a neighbor switch (no cell vanishes, adjacency changes); a T2
event is a cell disappearance (the cell vanishes, adjacency of the survivors is unaffected).

**Compliant permanent / exchangeable / pinned.** The three wall chemistries: never removed and
freely moving (thioether-like); removable and reformable only with an witness
(disulfide-like); immovable because mechanically jammed (Pickering-stabilized).

**Deborah number.** $\mathrm{De} = \tau_{\text{relax}}/\tau_{\text{observe}}$, the ratio setting
whether a material reads as fluid or solid on a given observation timescale.

**Census.** How much of a substrate reads as bulk, void, or interface under a given observer
set — distinct from the rate at which any individual actor's commitments change.

**Folding funnel.** An energy landscape shaped so that local, biased, downhill moves compose
into a fast, directed global settling process, rather than requiring exhaustive search.

**Phased foam.** The claim that a field's cell-and-wall structure is relative to which actors
$\mathcal D$ are chosen as observers, not a fixed property of the underlying substrate.

**Mask / drift locus.** One entity's several self-descriptions, and a locus where two of an
entity's own masks disagree.

**Obstruction.** The count of an entity's own drift loci — a measured quantity, not a
qualitative complaint.

**MetroFOAM.** Red Cup Engineering's branded AP+EVM implementation of FOAM. Its current intended
npm distribution binding is `@red-cup-engineering/metrofoam`; package namespace, repository
path, host, and node do not define the technology. The name expands to Metroplex of Foam Of
Actor Models; its fit with micro-, metro-, and macro-enterprise nomenclature is naming context,
not a scale definition.

---

## References

Belnap, N. D. (1977). A useful four-valued logic. In J. M. Dunn & G. Epstein (Eds.), *Modern
Uses of Multiple-Valued Logic* (pp. 5–37). Reidel.

Girard, J.-Y. (2001). Locus solum: From the rules of logic to the logic of rules.
*Mathematical Structures in Computer Science*, 11(3), 301–506.

Hewitt, C., Bishop, P., & Steiger, R. (1973). A universal modular ACTOR formalism for
artificial intelligence. *Proceedings of the 3rd International Joint Conference on Artificial
Intelligence*, 235–245.

Odriozola, I., Rekondo, A., Martin, R., Ruiz de Luzuriaga, A., Rodríguez, J., & Grande, H. J.
(2014). Catalyst-free room-temperature self-healing elastomers based on aromatic disulfide
metathesis. *Materials Horizons*, 1, 237.

Pickering, S. U. (1907). Emulsions. *Journal of the Chemical Society, Transactions*, 91, 2001.

Plateau, J. (1873). *Statique expérimentale et théorique des liquides soumis aux seules forces
moléculaires.* Gauthier-Villars.

Reiner, M. (1964). The Deborah number. *Physics Today*, 17(1), 62.

Taylor, J. E. (1976). The structure of singularities in soap-bubble-like and soap-film-like
minimal surfaces. *Annals of Mathematics*, 103, 489.

Thomson, W. (Lord Kelvin) (1887). On the division of space with minimum partitional area.
*Philosophical Magazine*, 24, 503.

Van Zee, N. J., & Nicolaÿ, R. (2020). Vitrimers: permanently crosslinked polymers with dynamic
network topology. *Progress in Polymer Science*, 104, 101233.

von Neumann, J. (1952). Discussion remark concerning paper of C. S. Smith "Grain shapes and
other metallurgical applications of topology". In *Metal Interfaces*, American Society for
Metals, 108.
