---
title: "Agent governance enrichment — term status, task briefs, cross-plan deps"
specialization: analysis
date-created: 2026-04-03
serves: agent-governance-enrichment
---

Library-side work to make harness orchestration principled — connecting governance domain (`library/.../sociology/work/domains/governance/`: role, office, officer, delegation, Hohfeld, accountability) to AI agents domain (agent-orchestration, multi-agent-system, tool-use).
The governance terms provide normative theory; agent terms provide implementation patterns; the bridge makes orchestration principled rather than ad hoc.
This plan produces library content that ops-dispatch-stage and agentic-orchestration reference — it does NOT own harness engineering.

## Current state — governance domain (well-developed)

| Term | Status | Notes |
|---|---|---|
| role | clean | formal triple, four invariants, nuclear derivation; research separated to survey |
| office | clean | four components, body politic/natural, vacancy, structural opposition |
| officer | new (2026-04-03) | three conditions; officer vs incumbent vs role-bearer |
| delegation | clean | four invariants, Hohfeldian positions, sub-delegation |
| assignment | clean | three conditions (capability/authority/capacity) |
| incumbent | clean | formal quadruple, two-body doctrine, two-stage installation |
| officium | clean | triadic structure, discharge condition, Stoic background |
| investiture | exists, unread | may need enrichment |
| accountability | exists, unread | key for tracing task |

## Current state — agent domain (partial)

| Term/Text | Status |
|---|---|
| agent | clean (three framings) |
| agent-orchestration | enriched (four design decisions + orchestration/choreography) |
| multi-agent-system | clean (four patterns, three open problems) |
| multi-agent-orchestration-in-practice | new text (ECC patterns → governance theory) |
| social-role-theory-survey | new (seven traditions) |
| orchestration/choreography survey | **missing** — only mentioned, needs proper text |
| accountability tracing | **missing** — concept exists in governance, not bridged to agents |

## Bridging texts

| Text | Status | Covers |
|---|---|---|
| dispatch and delegation survey | complete | Mintzberg, Fayol, Barnard, kanban, Gerkey-Matarić, Hohfeld |
| multi-agent orchestration in practice | complete | ECC patterns mapped to delegation/role/office theory |
| formal structure of delegation | complete | presheaf model, Heyting algebra proofs |
| formal structure of office | complete | nuclear doctrine, Roman legal correspondence |
| **agent governance bridge** | **missing** | the synthesis — what governance theory tells us the harness should do |

## Phase 1 — disambiguation and gap-filling (completed)

- **disambiguate-role-term** — separated ~120 lines of social role theory from role.md into social-role-theory-survey.md; role.md now has only formal definition, invariants, nuclear derivation, comparison tables.
- **write-officer-term** — created officer.md (referenced by officium.md L47, role.md's `related`, office.md's description).
  Three conditions for officership, officer vs. incumbent, Hohfeldian profile, usufruct limitation.
- **write-multi-agent-practice-text** — created multi-agent-orchestration-in-practice.md bridging ECC patterns (dispatch, pipeline, phased orchestration, worktree isolation) to governance theory.

## Phase 2 — surveys (open, parallel)

- **survey-orchestration-choreography** — Milner π-calculus (1999), W3C WS-CDL (2005), Honda/Yoshida/Carbone multiparty session types (POPL 2008).
  Application: Claude Agent SDK's TeammateTool (choreography) vs Agent tool (orchestration); ECC dmux (mixed). → `library/.../agents/texts/orchestration-and-choreography-survey.md`.
- **write-accountability-tracing-term** — accountability tracing for multi-agent systems, bridging governance accountability to agent-systems (error tracing through delegation chains, event logs, handoff docs).
  Grounded in delegation's accountability-non-transfer invariant + Young event sourcing (2010).

## Phase 3 — synthesis (depends on 1 and 2)

**research-agent-governance-bridge** — given clean governance terms, clean agent terms, practice text, orchestration/choreography survey, accountability tracing: what should the harness do that it doesn't yet?
Sub-questions: - Should agent definitions carry Hohfeldian position frontmatter (powers/duties/privileges/immunities)? - Can role subsumption ordering (ι_R from role.md) generate the agent hierarchy instead of hand-maintaining? - What does investiture look like for software agents — is install.js the constitutive speech act binding body politic (agent definition) to body natural (running instance)? - How do the four delegation invariants constrain /dispatch and /orchestrate? - Does orchestration/choreography map to push/pull dispatch?

## Cross-plan dependencies

**Feeds:** - ops-dispatch-stage — authority-scope-checking (delegation's boundedness), push-pull-dispatch-selection (work-type), failure-reassignment-saga (accountability tracing) - agentic-orchestration — Phase 7 computational bridge envisions predicate-derived capabilities

**Draws from:** - ops-research-foundations (complete) — dispatch/delegation survey, work-type-classification survey, execution/monitoring survey - work-domain-layer-separation — clean work taxonomy (process/procedure/derivation/inquiry) prerequisite for bridge research

## Success criteria

- every governance term referenced by harness has clean definition (no mixed research)
- bridge text/term set maps governance concepts to agent implementation with specific actionable mappings (not analogies)
- agent domain has proper orchestration/choreography survey
- accountability tracing defined well enough for dispatch plan's failure-reassignment to reference
- dispatch plan's tasks cite library terms that resolve to clean content
