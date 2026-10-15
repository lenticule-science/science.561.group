---
title: "Theory of Concurrent Game Systems"
date-created: 2026-10-15
description: "Concurrent games with symmetry are the theory of computing, agency and play at once; a running world is a concurrent game system whose dimension is a site, whose areas are sub-arenas, whose players observe restrictions as arenas and commit through strategies, whose tick folds moves by the knowledge join, and whose conflicts are a computed cohomology class."
type: theory
name: theory-of-concurrent-game-systems
reading-order: 8
depends-on: [theory-of-obsmetrologia, theory-of-relationality, theory-of-predication-categories, theory-of-agency, theory-of-work, theory-of-governing]
used-by: [theory-of-computer-systems, theory-of-market-systems]
keywords: [concurrent-game, event-structure, arena, strategy, receptivity, innocence, symmetry, star-autonomous, federation, parallel-composition, handedness, dimension, area, player, observe, tick, swarm, stigmergy]
provenance:
  authors: [emsenn, claude-opus-5-5]
  derived-from:
    - "deleted concurrent-game-system.md (git show a06ed16f4c38^:archive/2026/06/06/computer/docs/dev/notes/concurrent-game-system.md)"
    - "obsmetrological-services-section notes 2026-06-18 'Mysterious Machines: Strategy, Self, and the Concurrent Game'"
    - "content/text/documents/articles/notes/2026/07/07/2026-07-07-note-on-gaming-arenas.md (this section: Arenas, Plays, and Strategies)"
    - "red-cup-engineering/farstone.561.group@main:docs/DESIGN.md"
    - "red-cup-engineering/feltos@main:content/text/documents/articles/teaching-articles/explanations/what-is-feltos.md"
    - "emsenn/2025-12-18-tab@main:behaviors/sys/dimension.fnl and attributes/vr/area.fnl (the founder's Dimension/Area model)"
---

# Theory of Concurrent Game Systems

A concurrent game system is one running game: events laid down under causal order, conflicts among alternatives, symmetries that say which plays are the same, and a strategy playing it. The collection of all such systems is a star-autonomous category, CGS, and CGS is the typed theory of computing: sequential, nominal, session-typed and realizability computation all embed in it (Castellan, Clairambault and Winskel; Hyland–Ong; Caires–Pfenning). It is also the theory of agency and the theory of play. To compute, to choose and to play are one act.

A MUD is not built on this theory. "A MUD is what the theory looks like wearing a face you can walk inside" (Farstone design). A running computation is a game being played is a world being inhabited.

## Primitives

1. **Polarized prime event structure** A = (E, ≤, #, λ): events; a causal partial order with finite causes; an irreflexive symmetric conflict relation inherited forward along causality; a polarity λ : E → {Player, Opponent}.
2. **Configuration (position).** A finite subset of E that is down-closed and conflict-free: an occurred history.
3. **Symmetry groupoid** Ã: bijections between configurations that preserve causality, conflict and polarity. It records which plays the system treats as the same.
4. **Strategy** σ : S → A, a map of event structures with symmetry that is receptive (Player never blocks an enabled Opponent move), innocent (Player's move depends only on its view) and symmetry-invariant.
5. **Game** G = (A, players, admissible strategies, observation, payoff, settlement). A player occupies strategy roles; a player is not a primitive of the arena.

## Laws

- **K1. Star-autonomy.** A⊥ swaps polarity. A ∥ B is parallel composition: disjoint events with no causality or conflict across. A ⊸ B = A⊥ ∥ B. The identity is copycat. Composition is parallel composition plus hiding, which is cut; running a composition is cut elimination.
- **K2. Rules are sorted by kind.** A rule is any constraint derivable from the arena or imposed on it: the legal-move rule is enabling in A; a resource rule is a linear constraint on configurations; an information rule is an observation map; a settlement rule is a closure on valuations; a payoff rule is a function from outcomes to values.
- **K3. Federation is parallel composition.** Bidirectional exchange between two systems is the monoidal product A ∥ B. At the value level it is cellwise ∨k followed by closure, and it converges in any order by monoidal coherence and Knaster–Tarski.
- **K4. Handedness is duality.** An embodied participant's (receive, send, actuate, observe) is the Player/Opponent duality on its input and output arenas: receive and observe on the Opponent side of the input, send and actuate on the Player side of the output.
- **K5. Concurrency is not interleaving.** Moves on independent events commute, and the play is a partial order. Forcing concurrent moves into one sequence invents an order that does not exist.
- **K6. Swarm criteria.** A collective coordinates as a swarm, at convergent cost and with no orchestrator, only with bounded per-agent cost, interchangeable agents and stigmergy (coordination through traces in a shared environment). Language-model agents fail all three: context grows with conversation, each carries idiosyncratic context, and they pass messages rather than leave traces. So coordination must live in the substrate, a shared stigmergic field whose merge is convergent, not in the agents.
- **K7. The four kinds of play are the four regimes.** Caillois's ilinx, mimicry, alea and agon sit at the aperiodic, transfinite, Scott and finite regimes. A finished game with perfect information is a number (Conway); determinacy is the finite regime's H¹ = 0.

## The world as a concurrent game system

Model: the following derives "Dimensions with Areas that Players observe as Arena and drive Strategies" from K1–K6, the Farstone turn loop and FeltOS's world model.

1. **Dimension.** A dimension D is a site: a category of areas with covering families, the base over which the world's sheaves are sections. FeltOS: "An actor inhabits a dimension, moving through its areas and worlds." The Modeled Union Dimension names the same object: the site whose unions of covers carry the sections.
2. **World.** The settled world W is a sheaf of FOUR-valued settled cells over D. Its history is the append-only record of utterances; W is the record's settling.
3. **Area.** An area U is an object of D: a world, a region, a room, a work board. Its event structure E_U is the events located in U, with restriction maps to sub-areas.
4. **Observation.** A player i has a perception fiber P_i, what it can read with its senses, secrets and standing. Observing U gives the arena A_i(U) = observe(W restricted to U and P_i). Polarity is read from charge and capability: events i may commit (by its skills, offices and grants) are Player; events others commit are Opponent. No player reads outside its section, so stealth, secrets and fog are restrictions, not flags.
5. **Strategy.** A player drives a strategy σ_i on A_i(U). A character's behavior is a ludics design, checkable rather than scripted; a conversation is the cut between two designs. A micro-enterprise's taking policy is its strategy on the work area.
6. **Turn.** settled world → observe(player's fiber) → arena → run(strategy, move) → new utterances → settle (fold the record by ∨k) → next settled world. A turn is one cut elimination. The tick is the sole writer; commands are proposals for the next tick.
7. **Conflict.** Concurrent incompatible proposals in one tick are an obstruction to gluing, the class H¹ = H¹_t ⊕ H¹_⊤ (truth disagreement plus held contradiction). It is computed and recorded as a witness and resolved as an explicit choice, never by arrival order.
8. **Federation.** Two instances' dimensions compose by ∥, and an actor walks between them as a named entity carried over ActivityPub++.

## Consequences for the Group's systems

Required:

1. **Every MetroPlat instance is a dimension.** Its enterprises, offices and work boards are areas of that dimension. Agents and humans inhabit it as players with perception fibers.
2. **Work is played in the world.** The work board is an area. A micro-enterprise observes the restriction of the board to its fiber as its arena and acts through its strategy. No agent finds work through a side channel that bypasses the world.
3. **One writer, folded by join.** The tick settles the world from the record. Conflicts are H¹ classes with witnesses.
4. **Strategies are typed objects.** A strategy is a receptive, innocent, symmetric policy from positions to moves, not a free-form prompt or a role label.
5. **Coordination is stigmergic.** Agents leave moves in the shared field and read the field. They do not message each other point to point to coordinate, because that architecture costs Θ(n²).

## Open

- Open: a published proof that the Dimension/Area/Player construction above is a functor from FeltOS's world model to CGS, and that `observe` is a sheaf restriction in the strict sense.
- Open: the exact categorical relationship between the Dialectica and game models of the effective topos.

## Sources

- The formal theory (deleted from the corpus): `git show a06ed16f4c38^:archive/2026/06/06/computer/docs/dev/notes/concurrent-game-system.md`.
- Computing, agency and play as one category: `science-services-section/services/information-science-services-section/services/math-services-section/services/obsmetrological-services-section/content/text/documents/articles/notes/2026/06/18/2026-06-18-mysterious-machines-strategy-self-and-the-concurrent-game.md`.
- Arenas, plays and strategies (definitions of game, player, rule): `content/text/documents/articles/notes/2026/07/07/2026-07-07-note-on-gaming-arenas.md` (this section).
- The world as the theory with a face: `red-cup-engineering/farstone.561.group@main:docs/DESIGN.md`; its first implementation `red-cup-engineering/fizzos`.
- FeltOS's statement of the dimension: `red-cup-engineering/feltos@main:content/text/documents/articles/teaching-articles/explanations/what-is-feltos.md`.
- The founder's Dimension/Area model: `emsenn/2025-12-18-tab@main:behaviors/sys/dimension.fnl`, `attributes/vr/area.fnl`.
- Work as a concurrent game: `561-group-services-section/content/text/documents/articles/notes/2026/10/01/2026-10-01-note-on-work-between-micro-enterprises-as-a-concurrent-game.md`.
