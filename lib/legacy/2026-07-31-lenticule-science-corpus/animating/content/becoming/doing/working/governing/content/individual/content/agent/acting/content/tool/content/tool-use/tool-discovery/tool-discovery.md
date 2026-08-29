---
type: morphism
class: contemporary
status: active
depends-on:
  - ../objects/tool-registry.md
see-also:
  - teaching/explanations/tool-selection.md
  - questions/can-tools-be-discovered-autonomously.md
references:
  - references/patil-gorilla2023.md
---

# Tool discovery

**Tool discovery** is the morphism that finds relevant tools in a [registry](../objects/tool-registry.md) given a task or query.
It is the *first stage* of selection when registries are too large to fit in prompt.

## Forms

- **Lookup discovery.** Tool name known; direct lookup.
- **Browse discovery.** Tools organized by category; agent navigates.
- **Search discovery.** Query against tool descriptions; retrieval ranks results.
- **Embedding-based discovery.** Embed query and tool descriptions; cosine similarity ranks.
- **Learned discovery.** Model fine-tuned on tool- query pairs predicts relevance.

Real systems often combine these: embedding-based retrieval with learned reranking.

## Embedding-based retrieval

The dominant pattern for medium-large registries:

1. **Offline.** Embed each tool's name + description + parameter docs into a vector.
2. **Online.** Embed user query / current task into vector.
3. **Retrieve.** Top-$k$ tools by cosine similarity.
4. **Pass to selection.** Top-$k$ subset used by selection stage.

Quality depends on:

- Embedding model quality.
- Tool description quality.
- Query reformulation (may need to rephrase task as retrieval query).

## Hierarchical / multi-stage discovery

For very large registries:

1. **Coarse retrieval.** Cheap embedding-based to narrow ~10000 → ~100.
2. **Fine retrieval.** More expensive (cross-encoder, LLM-based) to narrow ~100 → ~10.
3. **Selection.** Final 10 fed to selection stage.

Trades off cost and quality.

## Discovery vs selection

Distinguish:

- **Discovery.** *Finds candidate* tools (recall- oriented).
- **Selection.** *Chooses* the right tool from candidates (precision-oriented).

Both are necessary at scale; failures at either stage impair end-to-end performance.

## Failure modes

- **Recall miss.** Right tool not in retrieved set.
- **Description-query mismatch.** Tool description doesn't match how user phrases task.
- **Embedding bias.** Embedding model favors certain phrasings.
- **Cold start.** New tools without usage history are hard to retrieve.

## In contemporary AI

- **Function-calling APIs.** Don't natively support discovery; assume all tools fit in prompt.
- **Agentic frameworks.** Provide tool retrieval utilities.
- **Specialized models** (Gorilla, ToolLLM).
  Trained to handle large registries with built-in discovery.
- **MCP.** Model Context Protocol supports tool listing but doesn't standardize discovery.

## Autonomous discovery

Open question (see [can-tools-be-discovered-autonomously](questions/can-tools-be-discovered-autonomously.md)):

Can agents *discover* tools they don't know about through environmental exploration?
E.g., crawling documentation, reading code, exploring APIs.

Some research (AutoGPT-style) attempts this; reliability is partial.

## Limits

- **Recall ceiling.** Any retrieval misses some relevant tools.
- **Description quality dependence.** Bad descriptions doom discovery.
- **Cost.** Discovery cost adds to per-task cost.
- **Trust.** Discovered tools may be untrusted; need vetting.

## Status

Standard practice for large-registry agentic systems.
Active research on improving recall, reducing cost, and enabling autonomous discovery.
