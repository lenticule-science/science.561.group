---
title: "Compose CLAUDE.md and AGENTS.md from FARS fibers via respond()"
specialization: plan
date-created: 2026-04-06
project: generative-harness
serves-system: foah
department: engineering
serves: [system-architecture-refactor]
work-type: procedure
horizon: week
priority-method: library/theories/humanities/theories/sociology/theories/work/terms/convergent-enrichment.md
priority-rationale: "Harness generation is where the operational world (agents, skills, commands) meets the foundational algebra (FARS predicates). Composing via respond() replaces string munging with principled fiber algebra."
design-ideas:
  - fars-algebra-native-generation
  - respond-as-view-operator
  - fiber-composition-over-string-concat
enabled-by:
  - convergent-enrichment-plan
  - fars-graph-lifecycle
  - fars-settle-function
---

The generative harness currently uses string concatenation to build CLAUDE.md and AGENTS.md from YAML frontmatter.
This couples the published documentation to the code that reads it, makes generation fragile, and wastes the algebra.

Instead: each component (office, skill, command, rule, hook) exposes its context as a FARS fiber.
Generation becomes `respond(office, {payload: {type: "skill"}})` — a query, not parsing.
Installation becomes algebraic composition, not file syncing.

The work proceeds from theory to practice: first define what predicates must flow (the schema), then rewrite generation to use respond(), then wire installation to use composition.

## The context spacesuit = officer kit = RPG loadout (2026-04-06 captain insight)

The context window loaded at session-start IS the same structure across three domains that the captain identified as convergent:

| Domain | Name | Contents | Purpose |
|--------|------|----------|---------|
| **Agentic AI** | Context spacesuit | CLAUDE.md, AGENTS.md, rules, skills, memory, session state | Determines what the agent can perceive, what tools it can use, what constraints it operates under |
| **Military** | Officer's kit | Briefing packet, standing orders, equipment manifest, comms gear, ID/credentials, maps | Determines what the officer knows, what they can do, what authority they carry, where they can go |
| **RPG** | Character loadout | Stats, inventory, skill list, quest log, map, spell book | Determines what the character can perceive (stats affect senses), what actions are available (inventory + skills), what goals are active (quests) |

All three ARE the same structure: **the fiber you carry into the composition.** respond(agent, task) is determined by what's in the suit.
Different suits = different Umwelten of the same task space.

### What this means for context composition

CLAUDE.md generation isn't "building a system prompt."
It's **equipping an officer for a mission.** The generate-root-agentic-files.js script isn't a documentation generator — it's the QUARTERMASTER assembling a kit.

The kit has sections that map to military/RPG analogs:

| CLAUDE.md section | Military analog | RPG analog | Algebraic meaning |
|-------------------|----------------|------------|-------------------|
| Rules | Standing orders, ROE | Class restrictions | Constraint-fiber (lusory attitude predicates) |
| Skills | Training certifications, SOPs | Skill tree, abilities | Action-vocabulary fiber (what messages can be sent) |
| Commands | Equipment inventory | Item inventory | Tool-fiber (what compositions are available) |
| Agents | Unit roster, chain of command | Party members, NPCs | Available settlement partners |
| Infrastructure | Comms gear, logistics | Map, fast-travel network | Channel-fiber (what entities can be perceived) |
| Memory | Intelligence briefing, past ops | Quest log, journal | Entangled pairs (F8) — geometric history |

### The fiber schema IS the kit manifest

The fcc-build-fiber-schema task should produce a kit manifest — what predicates each component type MUST contribute to the spacesuit.
The schema isn't a data format.
It's a LOADOUT SPECIFICATION: "for this office, on this mission (task type), the kit must include these rules, these skills, these commands, this memory."

Different offices get different kits (different context spacesuits) because respond(office, {channel: loadout}) produces different fibers.
The researcher's kit has research skills and library perception.
The operations officer's kit has dispatch tools and plan visibility.
Same quartermaster (the install script), different loadouts, different Umwelten.

### The gamification connection

The character sheet (sunday-funday-sprint) IS the stat block that goes into the loadout.
XP, level, mood, achievements — these are character stats that affect what compositions the agent can perform.
A level-2 dispatcher has different available actions than a level-1.
The character sheet IN the context spacesuit IS the RPG character sheet IN the loadout.

This means the sunday-funday-sprint gamification and the FAOH context composition are the SAME work: building the system that assembles a character sheet + skill list + quest log + inventory + map into a context window = building the system that equips an RPG character for a dungeon = building the system that kits an officer for a mission.
One system, three descriptions.
