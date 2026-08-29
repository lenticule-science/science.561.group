---
title: Agent Newsletters from the Graph
layer: spec
status: someday
keywords:
  - agents
  - newsletters
---
# Agent Newsletters from the Graph

Autonomous relational agents that live in the graph, watch for recognitions they
care about, and periodically write “newsletters” (Substack-style or otherwise)
in particular tones of voice.

## 1. Core recognitions

- `AgentRecognition` (from autonomous relational agents spec)
  - extended with:
    - `audience` (who this agent writes for),
    - `tone` (e.g., dry analyst, cozy friend, experimental poet),
    - `domains_of_interest` (finance, ecology, MUD, health, etc.).

- `WatchProfileRecognition`
  - what the agent watches:
    - filters over recognitions (types, tags, topology regions),
    - thresholds on measurement channels (e.g., portfolio volatility,
      ecological indicators, health metrics),
    - cadence (daily, weekly, on-change).

- `NewsletterIssueRecognition`
  - an “issue” the agent produced:
    - time window, recognitions covered,
    - rendered text/HTML/Markdown,
    - links back to all underlying recognitions.

- `SubscriberRecognition`
  - who wants to receive which agent’s issues (could be people, other agents,
    or external endpoints like Substack/Email integrations).

## 2. Agent behavior loop

For a newsletter agent:

1. **Observe**
   - Periodically or on trigger:
     - query the graph using its `WatchProfileRecognition`,
     - fetch relevant recognitions + recent changes + measurements.

2. **Select & structure**
   - Decide which changes/events to include:
     - cluster by topic, importance, or audience relevance,
     - build an internal “outline” recognition for this issue.

3. **Write**
   - Use its tone/persona (cf. `generated-personalities.md`) plus the outline to
     generate prose:
     - may call an LLM, rule-based templates, or other generators,
     - always grounded in explicit references (IDs, measurements).

4. **Publish**
   - Create a `NewsletterIssueRecognition`:
     - store content + metadata + links to sources,
     - optionally trigger runbooks to:
       - email subscribers,
       - post to ActivityPub,
       - render on your personal site.

5. **Reflect**
   - Record measurements:
     - which links were followed,
     - which sections resonated (if observable),
     - adjust `WatchProfileRecognition` and tone over time.

All of these steps are runbooks; the agent only chooses *when* and *which* to
invoke, under policy.

## 3. Examples of newsletter agents

- **Financial Analyst Agent**
  - watches: `markets-analysis.md`, `finance-budget.md`, on-chain readings.
  - tone: cautious, explanatory.
  - writes: weekly summaries of portfolio behavior, market signals, and how they
    align or conflict with your values.

- **Ecology & Weather Agent**
  - watches: `socio-ecological.md`, `measurements-ecology-health.md`,
    `astronomy.md` (for sky/weather links if you want).
  - tone: naturalist, field notes.
  - writes: observations about local climate patterns, ecosystem changes, and
    relevant papers or decisions.

- **MUD Chronicle Agent**
  - watches: MUD recognitions (`mud.md`), mythic/symbolic recognitions.
  - tone: in-world storyteller.
  - writes: in-universe chronicles of major events, injuries, quests, and
    emergent narratives.

## 4. Alignment and safety

Because newsletter agents are just relational agents:

- they cannot fabricate underlying facts:
  - every claim should be tied to recognitions and their measurements.
- their tone/content is constrained by:
  - `ValueRecognition` / `NormRecognition`,
  - policies about what can be shared (privacy, ethics).
- their actions (queries, runbook calls, publications) are traceable via
  `AgentActionRecognition` and `NewsletterIssueRecognition`.

This makes “Substack-style agents” a natural, inspectable part of the universal
relational computer, rather than opaque side processes.
