---
title: "RimWorld Colony Management as a Model for Agentic Systems"
description: "Analysis of RimWorld's colonist management systems — work priorities, skill/passion, decay, mood, storyteller AI, and research trees — as design patterns for multi-agent orchestration."
date-created: 2026-04-05
domain: computing
keywords:
  - agentic-systems
  - game-design
  - colony-simulation
  - dispatch
  - skill-management
sources:
  - title: "Work - RimWorld Wiki"
    url: "https://rimworldwiki.com/wiki/Work"
  - title: "Skills - RimWorld Wiki"
    url: "https://rimworldwiki.com/wiki/Skills"
  - title: "Mental break - RimWorld Wiki"
    url: "https://rimworldwiki.com/wiki/Mental_break"
  - title: "Mood - RimWorld Wiki"
    url: "https://rimworldwiki.com/wiki/Mood"
  - title: "AI Storytellers - RimWorld Wiki"
    url: "https://rimworldwiki.com/wiki/AI_Storytellers"
  - title: "Research - RimWorld Wiki"
    url: "https://rimworldwiki.com/wiki/Research"
  - title: "Algorithmic Authors: RimWorld's AI Storytellers as Agents of Literary Genre"
    url: "https://medium.com/@coyega1328/algorithmic-authors-rimworlds-ai-storytellers-as-agents-of-literary-genre-eff70ea4560c"
---

RimWorld is a colony simulation where the player manages colonists indirectly — setting priorities, schedules, and research directions while colonists autonomously execute work. The player never directly controls a colonist's hands. This constraint produces a management system that maps remarkably well onto multi-agent orchestration, where a harness directs autonomous agents without micromanaging their inference.

## Work Priorities: The 1-4 Dispatch System

RimWorld offers two priority modes. In **simple mode**, each colonist toggles work types on or off. In **manual mode**, each work type gets a priority from 1 (highest) to 4 (lowest), or blank (disabled). A colonist completes all available priority-1 work before touching priority-2 work. Within the same priority level, work types listed further left take precedence.

The work types are ordered by criticality. From left to right: Firefighting, Patient, Doctor, Bed Rest, Basic (flicking switches, etc.), Warden, Handling, Cooking, Hunting, Construction, Growing, Mining, Plant Cutting, Smithing, Tailoring, Art, Crafting, Hauling, Cleaning, Research. Emergency types (Firefighting, Patient, Bed Rest) are typically set to priority 1 for all colonists. Specialized types (Doctor, Cooking, Research) are set to priority 1 only for the best-skilled colonist.

### Mapping to agent dispatch

The 1-4 system maps directly to dispatch priority/leverage scoring:

| RimWorld | Agentic system |
|----------|---------------|
| Priority 1 | Critical path — blocks everything else |
| Priority 2 | High leverage — core office specialty |
| Priority 3 | Background — fill idle capacity |
| Priority 4 | Opportunistic — only when nothing else |
| Blank | Incapable — agent lacks the tool or skill |

The left-to-right ordering within a priority level is the tie-breaking rule. In our system, this is the task-router's secondary sort: when two tasks have equal leverage, prefer the one closer to the critical path.

A key design lesson: setting Hauling to priority 1 causes a colonist to haul every object on the map before doing anything else. **Priority 1 is not "important" — it is "preemptive."** This distinction matters for agent dispatch. A task marked critical should genuinely preempt all other work, not just rank highly.

## Skills and Passion: Aptitude Meets Interest

Each colonist has 12 skills rated 0-20: Shooting, Melee, Construction, Mining, Cooking, Plants, Animals, Crafting, Artistic, Medical, Social, Intellectual. Skills determine work speed and output quality.

The critical mechanic is **passion**, which comes in three tiers:

| Passion level | XP rate | Mood effect |
|--------------|---------|-------------|
| No passion | 35% | None |
| Minor passion (one flame) | 100% | +8 mood |
| Burning passion (two flames) | 150% | +14 mood |

Passion does three things simultaneously: it multiplies learning speed, it provides a mood bonus while working (making breakdown less likely), and it indirectly fights skill decay (faster XP gain offsets the drain). A colonist with burning passion in Cooking learns nearly 4.3x faster than one with no passion, and is happier doing it.

### Mapping to model tier and office affinity

| RimWorld | Agentic system |
|----------|---------------|
| Skill level (0-20) | Model capability tier (haiku/sonnet/opus) |
| No passion (35% rate) | Generic agent on mismatched task |
| Minor passion (100% rate) | Agent with relevant office/skill file |
| Burning passion (150% rate) | Specialist agent with tuned prompt + tools |
| Mood bonus from passion | Lower failure rate when agent works in its specialty |

The lesson: **matching agent to task is not just about capability — it is about learning efficiency and failure resistance.** An opus-tier agent grinding through janitorial tasks is like assigning your level-18 researcher to haul rocks. It works, but the opportunity cost is enormous and the agent gains nothing from the experience.

## Skill Decay: Use It or Lose It

Skills above level 10 decay continuously. XP drains at a constant rate regardless of activity. A skill level is lost only after XP falls to zero and then drops a further 1,000 points below (a buffer preventing rapid oscillation at level boundaries).

The trait "Great Memory" halves decay rate. Passion does not directly slow decay, but because passionate colonists gain XP faster, they can outpace the drain through regular practice.

### Mapping to confidence decay

Our instinct system already implements this pattern: instincts that are not reinforced by observations lose confidence over time. RimWorld adds nuance worth adopting:

- **Decay only above a threshold.** Skills 1-10 never decay. This means basic competencies are permanent, while expert-level skills require maintenance. For agent skills, this suggests: foundational capabilities (file reading, basic search) should not decay, but specialized learned patterns (domain-specific prompt strategies) should.
- **The buffer zone.** Losing 1,000 XP below a level boundary before actually dropping prevents rapid flicker between levels. Our confidence scores should similarly have hysteresis — do not demote a skill on a single failed observation.
- **Decay is constant, not proportional.** A level-20 skill decays at the same rate as a level-11 skill. The difference is that level-20 has more XP buffer. This means: high-confidence instincts are not immune to decay, they just survive longer without reinforcement.

## Mood and Needs: The Breakdown Threshold

Each colonist has a mood score (0-100%) determined by the sum of active "thoughts" — positive and negative modifiers from environment, events, and work. Mental breaks trigger when mood drops below threshold:

| Threshold | Break severity | Examples |
|-----------|---------------|----------|
| Below 35% | Minor | Hiding in room, food binge, sad wander |
| Below 20% | Major | Insulting spree, refusing to work, psychotic wander |
| Below 5% | Extreme | Arson, berserk attack, catatonia |

After a mental break, the colonist receives a "catharsis" thought (+40 mood for 2.5 days), generally preventing spiral breakdowns. A breaking colonist can be arrested to interrupt the episode, but this carries its own risks.

Needs that affect mood include: food, rest, comfort, beauty (environment quality), recreation (variety matters — doing the same recreation type gives diminishing returns), social interaction, and temperature. Notably, **doing work you have passion for provides a mood bonus**, creating a positive feedback loop: passionate workers are happier, less likely to break, and learn faster.

### Mapping to agent failure modes

| RimWorld | Agentic system |
|----------|---------------|
| Mood score | Agent health/reliability metric |
| Negative thoughts | Accumulated errors, context pollution, tool failures |
| Mental break threshold | Failure cascade — agent starts producing bad output |
| Minor break (hiding in room) | Agent stalls — returns empty or generic responses |
| Major break (insulting spree) | Agent hallucinating — confident wrong answers |
| Extreme break (arson) | Agent destructive — deleting files, corrupting data |
| Catharsis post-break | Cool-down period after failure before re-dispatch |
| Arrest to interrupt | Kill the agent session, route to fresh agent |

The catharsis mechanic is particularly instructive. After an agent fails, there should be a recovery period — not immediate re-dispatch on the same task. Our `reflect-on-failure` tool implements half of this: it captures the diagnosis. The missing half is the cool-down: don't re-dispatch the same task type to the same agent configuration immediately.

The recreation variety mechanic also maps well: agents that do the same type of work repeatedly accumulate context fatigue. Rotating between task types (research, then writing, then review) keeps output quality higher than grinding a single type.

## The Scheduling System: Time Allocation

Each hour of the day can be assigned to one of four modes per colonist:

| Mode | Behavior |
|------|----------|
| Sleep | Go to bed if tired, eat if hungry, otherwise work |
| Work | Work regardless of needs (except extreme hunger/exhaustion) |
| Recreation | Fulfill recreation need first, then work if satisfied |
| Anything | Autonomously balance all needs, then work |

The community consensus is that the optimal schedule is simple: 8 hours of Sleep (nighttime, when work speed is reduced), 16 hours of Anything. Complex schedules rarely outperform letting colonists self-manage. The exception is shift work for 24-hour coverage (staggering sleep times) and forced recreation blocks for colonists prone to mental breaks.

### Mapping to agent scheduling

The "Anything" mode is the most efficient because it lets the colonist optimize locally. This validates our current approach: agents should self-select tasks from the ready queue rather than being force-scheduled. The harness sets priorities and constraints; the agent decides when to eat (refresh context), sleep (yield to another agent), or work.

The exception — forced recreation for fragile colonists — maps to: force-review or force-reflection for agents that have accumulated errors. Don't wait for the breakdown; schedule maintenance.

## The Research Tree: Unlocking Capabilities

Research follows a dependency tree with six tech levels: Neolithic, Medieval, Industrial, Spacer, Ultra, Archotech. Each project has a point cost and may require prerequisites. Only one project can be active at a time, but switching preserves progress.

Research speed depends on the researcher's Intellectual skill and the research bench quality. Critically, **your faction's tech level imposes a cost multiplier on higher-tier research**:

| Researching | Tribal faction | Industrial faction |
|-------------|---------------|-------------------|
| Neolithic | 1x | 1x |
| Medieval | 1.5x | 1x |
| Industrial | 2x | 1x |
| Spacer | 2x | 2x |

This creates a natural progression: you research what is cheap and accessible first, building toward the capability to research harder things efficiently. Skipping ahead is possible but expensive.

### Mapping to the Academy curriculum

| RimWorld | Agentic system |
|----------|---------------|
| Research project | Skill file or capability to develop |
| Tech level | Capability tier (basic tooling → orchestration → autonomous loops) |
| Cost multiplier | Complexity overhead — developing advanced capabilities requires foundational ones |
| One project at a time | Focus: develop one capability fully before starting the next |
| Prerequisites | Dependency chain: you cannot build multi-agent orchestration without single-agent reliability |
| Research bench quality | Infrastructure quality — better tooling accelerates capability development |

The "preserve progress on switch" mechanic is worth noting. When we pause development on a capability to address something urgent, the work already done should not be lost. Plans and partial implementations should be resumable, not restarted. Our plan system already handles this with task-level status tracking.

## Synthesis: What RimWorld Teaches About Agent Orchestration

RimWorld's design succeeds because it gives the player **leverage without control**. The player sets priorities, schedules, and research direction. Colonists execute autonomously within those constraints. The systems interact: a well-prioritized colonist with burning passion in their specialty, adequate recreation, and a good environment produces excellent work reliably. A poorly managed colony spirals: bad priorities cause unfinished critical work, which causes environmental degradation, which causes mood drops, which causes mental breaks, which causes more unfinished work.

The same dynamics apply to multi-agent systems:

1. **Priority is preemption, not importance.** Be precise about what truly preempts other work.
2. **Match agents to tasks by affinity, not just capability.** The passion system shows that aptitude alone is insufficient — interest (specialization) multiplies learning and reduces failure.
3. **Skills decay without practice.** Capabilities that are not regularly exercised degrade. This is not a bug; it is information about what the system actually needs.
4. **Monitor agent health, not just output.** The mood system tracks accumulated stress before it manifests as failure. Agent telemetry should do the same.
5. **Simple scheduling beats complex scheduling.** Let agents self-manage within constraints rather than micromanaging time blocks.
6. **Research is sequential and has prerequisites.** Develop capabilities in dependency order. Skipping ahead is expensive.
7. **The storyteller creates pressure, not tasks.** The heartbeat/world-tick should generate events and pressure that surface work, not assign work directly.

## The Storyteller as Heartbeat

The three storytellers represent three event-generation philosophies:

**Cassandra Classic** follows a rising tension curve. Threats escalate, with breathing room between peaks. She is predictable and teaches the player to prepare. This maps to a scheduled review cycle: standup, weekly review, monthly retrospective — each surfacing progressively larger concerns.

**Phoebe Chillax** provides long calm periods with occasional intense events. She favors building over surviving. This maps to a development-focused mode: long stretches of capability building with periodic stress tests.

**Randy Random** ignores curves entirely. Any event can happen at any time with roughly equal probability. He generates the most dramatic stories but also the most colony wipes. This maps to production reality: incidents do not follow schedules.

All three storytellers share a key mechanic: **event selection is weighted by colony state.** Wealthy colonies attract harder raids. Large populations face more social events. Struggling colonies get more trader visits (recovery opportunities). The system is not random — it is responsive. Our heartbeat should similarly read system state (plan progress, error rates, idle capacity) and generate events calibrated to current conditions, not fixed schedules.
