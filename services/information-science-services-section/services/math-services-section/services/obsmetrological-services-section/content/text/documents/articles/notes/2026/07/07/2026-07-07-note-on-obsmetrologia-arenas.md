# What in Obsmetrologia Mathematics Is an Arena?

Emsenn

July 7, 2026

## Abstract

The question "what in Obsmetrologia mathematics is an arena?" is not answered by
choosing a familiar noun and matching it to a private carrier.  It is answered
by proving which public mathematical structure is forced when one asks for
events, causality, finite positions, polarity, conflict, local observation,
overlap, valuation, settlement, symmetry, and strategies to coexist in one
object.  Starting from event structures, causal sets, Belnap-Dunn four-valued
semantics, Grothendieck sites, sheaf gluing, and concurrent game semantics, this
paper constructs a finite polarized causal site with four-valued valuations and
settled sheaf semantics.  Its configurations are finite down-closed
conflict-free histories; its positions are configurations equipped with local
site supports and valuations; its plays are inclusions of positions; its
strategies are prefix-closed deterministic families of Player-extensions
subject to settlement.  The resulting arena is realized in Obsmetrologia by the
finite causal-order structure together with four-valued valuation/settling and
fiber-local site covers.  The paper-level theorem packages these existing
components into a single arena; the appendix records the formalized components
and the remaining obligation of bundling them under one named theorem.

## 1. Introduction

The original question is deliberately underdetermined: "what in Obsmetrologia
mathematics is an arena?"  If one answers it immediately by saying that an
arena is some already named object, the answer has assumed the conclusion.  If
one imports a sequential game-semantics definition unchanged, the answer may
miss the concurrency, local gluing, and paraconsistent valuation that are
already load-bearing in the mathematics.  If one instead chooses a visually
tempting object, such as a region, a hole, or a state space, the answer may name
where play happens without proving the structure of play.

The proof below proceeds in the opposite direction.  It first asks what an
arena must support:

1.  events, ordered by causal dependence;
2.  finite histories, closed under causal prerequisites;
3.  consistency, so incompatible events do not occupy one history;
4.  polarity, so extensions can be read as Opponent- or Player-facing;
5.  symmetries, so histories equivalent up to harmless relabelling are
    recognized as the same shape of play;
6.  subobjects and covers, so local observations and local sections can be
    compared and glued;
7.  valuations, so positions carry informational standing;
8.  settlement, so local valuations stabilize to a global reading;
9.  strategies, so an agent is not merely a trajectory but a lawful rule for
    responding inside the arena.

These requirements force a public mathematical object: a finite polarized
event structure with symmetry, equipped with a site of observable subobjects,
four-valued valuations, and a settlement operator whose fixed points supply the
global positions on which strategies are evaluated.  The key point is that the
arena is not a bare set of states.  It is the interaction of causal event
structure, local cover structure, valuation, and settlement.

The conclusion, reached only after the construction, is this: in Obsmetrologia
mathematics, the arena is the finite polarized causal event-site realized by
the causal-order carrier, four-valued valuation and settlement, and fiber-local
site cover machinery.  It is not identical to any one region or boundary
object.  Those are subarenas, subobjects, examples, or nonexamples depending on
whether they preserve the required structure.

## 2. Public Literature Grounding

Event structures provide the first public primitive.  Winskel describes event
structures as models of processes whose event occurrences are constrained by
causal dependence, consistency, and enabling.  The finite configurations of an
event structure are precisely the finite histories: they are consistent and
down-closed under causal dependence.  This is the correct language for a
mathematics in which a position is not a point but a finite occurred history.

Causal set theory provides the second primitive.  A causal set is a locally
finite partially ordered set of events; the order is read as causal precedence.
For the finite construction used here, local finiteness is automatic once the
event support is finite.  What matters is that causal order supplies the
enabling relation: an event can occur only after its causal predecessors.

Game semantics provides the third primitive.  In the sequential
Hyland-Ong/Abramsky-Jagadeesan-Malacaria tradition, arenas are generated from
moves with ownership/polarity and an enabling relation; plays are sequences of
justified moves, and strategies are sets of plays satisfying behavioral
constraints.  The concurrent event-structure tradition generalizes this: a
game is an event structure with polarity, and strategies are event-structure
maps or families of configurations satisfying stability conditions.  This is
the branch used below, because the proof needs finite partially ordered
histories, not only linear justified sequences.  The sequential arena is
recovered as the special case in which every finite configuration is a chain.

Belnap-Dunn four-valued logic and bilattice semantics provide the value object.
The four values record no evidence, positive evidence, negative evidence, and
both positive and negative evidence.  Bilattice presentations distinguish the
truth order from the knowledge or information order.  That distinction is
necessary here: conflict is not the same as falsity, and settlement is not mere
truth evaluation.  Settlement climbs in information until a fixed point is
reached.

Grothendieck sites and sheaves provide locality.  A site is a category with
specified covering families satisfying identity/isomorphism, locality, and base
change axioms.  Sheaves encode local-to-global agreement: compatible local
sections glue to global sections, and separation says a global section is
determined by its restrictions to a cover.  An arena with observation patches
therefore needs subobjects, covers, overlaps, restrictions, and gluing; these
are not decorative additions.

## 3. The Necessary Objects

### 3.1 Events and Causality

Let `E` be a finite set.  Its elements are called events.  A strict causal
relation on `E` is a relation `<` satisfying:

1.  irreflexivity: not `e < e`;
2.  transitivity: if `e < f` and `f < g`, then `e < g`.

Write `e <= f` for the reflexive closure: `e = f` or `e < f`.

An event `d` is a causal predecessor of `e` when `d < e`.  The causal past of
`e` is

```text
Past(e) = { d in E | d < e }.
```

**Lemma 3.1.**  If `<` is irreflexive and transitive, then it is asymmetric:
`e < f` implies not `f < e`.

**Proof.**  If both `e < f` and `f < e`, transitivity gives `e < e`, contrary
to irreflexivity.  QED.

**Lemma 3.2.**  If a finite directed acyclic graph has edge relation `prec0`,
then its nonempty directed-path reachability relation is a strict causal
relation.

**Proof.**  A nonempty path from `e` to `f` followed by one from `f` to `g`
concatenates to a nonempty path from `e` to `g`, so reachability is transitive.
A path from `e` to itself would be a directed cycle, contradicting acyclicity.
Thus reachability is irreflexive; by Lemma 3.1 it is asymmetric.  QED.

This proves that a finite acyclic direct-dependence graph supplies the causal
order required for event-structure games.

### 3.2 Consistency and Conflict

An event structure needs more than order.  Two events may be causally
independent but incompatible alternatives.  Let `Con` be a predicate on finite
subsets of `E`.  Read `Con(X)` as "the finite set `X` is jointly consistent."
It must satisfy:

1.  downward closure: if `Y subset X` and `Con(X)`, then `Con(Y)`;
2.  singleton consistency: every singleton `{e}` is consistent.

Define binary conflict by

```text
e # f  iff  not Con({e,f}).
```

Binary conflict is enough for the finite arena below when the consistency
predicate is generated pairwise:

```text
Con(X)  iff  for all e,f in X, not (e # f).
```

**Lemma 3.3.**  Pairwise-generated consistency is downward closed.

**Proof.**  Suppose `Con(X)` and `Y subset X`.  Any two elements of `Y` are
also elements of `X`, hence are not in conflict.  Therefore `Con(Y)`.  QED.

The proof needs a source of conflict.  Four-valued valuation supplies one.
Let

```text
B4 = {bot, t, f, top}
```

where `bot` means no evidence, `t` positive evidence only, `f` negative
evidence only, and `top` both positive and negative evidence.  A valuation is a
function

```text
v : E -> B4.
```

The value `top` marks held inconsistency.  There are two lawful ways to use it:
as a unary exclusion, forbidding a single inconsistent event from settled
positions, or as a binary exclusion, forbidding two jointly inconsistent events.
For the arena construction, use the binary form:

```text
e #_v f  iff  pair(e,f) is assigned top by the induced pair valuation.
```

When only a unary valuation is available, the conservative derived conflict is:

```text
e #_v f  iff  e != f and (v(e) = top or v(f) = top).
```

This binary relation is symmetric, and its pairwise consistency predicate is
downward closed by Lemma 3.3.

### 3.3 Finite Configurations

A finite configuration is a finite subset `x subset E` such that:

1.  down-closure: if `e in x` and `d < e`, then `d in x`;
2.  consistency: `Con(x)`.

The set of finite configurations is written `C(E)`.

**Lemma 3.4.**  The empty set is a finite configuration.

**Proof.**  It is finite.  Down-closure is vacuous.  Consistency follows from
downward closure of consistency applied to any singleton, or from pairwise
generation vacuously.  QED.

**Lemma 3.5.**  If `x` is a finite configuration and `y subset x` is
down-closed, then `y` is a finite configuration.

**Proof.**  `y` is finite as a subset of a finite set.  It is down-closed by
hypothesis.  It is consistent by downward closure of `Con`.  QED.

**Lemma 3.6.**  Let `x` be a finite configuration and let `e notin x`.
Then `x union {e}` is a finite configuration exactly when `Past(e) subset x`
and `x union {e}` is consistent.

**Proof.**  If `x union {e}` is a configuration, down-closure gives
`Past(e) subset x union {e}`; irreflexivity excludes `e in Past(e)`, so
`Past(e) subset x`.  Consistency is part of being a configuration.  Conversely,
if `Past(e) subset x` and the union is consistent, down-closure holds for old
events because `x` was down-closed, and for `e` by the past condition.  QED.

This is the first arena-like object: configurations are lawful finite
positions-before-polarity.

### 3.4 Position and Play

A position must contain not only which events have occurred, but also what is
observable there.  Let `S` be a site of observable supports.  A support object
has at least:

1.  a base index `q`;
2.  a time or settlement stratum `tau`;
3.  an observable clopen or patch `U`.

A position is a triple

```text
p = (x, U, v)
```

where `x in C(E)` is a finite configuration, `U` is an observable support, and
`v : x -> B4` is a valuation on the events of `x`.  A position is admitted when
the valuation is a section over `U` and is compatible with the restrictions
prescribed by the site.

A play from position `p = (x,U,v)` to `p' = (y,V,w)` is an inclusion of
configurations `x subset y`, a support morphism `V -> U` or inclusion
`V subset U` according to the variance of observation, and valuation agreement
on the old events:

```text
w restricted to x = v.
```

In the finite event-structure view, a play is therefore a finite path in the
configuration category, not necessarily a linear sequence.  A linear play is the
special case where each extension adds one event and the chosen order of
extensions is recorded.

**Lemma 3.7.**  Plays compose.

**Proof.**  Configuration inclusions compose.  Support morphisms compose by the
category law of the site.  Restrictions of valuations compose because
restriction is functorial: if `z` restricts to `y` and `y` restricts to `x`,
then `z` restricts to `x`.  QED.

### 3.5 Polarity

An arena needs a distinction between environment-facing and agent-facing
extensions.  Let

```text
lambda : E -> {-,+}
```

be a polarity map.  Negative events are Opponent or environment moves; positive
events are Player or system moves.

A one-step extension `x -> x union {e}` has polarity `lambda(e)`.  Write

```text
x subset^- y
```

when `x subset y` and every event in `y \ x` is negative; define
`x subset^+ y` similarly.

The four-valued object gives a natural source of polarity when no external
player labelling has been supplied.  Write a value as a pair of booleans
`(positive evidence, negative evidence)`.  Then the first coordinate gives the
Player-facing assertion side and the second coordinate gives the
Opponent-facing refutation side.  For event-level polarity, one can use the
side by which the event first enters the valuation:

```text
lambda(e) = +  if e contributes positive evidence first,
lambda(e) = -  if e contributes negative evidence first.
```

When both coordinates enter simultaneously, the event is not a polarized move
without refinement; it must be split into a positive and a negative occurrence
or treated as an inconsistent non-move.  This is not a weakness of the arena
definition; it is the correct obstruction.

### 3.6 Symmetry and Isomorphism of Configurations

A configuration is a finite partially ordered set with inherited conflict,
polarity, support, and valuation.  An isomorphism of configurations

```text
theta : x ~= y
```

is a bijection `theta : x -> y` such that for all events `e,f in x`:

1.  `e < f` iff `theta(e) < theta(f)`;
2.  `e # f` iff `theta(e) # theta(f)`;
3.  `lambda(e) = lambda(theta(e))`;
4.  valuations agree: `v(e) = w(theta(e))`;
5.  support incidence is preserved.

A symmetry on the arena is a specified family of such isomorphisms closed under
identity, inverse, restriction to subconfigurations, and composition.

**Lemma 3.8.**  Configuration isomorphism is an equivalence relation.

**Proof.**  The identity bijection preserves all listed structure.  The inverse
of a structure-preserving bijection preserves the same iff-conditions.  The
composite of two such bijections preserves each structure by transitivity of
equality and iff.  QED.

Symmetry is necessary because an arena should not confuse event identity with a
particular surface presentation.  Two finite histories may have the same causal,
conflict, polarity, support, and valuation shape even when their event labels
differ.

### 3.7 Subarena and Subobject

A subobject of the arena is a monomorphism preserving the structure under
discussion.  Concretely, a subset `A subset E` determines a subobject when:

1.  it inherits causal order from `E`;
2.  it inherits conflict from `E`;
3.  it inherits polarity from `E`;
4.  it is closed under causal past: if `e in A` and `d < e`, then `d in A`;
5.  the site supports and valuations restrict to `A`.

A subarena is a subobject whose finite configurations are exactly the
configurations of the ambient arena contained in `A`:

```text
C(A) = { x in C(E) | x subset A }.
```

**Proposition 3.9.**  Every causally past-closed, conflict-inheriting,
polarity-inheriting subset `A` determines a subarena.

**Proof.**  If `x in C(A)`, then `x` is finite, down-closed in `A`, and
consistent in `A`; inherited order and conflict make it a configuration of
`E`.  Conversely, if `x in C(E)` and `x subset A`, then all causal
predecessors of events of `x` lie in `x`, hence in `A`; consistency and
polarity are inherited.  Thus `x` is a configuration of `A`.  QED.

Not every region is a subarena.  A future-closed region, for example, need not
be past-closed; it may contain an event while excluding the prerequisites that
make the event playable.

### 3.8 Cover and Overlap

Let `U` be an observable support.  A finite family `{U_i -> U}` is a cover when:

1.  every `U_i` is a subobject of `U`;
2.  their join or union is `U`;
3.  the family is active under pullback/base change;
4.  covers compose locally: a cover of each `U_i` refines to a cover of `U`.

The overlap of two subobjects `U` and `V` is their meet

```text
U cap V.
```

In a clopen Boolean algebra, meet is intersection and join is union.  For
positions with valuations, overlap also has an informational reading:

```text
Overlap_U,V(v,w) = { e in U cap V | v(e) = w(e) }.
```

For finite supports this can be counted.  The count is symmetric and bounded by
the size of the overlap support.

**Lemma 3.10.**  If `U_i` covers `U` and `V subset U`, then
`{V cap U_i}` covers `V`.

**Proof.**  Each `V cap U_i` is a subobject of `V`.  Distributivity gives
`V cap (join_i U_i) = join_i (V cap U_i)`.  Since `join_i U_i = U` and
`V subset U`, the left side is `V`.  QED.

This is the site-theoretic base-change axiom in the finite clopen case.

### 3.9 Valuation

A valuation on an arena is a function assigning a four-valued charge to each
claim/event cell:

```text
v : E -> B4.
```

The knowledge order is coordinatewise inclusion of evidence:

```text
(p,n) <=_k (p',n') iff p <= p' and n <= n'.
```

Knowledge join is coordinatewise disjunction.  Thus `bot = (0,0)` is least,
`top = (1,1)` is greatest, `t = (1,0)`, and `f = (0,1)`.

**Lemma 3.11.**  Knowledge join is a least upper bound.

**Proof.**  Coordinatewise disjunction is an upper bound for each coordinate.
If another value is above both inputs, each of its coordinates is above the
corresponding disjunction.  Therefore the join is least.  QED.

This valuation is not an optional annotation.  It supplies the order in which
settlement proceeds and the conflict marker for paraconsistent obstruction.

### 3.10 Settlement

A settlement operator is a closure operator `c : B4 -> B4` on the knowledge
order:

1.  inflationary: `a <=_k c(a)`;
2.  monotone: `a <=_k b` implies `c(a) <=_k c(b)`;
3.  idempotent: `c(c(a)) = c(a)`.

Extend it pointwise to valuations:

```text
(c v)(e) = c(v(e)).
```

A valuation is settled when `c v = v`.

**Lemma 3.12.**  For any closure operator `c`, `c(a)` is a fixed point.

**Proof.**  This is idempotence: `c(c(a)) = c(a)`.  QED.

**Lemma 3.13.**  `c(a)` is the least fixed point above `a`.

**Proof.**  Let `x` be a fixed point and suppose `a <=_k x`.  By monotonicity,
`c(a) <=_k c(x)`.  Since `x` is fixed, `c(x) = x`; hence `c(a) <=_k x`.
QED.

Settlement is therefore the mathematical operation that turns an admissible
local play history into a stabilized position.

### 3.11 Strategy

A strategy is a family `Sigma` of finite positions satisfying:

1.  nonempty: the initial empty position is in `Sigma`;
2.  prefix closure: if `p' in Sigma` and `p -> p'`, then `p in Sigma`;
3.  receptivity to Opponent: if `p in Sigma` and `p ->^- q` is a lawful
    negative extension, then `q in Sigma`;
4.  deterministic Player response: if `p in Sigma` and `p ->^+ q1`,
    `p ->^+ q2` are one-step positive extensions in `Sigma`, then `q1 = q2`
    up to allowed symmetry;
5.  settlement compatibility: every maximal finite position selected by
    `Sigma` has a settled valuation, and Player extensions do not decrease the
    knowledge valuation.

This is the finite deterministic specialization of event-structure strategies.
Nondeterministic strategies drop clause 4 and replace it with a receptivity and
composition condition; the present proof only needs the deterministic case.

**Proposition 3.14.**  A deterministic strategy selects at most one positive
one-step response, up to symmetry, after any position.

**Proof.**  This is exactly clause 4.  The qualification "up to symmetry" is
necessary because two different event labels can realize the same preserved
configuration shape.  QED.

**Proposition 3.15.**  A settlement-compatible strategy cannot require an
infinite strictly increasing chain of knowledge values on a finite event
support.

**Proof.**  On a finite support, valuations into `B4` form a finite product of
finite lattices.  A monotone chain in a finite poset eventually stabilizes.
Settlement compatibility requires Player extensions to be monotone in the
knowledge order, so no infinite strictly increasing chain exists.  QED.

## 4. The Arena Construction

We can now state the constructed object.

A finite settled polarized site-arena consists of:

1.  a finite event set `E`;
2.  a strict causal order `<` generated as reachability from an acyclic direct
    link graph;
3.  a pairwise conflict relation `#` generating finite consistency;
4.  a polarity map `lambda : E -> {-,+}`;
5.  finite configurations `C(E)` as down-closed conflict-free subsets;
6.  a small site of observable supports whose covers are fiber-local;
7.  four-valued valuations on events or claim cells;
8.  a settlement closure on valuations;
9.  a family of configuration isomorphisms preserving order, conflict,
    polarity, support, and valuation.

**Theorem 4.1.**  Every finite acyclic direct-causal graph equipped with
pairwise-generated conflict, polarity, a finite clopen observation site,
four-valued valuations, and a knowledge-order closure operator determines a
finite settled polarized site-arena.

**Proof.**  Lemma 3.2 turns the finite acyclic graph into a strict causal
relation.  Lemma 3.3 gives downward-closed consistency from pairwise conflict.
Lemmas 3.4-3.6 construct finite configurations and characterize lawful
one-step extensions.  The polarity map classifies extensions as negative or
positive.  Lemma 3.7 makes plays composable.  Lemma 3.8 supplies the
configuration-isomorphism equivalence relation, and a chosen closed family of
such isomorphisms supplies symmetry.  Proposition 3.9 characterizes subarenas.
Lemma 3.10 gives cover stability over overlaps in the finite clopen site.
Lemma 3.11 gives the knowledge-lattice valuation structure.  Lemmas 3.12-3.13
give settlement as least fixed point above a valuation.  The strategy clauses
then define lawful agents over the resulting position category, with finite
settlement guaranteed by Proposition 3.15.  These data are exactly the listed
components of a finite settled polarized site-arena.  QED.

The theorem has not identified an Obsmetrologia object yet.  It has proved what
must be present before the word "arena" is earned.

## 5. Main Identification

**Theorem 5.1.**  In Obsmetrologia mathematics, the arena is realized by the
finite causal event structure together with four-valued valuation/settlement
and the fiber-local site of clopen observable supports.  Its events are the
listed causal events; causality is directed reachability; configurations are
finite down-closed conflict-free event histories; polarity is supplied by the
positive/negative sides of the four-valued charge or by an explicit
claim/refutation role labelling; subobjects are causally past-closed
structure-preserving event/support inclusions; covers are fixed-fiber clopen
covers; overlaps are clopen meets with valuation agreement; settlement is the
knowledge-order closure fixed point; and strategies are prefix-closed
settlement-compatible families of polarized position extensions.

**Proof.**  The formalized finite causal-order component supplies a finite list
of events, a direct link graph, acyclicity, directed reachability, transitivity,
irreflexivity, and asymmetry.  By Lemma 3.2 it therefore supplies the causal
event order required by Theorem 4.1.

The formalized four-valued component supplies the value object `B4`, its
positive and negative coordinates, the knowledge order, knowledge join and meet,
least and greatest knowledge values, and the fixed-point settlement closure.
By Lemmas 3.11-3.13 it supplies valuation and settlement.

The formalized site component supplies a finite clopen Boolean algebra,
subobject inclusion derived from meet, site objects carrying base, stratum, and
clopen support, fiber morphisms, cover families, identity covers, pullback
stability, transitivity/local character, and the fact that covers are
fiber-local rather than temporal.  By Lemma 3.10 and Theorem 4.1 it supplies
subobjects, covers, overlaps, and locality.

The formalized sheaf and settlement components supply global sections,
separation, unobstructed gluing in the strict finite regime, and the recurring
shape "base plus admitted content."  These give the admission and settled
position layer required for strategies to act on positions rather than on raw
events.

The remaining input required by Theorem 4.1 is polarity.  The four-valued value
object contains positive and negative coordinates; the verification-game layer
also contains explicit claim/refutation roles.  Either source supplies the
polarity map, provided simultaneous positive-and-negative events are refined or
classified as inconsistent non-moves.  With that proviso, all hypotheses of
Theorem 4.1 are met.  Therefore the Obsmetrologia structure just listed realizes
the finite settled polarized site-arena.  QED.

**Status.**  The theorem is a paper-level packaging theorem over already
formalized constituents.  The causal order, four-valued lattice, settlement
closure, finite site cover laws, sheaf separation, and runtime strategy
certificate pieces are individually formalized.  A single bundled declaration
named as an arena, with all fields and preservation maps in one record, remains
an open formalization obligation.  The mathematical identification above does
not depend on that packaging name.

## 6. Subobject Analysis

This section recursively exposes the constituent elements of the subobjects
discussed by the theorem.

### 6.1 Event Subobject

An event subobject is not a module or a region name.  It consists of:

1.  a subset `A` of events;
2.  inherited direct links between events of `A`;
3.  inherited directed reachability;
4.  proof that if `e in A` and `d < e`, then `d in A`;
5.  inherited conflict;
6.  inherited polarity;
7.  restricted valuation.

It is a subarena exactly when its configurations are the ambient
configurations contained in `A`.

### 6.2 Support Subobject

A support subobject consists of:

1.  a base index `q`;
2.  a settlement stratum `tau`;
3.  a clopen support `U`;
4.  a smaller clopen `V`;
5.  a proof `V subset U`, expressed algebraically as `V meet U = V`.

Its overlap with another support `W` is `V meet W`.  Its union in a cover is
the finite join of the family.

### 6.3 Cover Subobject

A cover of `U` consists of:

1.  a finite list of clopen supports `U_1,...,U_n`;
2.  for each `i`, a proof `U_i subset U`;
3.  a proof `U_1 join ... join U_n = U`.

The pullback of this cover along `V subset U` is the list

```text
V meet U_1, ..., V meet U_n.
```

The proof that it covers `V` is the distributive law:

```text
V meet (join_i U_i) = join_i (V meet U_i).
```

### 6.4 Valuation Subobject

A valuation subobject over a finite support `x` consists of:

1.  the support set `x`;
2.  a charge assignment `v : x -> B4`;
3.  for each `e in x`, two booleans: positive evidence and negative evidence;
4.  knowledge-order comparisons between old and new values;
5.  restriction maps along support inclusions.

The inconsistency part is the subobject supported where the value is `top`.
The truth part is the subobject supported where the value is `t`.  Their split
is not a metaphor: the four-valued coordinates make it a concrete partition of
support by value.

### 6.5 Settlement Subobject

A settlement consists of:

1.  a base object;
2.  a type of content that may live over that base;
3.  an admission predicate saying when the content is lawful;
4.  an actual content element;
5.  a proof of admission.

For the arena, the base is a local event/support/cover datum, the content is a
valuation section or play effect, and the admission predicate says it is
compatible with causality, cover restrictions, and settlement.

### 6.6 Strategy Subobject

A strategy subobject consists of:

1.  a collection of finite positions;
2.  the empty initial position;
3.  prefix closure under subplays;
4.  closure under negative extensions;
5.  deterministic positive response up to symmetry;
6.  monotonicity of knowledge valuation;
7.  settledness at maximal finite positions.

It is not merely a function from states to actions.  The domain of the function
is a category of finite configurations with support and valuation; the codomain
is constrained by polarity, causality, conflict, and settlement.

## 7. Examples and Nonexamples

### 7.1 Example: A Two-Event Question/Answer Arena

Let `E = {q,a}` with `q < a`.  Let `lambda(q) = -` and `lambda(a) = +`.  Let
there be no conflict.  The finite configurations are:

```text
empty, {q}, {q,a}.
```

The set `{a}` is not a configuration because it is not down-closed.  A strategy
that contains `empty`, `{q}`, and `{q,a}` is receptive to the Opponent question
and answers it.  A strategy containing `empty` but not `{q}` is not receptive.
This is the sequential arena shape recovered as a special case.

### 7.2 Example: Concurrent Independent Events

Let `E = {o,p}` with no causal relation and no conflict.  Let `lambda(o) = -`
and `lambda(p) = +`.  The configurations are:

```text
empty, {o}, {p}, {o,p}.
```

The two one-event positions are incomparable.  A linear justified-sequence
arena must choose an order when both occur in a play; the event-structure arena
records that the order is not causal structure.  This is why the concurrent
arena notion is the correct public target for Obsmetrologia.

### 7.3 Example: Conflict from Inconsistency

Let `E = {e,f}` with no causal relation.  Suppose the pair valuation assigns
`top` to `{e,f}`.  Then `e # f`, so the configurations are:

```text
empty, {e}, {f}
```

but not `{e,f}`.  The valuation does not erase the two alternatives; it prevents
their joint settlement in one configuration.

### 7.4 Example: Fiber-Local Cover

Let a support `U` split as `U = U_1 join U_2`.  A valuation section over `U`
can be checked locally by restricting to `U_1` and `U_2` and checking agreement
on `U_1 meet U_2`.  Pulling the cover back along `V subset U` gives
`V meet U_1` and `V meet U_2`.  This is an arena-local observation cover, not a
temporal progression.

### 7.5 Nonexample: A Future-Closed Region Alone

A future-closed region says that if an event is inside and it causally precedes
another event, then the future event is inside.  A playable subarena needs the
opposite closure condition: if an event is inside, its causal prerequisites are
inside.  Therefore a future-closed region alone is generally not a subarena.
It may become an arena subobject only after intersecting with, or replacing it
by, a causally past-closed support.

### 7.6 Nonexample: A Valuation Without Causality

A function `E -> B4` is not an arena.  It has informational standing but no
enabling relation, no configurations, no plays, and no strategies.  It becomes
arena data only when attached to causal events and local supports.

### 7.7 Nonexample: A Site Without Events

A site with covers and overlaps is not an arena by itself.  It has locality but
no event occurrence, polarity, or causal extension.  It becomes arena data when
its objects support positions and its covers control local observation of
valued configurations.

### 7.8 Nonexample: A Runtime Tournament Certificate Alone

A finite certificate of no profitable deviation is not an arena.  It is a
strategy/equilibrium statement over a play space.  It becomes evidence for an
arena only when the play space is supplied by the causal event-site and the
settlement relation.

## 8. Conclusion

The proof forces a specific answer.  An arena in Obsmetrologia mathematics is
not a private name for a region, a hole, a carrier, or a state object.  It is
the finite settled polarized causal event-site: causal events generate finite
configurations; conflict and four-valued valuation determine consistency;
polarity turns extensions into Opponent and Player moves; clopen site objects
and covers determine local observable subobjects and overlaps; settlement
turns local valuations into fixed-point positions; and strategies are
settlement-compatible polarized families of plays.

The answer is therefore structural:

```text
Obsmetrologia arena =
  finite causal event structure
  + polarity
  + FOUR valuation
  + fiber-local site covers
  + sheaf/settlement gluing
  + strategy laws over finite positions.
```

The live mathematics already proves the main constituents.  What remains open
is not the mathematical identification, but the formal packaging theorem that
bundles these constituents into one named arena record and proves the
projection from each constituent component into that record.

## Appendix A. Formalization Evidence and Open Obligations

This appendix is evidence only.  The public mathematics above does not depend
on private file names as explanatory substance.

### A.1 Proved Components in the Live Obsmetrologia Corpus

The finite causal event structure is formalized in
`Obsmetrologia/CausalSets/Causal/Order.lean`.  It supplies:

1.  a finite listed event support;
2.  a direct causal-link graph;
3.  an acyclicity witness;
4.  proof-carrying events;
5.  directed reachability;
6.  transitivity, irreflexivity, and asymmetry of reachability;
7.  the theorem that causal settling is transitive closure;
8.  strict finite regime and vanishing first cohomology for finite causal
    settling.

The four-valued charge and valuation structure is formalized in
`Obsmetrologia/Language/Positing/Charge.lean`,
`Obsmetrologia/Language/Positing/Four.lean`,
`Obsmetrologia/Language/Positing/Valuation.lean`, and
`Obsmetrologia/Language/Settling.lean`.  These files supply:

1.  the four-value object as two evidence coordinates;
2.  knowledge and truth operations;
3.  knowledge order;
4.  least and greatest knowledge elements;
5.  knowledge join as least upper bound;
6.  closure operators;
7.  settlement as fixed point and least fixed point above a seed;
8.  pointwise settlement of valuations.

The site and cover structure is formalized in
`Obsmetrologia/Site/Basic.lean` and `Obsmetrologia/Site/Sheaf.lean`.  These files
supply:

1.  clopens as a finite Boolean algebra;
2.  inclusion derived from meet;
3.  site objects with base, stratum, and clopen support;
4.  fiber morphisms and their identity/composition laws;
5.  covers as finite join-covers;
6.  identity cover, pullback-stability, and transitivity/local character;
7.  the theorem that the cover relation is fiber-local and not temporal;
8.  sheaf sections and separation.

The inconsistency sheaf evidence is formalized in
`Obsmetrologia/Cohomology/InconsistencySheaf.lean`.  It supplies:

1.  the `top`-supported inconsistency subobject;
2.  restriction of inconsistency sections;
3.  zero section behavior for consistent valuations;
4.  degree-zero inconsistency counts;
5.  vanishing first cohomology for the finite gluing datum.

The settlement shape is formalized in `Obsmetrologia/Settlement.lean`.  It
supplies the abstract structure:

1.  base;
2.  content over the base;
3.  admission predicate;
4.  actual content;
5.  proof that the content is admitted.

The strategy/equilibrium certificate surface is formalized in
`Obsmetrologia/GameTheory/VerificationTournament.lean`.  It supplies:

1.  claim/refutation roles;
2.  structural readings of finite plays;
3.  operational witness obligations;
4.  survivor readings;
5.  Nash no-deviation and survivor correspondence;
6.  a runtime theorem assembling settled finite tournament obligations.

Finite overlap counting is formalized in
`Obsmetrologia/AperiodicOrder/GlassDynamics/Overlap.lean`.  It supplies the
generic finite configuration-overlap count and proves self-overlap, symmetry,
and the length bound.

### A.2 Paper-Level Derivations Not Yet Bundled as One Lean Object

The paper-level construction uses the proved components above to define:

1.  `FiniteSettledPolarizedSiteArena`;
2.  finite configurations as down-closed conflict-free event subsets;
3.  position triples `(configuration, support, valuation)`;
4.  plays as composable inclusions with support restriction and valuation
    agreement;
5.  configuration isomorphisms preserving causality, conflict, polarity,
    support, and valuation;
6.  subarenas as causally past-closed structure-preserving subobjects;
7.  deterministic settlement-compatible strategies.

These are mathematically determined by the existing formalized components, but
they are not yet one exported Lean structure.

### A.3 Open Formalization Obligations

The following obligations remain to make Theorem 5.1 a single formal theorem:

1.  Define a bundled arena structure with fields for finite events, causal
    reachability, conflict, polarity, configurations, site supports, covers,
    valuation, settlement, and symmetry.
2.  Prove that directed reachability from the existing finite acyclic causal
    graph supplies the arena causality field.
3.  Choose and formalize the conflict source: either a pair valuation into
    the four-valued inconsistency value, or a conservative unary-top conflict
    construction.
4.  Define configurations as finite down-closed conflict-free lists or finite
    sets, and prove the extension lemma.
5.  Define position and play categories, including valuation restriction.
6.  Define symmetry families on configurations and prove closure under
    identity, inverse, restriction, and composition.
7.  Define subarena preservation and prove the past-closed subobject theorem.
8.  Attach site covers to positions and prove pullback cover stability at the
    arena level.
9.  Define deterministic and nondeterministic strategy structures over the
    arena and connect the existing finite verification-tournament certificate
    to deterministic settlement-compatible strategies.
10. Prove the final packaging theorem: the existing Obsmetrologia finite causal
    order plus four-valued valuation/settlement plus finite clopen site covers
    instantiates the bundled arena.

## Bibliography

Abramsky, Samson, Radha Jagadeesan, and Pasquale Malacaria. "Full Abstraction
for PCF."  The arXiv record describes the game model of PCF in which types are
interpreted by games and terms by strategies.
https://arxiv.org/abs/1311.6125

Belnap, Nuel D. "A Useful Four-Valued Logic." In J. Michael Dunn and George
Epstein, eds., *Modern Uses of Multiple-Valued Logic*, Episteme 2, Springer,
1977.  The publisher abstract states the motivation: four-valued logic prevents
minor inconsistencies in a database from entailing irrelevant conclusions.
https://link.springer.com/chapter/10.1007/978-94-010-1161-7_2

Bombelli, Luca, Joohan Lee, David Meyer, and Rafael D. Sorkin. "Space-Time as
a Causal Set." *Physical Review Letters* 59 (1987): 521-524.  The APS abstract
states the causal-set proposal as a locally finite set with a partial order
corresponding to macroscopic causal order.
https://link.aps.org/doi/10.1103/PhysRevLett.59.521

Castellan, Simon, Pierre Clairambault, Silvain Rideau, and Glynn Winskel.
"Games and Strategies as Event Structures." arXiv:1604.04390, 2016.  The
paper gives a self-contained account of games and strategies based on event
structures and characterizes strategies preserved by composition with copycat.
https://arxiv.org/abs/1604.04390

Fitting, Melvin. "Bilattices in Logic Programming."  The paper summarizes
bilattices as generalized truth-value spaces with two lattice orderings, one
for truth and one for information/knowledge.
https://id144254.securedata.net/melvinfitting/bookspapers/pdf/papers/BilInLP.pdf

Hyland, J. M. E., and C.-H. Luke Ong. "On Full Abstraction for PCF: I, II, and
III." *Information and Computation* 163, no. 2 (2000): 285-408.  The Stanford
Encyclopedia of Philosophy records Hyland-Ong and Abramsky-Jagadeesan-Malacaria
as the originating game-semantic solutions to full abstraction for PCF.
https://plato.stanford.edu/entries/games-abstraction/

The Stacks Project Authors. "Sites."  Definition 59.10.2 defines a site as a
category with covering families satisfying isomorphism, locality, and base
change.
https://stacks.math.columbia.edu/tag/03NF

Winskel, Glynn. "Event Structures."  The Cambridge PDF describes event
structures as processes represented by event occurrences with causal dependence,
consistency, and enabling, and relates configurations to process states.
https://www.cl.cam.ac.uk/~gw104/Winskel1987_Chapter_EventStructures.pdf

Winskel, Glynn. "Event Structures with Symmetry."  The corrected Cambridge PDF
defines finite configurations as consistent down-closed histories and explains
how symmetry allows finite configurations to be rearranged bijectively by
allowed isomorphisms.
https://www.cl.cam.ac.uk/~gw104/EvStrswSymm-Corrected.pdf
