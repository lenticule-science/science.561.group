---
type: question
status: open
see-also:
  - teaching/explanations/tool-selection.md
  - ../theorems/selection-cost-bound.md
---

# How many tools can an LLM handle?

## The question

How many tools can be productively included in an LLM agent's effective registry?
At what scale does performance degrade?
What architecture choices change the answer?

## Why it's hard to answer

The answer depends on:

- **Model.** Stronger models handle more tools.
- **Tool descriptions.** Better descriptions enable more tools.
- **Tool similarity.** Similar tools confuse selection more than dissimilar tools.
- **Task complexity.** Hard tasks require more selection accuracy.
- **Selection mechanism.** Prompt-based, retrieval- augmented, learned all have different scaling.
- **Registry quality.** Curated registries scale better than aggregated ones.

So "how many tools" is multi-parameter, not single- number.

## Empirical observations

Approximate practical regimes (Q4 2024-2025):

- **Strong models, well-described tools, prompt- based.** ~50-100 tools manageable.
- **Strong models, retrieval-augmented.** ~500-5000 tools manageable; quality bounded by retrieval recall.
- **Tool-specialized models** (Gorilla, ToolLLaMA).
  Up to 16,000+ tools in benchmarks.
- **Production systems.** Often 10-50 tools per potential agent context; aggregator services manage larger pools with retrieval.

These shift as models improve.

## What changes with scale

As tool count grows:

- **Selection accuracy degrades.** More candidates, more confusion.
- **Prompt cost grows.** Linearly in description length.
- **Latency grows.** From prompt processing.
- **Description-quality bottleneck appears.** Maintaining description consistency across many tools is hard.
- **Tool similarity confusion.** Similar tools conflate.

Mitigated by retrieval, learned selection, etc.

## Hypotheses

- **Hard ceiling.** Above some count, no architecture can effectively handle more tools.
  Probably wrong; engineering can keep pushing.
- **Soft ceiling per architecture.** Each architecture has a soft limit; hopping architectures (prompt → retrieval → learned) extends the limit.
- **Scale-with-model.** As models improve, the effective limit grows.
- **Description-quality dominant.** The limit is set more by description quality than count.

The hypotheses are partly compatible.

## What progress requires

- **Standardized benchmarks** for tool-handling at various scales.
- **Retrieval-quality work** specifically for tool registries.
- **Auto-description generation** to maintain consistency at scale.
- **Selection-architecture comparison** under controlled conditions.
- **Aggregator-service experience** as production data source.

These are partially in progress.

## Why it matters

- **Practical agent design.** What registries to build, what selection mechanisms to use.
- **Tool-aggregation services.** Composio, RapidAPI, etc. design depends on this.
- **Capability vs reliability trade-off.** More tools = more capability but worse selection accuracy.
- **Long-term agent capability.** Agents with access to large tool ecosystems can do more.

## Status

Open and active.
Empirical data accumulates; theoretical bounds are informal.
Likely to be answered *in practice* as production deployments stabilize and benchmarks mature, rather than through clean theoretical analysis.
