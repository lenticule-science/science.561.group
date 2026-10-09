---
name: project_mud-architecture-insight
description: The 561 system maps 1:1 onto LPMud architecture — driver (mash-engine), mudlib (type conventions/skills), map (knowledge graph), rooms (entities), agents (players/NPCs). Not a metaphor — same data structures. Teraum Racket MUD code at operations/engineering/triage/software/teraum-racket-mud/ demonstrates the pattern.
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: project_mud-architecture-insight
---

The user pointed out that their old MUD code (Teraum, in Racket) shows the architecture the system already has. The mapping is structural, not metaphorical:

- **Driver** = mash-engine binary (sessions, I/O, runtime)
- **Mudlib** = skills + type conventions (writing-terms, writing-texts, etc.)
- **Map** = knowledge graph (entities with typed relations)
- **Recipes** = domain-specific constructors (each layer adds trivia/context)
- **Builders** = agents using skills to create entities
- **Rooms** = any entity with contents and exits (domains, plans, projects)
- **NPCs** = daemon loops, scheduled agents

Decision record `001-convergence-through-minimum-viable-instance` captures the convergence. Text at `library/.../multi-user-dungeons/the-mud-as-system-architecture.md` traces the pattern formally.

**Why:** MUD architecture is underrepresented in LLM training data but IS the pattern this system uses. The user explicitly said "it's basically just a MUD." Future work on mash-engine, the TUI, navigation, and agent dispatch should use MUD vocabulary and patterns — they have 40 years of iteration behind them.

**How to apply:** When designing mash-engine features, think in MUD terms: look/go/build/tell/take. When designing the harness, think driver/mudlib. When designing navigation, think rooms-and-exits not tabs-and-menus. Read the Teraum code for concrete patterns.
