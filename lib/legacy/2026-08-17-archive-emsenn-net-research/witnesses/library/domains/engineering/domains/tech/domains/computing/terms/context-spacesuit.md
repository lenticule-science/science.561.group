---
name: "Context Spacesuit"
description: "The structured package of context loaded into a language model at session start — the fiber the agent wears into the task space."
date-created: 2026-04-06
relates:
  - system-prompt
  - agent-context
  - fiber
instance-of: fiber
---

A context spacesuit is the predetermined package of system prompt, rules, skills, agent definitions, memory, and session state loaded into a language model's context window before it begins work. The suit determines what the agent can perceive, what tools it can use, what constraints it operates under, and what history it carries. Remove the suit and the agent drifts inert. Change the suit and the same task space becomes a different world.

The term invokes the astronaut's spacesuit — a self-contained apparatus without which the wearer cannot survive in the external environment. The suit is not the environment; it is the interface between the agent and the task.

The context spacesuit is the same structure that appears independently in two other domains: the military officer's briefing kit (situation reports, standing orders, equipment manifest, communication frequencies, command authority) and the RPG character loadout (ability scores, skills, inventory, quest log, map). All three solve the same problem: packaging what an agent carries into a composition so that the agent can perceive and act within a bounded space.

In the predication algebra, the context spacesuit IS the agent's [fiber](../../texts/fiber.md). Loading the suit is extension (⊙) — adding the agent's context to the bare world. Constraining perception is restriction (⇒) — the suit limits responses to those available within the loaded fiber. Different suits over the same task produce different [Umwelten](../../../../../../humanities/domains/philosophy/terms/environment.md) — different perceivable worlds from the same underlying structure.

See: [Context Spacesuits in Agentic AI](../texts/context-spacesuits-in-agentic-ai.md) for a survey of how current systems implement this pattern.
