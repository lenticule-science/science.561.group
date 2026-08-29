---
title: "Explore fragment-specific agent training and escalation of communication"
date-created: 2026-03-08T00:00:00
authors:
  - emsenn
status: proposed
priority: medium
depends-on: []
goal: "003"
milestone: ""
appetite: "large"
---

## Summary

Explore training local models on specific fragments of the emsemioverse so they become experts in that fragment.
This is part of a wider exploration of how agent profiles vary across formalization levels, and how the existing "escalation of communication" concept maps onto skill maturity and progressive automation.

## Motivation

The skill maturity concept already describes five stages of formalization: inference-heavy → structured inference → delegable → procedural → tool.
Each stage shifts execution from a high-capability agent toward deterministic tooling.

A gap exists between stages 2 (structured inference) and 3 (delegable): the current `delegate_task` tool passes a single prompt with context to a generic local model.
The model has no domain expertise — it transforms supplied content without understanding the domain's vocabulary, conventions, or relationships.

Fragment-specific training would create models that are fluent in a specific fragment's vocabulary and patterns.
A model trained on semiotic-endeavor content, for example, would understand terms like "method component," "closure condition," and "lifecycle guard" without needing them explained in every prompt.
This fills the gap between "needs a capable general model" and "can be scripted deterministically."

### Escalation of communication

Emsenn's 2019 essay "An Escalation of Communication" describes how ideas should progress through increasingly public venues: private thought → family discussion → friends → public presentation.
Each stage tests the idea against a wider, less sympathetic audience.

This maps onto the skill maturity axis:

| Communication stage | Skill maturity stage | Agent profile |
|---|---|---|
| Private thought | Inference-heavy | High-capability agent (Claude Opus) exploring a new task |
| Family discussion | Structured inference | Same agent with typed I/O contracts |
| Friends / associates | Delegable | Fragment-trained local model with domain expertise |
| Public presentation | Procedural / Tool | Deterministic script or MCP tool |

The fragment-trained model occupies the "friends" position: it can be trusted with domain-specific work because it speaks the language, but it doesn't have the full judgment of the "family" (high-capability agent).
Ideas that pass through the fragment-trained model without errors are ready for further formalization.

This is also perpendicular to the agent-skill-proficiency axis (which measures trust in a specific agent for a specific skill).
A fragment-trained model has higher proficiency for skills within its fragment and lower proficiency outside it.

## Research phase

### What exists

1. **Skill maturity concept** at `specifications/agential-semioverse-repository/concepts/skill-maturity.md` — already defines the 5-stage lifecycle
2. **Agent skill proficiency** at `mathematics/objects/universes/agential-semioverse/concepts/agent-skill-proficiency.md` — already defines per-skill trust
3. **Progressive formalization** described in `theory/agent-skill-interaction.md` — conversation → specification → skill → script → formal proof
4. **Escalation of communication** essay at `personal/writing/letters-to-the-web/2019-01-28-an-escalation-of-communication.md`
5. **Policy 001** (progressive automation) — "make actions accomplishable by less capable agents over time"

### What needs research

1. **Fine-tuning methods for small local models**: what does it take to train a qwen2.5:7b variant on a corpus of ~100 markdown files?
  QLoRA?
  Full fine-tuning?
  RAG as an alternative?
2. **Evaluation methodology**: how do you measure whether a fragment-trained model is actually better for that fragment than a generic model?
  Compare enrichment quality?
  Frontmatter accuracy?
3. **Fragment boundaries**: what constitutes a "fragment" for training purposes?
  A single specification?
  A discipline?
  A layer of the conceptual stack?
4. **Interaction with MCP**: should a fragment-trained model be exposed as a separate MCP tool (e.g., `delegate_to_endeavor_model`) or as a model parameter to the existing `delegate_task`?

## Steps

1. **Survey**: research fine-tuning approaches for small models (Ollama-compatible), especially QLoRA and corpus-based training.
  Produce a text documenting findings.

2. **Design fragment boundaries**: decide what "fragment" means.
  Options: single spec (semiotic-endeavor), single layer (agential semioverse), single discipline (technology), cross-cutting theme.

3. **Pilot**: fine-tune or RAG-augment a local model on the semiotic-endeavor specification (the most documented fragment).
  Test against the existing `infer_triage_frontmatter` task as a benchmark: does the fragment-trained model produce better frontmatter for endeavor-related triage files?

4. **Formalize the escalation mapping**: write a concept file that connects escalation of communication, skill maturity, and agent-skill-proficiency into a coherent theory of progressive formalization with agent trust at each stage.

5. **Integrate into skill system**: if the pilot succeeds, design how fragment-trained models fit into the skill manifest system (new runtime value? model parameter? proficiency metadata?).

## Done when

- A text documenting fine-tuning/RAG approaches for fragment-specific training exists
- At least one pilot fragment-trained model has been tested against a benchmark task
- The escalation-of-communication mapping to skill maturity is encoded as a concept file
- The interaction between fragment training and the existing skill system is designed (even if not fully implemented)

## Dependencies

Independent.
Benefits from plan 0043 (script I/O standardization) for the benchmark task, and from plan 0045 (conceptual dependency mapping) for understanding fragment boundaries.

## Log

2026-03-08 — Created from emsenn's observation that training local models on specific fragments overlaps with the "escalation of communication" concept and the skill maturity lifecycle.
The progression from general-purpose inference to fragment-trained delegation to deterministic scripting is a concrete instance of progressive formalization applied to agent profiles.
