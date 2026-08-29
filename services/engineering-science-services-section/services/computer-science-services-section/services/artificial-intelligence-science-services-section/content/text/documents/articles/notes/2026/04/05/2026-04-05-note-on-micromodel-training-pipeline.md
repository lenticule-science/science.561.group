---
title: Micromodel Training Pipeline
description: Implementation plan and cost analysis for replacing LLM API calls with locally-trained micromodels using the fiber-model continuum framework.
date-created: 2026-04-05
type: note
science-owner: artificial-intelligence-science-services-section
in-service-of: lib/emsenn/services/561-group/services/561-group-services-section
name: micromodel-training-pipeline
keywords:
  - micromodel-training
  - fiber-model-continuum
  - api-replacement
  - cost-optimization
  - local-inference
specialization: plan
application: learning
architecture-note: Application sublocale, not OS infrastructure — see applications-as-sublocales analysis
serves-system: foah
project: agent-efficiency
owner: engineer
priority: "2"
serves:
  - agent-efficiency
  - operations-loop
depends-on: development-environment-migration
base-model: Qwen2.5-1.5B
fine-tune-method: QLoRA rank 16
fine-tune-cost: $2-5 per run
inference-runtime: llamafile
vps-ram-budget: 1.8GB
training-data-source: operations/engineering/records/tool-calls.jsonl
training-data-target: 2000 examples
sources:
  - library/theories/engineering/theories/tech/theories/computing/texts/small-model-fine-tuning-for-agents-2026.md
  - library/theories/engineering/theories/tech/theories/computing/texts/non-llm-computation-for-agent-duties.md
  - library/theories/engineering/theories/tech/theories/computing/texts/model-training-as-algebraic-closure.md
---

Replace LLM API calls for structured decisions with locally-hosted small models trained on our own data. The micromodel handles F2 work (routing, classification, structured prediction) at near-zero marginal cost.

## Fiber-model continuum (2026-04-06 insight)

Every fiber IS a model in the mathematical sense — a truth-value assignment to propositions. The model tier needed is inversely proportional to fiber richness:

| Fiber richness | Model needed | Cost | Example |
|---------------|-------------|------|---------|
| Empty (all ⊥) | Opus | ~$0.10/q | Novel research, architecture |
| Thin | Sonnet | ~$0.03/q | Implementation with some guidance |
| Medium | Haiku | ~$0.01/q | Dispatch, review with rich context |
| Fat | Local micromodel | ~$0.001/q | Routing, classification, structured prediction |
| Full (no ⊥) | respond() — no LLM | $0.00 | Fully settled fiber, pure algebra |

This means:
- **Convergent enrichment** (fattening fibers) and **model routing** (choosing cheaper tiers) are the SAME cost reduction from different directions
- The micromodel pipeline is not separate from the fiber enrichment plan — each fiber that gets fatter is a fiber that can drop a model tier
- Training data for micromodels comes from settled fibers — the training examples ARE the settled truth-value assignments
- The L*LM pattern (DFA extraction from converged models) is the endgame: a fully settled fiber IS a deterministic automaton

The micromodel sits in the middle of the continuum — cheaper than API models, more capable than pure algebra on thin fibers. As fibers fatten, micromodel work migrates to respond(). The micromodel is transitional infrastructure, not permanent.

## Phases

### Phase 1: Data Extraction (this week)
- Expand tool-call training data from 621 to 2,000+ xLAM examples
- Extract task-routing pairs from completed task records
- Extract observation patterns from observations.jsonl

### Phase 2: First Fine-Tuning Run ($2-5)
- Base: Qwen2.5-1.5B (fits current VPS at 1.8 GB)
- Method: QLoRA, rank 16, Unsloth framework
- Hardware: Vast.ai RTX 3090 spot, 1-2 hours
- Eval: hold out 20%, compare vs xLAM-2-3b-fc-r off-the-shelf

### Phase 3: VPS Deployment
- llamafile/llama.cpp server, GGUF Q4_K_M, localhost only
- Integration: task-router fallback, auto-dispatch model selection, pattern classification
- Latency: 2-20 sec per decision (acceptable for daemon tick)

### Phase 4: Monthly Iteration Loop
- Accumulate 500+ new examples/week from operation
- Re-train monthly ($2-5 GPU rental)
- Each round = algebraic nucleus applied to expanded generator set
- Track accuracy convergence → fixed point = model has learned the duty

### Phase 5: Specialization (quarter 2+)
- Per-office micromodels (router, reviewer, observer)
- Embedding model for semantic instinct/skill retrieval
- DFA extraction for fully converged offices (L*LM pattern: micromodel → deterministic automaton)

## Cost Model

| Phase | One-time | Monthly | Replaces |
|-------|---------|---------|----------|
| Data extraction | $0 | $0 | — |
| Fine-tune | $2-5 | $2-5 | — |
| VPS (Hetzner CX32) | $0 | $7.50 | $12 Vultr |
| **Total** | **$2-5** | **$10-12** | ~$30-50/day API routing |

Break-even: 1 day. After that, every micromodel routing decision is pure savings.
