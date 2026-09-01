---
description: The practice of measuring agentic system performance through benchmarks, metrics, and grading criteria — determining whether an agent setup produces value or wastes tokens.
identity: agent-evaluation
name: Agent Evaluation
provenance:
  date-created: 2026-03-29
  date-modified: 2026-03-29
  sources:
    - swebench2024
    - masft2025
    - enterpriseeval2025
references:
  swebench2024:
    authors:
      - C. E. Jimenez
      - J. Yang
      - A. Wettig
      - S. Yao
      - K. Pei
      - O. Press
      - K. Narasimhan
    title: "SWE-bench: Can Language Models Resolve Real-World GitHub Issues?"
    publication: ICLR 2024
    year: 2024
    url: https://arxiv.org/abs/2310.06770
  masft2025:
    authors:
      - Various
    title: Why Do Multi-Agent LLM Systems Fail?
    publication: arXiv
    year: 2025
    url: https://arxiv.org/abs/2503.13657
  enterpriseeval2025:
    authors:
      - Various
    title: "Beyond Accuracy: A Multi-Dimensional Framework for Evaluating AI Agents"
    publication: arXiv
    year: 2025
    url: https://arxiv.org/abs/2511.14136
relations:
  measures: agentic-system
  requires: agent-observability
  enables: agent-self-improvement
  acts-on: agentic-system
---
Agent evaluation is the practice of measuring [agentic system](./agentic-system.md) performance. The core question is whether an agent setup produces value — completing tasks correctly, reliably, and at acceptable cost — or wastes [tokens](../../../../../../content/text/glossary/terms/token.md) on coordination overhead, hallucinated actions, and cascading errors.

### Benchmarks

**SWE-bench** (Jimenez et al., ICLR 2024) is the most widely cited agent benchmark. It presents 2,294 real GitHub issues from 12 Python repositories and measures whether an agent can produce a correct patch. Top scores reached ~74.4% by end of 2025. Variants include SWE-Bench Verified (human-validated subset), SWE-Bench Multilingual, and SWE-Bench Lite (300 representative problems).

**GAIA** measures general AI assistant capability across web browsing, tool use, and multi-step reasoning. Top scores reached ~90% by end of 2025.

**AgentBench** evaluates across 8 environments: operating systems, databases, knowledge graphs, card games, puzzles, household tasks, web shopping, and web browsing.

**Terminal-Bench** (Stanford + Laude Institute, May 2025) tests agent operation in sandboxed command-line environments.

**Context-Bench** (Letta, October 2025) tests long-running context maintenance — chaining file operations and tracing relationships across project structures. This benchmark revealed that agents using simple filesystem operations (grep, search_files) outperform specialized memory architectures on context retrieval tasks.

### Beyond accuracy

Existing benchmarks optimize for task completion accuracy. A November 2025 arXiv paper proposes five evaluation dimensions for enterprise deployment:

1. **Cost** — total token expenditure and API cost per task. Cost-normalized accuracy (CNA) measures accuracy per dollar spent.
2. **Latency** — time from request to completion. SLA compliance rate measures what fraction of tasks complete within a time bound.
3. **Efficiency** — tokens consumed relative to task complexity. An agent that solves a simple task in 50,000 tokens is less efficient than one that solves it in 5,000.
4. **Assurance** — policy adherence score (PAS), measuring whether the agent follows its behavioral constraints and safety policies.
5. **Reliability** — pass@k reliability, measuring consistency across repeated runs. An agent that succeeds 3 out of 10 times on the same task has a reliability problem regardless of its peak accuracy.

### Practical evaluation methods

**LLM-as-judge.** A separate model evaluates agent output against criteria. Anthropic's production experience: a single judge prompt produces more consistent evaluations than multiple specialized judges. Start with 20 test queries — this is enough to reveal dramatic impacts from prompt changes.

**Deterministic graders.** Measurable properties checked without an LLM: output length within bounds, required entities present, schema valid, file exists, test passes. The OpenAI cookbook recommends starting with deterministic checks before adding semantic evaluation.

**Token tracking.** Anthropic's production multi-agent system data shows token usage explains 80% of performance variance on complex tasks. Model quality matters more than budget — upgrading models beats doubling token budgets.

### The multi-agent evaluation problem

The MASFT study (arXiv 2503.13657, March 2025) evaluated 150+ execution traces across 5 multi-agent frameworks with 6 expert annotators. Finding: performance gains from multi-agent architectures over single-agent baselines are minimal on popular benchmarks. Some multi-agent systems performed worse than best-of-N sampling from a single agent. The study identified 14 distinct failure modes across 3 categories (specification failures, inter-agent misalignment, verification failures).

## Related terms

- [Agentic system](./agentic-system.md) — the systems being evaluated
- [Agent observability](./agent-observability.md) — the instrumentation that produces evaluation data
- [Hallucination](../../../../../../content/text/glossary/terms/hallucination.md) — a failure mode evaluations must detect
- [Agent self-improvement](./agent-self-improvement.md) — the optimization loop evaluations drive
- [Multi-agent system](./multi-agent-system.md) — architectures where evaluation is hardest
