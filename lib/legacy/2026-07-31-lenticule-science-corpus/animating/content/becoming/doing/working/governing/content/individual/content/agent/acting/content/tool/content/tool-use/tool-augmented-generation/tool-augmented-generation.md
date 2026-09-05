---
type: concept
class: contemporary
status: active
depends-on:
  - tool-use.md
see-also:
  - ../morphisms/tool-invocation.md
references:
  - references/yao-react2022.md
  - references/schick-toolformer2023.md
---

# Tool-augmented generation

**Tool-augmented generation** is the generation paradigm in which tool invocations are *interleaved* with text production.
Tools are not preprocessor or post-processor steps but *inline* operations the model invokes during generation, with results integrated into subsequent generation.

## The paradigm shift

Traditional LLM use:

- **Pure generation.** Prompt → generation → response.
  No external interaction during generation.

Tool-augmented generation:

- **Interleaved.** Prompt → reason → tool call → result → reason → tool call → result → ... → response.
  External interaction integrated throughout.

This shift changes what the LLM can do — its effective capabilities are the union of its trained capabilities and its tools' capabilities.

## ReAct (Yao et al. 2022)

The canonical paradigm:

- Model generates a *thought* (reasoning step).
- Model emits an *action* (tool call).
- System returns *observation* (tool result).
- Model continues with next thought.

The thought-action-observation loop interleaves reasoning with acting, hence the name.

ReAct demonstrated that interleaving outperforms both pure reasoning (CoT) and pure acting on knowledge-intensive and decision-making tasks.

## Toolformer (Schick et al. 2023)

A learned variant:

- Model is fine-tuned to *insert* tool calls in its generation when useful.
- Training data is generated self-supervised: model proposes tool calls, evaluates whether the call improves prediction, retains useful calls.
- Result: model invokes tools during generation without explicit prompting.

Toolformer showed tool use can be *learned* rather than purely prompted.

## Variants and elaborations

- **Plan-and-execute.** Plan a sequence of tool calls upfront, then execute.
  Trades flexibility for predictability.
- **Reflective tool use.** After tool calls, reflect on results and revise plan.
- **Parallel tool calls.** Issue multiple calls simultaneously when independent (modern function- calling APIs support this).
- **Hierarchical tool use.** Nested agents invoking sub-agents as tools.

Each variant trades off responsiveness, predictability, and complexity.

## Implications

Tool-augmented generation:

- **Expands capability.** Model can do things impossible with text alone (real-time data, computation, external action).
- **Changes evaluation.** Performance depends jointly on model and tool quality; benchmarks must reflect this.
- **Changes failure modes.** Tool errors, latency, and side effects become first-class concerns.
- **Changes prompt engineering.** Prompts now orchestrate tool calls, not just text generation.

## In contemporary AI

Tool-augmented generation is the dominant paradigm for agentic LLM systems:

- All major LLM providers support function-calling APIs.
- Agentic frameworks (LangGraph, AutoGen, etc.) scaffold tool-augmented generation.
- Computer-use systems extend it to direct UI control.
- Evaluation benchmarks (SWE-bench, AgentBench, ToolBench) measure tool-augmented generation specifically.

## Limits

- **Latency.** Each tool call adds latency; long chains are slow.
- **Cost.** Tool calls add cost beyond generation.
- **Brittleness.** Tool failures cascade if not handled.
- **Verifiability.** Hard to verify that a generation used tools correctly.

## Status

Foundational paradigm in contemporary agentic AI.
Standard practice.
Continued elaboration in research (reflective, hierarchical, parallel variants).
