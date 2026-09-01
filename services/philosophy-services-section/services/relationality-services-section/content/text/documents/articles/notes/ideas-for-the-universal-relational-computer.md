---
title: Ideas for the Universal Relational Computer
keywords:
  - index
  - ideas
---
# Ideas Index

This directory collects **prospective** design notes for future slices of the
universal relational computer. Each file is intentionally a *plan*, not code
and not a binding specification: it names recognitions, measurements, topology,
and runbooks for a domain so that, when the core system is ready, we can lift
the idea into real specs and implementations under `docs/app/spec/` and
`docs/app/arch/`.

## Shared pattern

Nearly every idea should answer the same questions:

1. **What are the core recognitions?**
   - What are the “things that matter” in this domain (objects, events,
     relationships, states)?
2. **How do topology and measurement apply?**
   - What graphs/structures relate these recognitions?
   - What observables do we care about over time?
3. **What runbooks live here?**
   - What workflows/actions manipulate these recognitions (diagnose, intervene,
     explore, compare, publish, etc.)?
4. **How does this connect to other domains?**
   - Which ideas does it naturally touch (health, ecology, MUD, governance,
     markets, inner work, etc.)?

Future idea notes should follow this pattern, even if only in a lightweight
way.

## Current idea categories

### Core “infrastructure of life”

- Learning & curriculum: `learning-curriculum.md`
- Calendar, tasks, and planning: `calendar-tasks.md`
- Projects & coordination: `projects-coordination.md`
- Finance & budgets: `finance-budget.md`
- Medical data & care: `medical-data-care.md`
- Personal site & PKM: `personal-site.md`
- Relational spreadsheet views: `relational-spreadsheet.md`

### Social, governance, and communities

- ActivityPub & social: `activitypub.md`
- Social timelines & personal streams: `social-timelines.md`
- Email & messaging: `email-messaging.md`
- Governance & community: `governance-community.md`
- Government decisions & measurement: `government-decisions-measurement.md`
- Care networks & mutual aid: `care-networks.md`
- Open-source communities: `open-source-communities.md`

### Knowledge, research, and media

- Research reading & literature review: `research-reading.md`
- Lab notebook & experimental pipeline: `lab-notebook.md`
- Archives & media: `archives-media.md`
- Static docs from the graph: `static-docs-generator.md`
- Relational notebook assistant: `relational-notebook-assistant.md`
- Papers/weather/health measurements: `measurements-ecology-health.md`
- Astronomy: `astronomy.md`
- Newsfeeds & Activity streams: `newsfeeds-analysis.md`
- Web browsing sessions & hyperlink graphs: `web-browsing-sessions.md`
- Search, indexing, and retrieval: `search-index-views.md`

### Health, bodies, and inner work

- Medical data & care plans: `medical-data-care.md`
- Dreams, inner work, therapy notes: `dreams-inner-work.md`
- Micro-rituals & everyday magic: `micro-rituals-everyday-magic.md`
- System weather & self-care (including reiki): `system-weather.md`, `reiki-system.md`

### Devices and embodiment

- Mobile devices and personal sensors: `mobile-devices-sensors.md`

### Ecology, land, and environment

- Socio-ecological systems: `socio-ecological.md`
- Climate & ecology measurements: `measurements-ecology-health.md`
- Disaster preparedness & response: `disaster-response.md`
- Home & environment automation: `home-automation.md`

### Work, making, and practice

- Codebase & refactoring graph: `code-refactoring.md`
- Developer environment & code intelligence: `developer-environment.md`
- Craft & making: `craft-making.md`
- Music practice & composition: `music-practice.md`
- Robotics & embodied agents: `robotics-embodied.md`
- City infrastructure & transit: `city-infrastructure.md`
- Logistics & supply chains: `logistics-supply-chains.md`
- GUI graph workbench: `gui-graph-workbench.md`
- Dataview-style query language: `dataview-query-language.md`
- S-expression template language: `sexp-template-language.md`

### Interface, desktop, and attention

- Relational desktop & window manager: `relational-desktop.md`
- Notifications & attention routing: `notifications-attention-routing.md`

### Play, story, and symbolic domains

- Relational MUD toy: `mud.md`
- Generative music, visuals, personalities: `generated-music.md`, `generated-visuals.md`, `generated-personalities.md`
- Creative writing & worldbuilding: `creative-worldbuilding.md`
- Mythic archetypes & narrative fields: `mythic-archetypes.md`
- Synchronicity & coincidence graphs: `synchronicity-coincidence.md`
- Personal symbol systems: `personal-symbol-systems.md`
- Liminal spaces & glitch topology: `liminal-glitch-topology.md`
- Astrology & aquarian math: `astrology-aquarian-math.md`
- Physics calculator and simulation library: `physics-calculator.md`
- Newtonian physics simulation: `newtonian-physics-sim.md`
- Relational space program (KSP-style): `space-program.md`
- Cosmogenesis and emergent universes: `cosmogenesis.md`
- Quantum physics simulation: `quantum-physics-sim.md`
- Relational physics simulation: `relational-physics-sim.md`

### Markets, law, and institutions

- Markets & portfolio analysis: `markets-analysis.md`
- Legal agreements & contracts: `legal-contracts.md`
- Institutions (schools, orgs, labs): `institutions.md`

### Identity, multi-user, and distribution

- Multi-user relational computer: `multi-user-computer.md`
- Consent and data governance: `consent-data-governance.md`

### Agents, distribution, and meta

- Multi-agent collaboration: `multi-agent.md`
- Autonomous relational agents: `autonomous-relational-agents.md`
- Distributed relationality: `distributed-relationality.md`
- Blockchain (on-chain reading): `blockchain-onchain-reading.md`
- Value alignment & ethics: `value-alignment-ethics.md`
- Domain definitions (schemas, runbooks, handlers): `domain-definition.md`

### Notes

- Some ideas appear in multiple categories; that’s expected.
- When a domain feels ready to “graduate” from idea to spec, we can:
- extract its recognition vocabulary into `docs/app/spec/`,
- link its architecture into `docs/app/arch/`,
  - and implement its runbooks/handlers in `app/`.
