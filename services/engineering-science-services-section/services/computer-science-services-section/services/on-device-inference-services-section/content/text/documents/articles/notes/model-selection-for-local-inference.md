---
title: "Model Selection for Local Inference Tasks"
aliases:
  - "model selection"
  - "local model selection"
date-created: 2026-03-08T00:00:00
type: text
keywords:
  - ModelSelection
  - OnDeviceInference
  - TaskRouting
---

Running multiple local [large language models](../../../glossary/terms/large-language-model.md) on heterogeneous hardware — CPU via [Ollama](../../software/ollama/index.md) and [NPU](../../../../../../../content/text/glossary/terms/neural-processing-unit.md) via Foundry Local — requires a strategy for which model handles which task. The wrong choice wastes either time (running a large model on a simple classification) or quality (running a tiny model on a nuanced generation task).

## Task categories

Local inference tasks in a repository management context fall into three categories:

**Classification** tasks assign labels, scores, or categories to content. Examples: scoring triage file relevance (0-3), tagging content type (term/concept/text), identifying target discipline. These tasks have constrained output (a label or short JSON), benefit from low latency, and tolerate lower model capability. A 3B-parameter model performs comparably to a 7B model on well-prompted classification.

**Extraction** tasks produce structured output from unstructured text. Examples: extracting formal definitions as JSON, parsing frontmatter fields from content, identifying named entities. These need the model to follow output format instructions reliably. Mid-size models (3B-7B) handle this well; very small models (< 2B) tend to produce malformed output.

**Generation** tasks produce prose, definitions, or summaries. Examples: writing a term definition, generating a one-paragraph description, producing enriched frontmatter. Quality matters more than speed — a 7B model writes noticeably better prose than a 3B model. For initial drafts that a human or higher-trust model will review, smaller models may suffice.

## Hardware routing

When an NPU is available, it should be preferred for all task categories because it is faster (3-8 seconds versus 15-40 seconds on CPU for equivalent models) and operates at a fraction of the power draw (~2W versus 30-50W). This frees the CPU for other work, including running a second model concurrently.

The practical routing on a system with both Ollama (CPU) and Foundry (NPU):

- **NPU (Foundry)**: preferred for everything it can run. Current NPU-optimized models tend to be in the 4B range (phi-4-mini, etc.), which covers classification and extraction well and provides acceptable generation quality.
- **CPU (Ollama)**: fallback for models not available on NPU, and for running concurrent workloads alongside NPU tasks. Also handles larger models (7B-12B) that may not have NPU-optimized variants.

## Model trust ordering

When multiple models can enrich the same content, a trust ordering prevents lower-quality models from overwriting higher-quality results. Trust is determined empirically: run the same enrichment task across models and compare output quality. The ordering is not purely by parameter count — a well-tuned 3B model may outperform a poorly-prompted 7B model on a specific task.

Trust levels matter for provenance: each enriched file records which model produced its metadata. A file enriched by a higher-trust model is not re-enriched by a lower-trust model; a file enriched by a lower-trust model is re-enriched when a higher-trust model becomes available.
