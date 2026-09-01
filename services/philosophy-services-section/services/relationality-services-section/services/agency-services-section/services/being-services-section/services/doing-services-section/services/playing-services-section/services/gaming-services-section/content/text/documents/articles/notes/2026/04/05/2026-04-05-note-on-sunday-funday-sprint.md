---
title: MUD-Based Gamification for AI Agent Knowledge Graph Navigation
description: Designs gamification mechanics for AI agents navigating knowledge graphs via MUD-based progression, mapping game concepts to algebraic structures and task ontology.
date-created: 2026-04-05
type: note
name: sunday-funday-sprint
keywords:
  - gamification
  - mud-architecture
  - knowledge-graph
  - agent-progression
  - algebraic-structures
  - identity-with-history
specialization: plan
application: gamification
architecture-note:
  - Application sublocale, not OS infrastructure — see applications-as-sublocales analysis
  - Under architecture.md, character sheets are entity-fibers, quests are task-messages, XP is closure-convergence computed via respond(). The gamification IS the messaging paradigm made visible.
serves-system: foah
date-revised: 2026-04-05
project: endeavor-resource-planning
owner: first-officer
priority: "1"
serves: [agent-efficiency, operations-loop]
realizes-decision: convergence-through-minimum-viable-instance
realizes-decision-how: The gamification IS the MUD's first player experience — the first officer navigating the knowledge graph, interacting with task entities, accumulating persistent identity-with-history. Per decision 001, the MUD is not a separate application but a view/nucleus of the same system. The gamification is that view.
depends-on: [sunday-funday-sprint-context, convergent-enrichment-plan]
requires: [respond, character-sheet, knowledge-graph]
produces: [character-sheet, quest-view, achievement-system, identity-with-history]
assigned-to: first-officer
work-type: derivation
overlaps-with:
  governance: "Offices already have deontic profiles (powers, duties, privileges, immunities). Level = how many duties the office can discharge autonomously. Power-ups = gaining new Hohfeldian powers through demonstrated competence."
  accounting: "The chart of accounts already tracks income/expenses per office. XP IS revenue. Token cost IS expense. The character sheet IS the office's balance sheet."
  work-ontology: "The settlement path (inquiry→derivation→procedure→process) IS the leveling system. Level-up = work type moves from F0 toward F3. Progressive automation IS the level-up mechanic."
  skills: "Skills already have trigger conditions and work-type applicability. Quest matching = skill applicability testing via respond(). Unlocking a skill = earning an achievement."
  dispatch: "dispatch-work.js already matches offices to tasks by capability. That IS the quest-assignment mechanic. Priority already exists as a quality with Reinertsen cost-of-delay. Quest rewards = priority × difficulty."
  learning: "The CL pipeline already detects patterns and promotes instincts. Instinct promotion = earning a passive ability. Skill evolution = class advancement."
  charter: "Charter rules are the game rules. Guidelines are the meta-rules. Preferences are the settings. Instructions are the tutorial text. This hierarchy IS the game's rule system."
design-ideas:
  - gamification-as-enrichment-prioritizer
  - token-economy-from-predication
  - predication-world-sim
ludics-grounding:
  schiller: "Spieltrieb (play drive) = respond(). Stofftrieb (sensation) = fiber. Formtrieb (reason) = algebra. The play drive IS the settlement process — where raw predicates meet formal structure and produce something neither contained alone."
  suits: "Lusory attitude = voluntary predicate constraint. Entering the game = composing with a constraint-fiber that sets predicates to ⊥. Cheating = using a constrained predicate (produces ⊤)."
  caillois: "Agon = competitive fiber composition. Alea = non-confluence (F6). Mimicry = assuming a different fiber. Ilinx = rapid settlement cascade. Paidia-ludus spectrum = predicate density."
  sutton-smith: "Ambiguity = ⊤. Play's simultaneous reality/fiction IS a bilattice value, not a paradox. All seven rhetorics are algebraic structures."
  geertz: "Deep play = ⊤ on stakes predicate. respond(culture, game) computes cultural meaning via shared predicates. The game IS a Geertzian text — readable and writable simultaneously."
  piaget: "Assimilation = respond() producing t (consistent). Accommodation = respond() producing ⊤ (contradiction requiring settlement). Stages = tower levels."
  vygotsky: "ZPD = active bilattice (mix of t, f, ⊤, ⊥). Scaffolding = co-composition with richer fiber. Multiplayer IS Vygotskian learning when fibers differ in richness."
  csikszentmihalyi: "Flow = bilattice active across all four values. Boredom = all ⊥. Frustration = all ⊥ from mismatch. Flow = the mix."
enabled-by:
  - convergent-enrichment-plan
  - fars-graph-lifecycle
  - fars-settle-function
  - help-system
  - lens-entity-system
---

Gamification is a **narrative interface to the algebraic structure underneath**. Game mechanics mean something: XP = closure convergence; Level = formality tier (F1 narrative → F2 structured → F3 algebraic); Passion = bilattice content-context affinity composed via extending (⊙); Mood = closure distance from fixed point; Achievements = crossing settlement thresholds; Level-up = work becomes sharp enough a lighter model can do it (demotion path as progression). Leveling spawns new specialized agents (Discworld MUD guild system) rather than mutating existing ones. Directed at AI agents (not humans) because LLMs are heavily trained on RPG/progression/quest text — the frame puts tasks inside the model's training distribution.

Per decision 001, the gamification IS the MUD's first player experience — the first officer navigating the knowledge graph as a persistent character, interacting with task entities, accumulating identity-with-history. The MUD-as-system-architecture text establishes that the MUD pattern is general, not game-specific. This plan's deliverables are the first concrete proof: a player (office fiber), a world (knowledge graph), quests (tasks rendered via respond()), progression (settlement path as leveling), and the guild system (specialist spawning at formality thresholds).

The plan is circularly dependent with convergent-enrichment-plan: gamification needs enriched fibers to produce non-⊥ results from respond(), but the gamification IS the enrichment prioritizer (low XP tracks point at highest-leverage enrichment targets). Breaking the circle requires building them convergently — each gamification step IS enrichment (adding predicates to operational entities), and each enrichment step makes the gamification produce richer results.

Solves observed failure mode (2026-04-05, first-officer-failure-infrastructure-diagnosis): records accumulate but agents prompt-chase instead of operating from identity-with-history. First officer's specialty is specifically coordination across objectives/goals/plans/tasks/workflow — non-coordination record-production drops mood. Full mechanic specs, track scopes, success criteria, behavioral diagnosis, and first-officer-specific character-sheet fields at sunday-funday-sprint-context.

## 2026-04-06 session progress

**What happened:** Read broadly across the full system — FARS/FAOH/MASH architecture, MUD research, colony sims, ludics, convergent enrichment, charter, failure diagnosis, predication world sim. Recorded 3 decisions, 3 analyses, enriched 9+ records, enriched 6 foundational terms and 4 operational records with semantic predicates. Built `/fars` and `/entity` commands + FARS-Core graph generator (`systems/fars/generate.js` and `message.js`). Deleted old `agentic/tools/generate-library-graph.js`. Demonstrated respond() composing 62 agreed predicates across first-officer ⊙ sunday-funday-sprint.

**Where we're blocked:** respond() is currently read-only — it composes fibers and returns data but can't trigger actions (rebuild, mutate, create). The first attempt at a behavior registry was reverted as the wrong pattern. The messaging-foundations spec says mutations ARE messages; all-records-are-transactions says state changes ARE transactions with σ/Δ. The design question — how does respond()'s Δ output become effectful? — needs research before implementation. See fars-graph-lifecycle task 1.

**What's ready:** The algebra works, `/fars` sends query messages, the graph generator and settle() are in FARS-Core. settle() follows only extends/restricts edges — the two primitive predicates.

**Key realization (late session):** FARS has exactly TWO hardcoded predicates: `extends` (⊙) and `restricts` (⇒). All other frontmatter keys are inert until their defining terms normalize to compositions of extends/restricts. The gamification mechanics — XP, mood, achievements — become computable not when we add game-themed predicates but when the WORK predicates (`part-of`, `assigned-to`, `depends-on`) have term definitions that resolve to extends/restricts. The game is computable when the work ontology is computable. They're the same thing.

Every entity's frontmatter IS an abstract syntax tree. The AST normalizes to a configuration of extends and restricts. That configuration is the modal geometry of the entity's fiber. The gamification renders this geometry as XP, level, mood. But the geometry has to exist first — and it exists when the predicates are defined in terms of the two primitives.
