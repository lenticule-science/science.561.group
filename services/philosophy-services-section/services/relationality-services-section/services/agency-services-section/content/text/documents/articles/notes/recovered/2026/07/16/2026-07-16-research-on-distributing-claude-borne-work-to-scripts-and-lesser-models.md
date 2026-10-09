---
title: "Research on distributing claude borne work to scripts and lesser models"
description: "Prior-art sweep synthesis and pilot evidence for distributing Claude-borne work to scripts and lesser models"
date-created: 2026-07-16
kind: research-note
in-service-of: lib/emsenn
tags:
  - distribution
  - quartet
  - swarm
  - nvidia
  - routing
  - prior-art
status: design
declared-by: claude
---
# Research on distributing claude borne work to scripts and lesser models

This note consolidates the 2026-07-16 conglomerate-wide prior-art sweep and the same day's pilot evidence for the program recorded as requirement `distribute-claude-borne-work-to-scripts-and-lesser-models` (from-idea of the same name; funded by decision record `fund-distributing-claude-borne-work-to-scripts-and-lesser-models` as a bounded pilot). It exists so the next session recalls this synthesis instead of re-deriving it.

## The program's ancestry, by concept

**The quartet (process / procedure / derivation / inquiry).** Canonical ancestor: the archived work-taxonomy 2x2 ("meaning settled x execution settled") at `lib/emsenn/services/561-group/services/red-cup-engineering/src/_archive/2026-06-17-archive.emsenn.net/content/emsenn-archive-org/emsenn/archive/hacking/from-relationality-repo/operations-science-publications-websites-emsenn-net/library/theories/humanities/theories/business/terms/process/index.html` and its sociology/work-taxonomy siblings. Executable ancestor: the predicated-agentic-orchestration-platform spec (same archive tree, `.../spec/skills.md`), which binds process→script, procedure→conditional, derivation→typed llm-call with result_type, inquiry→open-ended loop — using the same sigma/delta notation the live `skill.schema.json` closure-kind enum now carries. Mathematical ancestor: the obsmetrologia closure-kind corpus node (nuclear-quartet theorem). The four live glossary terms (`lib/emsenn/services/561-group/services/board-of-directors/services/executive-office/content/glossary/terms/{process,procedure,derivation,inquiry}.md`) now cite all of this.

**Swarm dispatch to graded endpoints.** The load-bearing record is `.../2026-07-05-561-group/working/hacking/composting/library/doing/working/hacking/doing/working/planning/library/project/library/swarm-self-improvement/swarm-self-improvement.md`: a 5-minute heartbeat dispatching prompt-shaped tasks to free-tier endpoints (cerebras/groq/nvidia-nim/mistral/huggingface), endpoint records carrying `work-types`, `rate-limit-rpm`, `monthly-budget-tokens`, `grade`, tasks carrying `prefer-endpoint` with an escalate-on-repeated-failure rule, replies landing as drafts for operator lift/discard. This is the program, already sketched; the current pilot re-grows it inside the firm's record discipline.

**Complexity-to-tier routing.** `.../technology/archive/domains/computing/domains/on-device-inference/model-selection-for-local-inference.md` (lenticule archive): classification→3B, extraction→3B-7B, generation→7B+, hardware routing, and a **model trust ordering** — a lower-trust model never overwrites a higher-trust result. The trust ordering is not yet in any live record and should enter the routing design. `claude-topology.mts` (red-cup archive, 2026-07-02) adds F0/F1/F2 Claude tier routing; `0052-local-model-content-gap-filling.md` adds the cheap-model-bulk / Claude-quality division.

**Context packets.** No record names the literal term. Convergent ancestors: swarm tasks as "one prompt-shaped instruction with an Output section conforming to the reply contract"; `claims-to-prose.md` sentence-plans (each carrying sources, required modality, risk flags); the chief-of-staff briefing rule ("readable off the record by someone who was not there"); `precompact-handoff.mjs` session-handoff payloads; messaging-survey envelopes carrying authority/delegation chains. A context-packet class for the schema pool should synthesize these five.

**Control loops around models.** `accountable-agentic-newsrooms.md` (capability is not authority; gates vs judgment remainder), `2026-06-18-llm-computer/src/loop.mts` (settling loop with cost/step obstructions and a capability gate), the drone-swarm theory task (three-layer safety shield, certificates), and the live Huidu MAPE-K sensors (`raise-an-idea.js`, `report-an-anomaly.js`).

## Confirmed gaps (nothing found anywhere)

1. Heavy-reasoning-then-recall as a compute strategy (reason once at frontier cost, emit a validated record, recall at grep cost) — the firm practices it (glossary duty, achievement-by-re-running) and the pure math has the shape (settled-state fixed points, conservation-law identities in the nelson-implication and from-predicate-category clusters), but no record states the doctrine. It is the firm's central RSI claim and deserves a first-class record.
2. Fine-tuning / training models — no record anywhere (idea `local-inference-then-tuning-and-training` now holds the intent; `fine-tuning-local-models.md` covers LoRA mechanics for local models and names the principle "amortize prompt engineering into training").
3. NVIDIA/GPU-hosted inference — all archived local-inference art is Snapdragon-NPU; the live pilot is the first NVIDIA-endpoint record.

## Pilot evidence (2026-07-16, endpoint integrate.api.nvidia.com, key in .env as API_KEY_INFERENCE_NVIDIA)

**Test one — drafting (open generation, schema-validated).** `drafting-a-term.js` (`nvidia/nemotron-3-nano-30b-a3b`, fuel 3): across 6 actuations, 1/6 first-attempt valid (failures all unparseable JSON), 6/6 valid after repair, 0 refusals, fuel usage 2-3 of 3. All 4 real drafts were schema-valid but semantically wrong somewhere; the content-librarian's review caught and corrected every one. Lesson: the actuator replaces drafting labor, never the office's judgment; seat-after-review is load-bearing.

**Test two — judgment (verdict against an inline reply contract).** Scratch experiment (not a seated instrument; awaits IRB re-judgment): the same nano model plus `nvidia/llama-3.3-nemotron-super-49b-v1.5` judged a real dispatch context packet and a deliberately deficient control against five criteria (self-containment, machine-checkable goal conditions, lane boundaries, resolvable citations, output contract). Both tiers: first-attempt valid, real packet scored strong (all 2s), control scored deficient (all 0s). Discrimination confirmed at the nano tier.

**The routing lesson the two tests teach together:** first-attempt validity tracked the tightness of the inline output contract, not the model tier — drafting against an external schema failed first attempts 5/6; judging against an exact inline JSON shape succeeded 4/4 across both tiers. The context packet's output contract is the cheapest lever on actuator reliability, which is the archive's sentence-plan/reply-contract claim re-confirmed live.

## What next (for the IRB re-judgment and after)

- Carry this evidence to the investment-review-board's re-judgment of the funded pilot (per `fund-distributing-claude-borne-work-to-scripts-and-lesser-models`, Option 3).
- Candidate next instruments, in prior-art order: a judging-a-context-packet inquiry skill (test two, made a seated instrument); an endpoint register (per-endpoint work-types/rpm/budget/grade, per swarm-self-improvement) in the schema pool; a context-packet class; the model trust ordering as a routing rule.
- The heavy-reasoning-then-recall doctrine wants its own record (gap 1) — likely a term plus a section in the firm's ConOps when the strategy-and-development-committee drafts it, with this note as source material.
