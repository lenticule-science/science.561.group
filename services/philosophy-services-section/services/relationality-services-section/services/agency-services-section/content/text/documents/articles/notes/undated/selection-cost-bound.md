---
type: theorem
class: informal
status: active
depends-on:
  - teaching/explanations/tool-selection.md
  - ../objects/tool-registry.md
see-also:
  - ../morphisms/tool-discovery.md
references:
  - references/qin-toolllm2023.md
title: Selection cost bound
description: Statement (informal).
---

# Selection cost bound

**Statement (informal).** Tool-selection cost grows with registry size.
For prompt-based selection, cost grows roughly linearly in tool count due to prompt length and attention.
Beyond ~100 tools, retrieval- augmented selection becomes necessary; selection quality is then bounded by retrieval recall.

## Cost components

Selection cost decomposes:

- **Prompt cost.** Tokens consumed by tool descriptions in prompt.
- **Generation cost.** Tokens to emit selection rationale and call.
- **Latency.** Wall-clock time for the above.
- **Quality cost.** Selection accuracy degradation at scale.

The "quality cost" is often the binding constraint: beyond a certain registry size, selection accuracy drops faster than linear.

## Empirical regimes

Approximate practical regimes:

- **< 20 tools.** Selection works well in pure prompt with brief descriptions.
- **20-100 tools.** Detailed descriptions in prompt; selection accuracy depends on description quality.
- **100-500 tools.** Prompt becomes unwieldy; retrieval-augmented selection helps.
- **500-5000 tools.** Retrieval mandatory; quality bounded by retrieval recall.
- **5000+ tools.** Multi-stage retrieval and reranking.

Boundaries are fuzzy and depend on model.

## Why selection degrades at scale

Several mechanisms:

- **Prompt length.** Long prompts increase cost and decrease attention per token.
- **Lost-in-the-middle.** Middle of long prompts receives less effective attention.
- **Distractor confusion.** Many similar-looking tools confuse selection.
- **Description-quality bottleneck.** With more tools, hard to maintain consistent description quality across registry.

These compound at scale.

## Retrieval-augmented selection

Standard mitigation:

- Retrieve top-$k$ tools by relevance to current task.
- Include only top-$k$ in selection prompt.
- Selection accuracy now bounded by retrieval recall.

This reduces effective registry size to $k$, decoupling selection cost from total registry size.

## Trade-offs

- **Smaller $k$.** Less prompt cost but more recall risk.
- **Larger $k$.** Better recall but more prompt cost and lost-in-middle risk.
- **Two-stage** (retrieve + rerank).
  Better quality at cost of complexity and latency.
- **Learned selection** (Gorilla, ToolLLM).
  Highest quality but requires training.

Production systems pick based on registry size and quality requirements.

## Implications for design

- **Right-size registries.** Don't add tools without reason; each tool degrades selection.
- **Curate aggressively.** Remove unused / redundant tools.
- **Invest in descriptions.** Description quality has outsize impact at scale.
- **Use retrieval beyond ~100 tools.** Below that, prompt-based works; above, retrieval needed.
- **Consider learned selection** for very large registries.

## Limits

- **"Cost" is multi-dimensional.** Token cost vs latency vs quality interact.
- **Empirical bounds shift.** As models improve, the practical thresholds shift.
- **Domain-dependent.** Some domains (e.g., highly-similar APIs) degrade faster than others.

## Status

Standard observation in production agentic systems.
Justifies the architectural separation between discovery and selection at scale.
Active research on better retrieval and selection mechanisms.
