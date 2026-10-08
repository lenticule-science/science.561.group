---
title: "Games are computers are games — MUD design notes from the settling substrate"
description: "The ludics + concurrent-game-semantics design insights for a MUD on the settling substrate: adjudication IS settling, ludic play IS interaction IS positing, paraconsistency is for ecosystem/evidence (not toy races), the tick is the sole writer, perception-as-fiber, and linear inventory. Salvaged and curated from the 2026-06-15 session."
date: 2026-06-15
status: salvaged-design-note
keywords: ["mud-design", "settling-substrate", "ludics", "concurrent-game-semantics", "adjudication-is-settling", "paraconsistency", "tick-sole-writer", "perception-fiber", "linear-inventory", "command-as-design", "interaction-as-positing"]
date-created: 2026-06-15
---

# Games are computers are games — MUD design notes

The thesis the session kept circling: **a MUD running on the settling substrate is not a game with some math bolted on; the game mechanics are derived from the same categorical structure as the computer.** Commands are designs, turns are interactions, perception is a fiber, consequence is closure.
Ludics (Girard 2001), concurrent game systems (Rideau–Winskel; Castellan–Clairambault–Winskel), and the bilattice settling engine are the *same morphism* read at the game scale.
This note curates the load-bearing design insights.

## 1. The core identity: interaction IS constrained settling IS positing

Ludics strips logic down to the **design** — a formula-free record of one party's commitments (a set of actions on a locus tree under four coherence conditions: alternation, linearity, focusing, rootedness).
Two dual designs **interact**; the play **converges** (a successful play) or **diverges** (a failed one).
Behaviours are bi-orthogonal closures of design-sets; a formula is just the name of a behaviour.

The corpus's key realization on the predication substrate:

> "Interaction realizes as the bilattice knowledge-join `v_𝔇 ⊔_k v_𝔈` computed pointwise on entity-pairs.
> The play converges iff `cl_𝒮(v_{𝔇⊥𝔈})` reaches a fixed point in finitely many `≤_k`-monotone steps under the focusing closure-rule system `𝒮`.
> It diverges iff the iteration stalls at a partial extension that cannot be closed."

And the five-way alias coincidence that makes the whole game/computer fusion real — these are *the same morphism in the predication-settling category `PS`*, not analogies:

> "ludic play IS illocution IS term-instantiation IS hyperdoctrine push-forward IS SPOTCOMP positing IS Girard's design-action."

So: **a turn is an interaction; a command is a design; executing the command is the play converging by Knaster–Tarski; an invalid command is divergence (a contradiction in commitments).** The consequence cascade — the rules firing, effects propagating — *is* the closure operator iterating.
You do not implement "resolve command," then separately "compute consequences"; resolving the command is the settling computation: knowledge-join (both parties' commitments meet at each entity), then close under the rules.

The MUD-concept → math dictionary the session settled on:

| MUD concept | Mathematical grounding |
|---|---|
| Command | Design `𝔇` (polarity-respecting, focused, rooted set of action-posits) |
| Turn | Interaction `𝔇 ⊥ 𝔈` (player design meets world design) |
| Action execution | Convergence `⇓` (play completes by Knaster–Tarski fixed point) |
| Invalid action | Divergence `⇑` (no action at the required locus; contradiction) |
| Entity / object / room | Locus `ξ` (address in the tree) |
| State value | Partial valuation `v(ξ) ∈ FOUR` (told t / f / both / neither) |
| Perception | Observer-local settling `V(o)` (what the agent sees) |
| NPC personality | Closure-rule system `r(o)` (their inference rules) |
| Player agency | Strategy `σ` (receptive, innocent, symmetric) |
| Simultaneous action | Concurrent event structure (events in partial order, not totally sequenced) |
| Consequence cascade | Closure iteration `cl_𝒮(v)` (rules propagate effects) |
| Game rules | Governance `r(o)`; focus discipline; closure axioms |

## 2. Adjudication IS settling

This is the load-bearing engineering insight and worth stating plainly.
The bilattice floor has, by Knaster–Tarski, two fixed points in each order: `settle` / `brim` (knowledge-order LFP/GFP) and `adjudicate` / `presume` (truth-order LFP/GFP, the σ-twins). **Adjudicating an action — deciding what "really happened" when commitments collide — is not a separate subsystem; it is the truth-order settling of the joined valuation.** A combat round, a contested move, a disputed ownership claim: each is a section of the world whose adjudicated value is `adjudicate(join_k(claims))`.
The cells where the LFP and GFP disagree form the **void cone** — measurable, honest under-determination — and the engine re-articulates that residue one fold deeper rather than papering over it.

Practically: the adjudication code does not branch on "who wins"; it joins the evidence and settles.
Where players agree, the cell settles to `t` or `f`.
Where they conflict, it settles to `⊤` (told both) — which is *kept*, not resolved away.

## 3. Paraconsistency is for the ecosystem and the evidence — not toy races

A crucial design caution: the value of paraconsistency (`⊤` = held contradiction, surfaced not dropped) is **not** in adjudicating microscopic, fully-ordered races ("did A's sword swing land a tick before B's parry?").
Those are settled by sub-tick order — the tick is deterministic and arbitrates by order.
Paraconsistency earns its keep at the **ecosystem / evidence** scale:

- **Federation and replica divergence** — when two server shards, two timelines, or two witnesses report incompatible world-states, `⊤` records the genuine conflict as a first-class cohomology class (`H¹_top`) instead of silently picking a winner.
  The conflict is *visible*, queryable, and repairable by a declared catalog.
  "One mechanism, seven surfaces, structurally guaranteed."
- **Long-lived contested facts** — reputation, ownership, faction standing, lore: facts with positive *and* negative witnesses over time.
  `⊤` distinguishes "contested" from "unknown" (`⊥`), and the lossless evidence carrier keeps both sets of witnesses so the contestation can be re-examined.
- **Perception disagreement** — two characters who legitimately saw different things.
  Each observer's `V(o)` is its own settling; the global picture holding their disagreement as `⊤` is correct, not a bug.

The discipline: use `⊤` where contradiction is *real and informative* (ecosystem evidence), and use deterministic sub-tick order where it is merely a race.

## 4. The tick is the sole writer

The runtime invariant that keeps the settling honest: **only the tick writes to the world trace.** World state is an append-only trace of witnessed EAVT (= SPOT: subject–predicate–object–trace) assertions; computation is folding the trace to a Knaster–Tarski fixed point over `FOUR`.
The shell states it: a Unix REPL is read → eval → print; this computer's eval is settling, so its shell is **read → settle → project → loop**.

Concretely, each tick (from the inherited `mod_mud` async loop and the TAB bucket scheduler):

1. `perception_tick()` — materialize each observer's fiber from the trace.
2. Gather **proposals** from each system (movement, chat, combat, …) — these are *intents*, not writes.
3. `normalize` the proposals (sub-tick ordering, conflict surfacing).
4. `apply` — the single write point, extending the trace.

Nothing else mutates.
Players' commands enqueue proposals; the tick is the sole writer that settles them into the trace.
"If you reach for a `password-checks-out` boolean or an overwrite, you dropped into the shadow."
This is what makes concurrency tractable: between writes the world is a pure fold of an immutable log, and the tick boundary is exactly where the bigraded tick-cohomology (`H¹_t ⊕ H¹_top`) arbitrates concurrent inputs — truth-disagreements by sub-tick order, genuine inconsistencies witnessed as `⊤`.

## 5. Perception is a fiber (observer-local settling + handedness)

There is no global "what is true"; there is each observer's local settling.
The categorical object is a **ruled multi-observer system** `(O, V, r)`: `O` the observer category, `V : O → Settlings_B` assigning each observer a settling over the common base, `r(o)` its closure-rule system. **Perception is `V(o)` restricted to the observer-local frontier** — the entities that observer can reach.
The profile "MUST NOT replace this with a single global frontier or a global rule default unless it has a restriction theorem for that case."

Each modeled player decomposes by **handedness** — which side of the duality each coordinate sits on:

- `recv` — Opponent-side on `A` (what I am told)
- `observe` — Opponent-side on `A` (reads sensors from the environment)
- `send` — Player-side on `B` (what I output)
- `actuate` — Player-side on `B` (projects effects into the environment)

So an NPC's personality is `r(o)` (its inference rules: loyalty, memory, mood); its viewpoint is `V(o)`; what it can sense and what it can do are the observe/actuate handedness coordinates.
Two characters can hold different `V(o)` over the same base and the system is consistent — disagreement lives as `⊤` in the global picture, never forced to a single frontier.

## 6. Inventory is linear (resources, not copies)

The multiplicative-linear-logic reading of the substrate gives the right discipline for items: **inventory is linear.** A held object is a *resource* consumed by use, not a freely-copyable value.
The linear connectives are the operational vocabulary:

- `⊗` (tensor / fusion `⊙`) — holding two things at once; combining resources.
- `⊸` (linear implication / residuum) — "spend this to get that": crafting, trading, using a consumable.
  `reciprocal(x) = 1 ⊸ x`; division was literally "the residual the floor names but had not built."
- `!
  ` (the exponential / `bang`) — the *only* place copying is licensed: a bounded-copy comonad.
  Most game objects are *not* under `!
  `; they are linear and cannot be duplicated.
  This is what makes dupe-bugs a *type error* rather than a policing problem.

Multiplayer is the **tensor `∥` of pilots' traces** ("okaga's multiplayer galaxy is the tensor of pilots' traces") — federation belongs to the computer, and each player's resources stay linear within their own trace, combined by `⊗` at the shared loci.
(Caveat the corpus flags: additives, `!
`/`?
`, and the par reading are only partly developed; the multiplicative fragment is the firm part.)

## 7. Trace as proof; the gameplay loop is derived, not designed

A command-resolution **is a proof** that the command's effects follow from the game rules plus the current state.
The trace accumulates these proofs; settling is the computation demonstrating the consequence is justified.
Players feel agency because the proof-path is legible: *their posit + world state + rules → new state*.
The operations loop (`planning → dispatch → execution → tracking → review → feedback`) is the same recursive form at every scale (turn, session, project, swarm), aligning with being → doing → working → governing: entity state, the action (morphism), in-flight execution, the rules.

The corpus is blunt about what this buys for design: "The math is not separate from fun.
Fun *is* the property of a well-formed dialogue where (1) both parties are genuinely uncertain (no trivial strategy), (2) commitments are transparent but consequences hidden, (3) the interaction converges to interesting settled states, (4) players feel agency because their designs genuinely affect the outcome."
The thirteen cultural-ludic correspondences (Huizinga's magic-circle ↔ entity-fiber boundary; agon ↔ `⊙`-composition against a shared situation; alea ↔ non-confluence of bypass; mimicry ↔ fiber-assumption; ilinx ↔ settlement cascade; flow ↔ fiber-complexity matching) embed cultural play into proof-theoretic ludics via a faithful functor, so the aesthetics and the algebra are one object.

## Citations (corpus, on disk)

- Ludics core, design, interaction, behaviour: `.../voidmath/.../category/hacking/library/ludics/{docs/dev/journal,library/design,interaction,library/behaviour,library/locus,library/action,library/chronicle,cultural-embedding}/.../2026-05-24.md`
- Concurrent game systems: `.../predicate-category/hacking/library/thing/library/system/hacking/library/game-system/hacking/library/concurrent-game-system/docs/dev/journal/2026-05-24.md`
- Operations loop / being-doing-working-governing: `.../spotcomp/library/operations/specification.md`
- Modeled players, observer-local settling, handedness: `.../spotcomp/library/modeled-player/specification.md`
- The settling kernel as the computer's eval; tick as sole writer; accounts-as- players: `apps/interface/shell/README.md`, `computer/docs/dev/journal/2026-06-05-accounts-are-players-not-records.md`, `.../tab/docs/dev/notes/concurrency-and-the-tick.md`, `services/fizzos/docs/dev/tick-runtime.md`
- Linear-logic inventory reading (fusion/residuum/`bang`): `lib/meme-topology/src/bilattice-linear-logic.mts`, `.../predication-predication-fibers-as-linear-logic-models.md`
- Prior MUD engines (qtMUD, Racket-MUD, Fennel TAB, mod_mud) and the ten persistent patterns: `development/experimental/lab/archive/multi-user-dungeon/tab/docs/2026-03-11/{tab-mud-research,engine-design,agent-hierarchy}.md`
