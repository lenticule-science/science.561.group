---
title: "Agential"
description: "The agential layer: persona-agents, offices, sessions-as-processes, model-backed inference. Specs that describe agents acting on the substrate."
kind: index
---


The agential subsystem covers everything that distinguishes "an agent acting" from "the substrate computing."
Sessions, persona-agents, offices, the formality-layer, and the non-LM model surface that lets office work compute without invoking a language model.

This directory is the home for specs that the v0.8 release ([`milestones/v0.8-agential-layer.md`](../../milestones/v0.8-agential-layer.md)) operationalizes.
Earlier process-shaped specs ([`process/session-as-process.md`](../process/session-as-process.md), [`process/dispatch-as-scheduler.md`](../process/dispatch-as-scheduler.md), [`process/runbook-as-program.md`](../process/runbook-as-program.md)) remain in `process/` because they describe the OS-level process model independently of who is acting; specs here describe agential discipline that composes on top of that model.

## Specs (to be written at v0.8 partial; v0.9 full for the model-training surface)

- `non-lm-models.md` — Tier-2 statistical model artefacts as substrate cells: weight storage, training-event records, inference invocation contract, federation policy, retraction discipline.
- `skill-registry.md` — agent-side consumption of the skill manifest aggregated by [`stdlib/skill-manifest.md`](../stdlib/skill-manifest.md).
  Candidate scoring (`trigger-match`, `capability-fit`, `supersession-recency`, `tier-admissibility`), `select-skill-for-task` surface, manifest-version pinning, capability composition at fire time.
- `ideas-to-plans-pipeline.md` — five-stage substrate-resident pipeline (`idea` → `review` → `plan-draft` → `spec-edit` → `integrated`) that promotes raw triage notes into normative sprint material.
  Pipeline-card cell shape, transition closure rules, capability discipline, integration backlink protocol (`integrated-into` ↔ `source-idea` frontmatter symmetry), blocked-card lane, conformance vectors.
  Composes with [`../governance/triage-workflow.md`](../governance/triage-workflow.md) for the governance-app-facing surface.

## Theory grounding

- `agential-orchestration-platform/concepts/formality-layer` — F0–F6 grading of office work.
- `agential-orchestration-platform/concepts/personnel-vs-office` — the entity-class separation enforced by [`security/persona-and-personnel.md`](../security/persona-and-personnel.md).
- `agential-orchestration-platform/objects/agent-record`, `skill-record`, `office-record`, `session-record`.
- `agential-orchestration-platform/theorems/settlement-path-cost-monotonicity` — every promotion strictly reduces expected per-respond cost.
- `predicated-computing/concepts/closure-rule-system` — the algebra Tier-2 models compose against.

### Sibling-theory grounding (per [`references/theories.md` §"Sibling computing theories"](../../references/theories.md))

The agential layer also draws on two computing-theory siblings that sit outside the predication chain but whose results inform agential discipline:

- [`artificial-intelligence/theories/agents`](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/artificial-intelligence/theories/agents/) — three-condition characterisation of agentic systems, action-space algebra, observation-state-action loop, delegation-chain accountability, multi-agent coordination overhead.
  Direct authority for the persona-agent (8B) and companion (8G) specs and for the persistent-session subsystem (7G); the delegation-chain results ground the modal-restriction composition that bounds agent self-queueing.
- [`artificial-intelligence/theories/swarm-intelligence`](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/artificial-intelligence/theories/swarm-intelligence/) — stigmergy, ACO/PSO classical convergence, and the structural reasons LLM-based swarms fail classical convergence.
  Direct authority for the substrate's preference for [`dispatch-composes-authorization`](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/dispatch-composes-authorization.md) over emergent coordination — when this directory authors the multi-agent coordination spec, swarm-intelligence's negative results are the cited authority for *why* coordination is orchestrated rather than emergent.

## Conformance

The agential subsystem passes:

1. A Tier-2 model record loads, infers against a fiber projection, and emits cells whose `derived_from` chain reaches back to the model record and the input projection.
2. The same model + input → byte-identical output across replays and across Python/Rust implementations.
3. A model retraction propagates dependent-invalidity to every cell whose `derived_from` chain includes the retracted weights.
4. Federated peers exchange model records under the same signing/witness discipline as any other substrate entity.
5. `select-skill-for-task` returns a deterministic ranked candidate list across replays and across Python/Rust runtimes for the same substrate state and session attribution; pinning an invocation to a stale `manifest-version` surfaces `PCS_SKILL_MANIFEST_VERSION_MISMATCH`.
