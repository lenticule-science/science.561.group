---
type: concept
class: contemporary
status: active
depends-on:
  - tool-use.md
see-also:
  - ../objects/tool-registry.md
  - ../morphisms/tool-discovery.md
  - ../theorems/selection-cost-bound.md
references:
  - references/patil-gorilla2023.md
  - references/qin-toolllm2023.md
---

# Tool selection

**Tool selection** is the problem of choosing the right tool from a registry.
For small registries (10s of tools), prompt-listing the registry suffices.
For large registries (1000s+), the prompt cannot fit all tools; selection becomes a *retrieval* problem.

## The scaling problem

Naive tool use:

- All tool descriptions placed in prompt.
- Model selects among them per turn.
- Works for ~50-100 tools; degrades beyond that due to prompt length, attention-cost, and lost-in-the- middle effects.

For larger registries, this doesn't scale.

## Retrieval-augmented selection

The standard approach for large registries:

1. **Embed tool descriptions** offline.
2. **Embed user query / current task.**
3. **Retrieve top-$k$ most relevant tools.**
4. **Place retrieved subset in prompt.**
5. **Model selects** from the retrieved subset.

This reduces effective registry size to top-$k$ at generation time, decoupling registry size from prompt length.

## Approaches

- **Gorilla** (Patil et al. 2023).
  Fine-tuned model on large API documentation; trained to select correct API calls from thousands of options.
- **ToolLLM / ToolBench** (Qin et al. 2023).
  Massive tool registry (16,000+ APIs from RapidAPI); retrieval
  + selection pipeline.
- **HuggingGPT** (Shen et al. 2023).
  Selects ML models from HuggingFace as tools.
- **AutoGPT-style.** Iterative selection through reasoning about tool descriptions.

## Selection failure modes

- **Wrong tool.** Model selects an inappropriate tool.
- **Argument hallucination.** Right tool, wrong arguments.
- **Missing tool.** Model fails to find a tool that exists in the registry.
- **Tool confusion.** Multiple similar tools confused.
- **Format errors.** Right tool but wrong call format.

These failure modes compound in tool-call chains.

## Selection metrics

- **Selection accuracy.** Did the model pick the right tool?
- **Argument accuracy.** Were arguments correct?
- **Recall@k for retrieval.** Was the right tool in the top-$k$ retrieved?
- **End-to-end task success.** Did the chain complete the task?

These metrics are partially independent; high retrieval recall doesn't guarantee high selection accuracy.

## Tool description quality

Selection quality depends critically on description quality:

- **Names.** Short, descriptive, distinguishable.
- **Parameter docs.** Clear types, constraints, examples.
- **When to use.** Explicit guidance on when to invoke.
- **Examples.** Concrete invocation examples.
- **Side-effect class.** Read-only?
  State-modifying?
  Irreversible?

Poor descriptions tank selection accuracy regardless of retrieval quality.

## In contemporary practice

- **Small registries** (~50 tools): function-calling with all tools in prompt.
- **Medium registries** (50-500 tools): retrieval + selection from top-$k$.
- **Large registries** (1000+): two-stage selection with retrieval + reranking.
- **Agent self-selection.** Some frameworks let agents introspect their tool registry.

## Limits

- **Recall ceiling.** Retrieval misses limit selection accuracy.
- **Cold-start.** New tools without selection history are hard to retrieve.
- **Description quality dependence.** Better descriptions disproportionately help.
- **Domain transfer.** Selection trained in one domain transfers imperfectly to others.

## Status

Standard problem in production agentic systems.
Active research on retrieval + selection + reranking pipelines.
Specialized models (Gorilla, ToolLLM) demonstrate the ceiling is high but achieving it requires careful engineering.
