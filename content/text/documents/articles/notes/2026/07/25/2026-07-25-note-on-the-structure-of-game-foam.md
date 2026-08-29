---
title: "The Structure of Game Foam"
description: "Gives a foam-geometric reading of Girard's ludics: the Belnap FOUR order parameter as a foam phase, drying/incarnation as an exact idealization, and constraint counting on strategies."
date-created: 2026-07-25
kind: research-note
keywords:
  - game-foam
  - ludics
  - belnap-four
  - constraint-counting
status: design
declared-by: claude-interactive-session-supplying-lenticule-science
---
# The Structure of Game Foam

*Interfaces, phases, and constraint counting in ludic and concurrent-game systems*

---

## Abstract

We give a foam-geometric reading of Girard's ludics and of concurrent game
semantics. The four-valued Belnap order parameter carried by a design is shown
to partition a locus space into exactly the four regions a two-phase foam
requires: a void, two ordered bulk phases, and an interface. Under this reading
Girard's *incarnation* — the material part of a design, stripped of the loci no
counter-design ever visits — is the passage to the dry-foam limit, and the
classical theorem that two designs with equal incarnation are indistinguishable
to the whole orthogonal (the ludic form of Diderot's paradox of the actor) says
precisely that drying loses no observable: the dry idealization is exact rather
than approximate. We then count constraints on strategies. Receptivity and
innocence are shown to be a floppy-mode count and a self-stress count in the
sense of Maxwell and Calladine, and their difference is shown *not* to be a
rigidity index — reproducing, with a one-line construction, the same blind spot
that defeats naive Maxwell counting on three-dimensional frameworks. But
polarity separates the two pressures completely, and this yields a positive
result with no analogue in material foam: on a finite arena every innocent
play-set has a canonical least well-formed extension, so the isostatic point is
always attainable by a monotone process. Finally we identify the two topological
rearrangement events of foam physics with two named ludic acts — the daimon with
film rupture, and Rancière's dissensus (a newcomer that shifts a biorthogonal
closure) with a neighbour-switching T1 event — and read a character as a global
section over the cover of its masks, whose obstruction is a first cohomology
class.

---

## 1. Introduction

### 1.1 What is being claimed

A foam is a space partitioned into cells by a network of interfaces, in which
almost all of the energy lives on the interfaces and almost all of the volume
lives in the cells. Foams are interesting because that separation makes them
*predictable from surface data alone*: von Neumann's law relates a
two-dimensional cell's growth rate to its number of sides and to nothing else,
not to its area, its shape, or anything about its interior.

We claim that a ludic system — a set of Girard designs interacting over a locus
tree — is a foam in this sense, not by analogy but by construction, and that
several of its known theorems are foam-physical statements that have been proved
in a different vocabulary.

Three claims carry the paper.

1. **The order parameter is already there.** A design assigns to each locus one
   of four values. Those four values are exactly {void, phase A, phase B,
   interface}. The value the corpus calls *stable*, Belnap's $\top$, occurs
   exactly where two designs commit oppositely — which is the definition of a
   domain wall. Its name is not a coincidence: Plateau's laws are stability
   conditions on interfaces.

2. **Drying is exact.** Girard's incarnation operator deletes from a design
   every locus no counter-design visits. This is the dry limit — draining the
   liquid and keeping the film network. The paradox-of-the-actor theorem says
   two designs with the same incarnation are observationally identical. So
   nothing observable lives in the drained part. In material foam the dry limit
   is an idealization one apologizes for; here it is a theorem.

3. **Polarity buys isostaticity for free.** Rigidity theory's central
   difficulty is that counting degrees of freedom against constraints gives the
   wrong answer whenever a framework is simultaneously floppy and
   over-constrained. We show the same failure occurs for strategies, with an
   explicit two-move counterexample. But we also show that the two pressures act
   on disjoint move sets — negative moves force inclusion, positive moves force
   exclusion — and that this disjointness makes the isostatic point always
   reachable. Material foam has to relax into Plateau equilibrium; game foam is
   born there.

### 1.2 What is not being claimed

We do not claim a coarsening law. Section 8 states the candidate — that a
behaviour's fate depends on the number of counter-designs that meet it, and on
nothing else — as a conjecture with an explicit test, not as a theorem. We have
no analogue of von Neumann's law and do not assert one.

We do not claim that the corpus of implemented code we cite constitutes a
verification of any statement here. It supplies the definitions; the propositions
are ours and are proved in the text. The definitions of §2 and the constructions
of §§4, 7, 8, 9 exist as running code in the source corpus, transcribed here as
specification rather than cited as evidence, and nothing here has been
machine-checked. In particular, no bundled arena or strategy object exists in the
corpus's proof assistant; the formalization there is a certificate over a
claim/refutation transcript with a two-constructor role type, and the game
semantics lives in an interpreted language.

### 1.3 Relation to other work

This paper stands alone. A companion treatment, *The Structure of Semiotic
Foam*, reads a corpus of (token, claim) utterances as a foam with tokens as
walls and claims as cells; the present paper is not a sequel and does not depend
on it. §10 records where the two readings agree and where they diverge, for
readers who have both.

---

## 2. The substrate

We fix notation. All definitions in this section are standard or are transcribed
from an existing implementation; the reader who knows ludics may skim to §3.

**Definition 2.1 (Locus).** Fix a rooted tree whose nodes are finite sequences
of naturals ordered by the prefix relation $\sqsubseteq$. A *locus* $\xi$ is
such a sequence; $\xi\cdot i$ is its $i$-th child. The root is the empty
sequence. Write $\Xi$ for the set of loci.

**Definition 2.2 (Charge).** Let $\mathbf{4} = \{\bot, t, f, \top\}$ carry
Belnap's two orders: the *knowledge* order $\le_k$ with $\bot < t,f < \top$, and
the *truth* order $\le_t$ with $f < \bot,\top < t$. Write $\vee_k$ for the
knowledge join. The essential computation is
$$ t \vee_k f = \top, \qquad \bot \vee_k x = x .$$

**Definition 2.3 (Design).** A *design* is a finitely supported partial
valuation $\mathfrak{D} : \Xi \to \mathbf{4}$, with loci outside the support
carrying $\bot$. The four values record the act committed at a locus:

| act | charge | reading |
|---|---|---|
| Proponent (positive) | $t$ | the design commits here |
| Opponent (negative) | $f$ | the counter-design commits here |
| Daimon $\dagger$ | $\top$ | a participant gives up, asserting and denying |
| no action | $\bot$ | the design says nothing here |

**Definition 2.4 (Interaction, convergence, orthogonality).** The *interaction*
of $\mathfrak{D}$ and $\mathfrak{E}$ is the pointwise knowledge join
$\mathfrak{D} \vee_k \mathfrak{E}$. It *converges*, written
$\mathfrak{D} \perp \mathfrak{E}$, when the two designs meet (share a committed
locus) and the join reaches $\top$ somewhere — a daimon collision. Otherwise it
diverges: a participant is stuck, descending a branch the other never opened.

**Definition 2.5 (Behaviour).** For $X$ a set of designs, $X^\perp$ is the set
of designs orthogonal to every member of $X$. A *behaviour* is a set closed
under the resulting Galois connection: $\mathbf{B} = \mathbf{B}^{\perp\perp}$.
Formulas are names of behaviours.

**Definition 2.6 (Incarnation, ballast, material).** Let $\mathbf{B}$ be a
behaviour and $\mathfrak{D} \in \mathbf{B}$. The loci of $\mathfrak{D}$ *visited*
by $\mathbf{B}^\perp$ are those at which some counter-design in
$\mathbf{B}^\perp$ also commits. The *incarnation*
$|\mathfrak{D}|_{\mathbf{B}}$ is the restriction of $\mathfrak{D}$ to its visited
loci. The discarded remainder is the *ballast*. $\mathfrak{D}$ is *material*
when it equals its own incarnation. The *incarnation of a behaviour*
$|\mathbf{B}|$ is the set of incarnated designs — its skeleton.

**Definition 2.7 (Arena, play, strategy).** An *arena* is a prime event
structure $(E, \le, \#)$ — events with a causal partial order and a conflict
relation — with each event labelled positive (Player) or negative (Opponent),
together with a groupoid of symmetries: bijections on $E$ preserving causality,
conflict, and polarity. A *play* is a sequence of events consistent with $\le$
and $\#$. A *strategy* $\sigma$ on an arena is a non-empty prefix-closed set of
valid plays.

**Definition 2.8 (Well-formedness).** Fix a strategy $\sigma$. For $p \in
\sigma$ let $E(p)$ be the arena-legal one-move extensions of $p$, partitioned by
polarity into $E^-(p)$ and $E^+(p)$; let $\sigma^\pm(p) = \{m \in E^\pm(p) :
p\cdot m \in \sigma\}$. Then:

- $\sigma$ is **receptive** iff $\sigma^-(p) = E^-(p)$ for all $p \in \sigma$
  (Player may not refuse Opponent);
- $\sigma$ is **innocent**, in the deterministic sequential reading, iff
  $|\sigma^+(p)| \le 1$ for all $p \in \sigma$ (at most one Player move after
  any history);
- $\sigma$ is **symmetry-invariant** iff $\sigma$ is closed under relabelling
  each play by an arena symmetry.

$\sigma$ is *well-formed* when all three hold.

> **Scope note.** Definition 2.8's innocence is the deterministic reading. The
> concurrent-games literature uses *courtesy* instead, which is strictly weaker
> and admits nondeterministic strategies. Every result in §6 is stated for the
> deterministic reading and we flag explicitly where it depends on that choice.

---

## 3. The order parameter

This section states the paper's basic identification.

**Definition 3.1 (Phase assignment).** Let $\mathcal{D}$ be a finite set of
designs. The *phase* of a locus $\xi$ relative to $\mathcal{D}$ is the knowledge
join $\Phi(\xi) = \bigvee_k \{\mathfrak{D}(\xi) : \mathfrak{D} \in
\mathcal{D}\} \in \mathbf{4}$.

**Proposition 3.2 (Four regions).** $\Phi$ partitions $\Xi$ into four regions
with the following geometric content.

- $\Phi(\xi) = \bot$: **void.** No design commits at $\xi$. The locus is not part
  of the foam at all.
- $\Phi(\xi) = t$: **Proponent bulk.** Every design that commits here commits the
  same way. The locus is interior to a cell.
- $\Phi(\xi) = f$: **Opponent bulk.** Likewise, the opposite phase.
- $\Phi(\xi) = \top$: **interface.** At least two designs commit oppositely.

*Proof.* Immediate from Definition 2.2: $\top$ arises in a knowledge join only
from $t \vee_k f$, and $\bot$ only from an empty or all-$\bot$ family. $\square$

**Remark 3.3.** The identification is not decorative. Three independent
constructions in the implemented corpus all locate their essential condition at a
$\top$, and Proposition 3.2 says why they must:

1. *Orthogonality* (Definition 2.4) requires a daimon collision. Two designs are
   orthogonal exactly when they share an interface.
2. *Rule suspension* at a magic-circle boundary (§9) is defined as a
   boundary-crossing whose in-game and ordinary-life commitments join to $\top$.
   The boundary of a play region is an interface in the sense of Prop 3.2.
3. *Identity drift* (§7) is defined as a locus where two masks of one character
   superpose to $\top$. A drifting character has an interface running through
   itself.

Each of these was defined for its own reasons. That all three land on the same
charge is the content of the proposition: $\top$ *is* the interface, so anything
interfacial must be a $\top$-condition.

**Remark 3.4 (on the name).** The corpus names $\top$ `stable`. Read as a truth
value this is odd — $\top$ is the *inconsistent* value. Read as a phase it is
exact: a domain wall is the stable configuration of a frustrated boundary, and
Plateau's laws are the stability conditions that select which wall junctions
survive. The naming records a geometric fact that the logical reading obscures.

---

## 4. Cells: behaviours as phases

**Proposition 4.1.** A behaviour is a phase, in the following precise sense.
Define $\mathfrak{D} \sim \mathfrak{E}$ iff $\mathfrak{D}$ and $\mathfrak{E}$
have the same orthogonal: $\{\mathfrak{D}\}^\perp = \{\mathfrak{E}\}^\perp$.
Then $\sim$-classes refine behaviours, and a behaviour is a union of
$\sim$-classes closed under the Galois connection.

*Proof.* $(-)^{\perp\perp}$ is a closure operator on the powerset of designs
(extensive, monotone, idempotent — standard for a Galois connection induced by a
relation). Behaviours are exactly its closed sets. If $\mathfrak{D} \sim
\mathfrak{E}$ then $\mathfrak{D}$ lies in a closed set iff $\mathfrak{E}$ does,
since membership in $X^{\perp\perp}$ is determined by $X^\perp \subseteq
\{\mathfrak{D}\}^\perp$. $\square$

The reading: two designs are in the same phase when they relax against the same
counter-designs. A behaviour is the maximal set of designs indistinguishable by
*which of their walls come to equilibrium*. This is what a thermodynamic phase
is — an equivalence class under an equilibrium relation, not a list of members.

### 4.1 Incarnation is drying

A wet foam has a substantial liquid fraction $\phi$ occupying the Plateau
borders and vertices; as $\phi \to 0$ the borders thin to lines and the foam
becomes *dry*, consisting of films, edges, and vertices only. Almost all of foam
theory — Plateau's laws, von Neumann's law, the Kelvin and Weaire–Phelan
structures — is stated in the dry limit, and its applicability to real foam
depends on the drained material being dynamically unimportant.

**Definition 4.2 (Drying map).** For a behaviour $\mathbf{B}$, the *drying map*
is $\mathfrak{D} \mapsto |\mathfrak{D}|_\mathbf{B}$ of Definition 2.6. Material
designs are its fixed points; $|\mathbf{B}|$ is its image.

Ballast is committed but never met. It occupies loci, it is part of the design's
support, and no interaction ever visits it. It is the liquid.

**Theorem 4.3 (Drying is faithful on observables).** Let $\mathbf{B}$ be a
behaviour and $\mathfrak{A}, \mathfrak{B} \in \mathbf{B}$ with
$|\mathfrak{A}|_\mathbf{B} = |\mathfrak{B}|_\mathbf{B}$. Then for every
$\mathfrak{C} \in \mathbf{B}^\perp$, $\mathfrak{A} \perp \mathfrak{C}$ iff
$\mathfrak{B} \perp \mathfrak{C}$.

*Proof.* Fix $\mathfrak{C} \in \mathbf{B}^\perp$. By Definition 2.4,
orthogonality with $\mathfrak{C}$ is determined by the interaction
$\mathfrak{A} \vee_k \mathfrak{C}$, which depends on $\mathfrak{A}$ only at loci
where $\mathfrak{C}$ commits. Every such locus is visited by a member of
$\mathbf{B}^\perp$ (namely $\mathfrak{C}$), hence lies in the incarnation. So
$\mathfrak{A}$ and $|\mathfrak{A}|_\mathbf{B}$ agree at every locus that can
affect the interaction, and likewise for $\mathfrak{B}$. By hypothesis the two
incarnations are equal, so the two interactions with $\mathfrak{C}$ are
identical, and in particular converge or diverge together. $\square$

**Corollary 4.4 (The dry limit is exact).** For a ludic foam, the dry
idealization loses nothing. Two configurations with the same film network are
indistinguishable by every experiment the system admits, since every experiment
is an interaction with a counter-design and every counter-design meets only the
film.

**Remark 4.5.** Theorem 4.3 is a known ludic fact wearing different clothes. In
the performance-theoretic register the corpus calls it *the paradox of the
actor*, after Diderot: the great actor feels nothing, and the affect is
manufactured entirely at the surface; two actors with the same front stage are
indistinguishable to the audience however different their interiors. The foam
statement and the theatrical statement are the same theorem. What the foam
reading adds is the reason it *matters*: it is exactly the condition under which
von Neumann-style surface laws can exist at all. A coarsening law that depends
only on the number of a cell's sides is possible only in a system whose bulk is
inert. Theorem 4.3 establishes that inertness.

**Remark 4.6 (what drying is not).** Drying is not surface minimization. A
physical foam at fixed cell volumes minimizes total film area; the drying map
instead deletes volume and keeps the surface. The two operations move in
different directions and should not be conflated. Corollary 4.4 licenses working
in the dry limit; it says nothing about which dry configuration is selected.
That question is §6's.

---

## 5. Walls, and how long they last

Foams are distinguished from crystals by their clock. A foam is a structure whose
interfaces move, and every statement about a foam is implicitly indexed by
whether one is observing faster or slower than they move.

**Definition 5.1 (Ludic Deborah number).** For an interaction, let
$\tau_{\mathrm{norm}}$ be the time to normalization (the number of reduction
steps to convergence, or $\infty$ if the interaction diverges) and
$\tau_{\mathrm{obs}}$ the observation window. Set
$$\mathrm{De} = \tau_{\mathrm{norm}} / \tau_{\mathrm{obs}} .$$

**Proposition 5.2 (Three permanence classes).** Every locus at which a design
commits falls into exactly one of three classes, and the classification is
Deborah-indexed.

| class | condition | $\mathrm{De}$ | material analogue |
|---|---|---|---|
| **inert** | committed, never visited (ballast) | undefined | unreacted bulk |
| **exchangeable** | visited, interaction converges | $\mathrm{De} \approx 0$ | dynamic covalent bond |
| **pinned** | visited, interaction diverges | $\mathrm{De} = \infty$ | permanently frustrated interface |

*Proof.* The trichotomy is Definitions 2.4 and 2.6: a committed locus is either
outside the incarnation (inert) or inside it, and an interaction either converges
or does not. $\square$

**Corollary 5.3 (Ossification is divergence).** A structure that does not relax
on any accessible timescale is one whose interfaces diverge. Ossification — the
transition from a rearranging foam to a rigid one — is, in the ludic register,
the accumulation of divergent interactions.

This is chemically the right identification and it is worth being explicit about
why. A glass is not a material with strong bonds; it is a material whose
rearrangement pathway is blocked. Divergence is precisely a blocked pathway: a
participant descending a branch the other never opened, waiting forever for a
move that will not come. It is not a strong commitment. It is a commitment that
cannot be answered.

**Remark 5.4.** The daimon is the opposite pole and is often misread as the same
one. Playing $\dagger$ *terminates* the interaction — the participant gives up,
asserting and denying at once. Termination is not rigidity; it is rupture. §8
develops this.

---

## 6. Constraint counting on strategies

We now count. This section contains the paper's main technical results.

Rigidity theory's basic tool is Maxwell counting: compare the degrees of freedom
of a framework to the number of constraints imposed on it. The count is a
*signed index* and its central defect is well known — a framework can be
simultaneously under-constrained in one region and over-constrained in another,
so that the two errors cancel and the index reports isostaticity where none
exists. In three dimensions this is the double-banana. Calladine's refinement of
Maxwell's rule makes the defect precise: the index equals the number of floppy
modes minus the dimension of the space of self-stresses, and only the *pair*, not
the difference, characterizes rigidity.

We show the same structure holds for strategies, with the same defect, and then
show that polarity repairs it.

**Definition 6.1 (Deficiency and redundancy).** For a prefix-closed play-set
$\sigma$ on a finite arena, define
$$ f(\sigma) = \sum_{p \in \sigma} \bigl( |E^-(p)| - |\sigma^-(p)| \bigr), \qquad
   s(\sigma) = \sum_{p \in \sigma} \max\bigl(0,\ |\sigma^+(p)| - 1\bigr). $$
Both are non-negative integers. Call $f$ the *response deficiency* and $s$ the
*response redundancy*.

**Proposition 6.2.** $\sigma$ is receptive iff $f(\sigma) = 0$, and innocent iff
$s(\sigma) = 0$. Hence $\sigma$ is well-formed (modulo symmetry-invariance) iff
$f(\sigma) = s(\sigma) = 0$.

*Proof.* Immediate from Definitions 2.8 and 6.1; each summand is non-negative, so
the sum vanishes iff every summand does. $\square$

The reading is exact. A refused Opponent move is a **floppy mode**: the arena
offers a degree of freedom the strategy has not constrained, and the system can
move in a direction the strategy does not govern. A second admitted Player move
is a **self-stress**: two commitments contend at the same history with no
external cause, which is what a state of self-stress is — internal force with no
external load.

**Definition 6.3 (Index).** $\iota(\sigma) = f(\sigma) - s(\sigma)$.

**Theorem 6.4 (The index is blind).** $\iota(\sigma) = 0$ does not imply
$\sigma$ is well-formed. Explicitly, there is an arena and a prefix-closed
$\sigma$ with $\iota(\sigma) = 0$ that is neither receptive nor innocent.

*Proof.* Take the arena with four events: $a$ (negative, minimal), and $b$
(negative), $c^+, d^+$ (positive), all three caused by $a$ and pairwise
conflict-free. Let $\sigma = \{\varepsilon, a, a c, a d\}$ — prefix-closed and
valid. At $p = a$: $E^-(a) = \{b\}$ and $\sigma^-(a) = \varnothing$, so the
deficiency contribution is $1$; $\sigma^+(a) = \{c, d\}$, so the redundancy
contribution is $1$. All other plays contribute $0$. Hence $f(\sigma) =
s(\sigma) = 1$ and $\iota(\sigma) = 0$, while $\sigma$ refuses $b$ (not
receptive) and admits two Player continuations (not innocent). $\square$

**Remark 6.5.** Theorem 6.4 is the double-banana at two moves. In the framework
setting the counterexample requires three dimensions and a somewhat delicate
construction; here it is forced, because $f$ and $s$ are supported on disjoint
sets — $f$ counts over $E^-$, $s$ over $E^+$, and polarity partitions $E$. There
is no cancellation *mechanism* between them; the cancellation in the index is a
pure artefact of subtracting two independent quantities. The moral is the same
moral rigidity theory learned: report the pair $(f, s)$, never the difference.

We now show polarity gives something back.

**Definition 6.6 (Receptive closure).** For prefix-closed $\sigma$, let
$R(\sigma)$ be the least prefix-closed play-set containing $\sigma$ and closed
under: if $p \in R(\sigma)$ and $m \in E^-(p)$ then $p \cdot m \in R(\sigma)$.
On a finite arena this closure is reached in finitely many steps.

**Lemma 6.7.** $R$ adds only plays whose last move is negative.

*Proof.* By construction each closure step appends some $m \in E^-(p)$. $\square$

**Theorem 6.8 (Isostatic realizability).** Let $\sigma$ be innocent and
prefix-closed on a finite arena. Then $R(\sigma)$ is receptive *and* innocent,
and is the least receptive play-set containing $\sigma$. Consequently every
innocent play-set extends canonically to a well-formed strategy, and the
extension is unique and minimal.

*Proof.* Receptivity and minimality are Definition 6.6. For innocence, take
$p \in R(\sigma)$ and consider $\sigma^+_{R}(p) = \{m \in E^+(p) : p\cdot m \in
R(\sigma)\}$. Two cases.

*Case 1: $p \in \sigma$.* By Lemma 6.7 every play added by $R$ ends in a negative
move, so no play of the form $p \cdot m$ with $m$ positive is added. Hence
$\sigma^+_R(p) = \sigma^+(p)$, which has size $\le 1$ since $\sigma$ is innocent.

*Case 2: $p \in R(\sigma) \setminus \sigma$.* Again by Lemma 6.7 no positive
extension of $p$ is ever added, and $p \notin \sigma$ means $\sigma$ contains no
extension of $p$ either. So $\sigma^+_R(p) = \varnothing$.

In both cases $|\sigma^+_R(p)| \le 1$, so $R(\sigma)$ is innocent. $\square$

**Corollary 6.9.** In game foam the isostatic point always exists and is reached
by a monotone one-sided process — add every refused Opponent move and stop.

**Remark 6.10 (why this has no material analogue).** In a mechanical framework
the two pressures act on the same object. Adding a bar to remove a floppy mode
can create a self-stress; there is no procedure that monotonically approaches
isostaticity from below. That is why material foam must *relax* into Plateau
equilibrium rather than being constructible at it, and why the relaxation is
where all the physics is.

The ludic case is different because polarity assigns the two pressures to
disjoint move sets. Constraining the negative moves cannot disturb the positive
ones. The floppy count and the stress count are not merely reported separately —
they are *causally* independent, and the receptive closure exploits exactly this.

**Remark 6.11 (scope).** Theorem 6.8 uses the deterministic reading of innocence
(Definition 2.8). Under the concurrent *courtesy* condition the argument's Case 1
still goes through, since courtesy also constrains only the interleaving of
already-present moves, but the uniqueness claim in Theorem 6.8 does not, because
courtesy admits several incomparable well-formed extensions. We state the
concurrent case as open. This is not a technicality: it is the precise point at
which the "born isostatic" property could fail, and it should be the first thing
tested by anyone who wants to rely on Corollary 6.9.

An earlier reading of this material treated "opposition" as a role in this
corpus. It is not; every occurrence is a materials-science term for two physical
quantities moving inversely. The adversarial role that does exist is an audit
posture against a finished artefact, which is not a player. No two-agent
strategic interaction is implemented anywhere in the source system, and this
section's Player/Opponent vocabulary should not be read as describing one.

---

## 7. Masks

**Definition 7.1 (Delocation, mask).** For a locus $\xi$, *delocation* by $\xi$
relocates a design's entire play beneath $\xi$: every committed locus $\zeta$
becomes $\xi \cdot \zeta$, charges unchanged. A *mask* is a delocation. Write
$m_\xi(\mathfrak{D})$.

**Proposition 7.2.** Masks compose: $m_\xi \circ m_\zeta = m_{\xi \cdot \zeta}$,
and $m_\varepsilon = \mathrm{id}$. Hence the masks form a monoid isomorphic to
the free monoid on the locus alphabet, acting on designs.

*Proof.* Direct from the definition; concatenation of prefixes is associative
with the empty sequence as unit. $\square$

**Corollary 7.3 (No face beneath).** The mask monoid acts on the locus tree by
translation and has no fixed design other than the empty one. There is no
distinguished "unmasked" design: for any $\mathfrak{D}$ and any $\xi$,
$m_\xi(\mathfrak{D})$ is a design of the same shape at a different address.

Read geometrically this is a homogeneity statement: **the locus tree has no
preferred origin, and a mask is a translation of the foam.** The philosophical
slogan — Deleuze's masks behind masks, Butler's "no doer behind the deed" — is
in this reading a *gauge* claim, and gauge claims are the sort of thing one can
compute with. Note the monoid is not a group: delocation pushes deeper and
cannot be inverted, because the tree is rooted. Translations of game foam are
one-way.

### 7.1 A character is a global section

Suppose a character presents several masks $\mathfrak{P}_1, \dots,
\mathfrak{P}_n$ — several designs it plays at several addresses. Each is a local
description. The natural question is whether they describe one thing.

**Definition 7.4 (Gluing, drift).** The *glued family* is the pointwise
knowledge join $\bigvee_k \mathfrak{P}_i$. A locus $\xi$ is a *drift locus* when
the join is $\top$ there — one mask commits what another denies. The character is
*coherent* when there is no drift locus.

**Proposition 7.5.** Drift loci are exactly the interfaces of Proposition 3.2
internal to the character. A coherent character is one whose masks lie entirely
within a single bulk phase; a drifting character has a wall running through it.

*Proof.* Immediate: Definition 7.4's condition is Prop 3.2's $\top$-condition
applied to the family of masks rather than to a general design set. $\square$

This is the sheaf-theoretic shape: masks are sections over a cover, the character
is a global section, and drift is the obstruction to gluing. The implemented
corpus computes exactly this and packages the result as a first-cohomology
receipt whose generators are the drift loci and whose rank is their count.

**Remark 7.6 (what that rank is and is not).** The computed quantity is a *count
of drift loci*. It is presented as a first cohomology rank, and it is a
legitimate obstruction count — it is zero exactly when gluing succeeds. But it is
not the rank of $H^1$ of a cochain complex; no coboundary is formed and no
quotient is taken. It counts inconsistent sites, not independent cycles among
them.

This distinction is the same one that separates the graphic matroid from the
rigidity matroid. Cycle rank $b_1 = |E| - |V| + c$ counts independent cycles in a
graph and is computed by union-find; generic rigidity requires the pebble game
and counts independence in a strictly finer matroid. A count of contradiction
sites and a rank of independent obstructions coincide only when the obstructions
are independent — which is exactly the assumption not being checked.

We flag it because it recurs. The vocabulary of both computations is
cohomological; the mathematics implemented in both is connectivity. That is not a
defect of the definitions, which are honest about what they compute. It is a
statement about how much weight the numbers can bear: they are diagnostics, not
invariants.

---

## 8. Topological events

Foam evolution proceeds by two elementary rearrangements. A **T1** event is a
neighbour switch: a short film shrinks to zero length and reopens in the
perpendicular direction, so that two cells that were adjacent cease to be and two
that were not become so. A **T2** event is a cell disappearance: a cell shrinks
to zero volume and vanishes, and its neighbours close over the gap. Between
events the foam merely coarsens; the events are where the topology changes.

Both have ludic counterparts, and — this is the point of the section — both were
named for independent reasons in the source material.

**Definition 8.1 (Daimon event).** A play reaches the daimon at $\xi$ when a
participant commits $\top$ there, terminating the interaction.

**Proposition 8.2 (Daimon = T2).** A daimon event removes a locus from the set of
active interfaces without a neighbour switch: after $\dagger$, the play is over
and no further move is made below $\xi$. Its effect on the foam is the
disappearance of a cell, not a rearrangement of adjacency.

*Proof sketch.* Convergence is defined by reaching $\dagger$; after convergence
the interaction admits no continuation, so the sub-tree below $\xi$ carries no
further commitments and drops out of every subsequent incarnation. Adjacency
among the remaining designs is unchanged, since no design's commitments outside
that sub-tree are altered. $\square$

**Definition 8.3 (Dissensus).** A newcomer $\mathfrak{N}$ *redistributes* a
troupe $T$ when $\bigl(T \cup \{\mathfrak{N}\}\bigr)^{\perp\perp} \ne
T^{\perp\perp}$. A newcomer already inside the closure is *consensus*: already
counted, nothing redistributed.

**Proposition 8.4 (Dissensus = T1).** A redistributing newcomer changes which
designs are orthogonal to which — that is, which cells share a wall — while
adding no new termination. It is a neighbour switch.

*Proof sketch.* By Prop 4.1 a behaviour is determined by its orthogonal;
admitting $\mathfrak{N}$ alters $T^\perp$ and hence the closure, so some design
enters or leaves the phase. Since orthogonality is the sharing of an interface
(Remark 3.3), the change is precisely a change in the adjacency relation. No
locus is terminated, so no cell vanishes. $\square$

**Remark 8.5.** The identification is worth pausing on. Rancière's *dissensus* is
a political concept: the moment when a newcomer's admission redistributes the
partition of what counts, as opposed to *consensus*, where the newcomer was
always already counted. The corpus formalized it as a change in a biorthogonal
closure. That formalization turns out to be a T1 event — the elementary
topological rearrangement of a foam. Neither definition was made with the other
in view.

We take this as evidence for the reading rather than as decoration. A foam has
exactly two elementary events, and the two independently-named ludic acts are
exactly two, and they land one on each.

Propositions 8.2 and 8.4 are proof sketches rather than full proofs because both
depend on a precise account of what "the foam" is as a time-indexed object, which
we have not given; they should be read as identifications proposed, not
established.

---

## 9. The magic circle

Huizinga's *magic circle* is the bounded region within which play occurs, where
special rules apply and ordinary consequences are suspended. Formalized on an
arena it is a cell with an explicit boundary, and its three defining marks turn
out to be three distinct geometric conditions.

**Definition 9.1.** A *circle* on an arena is a set $I$ of events. Its
*boundary* is the set of events in $I$ having a cause or consequence outside $I$.

**Proposition 9.2 (The three marks are independent conditions).**

1. **Bounded.** $I$ is a genuine sub-arena iff $I$ is *down-closed*: every cause
   of an event in $I$ is in $I$. (You cannot be mid-game on a move whose
   prerequisites lie outside.) This is a condition on the *causal order*.

2. **Voluntary.** Entry is unforced iff every *entry point* — every event in $I$
   minimal for the induced order — is positive. In a prime event structure
   nothing is ever causally forced (causality says "may not occur until", never
   "must"), so forcedness cannot be a causal notion; it is a *polarity* notion,
   and this is a condition on the *labelling*.

3. **Rule-suspending.** Ordinary consequences re-enter iff some boundary
   crossing carries an in-game commitment $t$ against an ordinary-life
   commitment $f$, joining to $\top$. This is a condition on a *play*, not on the
   circle's geometry, and cannot be read off $I$ alone.

The three are mutually independent: a circle can be down-closed with forced
entry, or voluntary without being down-closed, and rule-suspension is undefined
until a play supplies the crossings.

**Corollary 9.3.** Under Proposition 3.2, mark (3) says the magic circle's
boundary *is a wall*: the interface between the in-game phase and the
ordinary-life phase. A circle admitting no paraconsistent crossing is hermetic —
it has an outside but no interface with it, and is therefore not a cell of the
same foam but a separate one.

**Remark 9.4.** This gives a sharp reading of the long-running argument about
whether the magic circle is "porous". The question as usually posed — does play
have real consequences? — is a question about whether the boundary carries $\top$.
A hermetic circle and a porous circle are not two opinions about the same object;
they are two different objects, distinguished by whether an interface exists. And
the porous one is the *generic* case: hermeticity requires every crossing to
agree, which is a codimension condition.

---

## 10. What this does and does not share with semiotic foam

For readers holding both papers.

**Shared.** The order parameter, the Deborah clock, the three permanence classes,
the surface/bulk separation, and the caution about which matroid a computation
actually counts in. In both readings the interesting quantity is a rate ratio and
the interesting failure is a count that reports health while two pathologies
cancel.

**Divergent, and importantly so.** Semiotic foam takes tokens as walls and
claims as cells; game foam takes the interface to be a *charge value* rather than
a syntactic object, and cells to be *equivalence classes under an equilibrium
relation* rather than individual utterances. The consequence is that game foam
has Theorem 6.8 and semiotic foam does not: polarity is a structure the ludic
substrate has and a corpus of utterances lacks. A vocabulary must relax into
isostaticity; a strategy is born there.

If one wanted a single question to test whether the two readings are the same
theory in two registers, it is this: **does a corpus of utterances carry a
polarity?** If claims and their refutations are genuinely distinct move types
with disjoint constraint roles, then semiotic foam should inherit Theorem 6.8 and
the "vocabularies must relax" picture is wrong. If they are not, the two foams
are structurally different and should stop being described in one vocabulary.

We do not know the answer.

---

## 11. Predictions and tests

Each is stated so that a negative result would tell us something specific went
wrong.

Construct two designs with equal incarnation and unequal support, along with a
counter-design outside $\mathbf{B}^\perp$ that distinguishes them. Theorem 4.3 is
stated relative to $\mathbf{B}^\perp$; if the intended notion of observation is
broader than interaction-with-the-orthogonal, Corollary 4.4 fails and the dry
limit is an approximation after all. This is the cheapest test and should be run
first.

Run the receptive closure on a corpus of real strategies — protocol
implementations, session types, dialogue policies — and measure $(f, s)$ before
and after. Theorem 6.8 predicts $s$ is invariant under closure. Any observed
increase in $s$ falsifies Lemma 6.7's use, meaning some closure implementation
adds positive moves, and the "born isostatic" claim does not describe that
system.

A behaviour's persistence under repeated dissensus is conjectured to depend only
on the number of counter-designs in its orthogonal that actually meet it, and not
on its size, its support, or its ballast — the game-foam analogue of von
Neumann's law, unproved here. To test it: generate random design populations,
evolve by repeated random admission, and regress survival against (a)
orthogonal-degree and (b) support size. Von Neumann-like behaviour predicts (a)
carries all the signal and (b) none. If support size predicts survival, there is
no surface law here and §4's inertness does not extend to dynamics.

Instrument a running interaction for $\tau_{\mathrm{norm}}$ and look for a
bimodal distribution. Proposition 5.2 predicts two populations (fast-converging
and divergent) rather than a continuum. A unimodal heavy-tailed distribution
would mean divergence is a limit of slowness rather than a distinct class, and
Corollary 5.3's identification of ossification with divergence becomes a matter
of degree rather than kind.

Compute, on a character with several masks, both the drift count and the actual
rank of the obstruction after quotienting by dependencies among drift loci.
Remark 7.6 predicts these differ whenever three or more masks overlap. If they
never differ in practice, the distinction is real but inert and the cheaper
count is the right instrument.

---

## References

Abramsky, S., Jagadeesan, R., & Malacaria, P. (2000). Full abstraction for PCF.
*Information and Computation*, 163(2), 409–470.

Belnap, N. D. (1977). A useful four-valued logic. In J. M. Dunn & G. Epstein
(Eds.), *Modern Uses of Multiple-Valued Logic* (pp. 5–37). Reidel.

Butler, J. (1990). *Gender Trouble: Feminism and the Subversion of Identity*.
Routledge.

Calladine, C. R. (1978). Buckminster Fuller's "tensegrity" structures and Clerk
Maxwell's rules for the construction of stiff frames. *International Journal of
Solids and Structures*, 14(2), 161–172.

Castellan, S., Clairambault, P., & Winskel, G. (2019). Thin games with symmetry
and concurrent Hyland–Ong games. *Logical Methods in Computer Science*, 15(1).

Deleuze, G. (1968). *Différence et Répétition*. Presses Universitaires de France.

Diderot, D. (1830 [c. 1773]). *Paradoxe sur le comédien*. Sautelet.

Faggian, C., & Hyland, M. (2002). Designs, disputes and strategies. In
*Computer Science Logic* (LNCS 2471, pp. 442–457). Springer.

Ginsberg, M. L. (1988). Multivalued logics: A uniform approach to reasoning in
artificial intelligence. *Computational Intelligence*, 4(3), 265–316.

Girard, J.-Y. (2001). Locus solum: From the rules of logic to the logic of rules.
*Mathematical Structures in Computer Science*, 11(3), 301–506.

Goffman, E. (1959). *The Presentation of Self in Everyday Life*. Doubleday.

Huizinga, J. (1938). *Homo Ludens: Proeve eener bepaling van het spel-element
der cultuur*. Tjeenk Willink.

Hyland, J. M. E., & Ong, C.-H. L. (2000). On full abstraction for PCF.
*Information and Computation*, 163(2), 285–408.

Jacobs, D. J., & Hendrickson, B. (1997). An algorithm for two-dimensional
rigidity percolation: The pebble game. *Journal of Computational Physics*,
137(2), 346–365.

Laman, G. (1970). On graphs and rigidity of plane skeletal structures. *Journal
of Engineering Mathematics*, 4(4), 331–340.

MacPherson, R. D., & Srolovitz, D. J. (2007). The von Neumann relation
generalized to coarsening of three-dimensional microstructures. *Nature*,
446(7139), 1053–1055.

Maxwell, J. C. (1864). On the calculation of the equilibrium and stiffness of
frames. *Philosophical Magazine*, 27(182), 294–299.

Mullins, W. W. (1956). Two-dimensional motion of idealized grain boundaries.
*Journal of Applied Physics*, 27(8), 900–904.

Plateau, J. (1873). *Statique expérimentale et théorique des liquides soumis aux
seules forces moléculaires*. Gauthier-Villars.

Rancière, J. (2008). *Le spectateur émancipé*. La Fabrique.

Reiner, M. (1964). The Deborah number. *Physics Today*, 17(1), 62.

Terui, K. (2011). Computational ludics. *Theoretical Computer Science*,
412(20), 2048–2071.

von Neumann, J. (1952). Discussion remark. In *Metal Interfaces* (pp. 108–110).
American Society for Metals.

Weaire, D., & Hutzler, S. (1999). *The Physics of Foams*. Oxford University
Press.

Winskel, G. (1986). Event structures. In *Petri Nets: Applications and
Relationships to Other Models of Concurrency* (LNCS 255, pp. 325–392). Springer.
