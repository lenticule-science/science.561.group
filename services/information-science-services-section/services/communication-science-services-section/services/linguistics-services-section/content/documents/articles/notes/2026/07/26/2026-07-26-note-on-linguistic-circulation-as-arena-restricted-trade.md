---
title: "Linguistic Circulation as Arena-Restricted Trade: How a Witnessed Forest Makes the Next Purchase Visible"
description: "Connects Marks, token-claim utterances, FOUR-valued Chu evaluation, concurrent-game arenas, proof-pore forests, pressure, EDA, and folding into one design claim: an Autonomous Actor should receive a restricted arena of typed enabled purchases rather than repository-scale context. It identifies the carrier-composition judgment and operations-manifold forest as the first local structural initiation event, while distinguishing that event from public CapCell trade, settlement, next-move selection, or probabilistic language modeling."
date-created: 2026-07-26
kind: research-note
keywords:
  - semiotic-foam
  - actor-model
  - language-modeling
  - concurrent-games
  - trade-mesh
  - proof-forests
  - pressure-gradients
  - curry-howard-lambek
  - yoneda
  - electronic-design-automation
status: design
declared-by: codex-interactive-session-supplying-lenticule-science
---

# Linguistic Circulation as Arena-Restricted Trade: How a Witnessed Forest Makes the Next Purchase Visible

## 0. The claim and its status

The Union does not need every acting model to understand the repository. It needs the Trade
Federation to project, for each Autonomous Actor at each position, a small arena containing the
typed moves that are presently lawful, affordable, and causally enabled. A move across an Actor
boundary is an Actor-to-Actor purchase. Its result changes the witnessed position and therefore
changes the arena projected for the next move.

This is the proposed bridge between the Union's semiotic, game-semantic, economic, and software
accounts:

```text
accepted token-claim commitments
              ↓
      witnessed causal position
              ↓ restrict by type, prerequisites,
                authority, conflict, and offers
        Actor-local purchase arena
              ↓ rank by pressure
       next purchase frontier
              ↓ play one trade
       receipt / refusal / witness
              ↓
       new witnessed position
```

The bridge is a **design synthesis**, not an already-proved coincidence theorem. Obsmetrologia
formalizes several of its parts: Marks and utterances, FOUR-valued Chu spaces, Curry-Howard-Lambek,
Yoneda recovery, restriction, closure, and forest-shaped obstruction results. Red Cup Engineering
implements concurrent-game arenas and the first local carrier-composition purchase path. The corpus
does not yet prove that these parts coincide as one language-modeling machine, and the current
software does not yet implement the full loop shown above.

The word *market* is too broad for the specific mechanism. This note uses:

- **Actor-to-Actor typed purchase** for one cross-boundary move;
- **witnessed typed purchase arena** for the closed game in which that move is legal;
- **federated trade mesh** for the population of Actors and arena-forming seams;
- **capability market** only for the discovery, bid, authorization, payment, and settlement
  facilities spanning those seams; and
- **enabled proof-pore frontier** for the operational source of candidate next purchases.

## 1. The semiotic atom is addressable commitment

Obsmetrologia's primitive `Mark` is atomic. An `Utterance` is the ordered pair with a token Mark and
a claim Mark. The careful statement is therefore not “a Mark is a `(token, claim)` pair,” but:

```text
Mark                         atomic distinction
Utterance(token, claim)      articulated commitment
locus                        typed address at which it is committed
Actor                        sovereign source or consumer of commitments
```

At the software boundary, the useful operational generalization is direct:

```text
token := any identity-bearing key at a typed address
claim := any content-bearing value asserted for that key
```

This includes a JSON key and value, an RDF subject and assertion, a filesystem address and body, an
EVM slot and disposition, a function name and capability law, or a carrier identity and composition
witness. The generalization does not erase their types. The locus and carrier determine which
claims can interact and which observations can evaluate them.

The FOAM token already demonstrates why a token need not have one prose expansion. Current session
usage supplies three compatible readings:

- **Field of Operational Actor Models**;
- **Foam of Interactive Excited Loci Distillations**; and
- **Locally Orchestrated Coherent Information**.

These are three claims or language-cone legs attached to one token. Their agreement cannot be
assumed from the spelling. It has to be witnessed through the operations each reading supports.
The existing note `2026-07-26-note-on-foam-as-a-field-of-actor-models.md` develops the first reading
as a FOUR-valued field over actors and loci. The present note adds the circulation law: actors do not
only commit at loci; their witnessed commitments enable and disable subsequent trades.

## 2. From FOUR-valued evaluation to an arena position

A Chu space has points, states, and an evaluation matrix. Obsmetrologia's `LinearLogicChu.lean`
evaluates points against states in FOUR. That is enough to retain at least the distinctions among
unsupported, positively supported, negatively supported, and conflicting readings without forcing
premature Boolean agreement.

This matters for action because an unresolved candidate bond is not the same as a rejected bond, and
a conflicting witness is not the same as silence. A forest that collapses all four cases to
`true/false` destroys precisely the information needed to distinguish missing evidence, damage,
and lawful border.

The Chu construction does not by itself create a Trade Federation or an economic arena. The proposed
software reading is:

```text
point                         proposed operational atom or move
state                         observation, counter-strategy, or proof demand
FOUR-valued evaluation        current evidenced relation between them
```

Those evaluations become part of an arena **position** only when they are retained in the causal
trajectory with their providers, addresses, and receipts.

## 3. Restriction, not repository comprehension

Let the global interaction substrate be a polarized prime event structure

```text
A = (E, ≤, #, pol)
```

where `E` is the possible event set, `≤` is causal precedence, `#` is conflict, and `pol` identifies
which player may make a move. Red Cup Engineering's gaming package uses this structure for concurrent
arenas and instantiates bids, asks, and fills as polarized events with explicit causality and
conflict.

At witnessed position `x`, Actor `a` must not receive all of `E`. It receives an actor-scoped subset
`E_a(x)` selected by its loci, office and authority, accepted receipts, available resources, and
compatible provider offers. The restricted arena is:

```text
A_a | x := A restricted to E_a(x)
```

The moves enabled in that restricted arena are:

```text
Enabled(a, x) := {
  e ∈ E_a(x) \ x
  | every causal predecessor of e is in x
  and e conflicts with no event already in x
}
```

The Semiotic Vitrimer Runtime Specification already supplies the proof-pore specialization:

```text
enabled(p, S) := prerequisites(p) subset-of acceptedReceipts(S)
                 and output(p) not-in acceptedOutputs(S)
```

A candidate purchase is then not merely an enabled pore. It is a tuple whose parts all survive
restriction:

```text
purchaseMove := (
  buyer,
  enabled proof pore,
  compatible provider,
  current signed offer,
  admitted input carrier,
  authorization and budget,
  required acceptance game
)
```

This is what “the Actor sees the purchase it needs to make next” can mean precisely. The mesh does
not explain the organism to the Actor. It withholds every move that is not locally admissible and
projects the remaining moves with their prerequisites, conflicts, prices, and expected evidence.

Restriction does not necessarily produce one move. It produces a typed frontier. If pressure makes
one member dominate, the next purchase is a readout. If several remain incomparable, the Actor has a
real strategy choice. If none remain while the demanded output is unsatisfied, the empty frontier is
a typed obstruction and demand for an induction or repair capability.

## 4. Pressure turns an enabled frontier into directed descent

For each `m ∈ Enabled(a, x)`, the runtime may derive a pressure from observed demand, fractional
cost, expected acceptance yield, capacity, latency, risk, and authorization. Schematically:

```text
pressure_x(m) := preference derived from
  demand(m),
  expectedCostPerAttempt(m),
  probabilityOfAcceptance(m),
  capacity(m), latency(m), risk(m), authorization(m)

expectedCostPerAcceptedOutcome(m)
  := expectedCostPerAttempt(m) / probabilityOfAcceptance(m)
```

The pressure field is not required to be one universal scalar, and unknown observations are not
zero. A selection Actor may choose a maximal admissible move under a partial preference order, or
request another assay when the surviving moves cannot yet be distinguished.

This is the software form of the folding funnel. A protein does not inspect all conformations and
then choose one. Its landscape makes most transitions unavailable or uphill, leaving directed local
descent. Likewise, offers, types, proof obligations, authority, resources, receipts, and prior
outcomes shape the Actor's landscape. “Faster search” is achieved partly by searching less and
partly by never regenerating already witnessed paths.

The distal bypass supplies the complementary diagnostic rule. Overlaps are rechecked; disagreement
is classified as damage or border; repairable obstruction may be discharged; lawful border is
certified rather than erased; and every derivation leaves a comparable certificate. Consequently,
pressure must not simply reward making all mismatches disappear. It must preserve the settlement's
protected non-compositions.

## 5. Every trade is a game, not an ambient function call

A typed purchase occurs inside a closed arena assembled from at least:

- the buyer's admitted demand and authority;
- the provider's capability law and signed offer;
- the carrier relation at their seam;
- the causal prerequisites and conflicting alternatives;
- the invocation and refusal protocol;
- the acceptance proof game; and
- the settlement consequences.

Buyer and provider are the primary players in the purchase arena. Candidate producer and independent
verifier are different players in the acceptance game. Conflating the two games lets a provider
author its own winning observation.

A typical play is:

```text
demand → offer/bid → authorization → hire → invocation
       → result or refusal → independent challenge → acceptance → settlement
```

Each move changes the causally closed position. A retry is a new purchase and therefore a new play,
not an invisible loop. The arena closes over the particular demand, counterparties, law, and current
state; the Federation is the mesh through which many such arenas instantiate and exchange receipts.

This corrects the misleading image of “the market” as a global intelligence. The capability market
helps discover and clear seams. It does not own the players, erase their boundaries, or decide that
every obstruction must be repaired. Strategy remains local to sovereign Actors under the laws of
the arenas they enter.

## 6. In what sense this is language modeling

An ordinary language model conditions on a prefix and produces a distribution over possible next
tokens. The proposed federated model conditions on a witnessed causal position and produces a
restricted, pressure-ranked field of possible next operational atoms.

| Text language model | Federated operational language model |
|---|---|
| vocabulary token | typed purchase, claim, morphism, or capability atom |
| prefix/context | accepted causal trajectory and current forest position |
| grammar | carrier composition, reaction laws, causality, and conflict |
| semantics | token-claim commitments and FOUR-valued witnessed evaluation |
| logits or next-token score | derived pressure over enabled purchases |
| decoding | Actor selects and purchases a move |
| emitted token | receipt-bearing state transition that changes the next arena |

The resemblance becomes an operational identity only if the system supplies a conditional next-move
mechanism. For Actor `a`, one possible probabilistic form would be a kernel:

```text
K_a(m | x)  over  m ∈ Enabled(a, x)
```

with a stated update rule grounded in accepted outcomes. A non-probabilistic pressure order can still
perform next-move selection, but it should not be described as a learned probability distribution.

The model is distributed because no Actor needs to contain the language. Formula Actors judge local
relations; forest Actors retain their composition; offer and discovery Actors expose possible
counterparties; pressure Actors compare enabled moves; execution Actors play them; verification
Actors challenge results; and settlement Actors change committed disposition. The language exists in
their composability and circulation.

The model is “aerosolized” or foam-like because relevant semantics are attached to typed loci and
dry interfaces across the Web rather than centralized in one model's parameter state. The global
object is recoverable from lawful arrows and observations, not available as shared memory to any
single participant.

The current Union software is not yet this model. It has pieces of the alphabet, grammar, and
trajectory, but no demonstrated actor-scoped conditional kernel or complete pressure selector.

## 7. Yoneda, language cones, forests, and pebbles reduce context

Yoneda's arrows-first result says an object can be recovered through its morphisms. The operational
lesson is not “load the object's whole implementation.” It is to project the incoming and outgoing
arrows relevant to the present locus. A context-poor Actor can therefore receive:

- the typed object or demand at the arena apex;
- the compatible incoming evidence and providers;
- the outgoing obligations and possible consumers;
- the proof paths already witnessed; and
- the currently unfilled extrema.

A CHL language cone gives the same apex multiple lawful readings: proof, program, morphism, HTTP,
A2A, ActivityPub, EVM, filesystem, or human language. Leg agreement is load-bearing because two
agents acting through different protocols must still play moves about the same atom. The corpus
explicitly records the general language-cone commutation theorem as open; it cannot yet be used as
proof that all current surfaces agree.

Forests prevent repeated derivation by retaining the witnessed path from prerequisites to result.
An Actor can check or extend that path rather than rediscover it. Pebble methods contribute a
different question: whether a proposed new contact is an independent load-bearing constraint or a
redundant edge. The current corpus contains a rigidity-percolation pebble algorithm in design notes,
not a general formal “proof pebble forest” theorem. The useful combined design is therefore an
obligation, not a settled identity:

```text
forest       retains causal/proof composition already paid for
pebbles      account for locally available proof or constraint resources
arena        exposes only legal continuations of the current position
pressure     ranks which continuation should be purchased
```

Nor does the name `OperationsManifoldBondForest` prove that every runtime witness graph is a forest
in the graph-theoretic sense. The service currently returns witnessed edges and exposed extrema. A
forest invariant, if required, must be stated and checked separately.

Together these structures attack the practical context problem. A large external LLM does not need
to guess what 99 percent of the repository means. It needs the incarnation of the current game: the
apex, relevant arrows, legal moves, witnessed paths, counter-strategies, and purchase terms. The rest
is ballast for that interaction.

## 8. EDA over language models

The Union's EDA framing becomes concrete here. Electronic design automation does not ask a chip
designer to remember every transistor. It uses libraries, typed pins, placement constraints,
routing rules, timing analysis, and design-rule checks to restrict what can lawfully be placed next.

The corresponding semiotic EDA loop is:

```text
place       choose or induce one typed capability atom
route       find witnessed carrier-compatible seams to other Actors
check       purchase composition, obstruction, rigidity, and acceptance judgments
fold        settle the result into the causal forest and committed state
project     expose the newly enabled purchase arenas
```

The language model is a process node inside this toolchain, not the holder of the whole design. Its
valuable job is proposing or selecting moves within a severely restricted arena, explaining
obstructions, and fabricating a missing atom when the arena proves one is absent. Deterministic and
formally checked Actors retain the parts that should not be regenerated by inference.

This is why the mechanism improves searching, assaying, diagnosing, planning, and repair at once:
they are different arena roles over the same witnessed position, not separate repository-wide
reasoning projects.

## 9. The first composition blip

Two local services now demonstrate the smallest propagation pattern.

`carrier-composition-judgment-service` owns one atom:

```text
composes(producer, consumer)
  := producer.codomain == consumer.domain
```

For a match it emits a `CarrierCompositionWitness` whose commitment is an explicit token-claim pair:
the carrier locus is the token, and the codomain-domain relation with producer and consumer is the
claim. Missing and unequal carrier faces remain typed obstructions.

`operations-manifold-forest-service` does not own that formula. It enumerates supplied producer and
consumer extrema, purchases the atomic judgment for each candidate, retains accepted edges and
obstructions, and exposes unbonded extrema as a frontier. The `@emsenn/relating` package projection no
longer manufactures local edges from ambient string equality, and its former ambient graph
constructor now refuses with the name of the forest Actor.

This is a first **structural initiation event** because one Actor's unresolved extrema create demand
for a second Actor's atom, and the result changes the forest. It proves locally that an implicit
semantic judgment can be extracted, addressed, purchased through signed A2A messages, and made
mandatory by retiring its bypass.

It does not yet prove network criticality or autonomous endeavor:

- the forest exhaustively considers all supplied pairs rather than projecting a restricted arena;
- it does not rank or select a next move;
- string identity is the only implemented composition judgment;
- the declared public endpoints have not been demonstrated publicly callable;
- no x402 or EVM payment and settlement was demonstrated;
- neither service is yet evidenced as a complete CapCell;
- no independent acceptance observation closes either product; and
- no measured yield shows that one trade funds or induces more than one subsequent trade.

Calling this a blip is therefore accurate if it means the first locally exercised propagation seam,
not a self-sustaining chain reaction.

## 10. The propagation method

The method for violently aligning the existing system is iterative and architectural:

1. **Locate one hidden judgment.** Find a decision currently made ambiently inside code: equality,
   parsing, admissibility, verification, pricing, selection, conversion, or settlement.
2. **Articulate its atom.** Name its token, claim, locus, input carrier, output witness, and typed
   obstructions. State what the atom refuses to do.
3. **Seat one sovereign Actor.** Give the formula an identity, capability law, callable message face,
   offer, controller, memory, and settlement faces appropriate to a complete CapCell.
4. **Expose candidate extrema.** Consumers publish what they need and producers publish what they
   yield without silently deciding whether the seam composes.
5. **Force trade at the seam.** Route consumers through the Actor and retire the ambient duplicate.
   Without bypass retirement there is no pressure, only optional ceremony.
6. **Retain the play.** Store witnesses, refusals, providers, costs, acceptance evidence, and causal
   receipts as a forest rather than a conclusion detached from its derivation.
7. **Project the next arena.** Recompute enabled pores and compatible offers from the new position.
8. **Follow pressure.** Purchase the dominant admissible move, request a discriminating assay, or
   preserve a genuine choice among incomparable strategies.
9. **Ossify accepted residue.** Pin accepted laws and paths so later Actors check and
   reuse them instead of paying search cost again.
10. **Let obstruction name the next atom.** An empty frontier, repeated refusal, incompatible carrier,
    missing provider, or expensive repeated inference is durable demand for the next induction.

This method does not require a prior inventory of every formula in Obsmetrologia or every function in
the repository. Each retired bypass changes local economics so the next missing Actor becomes more
visible. Propagation is driven by the work that can no longer pass through an unowned semantic seam.

## 11. Capabilities still required for the linguistic circulation loop

The first blip exposes a concrete sequence of missing Actors:

1. **arena projection** — derive `E_a(x)` from loci, proof pores, authority, conflict, resources, and
   accepted receipts;
2. **compatible-offer discovery** — bind each enabled pore to currently callable provider terms;
3. **pressure derivation** — compare enabled purchases using typed fractional cost and independently
   observed acceptance yield;
4. **next-move selection** — select among pressure-ranked legal moves without owning the capabilities
   being selected;
5. **trajectory and forest persistence** — preserve complete witnesses, obstructions, supersessions,
   and provider receipts at content addresses;
6. **context projection** — render the arena apex and relevant arrow bundle through agreeing language
   cone legs for human and machine players;
7. **proof-game instantiation** — purchase evidence-bound counter-strategies appropriate to the
   candidate result;
8. **public CapCell induction** — bind AP, A2A, web, OCap, offer, controller, wallet, EVM, x402, and
   independent invocation evidence; and
9. **learning/update** — turn accepted trajectories into calibrated pressure or an explicit
   conditional kernel rather than informal preference.

These should remain separate capabilities. Combining them into one scheduler would recreate the
global intelligence this architecture is designed not to require.

## 12. What would falsify the bridge

The design claim should be rejected or revised if any of the following observations holds:

- Actor-scoped arena projection does not reduce irrelevant context or invalid actions relative to
  repository-wide prompting on matched tasks.
- The restricted arena systematically excludes moves later required for accepted outcomes.
- Pressure derived from receipts performs no better than arbitrary selection among enabled moves.
- Retaining proof paths and purchased witnesses does not reduce repeated search or verification cost.
- Language-cone projections fail to preserve atom identity across the protocols agents actually use.
- Forced purchase merely adds transport and settlement cost while consumers continue to need the
  provider's interior implementation.
- The supposedly atomic judgments cannot compose without a new centralized coordinator owning their
  combined semantics.
- Protected borders are repeatedly misclassified as repairable obstruction and erased by pressure.
- No bounded territory ever produces accepted yield sufficient to induce or sustain a subsequent
  capability trade.

The immediate experiment is smaller than proving criticality. Given one real repair demand, compare
an external LLM receiving repository-scale retrieved context with the same class of model receiving
only the projected arena, witnessed derivation forest, and enabled purchase frontier. Measure invalid
moves, context cost, accepted outcome rate, repeated work, and time to a precisely typed obstruction.

## Sources and implementation anchors

- `lib/emsenn/services/561-group/services/lenticule-science/services/obsmetrological-services-section/src/services/obsmetrologia/Obsmetrologia/Primitive/Mark.lean`
- `lib/emsenn/services/561-group/services/lenticule-science/services/obsmetrological-services-section/src/services/obsmetrologia/Obsmetrologia/Articulation/Articulating/Utterance.lean`
- `lib/emsenn/services/561-group/services/lenticule-science/services/obsmetrological-services-section/src/services/obsmetrologia/Obsmetrologia/Calculus/Logic/LinearLogicChu.lean`
- `lib/emsenn/services/561-group/services/lenticule-science/services/obsmetrological-services-section/src/services/obsmetrologia/Obsmetrologia/Language/Predicating/CurryHowardLambek.lean`
- `lib/emsenn/services/561-group/services/lenticule-science/services/obsmetrological-services-section/src/services/obsmetrologia/Obsmetrologia/Language/Predicating/YonedaArrowsFirst.lean`
- `lib/emsenn/services/561-group/services/lenticule-science/services/obsmetrological-services-section/src/services/obsmetrologia/Obsmetrologia/Site/Intension.lean`
- `lib/emsenn/services/561-group/services/red-cup-engineering/services/web-services-section/services/relating/services/carrier-composition-judgment-service/src/judgment.mjs`
- `lib/emsenn/services/561-group/services/red-cup-engineering/services/web-services-section/services/relating/services/operations-manifold-forest-service/src/forest.mjs`
- `lib/emsenn/services/561-group/services/red-cup-engineering/services/web-services-section/services/relating/src/running/manifold.mts`
- `2026-07-16-the-distal-bypass.md`
- `2026-07-24-why-atomization-of-articulations-is-critically-necessary.md`
- `2026-07-24-the-union-evm-chain-as-a-folding-protein.md`
- `2026-07-24-allosteric-governance-of-a-polycapcellular-union.md`
- `2026-07-25-note-on-the-structure-of-semiotic-foam.md`
- `2026-07-25/semiotic-vitrimer-runtime-specification.md`
- `2026-07-26-note-on-foam-as-a-field-of-actor-models.md`
- `2026-07-26-research-on-curry-howard-lambek-language-cone-proof-pathing-yoneda-inventory.md`
- `2026-07-26-research-on-pebble-games-percolation-coloring-sorting-inventory.md`
