---
title: "Theory of Agency"
date-created: 2026-10-15
description: "An agent is a strategy that is its own opponent: the least fixed point of settling a relation together with a model of itself; agency exists because negation has a fixed point, it has four faces (animism, agential, agentic, individual), and an agent couples to a world as a strategy on A⊥ ∥ B, observing on the input and committing on the output."
type: theory
name: theory-of-agency
reading-order: 5
depends-on: [theory-of-obsmetrologia, theory-of-relationality, theory-of-predication-categories, theory-of-locution]
used-by: [theory-of-work, theory-of-governing, theory-of-concurrent-game-systems, theory-of-computer-systems]
keywords: [agent, agency, self-model, self-opponent, strategy, arena, handedness, faculty, face, glued-sheaf, animism, agential, agentic, individual, functional-decision-theory, actor]
provenance:
  authors: [emsenn, claude-opus-5-5]
  derived-from:
    - "OBS/content/text/documents/articles/notes/2026/06/18/2026-06-18-mysterious-machines-strategy-self-and-the-concurrent-game.md"
    - "OBS/content/text/documents/articles/notes/2026/06/17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md (agency, deciding, embodiment)"
    - "emsenn/561-theory@main:humanities/theories/math/theories/categories/theories/predication-categories/questions/agentive-triad-speaking-doing-learning.md"
    - "deleted agent-organization-engine lib/relating/docs/agency-architecture.md (git show 8eb890e29b21^:…)"
    - "emsenn/agential-relationality@main:apps/communicating/dev/content/researching/2026/06/25/2026-06-25-wmap-web-modeled-agency-protocol.md"
  note: "OBS = science-services-section/services/information-science-services-section/services/math-services-section/services/obsmetrological-services-section"
---

# Theory of Agency

To compute, to choose and to play are one act: taking a strategy in a game against an opponent who may be oneself. A strategy run against the world is a computation. A strategy run against a model of itself is an agent. A strategy run against a freely accepted opponent inside a bounded circle is a game. These are three readings of one category, the star-autonomous category of concurrent games with symmetry.

An agent is the strategy that does not need an external opponent, because it supplies its own. Agency exists because negation has a fixed point.

## Primitives

1. **Arena.** A relation whose two sides have been named as roles: a prime event structure (E, ≤, #) of events under causal order and conflict, with a polarity labeling each event Player or Opponent.
2. **Strategy.** A sub-event-structure of an arena that is receptive (it never refuses an Opponent move the arena allows) and courteous (it adds causal dependency only from Opponent to Player).
3. **Dual.** A⊥ swaps Player and Opponent. It is the value substrate's negation read one level up.
4. **Self-model.** Meta-cells that reflect a settling's own charges back into it.
5. **Faculty.** A capability surface on one of the three transverse axes of FOUR: communicating (truth ≤t), knowing (knowledge ≤k), playing (evidence ⟨a₊, a₋⟩).

## Laws

- **A1. Agent as fixed point.** An agent is the least fixed point of the reflexive closure: the initial algebra of X ↦ Settle(X + SelfModel(X)). By Lambek's lemma it contains a copy of its own settled state.
- **A2. Agency needs FOUR.** The self-referential cells settle in {⊥, ⊤}: an agent is never flatly true or false about itself, only uninformed or contested. On a Boolean substrate the self-model would not exist.
- **A3. Receptivity and courtesy are forced.** They follow from the no-deletion law: a strategy may add to what is settled but may not retract what the opponent has established.
- **A4. Handedness.** An agent couples to a world as a morphism A → B, a strategy on A⊥ ∥ B. Receiving and observing are the Opponent side of the input, where the world delivers. Sending and actuating are the Player side of the output, where the agent commits. A symmetric peer is the degenerate copycat case.
- **A5. Embedded agency.** Player is inside its own arena. There is no clean boundary between an agent's strategy and the game it plays.
- **A6. The tower is forced.** relation → agent → game → computer, each the least fixed point of a closure whose signature mentions only the level below. A game needs agents to play it; a computer is a game whose plays compose by cut and can be replayed.
- **A7. Deciding settles the algorithm.** The choice variable is the self-model, not the act. A decision made once holds everywhere the agent is computed (functional decision theory).
- **A8. Four faces.** Agency is a soft word, and the descent sorts it onto four regimes: animism (aperiodic: bare animacy, a someone at all), agential (transfinite: the actor who can do otherwise, the deed under a description), agentic (Scott: the contributor whose moves carry values others read off the common field), individual (finite: the bounded person to whom deeds are imputed). Each face is the previous one settled a regime further.
- **A9. Coherence is measurable.** The three faculties give three faces of an agent, local sections over its membrane. The agent (the bulk) is their glued global section, and it coheres exactly when the first cohomology of its union settlement vanishes. When H¹ > 0 the agent needs explicit resolution before it is coherent; consensus is the work H¹ imposes.
- **A10. Speaking before doing.** Speech acts emit asserted atoms (stratum 0). Doing-acts emit saturated (stratum 1, σ) or settled (stratum 2, Δ) atoms whose dependencies point back to speech. Learning is vertical: it extends the theory itself.
- **A11. Bounded autonomy.** An agent that queues work for itself cannot escalate its authority: the work's required capability is bounded by the agent's modally restricted capability, which never exceeds its underlying capability (proved).

## Actors on a network

An agent that acts across instances is an actor in the ActivityPub sense, glued as a sheaf with a membrane, an inbox and an outbox. An Activity is one meme crossing the membrane. Undo and Delete cross as denials. Visibility (public, followers, unlisted, direct) is FOUR ordered by epistemic reach. A capability is a locus the actor may play; invoking it is cut; delegating it is name-passing; attenuating it is dualizing. Federation is parallel composition. A human is an agent in the same Actor model (WMAP, 2026-06-25). The Leader's own harness characters are actors with handles on the Leader's node, and "Claude handing Codex an assignment is one actor messaging another, not a private call inside one process" (Leader, 2026-09-27).

## Consequences for the Group's systems

Required:

1. **Agents are inhabitants, not processes with prompts.** An agent has a place in a world, an arena it observes and a strategy it plays. It finds work by observing its arena, not by reading a side queue.
2. **Arena = what a Player observes; Strategy = what it commits.** "Dimensions with Areas that Players observe as Arena and drive Strategies" means this exactly: an Area restricted to a player's perception is the Opponent side of that player's arena, and the player's moves are the Player side of its strategy.
3. **One Actor model for humans and agents.** The Leader, Claude sessions, Codex sessions and service accounts are actors of one kind, with handles, inboxes and capabilities. Nothing in the substrate distinguishes them except their records.
4. **Agent state is interior and glued.** What an agent says (communicating), knows (knowing) and plays (playing) are three faces. Its coherence is a computed cohomology class, so incoherent agents are detected, not discovered.
5. **Self-queued work is capability-bounded.** Dispatch checks required capability against the agent's restricted capability (A11).

## Open

- Hypothesis: forming an agent is a symmetry breaking of the K₄ gauge to its stabilizer, with the order parameter on {⊥, ⊤}. It awaits a moduli statement of how much agency a settling carries.
- Open: the semantics of the logical counterfactual that functional decision theory relies on, and the individuation of "the same algorithm" across implementations.

## Sources

- The agency chapter and the tower: `OBS/content/text/documents/articles/notes/2026/06/18/2026-06-18-mysterious-machines-strategy-self-and-the-concurrent-game.md`.
- The fixed point of negation, the four faces, deciding and embodiment: `OBS/content/text/documents/articles/notes/2026/06/17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md`.
- The agentive triad: `emsenn/561-theory@main:humanities/theories/math/theories/categories/theories/predication-categories/questions/agentive-triad-speaking-doing-learning.md` (live copy in this section: `content/text/documents/articles/notes/undated/agentive-triad-speaking-doing-learning.md`).
- The agent as a glued sheaf (deleted): `git show 8eb890e29b21^:lib/emsenn/services/561-group/services/engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agent-organization-engine/lib/relating/docs/agency-architecture.md`.
- Agency as an exchangeable actor: `emsenn/agential-relationality@main:apps/communicating/dev/content/researching/2026/06/25/2026-06-25-wmap-web-modeled-agency-protocol.md`.
- Bounded autonomy: `emsenn/theory-of-agency@main:library/agent/working/library/work/dispatching/docs/dev/notes/agent-self-queueing-bounded-by-modal-restriction.md`.
