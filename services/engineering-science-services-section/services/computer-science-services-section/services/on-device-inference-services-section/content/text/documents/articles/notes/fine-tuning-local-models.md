---
title: "Fine-Tuning Local Models on a Knowledge Corpus"
aliases:
  - "fine-tuning"
  - "model fine-tuning"
date-created: 2026-03-08T00:00:00
type: text
keywords:
  - FineTuning
  - OnDeviceInference
  - MachineLearning
---

Fine-tuning adapts a pre-trained [large language model](../../../glossary/terms/large-language-model.md) to perform better on a specific domain or task by training it further on a curated dataset. For a structured knowledge repository — thousands of markdown files with frontmatter, cross-references, and discipline-specific vocabulary — fine-tuning could produce a model that generates content matching the repository's conventions without explicit prompting.

## What fine-tuning does

A base model like [Qwen](../../../glossary/terms/qwen.md) 2.5 3B knows general language but nothing about semiotic markdown, CamelCase tags, or the difference between a term and a concept in this repository's type system. Every inference call must include the frontmatter specification, valid type list, and formatting rules in the prompt — consuming context window and adding latency.

Fine-tuning on the repository's content would teach the model these conventions directly. A fine-tuned model could produce correctly-formatted frontmatter, use the right type vocabulary, and generate CamelCase tags without being told the rules each time. The prompt shrinks from ~500 tokens of instructions to a simple "enrich this file."

## Feasibility on consumer hardware

Fine-tuning a 3B-parameter model using LoRA (Low-Rank Adaptation) requires approximately 8-16 GB of VRAM or unified memory. On an ARM-based system like the Snapdragon X Elite with 32 GB of shared memory, this is feasible using CPU-based training tools (though slow) or potentially through the [NPU](../../../../../../../content/text/glossary/terms/neural-processing-unit.md) if the training framework supports the QNN backend.

Practical requirements:
- **Dataset preparation**: convert repository files into training examples (input: raw content → output: enriched content with correct frontmatter)
- **Training time**: 1-4 hours for a 3B model with LoRA on CPU, potentially faster on GPU/NPU
- **Storage**: the LoRA adapter adds ~50-200 MB on top of the base model
- **Tools**: Unsloth, Axolotl, or llama.cpp's built-in fine-tuning support

The resulting adapter can be loaded by [Ollama](../../software/ollama/index.md) as a custom model, making it immediately available through the existing `local_llm` infrastructure.

## What to fine-tune on

The training dataset should consist of high-quality examples:
- Files with complete, validated frontmatter (enriched by trusted models or by hand)
- Term definitions that follow the one-concept-per-file convention
- Cross-referenced content that demonstrates the linking style
- A mix of content types (term, concept, text, index) to teach the type system

A repository with ~500 well-formed files can produce a useful fine-tuning dataset. Quality matters more than quantity — 200 excellent examples outperform 2,000 mediocre ones.

## What fine-tuning does not do

Fine-tuning does not give the model new knowledge about the world. A fine-tuned model knows the repository's *conventions* better, but it still draws factual content from its pre-training data. It will not learn the specific content of the repository in a way that allows it to answer questions about that content — that requires retrieval-augmented generation (RAG) or a much larger training dataset.

Fine-tuning also does not make a small model as capable as a large one. A fine-tuned 3B model will follow formatting conventions better but will not suddenly produce the reasoning quality of a 70B model.

## When to fine-tune

Fine-tuning makes sense when:
- The same long prompt is repeated across hundreds or thousands of calls (amortize prompt engineering into training)
- The conventions are stable enough that retraining is infrequent
- Output format consistency matters more than factual accuracy

For this repository, the enrichment pipeline is the strongest candidate: the frontmatter specification is stable, the prompt is repeated thousands of times (once per triage file), and format consistency is critical. A fine-tuned model could replace the 500-token enrichment prompt with a 50-token prompt and produce more consistent results.

The appropriate time is after the repository conventions stabilize — fine-tuning on a moving target wastes the training effort. Current work on specifications and content type enforcement should reach a stable state before investing in fine-tuning.
