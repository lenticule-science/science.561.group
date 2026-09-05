---
title: "Voyager Skill Library Analysis"
description: "Architecture analysis of the Voyager open-ended embodied agent — skill library, self-verification, automatic curriculum, and compositional skills."
date-created: 2026-04-04
source-system: "https://github.com/MineDojo/Voyager"
source-paper: "Voyager: An Open-Ended Embodied Agent with Large Language Models (Wang et al., 2023)"
relates-to:
  - continuous-learning-in-agentic-harnesses
  - ecc-skill-system-analysis
---

Voyager is an LLM-powered agent for Minecraft that learns an open-ended repertoire of skills without human intervention. It demonstrates three mechanisms directly relevant to our harness: a semantic skill library, a self-verification critic, and an automatic curriculum. This analysis is based on the source code at `MineDojo/Voyager` (commit as of 2026-04-04).

## Architecture Overview

Voyager's main loop (`voyager.py:learn`) runs indefinitely:

1. **Curriculum agent** proposes the next task based on the agent's current state, completed tasks, and failed tasks.
2. **Action agent** generates JavaScript code to execute the task in Minecraft, receiving relevant skills from the library as context.
3. **Critic agent** inspects the post-execution game state and judges whether the task succeeded, providing critique if it failed.
4. On success, the **skill manager** extracts the working code, generates a natural-language description, and stores both in the skill library.
5. On failure, the curriculum agent records the failure and proposes a different task.

The loop has no terminal condition except an iteration cap. This is true open-ended learning — there is no predefined goal list.

## The Skill Library

### Storage

The skill library is a flat dictionary (`skills.json`) mapping skill names to `{code, description}` pairs. Each skill is also persisted as two separate files:

- `skill/code/{name}.js` — the executable JavaScript function
- `skill/description/{name}.txt` — the LLM-generated natural-language description

When a skill is overwritten (same name, improved code), the old version is archived as `{name}V{n}.js`, preserving history. The library from trial 1 contains 57 learned skills, ranging from `mineWoodLog` to `craftIronPickaxe` to `killOneEnderman`.

### Semantic Indexing

Skills are indexed in a Chroma vector database. The embedding key is the **description**, not the code. When the agent needs skills for a new task, it queries the vector store with the task context as the search string and retrieves the top-k most similar skill descriptions (`retrieval_top_k=5` by default).

This is the critical insight: **retrieval is by semantic similarity of what the skill does, not by name matching or category**. The query is the natural-language task context (e.g., "How to craft an iron pickaxe in Minecraft?"), and the descriptions are natural-language summaries of the skill's behavior.

### Description Generation

The `SkillManager.generate_skill_description` method sends the raw JavaScript code to a separate LLM call with a prompt that asks for a plain-English summary of the function's behavior in 6 sentences or fewer. The description is formatted as a comment inside a function stub:

```javascript
async function craftIronPickaxe(bot) {
    // The function checks if there are enough iron ingots and sticks...
}
```

This formatting means the description is itself valid JavaScript that can be injected into a prompt as a code example without breaking syntax highlighting.

### Retrieval Flow

In `voyager.py:reset`, before the action agent starts working on a task:

1. The skill manager queries the vector store with `self.context` (the task context from the curriculum agent).
2. The top-k skill **code** bodies are retrieved and injected into the action agent's system prompt.
3. After each iteration step, skills are re-retrieved using an augmented query that includes a summary of execution errors from the chat log.

This means the agent's available skill context adapts within a single task attempt — if initial code fails because it needs a crafting table, the re-query may surface `craftCraftingTable` for the next iteration.

## Self-Verification: The Critic Agent

The critic agent (`critic.py`) is a separate LLM that receives the post-execution game state and the original task, then returns a JSON verdict:

```json
{
    "reasoning": "...",
    "success": true/false,
    "critique": "..."
}
```

### What the Critic Sees

The critic receives: biome, time, nearby blocks, health, hunger, position, equipment, inventory contents, chest contents, the task description, and task context. It does **not** see the generated code or the execution trace — only the resulting game state.

### What the Critic Catches

The prompt includes 7 few-shot examples covering:
- Counting items across categories (2 oak logs + 2 spruce logs = 4 wood logs → success)
- Having materials but not having crafted the target (has planks and sticks but no pickaxe → failure with critique)
- Item name transformations (mining iron_ore yields raw_iron)
- Placement verification via nearby blocks
- Mob kill verification via dropped items
- Eating verification via hunger level
- Deposit tasks verified by inventory slot count

The critique text is fed back to the action agent as part of the next iteration's human message, creating a feedback loop: critic identifies what went wrong, action agent adjusts code.

### Design Choice: State-Based, Not Trace-Based

The critic judges success solely from the resulting state, not from observing the execution. This is robust — it doesn't matter how the agent achieved the result, only whether the result was achieved. But it means the critic cannot diagnose *process* failures (e.g., "you used the wrong pickaxe type" or "you walked in circles for 30 seconds").

## Automatic Curriculum

The curriculum agent (`curriculum.py`) decides what to learn next. This is Voyager's answer to the exploration-exploitation problem.

### Inputs

The curriculum agent receives:
- Current game state (biome, time, blocks, entities, health, hunger, position, equipment, inventory)
- Completed tasks list
- Failed tasks list
- QA context: answers to questions about the current biome (what blocks, items, and mobs are available)

### Warm-Up Mechanism

The curriculum uses a **warm-up schedule** that progressively reveals information. Early in training (< 15 completed tasks), the agent sees minimal context — just nearby blocks and basic stats. As it completes more tasks, additional observation types are unlocked:

- Context QA unlocks at task 15
- Biome info at task 10
- Other blocks at task 10
- Nearby entities at task 5
- Health/hunger at task 15

This prevents the agent from being overwhelmed by information early on and mimics a pedagogical principle: **start simple, add complexity as competence grows**.

Additionally, observations that have passed the warm-up threshold are included with 80% probability (random dropout), preventing the agent from over-relying on any single observation type.

### Task Proposal Logic

1. **First task is hardcoded**: "Mine 1 wood log" — every playthrough starts the same way.
2. **Inventory management triggers**: If inventory is ≥ 33/36 full, the agent is directed to deposit items or craft/place a chest. This is a survival constraint, not a learning goal.
3. **LLM-proposed tasks**: The curriculum prompt instructs the LLM to act as a "mentor" that guides the agent toward novel, appropriately difficult tasks. The prompt includes constraints:
   - Tasks must be specific ("Mine 3 iron ore", not "explore")
   - Tasks should be novel — avoid repetition
   - Tasks should not require visual confirmation (no building, planting)
   - Tasks should be achievable given current resources

### QA System

The curriculum agent runs a two-step QA process to ground its proposals in Minecraft knowledge:

1. **Step 1 — Ask questions**: Given the current state, an LLM generates questions about what's possible in the current biome. Plus 3 hardcoded questions about blocks, items, and mobs in the current biome.
2. **Step 2 — Answer questions**: A second LLM call answers each question. Answers are cached in a vector store to avoid re-answering similar questions.

The QA answers are injected as context into the curriculum's task proposal, ensuring the agent proposes tasks that are actually possible in its current environment (e.g., it won't try to mine diamonds in a plains biome at the surface).

### Task Decomposition

For inference mode (not learning), the curriculum agent can decompose a complex task into subtasks using a separate prompt. This is used when a human gives a high-level goal like "get diamond gear" and the agent needs to plan the prerequisite chain.

## Compositional Skills

### How Skills Reference Earlier Skills

Learned skills compose by calling **control primitives** — the base skill layer. These are hardcoded JavaScript functions:

- `exploreUntil(bot, direction, duration, callback)` — move until a condition is met
- `mineBlock(bot, blockName, count)` — find and mine blocks
- `craftItem(bot, itemName, count)` — craft using a recipe
- `placeItem(bot, itemName, position)` — place a block
- `smeltItem(bot, inputItem, fuel, count)` — smelt in a furnace
- `killMob(bot, mobName, timeout)` — find and kill a mob
- `useChest(bot, chestPosition, action, items)` — chest operations

When the action agent generates code for a new task, it receives both the control primitive signatures and the retrieved learned skills as context. It can call any of them. For example, `craftIronPickaxe` calls `mineBlock`, `smeltItem`, `craftItem`, and `placeItem` — all control primitives.

However, **learned skills do not directly call other learned skills**. The composition is indirect: a learned skill's code may replicate patterns from previously learned skills (because those skills were in the prompt context), but it calls control primitives, not the learned skill functions. This is because all learned skills are injected into the execution environment as available functions via `self.skill_manager.programs`, but the action agent's prompt primarily demonstrates control primitives and retrieved skills as examples to pattern-match from.

In practice, the skill library acts as a **pattern memory** more than a **call hierarchy**. The agent sees "here's how `mineFiveIronOres` does it" and writes similar code that reuses the same primitives, rather than calling `mineFiveIronOres` directly.

### The Programs Property

All learned skills are concatenated with all control primitives into a single `programs` string that is passed to the Minecraft environment for execution. This means every learned skill is technically callable, but the compositional pattern is: control primitives as the API, learned skills as examples.

## What We Should Adopt

### 1. Semantic Retrieval for Instincts

Our instinct system stores observations and patterns, but retrieval is currently file-based (grep, glob). Voyager's approach — generate a natural-language description of each skill, embed it, and retrieve by semantic similarity to the current task — would dramatically improve instinct relevance.

**Concrete application**: When a session starts a task, embed the task description and retrieve the top-k most semantically similar instincts, rather than loading all instincts or relying on filename matching. This is exactly what the `SkillManager.retrieve_skills(query)` method does.

**Key detail**: The embedding is on the *description*, not the *code*. Our equivalent would be embedding the instinct's `description` frontmatter field, not the full file content.

### 2. Automatic Curriculum for Dispatch

Voyager's curriculum agent is the closest existing implementation to what our dispatch system needs. The parallels:

| Voyager | Our System |
|---------|------------|
| Game state observation | Datastore state (plans, tasks, events) |
| Completed tasks list | Completed tasks from records |
| Failed tasks list | Failed/blocked tasks |
| QA context about current biome | Domain knowledge from library |
| Warm-up schedule | Progressive capability unlocking |
| "Novel and interesting" constraint | Leverage-based task selection (Policy 009) |

The warm-up mechanism is particularly relevant: our system currently throws the full organizational state at dispatch decisions. Voyager demonstrates that **progressive information revelation** produces better task selection — start with what's immediately actionable, add strategic context as the agent matures.

The 80% random inclusion of observation types is also worth considering — it would prevent our dispatch from over-fitting to whichever metric happens to be most salient.

### 3. Compositional Skill Hierarchies

Voyager's pattern — hardcoded primitives as the base layer, learned patterns as examples — maps directly to our architecture:

| Voyager | Our System |
|---------|------------|
| Control primitives (`mineBlock`, `craftItem`) | Tools and MCP methods |
| Learned skills in prompt context | Skills and instincts in agent prompts |
| Skill descriptions as retrieval keys | Skill `description` field as retrieval key |
| `programs` concatenation for execution | Skill content loaded into agent context |

The key lesson is that **composition happens through example, not through call chains**. Skills don't need to invoke each other; they need to demonstrate patterns that the action agent can recombine. This validates our current approach where skills are prompt content rather than executable functions.

### 4. State-Based Verification

The critic pattern — a separate LLM that judges success from state, not from observing the process — could improve our review and verification flows. Currently our reviewer examines the changes made (the process). A Voyager-style critic would ask: "given the current state of the repository, has the task been accomplished?" This is more robust to unexpected implementation paths.

### 5. Description-First Indexing

Every skill in Voyager is stored with an LLM-generated description that serves as the semantic key. Our skills have `description` fields in frontmatter, but they're hand-written and inconsistently detailed. Generating standardized, retrievable descriptions — using an LLM to summarize what each skill enables — would make semantic retrieval viable.

## Limitations Worth Noting

- **No skill deprecation**: Skills accumulate forever. There's no mechanism to prune skills that are superseded by better ones.
- **Flat retrieval**: No hierarchy in the vector store — simple skills and complex skills compete equally for the top-k slots.
- **No dependency tracking**: The system doesn't know that `craftIronPickaxe` depends on having learned to smelt iron. Composition is emergent, not explicit.
- **Single-agent**: No multi-agent coordination. The curriculum, action, and critic agents are sequential, not parallel.
- **Hardcoded warm-up**: The warm-up schedule is manually tuned, not learned from experience.

## See Also

- [Continuous Learning in Agentic Harnesses](./continuous-learning-in-agentic-harnesses.md)
- [ECC Skill System Analysis](./ecc-skill-system-analysis.md)
