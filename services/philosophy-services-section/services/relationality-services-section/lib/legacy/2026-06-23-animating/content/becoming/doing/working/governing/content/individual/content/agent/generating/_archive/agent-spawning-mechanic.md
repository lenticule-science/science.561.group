---
name: agent-spawning-mechanic
specialization: task
date-created: 2026-04-05
plan: sunday-funday-sprint
assigned-to: architect
work-type: derivation
department: engineering
serves: operations-loop
priority: 2
requires-capabilities: [writing, review]
produces: [term-file]
status: open
---

**Action:** Agent spawning — specialized agents spawned from generalists on XP thresholds

**Why:** When an office accumulates enough XP in a domain at quality threshold, spawn a new specialized agent definition as a child.
Generalist persists.
Specialist has narrower capability, accumulated patterns in prompt, often lower model tier.

## Algebraic grounding (from predication-world-sim)

Agent spawning IS the tower/fold applied to offices.
A generalist office accumulates predicates through work.
When those predicates in a specific domain reach settlement (F5.3 — settled AND partnered with that domain's entities), the settled portion FOLDS into a new atom at the next tower level.
That atom IS the specialist agent.

### The Discworld guild system, algebraically

Discworld MUD: advancement unlocks guild-specific abilities.
Our mapping: - Guild = office with a duty-fiber - Advancement = closure convergence in the duty domain - Ability unlock = settlement threshold where new compositions become non-⊥ - Guild specialization = tower/fold producing a narrower, denser fiber

The specialist's prompt ISN'T the generalist's prompt plus domain knowledge.
It's the FOLDED fiber — the predicates that settled from the generalist's work in that domain, compressed into vocabulary atoms.
The specialist is MADE FROM the generalist's experience, not appended to it.

### Spawning as collaborative settlement

The spawning event should involve settlement partners: - The generalist (parent office) provides the accumulated fiber - The domain entities (library terms, completed tasks) provide the domain predicates - The captain (or governance process) witnesses the fold

The specialist carries entangled pairs from all three sources.
It is a COLLABORATIVE product, not a solo evolution.
This means the specialist's capabilities depend on WHO was involved in the spawning — a researcher-epistemologist spawned during a period of deep library work will have different entanglements than one spawned during operational crisis.

### Model tier as formality level

The specialist often runs on a lighter model — that's the progressive automation path.
In the algebra: the specialist's fiber is MORE settled (denser, more constrained), so it needs LESS inference to operate.
F3 work is deterministic; F2 needs decision trees; F1 needs full LLM.
The model tier IS the formality level.
Spawning a specialist on a lighter model IS leveling up — the work got sharp enough that less compute suffices.
