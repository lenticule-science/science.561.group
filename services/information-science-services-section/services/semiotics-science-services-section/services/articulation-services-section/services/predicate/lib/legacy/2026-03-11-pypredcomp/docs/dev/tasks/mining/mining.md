---
title: "Mining tasks"
description: "Source bundles in the captain's archive that need extraction into replit-sprint specs. Each task is one bundle; outcome is one or more spec files."
kind: index
---

# Mining tasks

Sources the captain has produced over years of design work that haven't been distilled into replit-sprint specs yet.
Each task here represents one bundle to extract.
The Replit Agent should not have to read these directly; this directory's specs are the consolidation.
Each completed mining task produces (or updates) specs in `../../specs/`.

## Owner agent + runbook

- **Owner**: [mining-curator](../../../../../engineering/agents/mining-curator.md) — extracts decisions, wire formats, error codes, and interface contracts; transposes with citation, never invents.
- **Runbook**: [mine-one-source-bundle](../../../../../engineering/runbooks/mine-one-source-bundle.md) — the per-task workflow.
- **Skill pack**: [mining](../../../../../engineering/skills/mining/_index.md) — ten skills the curator uses.
- **Vocabulary gate**: [vocabulary translation](../../references/vocabulary-translation.md) — the gate before anything is written into the sprint.

To pick up a task: read the runbook, then work through one row below.

## Tier 1 — core architecture (highest value)

| Task | Source | Spec output | Status |
|---|---|---|---|
| [m01-cce.md](m01-cce.md) | `…/semiotic-cell-machine/cce.md` (332 lines) | `specs/respond.md` (extend), `specs/closure-engine-internals.md` (new) | pending |
| [m02-cdf.md](m02-cdf.md) | `…/semiotic-cell-machine/cdf.md` (1424 lines) | `specs/cellular-data-format.md` (new) | pending |
| [m03-cds.md](m03-cds.md) | `…/semiotic-cell-machine/cds.md` (419 lines) | `specs/cell-record.md` (extend) | pending |
| [m04-rtl.md](m04-rtl.md) | `…/semiotic-cell-machine/rtl.md` (266 lines) + `docs/specs/semantics/language.md` (101 lines) + `docs/specs/carriers/language-json.md` (90 lines) | `specs/message-language.md` (new) | pending |
| [m05-rdf-profile.md](m05-rdf-profile.md) | `…/semiotic-cell-machine/rdf-profile.md` + `docs/specs/host/rdf.md` (~950 lines) | `specs/rdf-projection.md` (new) | pending |
| [m06-trace-universe.md](m06-trace-universe.md) | `…/semiotic-cell-machine/docs/specs/semantics/trace-universe.md` (2403 lines) | `references/predcat-translation-guide.md` (new) | pending |
| [m07-development-roadmap.md](m07-development-roadmap.md) | `…/semiotic-cell-machine/development-roadmap.md` (4374 lines) | `plans/sequenced-phases.md` (new) | pending |
| [m08-relational-computer.md](m08-relational-computer.md) | `…/sscu-sprint/.../relational-computer/architecture.md` (~3000+ lines) | `specs/isa.md` (new), `specs/computational-model.md` (new) | pending |
| [m09-tech-bucket-2-spec.md](m09-tech-bucket-2-spec.md) | `…/from-tech-bucket-2/SPEC.md` (6593 lines) | scope-and-route to existing specs (likely supersedable) | pending |
| [m10-node.md](m10-node.md) | `…/semiotic-cell-machine/node.md` (389 lines) | `specs/runtime-cycles.md` (extend), `specs/node-config.md` (new) | pending |

## Tier 2 — FaRS cross-cutting concerns (mid value, broad coverage)

The captain's `fars-analyses/` corpus is twelve "analyzing FaRS X across research" files.
Each consolidates the design discussion of one cross-cutting concern across many sources.

| Task | Source | Spec output | Status |
|---|---|---|---|
| [m20-fars-architecture-settlement.md](m20-fars-architecture-settlement.md) | `analyzing-fars-architecture-and-settlement-across-research.md` | `specs/respond.md` (extend), `specs/architecture-decisions.md` (new) | pending |
| [m21-fars-containment-composition.md](m21-fars-containment-composition.md) | `analyzing-fars-containment-and-composition-across-research.md` | `specs/scope.md` (new) | pending |
| [m22-fars-dispatch-matching.md](m22-fars-dispatch-matching.md) | `analyzing-fars-dispatch-and-matching-across-research.md` | `specs/apps/dispatch.md` (extend) | pending |
| [m23-fars-federation-distribution.md](m23-fars-federation-distribution.md) | `analyzing-fars-federation-and-distribution-across-research.md` | `specs/federation-protocol.md` (new) | pending |
| [m24-fars-interface-boundary.md](m24-fars-interface-boundary.md) | `analyzing-fars-interface-and-boundary-across-research.md` | `specs/interfacers/_index.md`, `specs/boundary.md` (new) | pending |
| [m25-fars-interfacers.md](m25-fars-interfacers.md) | `analyzing-fars-interfacers-across-research.md` | `specs/interfacers/*.md` (multiple) | pending |
| [m26-fars-learning-feedback.md](m26-fars-learning-feedback.md) | `analyzing-fars-learning-and-feedback-across-research.md` | `specs/apps/review.md` (extend), `specs/apps/academy.md` (extend) | pending |
| [m27-fars-messaging-events.md](m27-fars-messaging-events.md) | `analyzing-fars-messaging-and-events-across-research.md` | `specs/event-log.md` (extend), `specs/apps/chat.md` (extend) | pending |
| [m28-fars-offices-governance.md](m28-fars-offices-governance.md) | `analyzing-fars-offices-and-governance-across-research.md` | `specs/apps/governance.md` (extend), `specs/office.md` (new) | pending |
| [m29-fars-scope-sandboxing.md](m29-fars-scope-sandboxing.md) | `analyzing-fars-scope-and-sandboxing-across-research.md` | `specs/scope.md` (extend) | pending |
| [m30-fars-session-memory.md](m30-fars-session-memory.md) | `analyzing-fars-session-and-memory-across-research.md` | `specs/apps/sessions.md` (extend), `specs/memory-tiers.md` (new) | pending |
| [m31-fars-tick-execution.md](m31-fars-tick-execution.md) | `analyzing-fars-tick-and-execution-across-research.md` | `specs/runtime-cycles.md` (extend) | pending |

## Tier 3 — FaRS from external systems (informs design choices)

For each FaRS-from-X analysis, extract: (1) which patterns FaRS adopts, (2) which it rejects, (3) which inform specific specs.

| Task | Source | Spec output | Status |
|---|---|---|---|
| [m40-ecc.md](m40-ecc.md) | `analyzing-how-everything-claude-code-informs-development-of-fars.md` | references-driven design notes | pending |
| [m41-openclaw.md](m41-openclaw.md) | `analyzing-how-openclaw-informs-development-of-fars.md` | likely `specs/apps/sessions.md`, `specs/memory-tiers.md`, `specs/dm-policy.md` | pending |
| [m42-cline.md](m42-cline.md) | `analyzing-how-cline-informs-development-of-fars.md` | likely `specs/loop-detection.md`, `specs/compaction.md` | pending |
| [m43-aider.md](m43-aider.md) | `analyzing-how-aider-informs-development-of-fars.md` | references-driven | pending |
| [m44-openhands.md](m44-openhands.md) | `analyzing-how-openhands-informs-development-of-fars.md` | references-driven | pending |
| [m45-swe-agent.md](m45-swe-agent.md) | `analyzing-how-swe-agent-informs-development-of-fars.md` | references-driven | pending |
| [m46-lpmud.md](m46-lpmud.md) | `analyzing-how-lpmud-discworld-informs-development-of-fars.md` | likely `specs/runtime-cycles.md` (heartbeat), `specs/apps/simulation.md` | pending |
| [m47-bussard.md](m47-bussard.md) | `analyzing-how-bussard-informs-development-of-fars.md` | likely `specs/event-log.md`, `specs/apps/chat.md` | pending |
| [m48-mud-autonomous.md](m48-mud-autonomous.md) | `analyzing-how-mud-autonomous-worlds-informs-development-of-fars.md` | `specs/apps/simulation.md` | pending |
| [m49-dwarf-fortress.md](m49-dwarf-fortress.md) | `analyzing-how-dwarf-fortress-informs-development-of-fars.md` | `specs/apps/simulation.md` | pending |
| [m50-rimworld.md](m50-rimworld.md) | `analyzing-how-rimworld-informs-development-of-fars.md` | `specs/apps/simulation.md` | pending |
| [m51-voyager.md](m51-voyager.md) | `analyzing-how-voyager-informs-development-of-fars.md` | `specs/apps/academy.md` | pending |
| [m52-reflexion-lats.md](m52-reflexion-lats.md) | `analyzing-how-reflexion-and-lats-informs-development-of-fars.md` | `specs/apps/review.md` | pending |
| [m53-ics.md](m53-ics.md) | `analyzing-how-industrial-control-systems-informs-development-of-fars.md` | `specs/apps/ics.md` (extend) | pending |
| [m54-qtops.md](m54-qtops.md) | `analyzing-how-qtops-informs-development-of-fars.md` | likely `specs/apps/fleet.md` | pending |
| [m55-tab.md](m55-tab.md) | `analyzing-how-tab-informs-development-of-fars.md` | likely `specs/apps/simulation.md` (TAB is captain's earlier work) | pending |
| [m56-ai-memory-systems.md](m56-ai-memory-systems.md) | `analyzing-how-ai-memory-systems-informs-development-of-fars.md` | `specs/memory-tiers.md` | pending |
| [m57-huggingface.md](m57-huggingface.md) | `analyzing-how-huggingface-informs-development-of-fars.md` | likely `specs/apps/academy.md` (training infra) | pending |
| [m58-messaging-systems.md](m58-messaging-systems.md) | `analyzing-how-messaging-systems-informs-development-of-fars.md` | `specs/apps/chat.md`, `specs/event-log.md` | pending |
| [m59-guix-guile.md](m59-guix-guile.md) | `analyzing-how-guix-guile-informs-development-of-fars.md` | `decisions/deployment-via-guix-or-nix.md` | pending |

## Tier 4 — universe docs (cross-cutting application universes)

| Task | Source | Spec output | Status |
|---|---|---|---|
| [m70-knowledge-fabric.md](m70-knowledge-fabric.md) | `…/ideas-from-some-old-draft/knowledge-fabric-universe.md` | `specs/apps/knowledge.md` (extend) | pending |
| [m71-measurement-analytics.md](m71-measurement-analytics.md) | `measurement-analytics-universe.md` | `specs/apps/fleet.md` (extend), `specs/apps/ics.md` (extend) | pending |
| [m72-media-experience.md](m72-media-experience.md) | `media-experience-creativity-universe.md` | `specs/apps/publishing.md` (extend), `specs/apps/simulation.md` (extend) | pending |
| [m73-productivity-operations.md](m73-productivity-operations.md) | `productivity-operations-universe.md` | `specs/apps/tasks.md` (extend), `specs/apps/sessions.md` (extend) | pending |
| [m74-relational-agency-governance.md](m74-relational-agency-governance.md) | `relational-agency-governance-universe.md` | `specs/apps/governance.md` (extend), `specs/apps/personas.md` (extend) | pending |
| [m75-resource-storage-replication.md](m75-resource-storage-replication.md) | `resource-storage-replication-universe.md` | `specs/storage-layout.md` (extend), `specs/federation-protocol.md` (extend) | pending |
| [m76-runtime-orchestration.md](m76-runtime-orchestration.md) | `runtime-orchestration-universe.md` | `specs/runtime-cycles.md` (extend), `specs/runtime-state.md` (extend) | pending |
| [m77-simulation-science-topology.md](m77-simulation-science-topology.md) | `simulation-science-topology-universe.md` | `specs/apps/simulation.md` (extend), `specs/apps/ics.md` (extend) | pending |

## Tier 5 — mash-engine

| Task | Source | Spec output | Status |
|---|---|---|---|
| [m80-mash-engine-docs.md](m80-mash-engine-docs.md) | `operations/engineering/services/mash/docs/src/` (mdBook) | `references/mash-engine.md` (new) — what's in code, what to copy/port | pending |
| [m81-mash-engine-algebra.md](m81-mash-engine-algebra.md) | `operations/engineering/services/mash/crates/mash-engine/src/algebra/` | `specs/cell-record.md` reference, port-and-adapt notes | pending |
| [m82-mash-engine-proof.md](m82-mash-engine-proof.md) | `operations/engineering/services/mash/crates/mash-engine/src/proof/` | `specs/respond.md` reference, port-and-adapt notes | pending |
| [m83-mash-engine-hub.md](m83-mash-engine-hub.md) | `operations/engineering/services/mash/crates/mash-engine/src/hub/` | `specs/runtime-cycles.md` reference | pending |

## Execution discipline

For each mining task:

1. Open the source file.
  Read in full (not just headers).
  Do not skim.
2. Extract: (a) decisions made, (b) wire-format / shape commitments, (c) error codes, (d) concrete examples, (e) interface contracts, (f) what this spec replaces or supersedes.
3. Translate vocabulary into PredCat / PredComp / AgOP terms.
  Record translation in [references/vocabulary-translation.md](../../references/vocabulary-translation.md).
4. Update the named spec output file.
  Cite the source path in the spec's frontmatter so the agent can drill back.
5. Update this index — mark the task `done`, list the specific spec sections updated.

The agent reads the resulting specs directly.
They do not chase mining task files.
Mining task files are the captain's audit trail of what was extracted from where.
