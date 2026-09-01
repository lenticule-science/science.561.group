---
title: "Non-LLM Computation for Agent Duties"
description: "When agent tool selection, routing, and structured decisions can be handled by classifiers, decision trees, Markov chains, and graph queries instead of language model inference"
date-created: 2026-04-04
domain: computing
related-terms:
  - tool-use
  - agent-orchestration
  - agentic-system
  - inference-as-tool
related-texts:
  - small-model-fine-tuning-for-agents-2026
  - reflexion-and-lats-analysis
  - model-training-as-algebraic-closure
sources:
  - "Schick et al., 'Toolformer: Language Models Can Teach Themselves to Use Tools,' ICLR 2023 (arXiv:2302.04761)"
  - "Ong et al., 'RouteLLM: Learning to Route LLMs with Preference Data,' ICLR 2024 (arXiv:2406.18665)"
  - "Wu et al., 'StateFlow: Enhancing LLM Task-Solving through State-Driven Workflows,' arXiv 2024 (arXiv:2403.11322)"
  - "Zhou et al., 'Language Agent Tree Search (LATS),' ICML 2024 (arXiv:2310.04406)"
  - "Chen et al., 'Structured Agent Distillation for Large Language Model Agents,' arXiv 2025 (arXiv:2505.13820)"
  - "Yu & Zhao, 'Distilling LLM Reasoning into Graph of Concept Predictors,' arXiv 2026 (arXiv:2602.03006)"
  - "Xiang et al., 'Retrospex: Language Agent Meets Offline Reinforcement Learning Critic,' EMNLP 2024 (arXiv:2505.11807)"
  - "PASTE: Pattern-Aware Speculative Tool Execution, arXiv 2025 (arXiv:2603.18897)"
  - "AgentFly: Fine-tuning LLM Agents without Fine-tuning LLMs, arXiv 2025 (arXiv:2508.16153)"
  - "L*LM: Learning Deterministic Finite Automata from Demonstrations, arXiv 2024 (arXiv:2402.07051)"
  - "HTW Berlin, 'Oh LLM, Give Me a Decision Tree,' SIGKDD 2024 (arXiv:2409.18594)"
  - "EvoTool: Self-Evolving Tool-Use Policy Optimization, arXiv 2025 (arXiv:2603.04900)"
  - "SWiRL: Synthetic Data Generation & Multi-Step RL for Reasoning & Tool Use, arXiv 2025 (arXiv:2504.04736)"
---

Language model inference is expensive, slow, and non-deterministic. For structured agent work — routing tasks to offices, selecting tools, updating records — it is also unnecessary. This text examines what computation can replace LLM inference for agent duties, grounded in published research and empirical tool-call data from this system.

## The Claim

A significant fraction of what agent systems use language models for — tool selection, task routing, status updates, record-keeping — involves decisions that are *computable given the inputs*. These decisions do not require language generation. They require classification, lookup, or structured prediction. Using an LLM for them is like using a search engine to add two numbers.

The [offices-as-fuzzy-cells analysis](../../../../../operations/command/endeavor/records/analyses/offices-as-fuzzy-cells.md) identifies a formality scale from F0 (implicit) to F3 (algebraic). Seven of the system's 26 offices are near-fully formalizable: bookkeeper, docs-lookup, graph-analyst, harness-cleaner, doc-updater, observer, and quartermaster. Their work could be done by deterministic programs or lightweight classifiers.

## 1. Office-Task Matching as Classification

The first question: can "which office handles this task?" be answered without an LLM?

**What makes it tractable.** Every task in this system has structured frontmatter: `type`, `domain`, `part-of` (plan/project), `description`, and `tags`. Every office has a defined site (action domain), recognition fibers (what it accepts as input), and tool allowlists. The matching problem is: given task features, select the office whose recognition fibers match.

**What would work.** A multi-class classifier trained on (task-features → office) pairs. Features:

- `type` field (categorical: task, plan, event, term, text)
- `domain` path (categorical: engineering, command, science, subdomain)
- `work-type` (categorical: review, write, fix, deploy, research, track)
- Keywords from title and description (bag-of-words or TF-IDF)
- Tool requirements implied by the task (does it need Write? WebSearch? Bash?)

A decision tree or random forest over these features would suffice. The training data already exists: every dispatched task in `operations/command/endeavor/records/tasks/` has both features and an assigned office (the agent that completed it). With ~100 completed tasks, even a shallow tree would capture the dominant splits: if `type=text` and `domain` contains `library/`, route to writer; if the task description mentions "build error" or "cargo," route to build-error-resolver.

**Published support.** RouteLLM (Ong et al., ICLR 2024) trains classifier routers — BERT-based, matrix factorization, and even simple logistic models — on human preference data to select between LLM tiers. They report 85% cost reduction on MTBench and 45% on MMLU without quality loss. Their matrix factorization router is especially relevant: it embeds tasks and models in a shared space and computes a dot-product score. The same architecture applies to task-office matching. The "Doing More with Less" survey (arXiv:2502.00409) confirms that lightweight classifiers (DistilBERT-scale) achieve 1.4x cost reduction over LLM-based routing for structured decisions.

## 2. Tool-Call Sequences as Markov Chains

**Empirical analysis.** We analyzed 722 tool calls across 2 sessions from this system's `tool-calls.jsonl`. The data reveals strong sequential structure:

**Bigram transition probabilities (top patterns):**

| From → To | Probability | Count |
|-----------|-------------|-------|
| Grep → Read | 53.1% | 26 |
| WebSearch → WebSearch | 70.0% | 28 |
| Read → Read | 51.9% | 126 |
| Bash → Bash | 55.0% | 104 |
| Glob → Read | 34.7% | 25 |
| Edit → Bash | 40.0% | 18 |
| Read → Edit | 11.5% | 28 |

**Stereotyped workflows (trigrams, self-loops removed):**

| Pattern | Count | Interpretation |
|---------|-------|---------------|
| Read → Edit → Bash | 15 | Read file, modify, verify |
| Bash → Read → Edit | 14 | Run command, read result, fix |
| Glob → Grep → Read | 7 | Find files, search content, read match |
| Write → Read → Edit | 6 | Write draft, read, refine |
| Bash → record_event → Bash | 9 | Execute, log, continue |

**Conditional entropy by tool:**

| Tool | Entropy (bits) | Predictability |
|------|---------------|---------------|
| WebSearch | 1.55 | 45% above random |
| Bash | 2.15 | 40% |
| Glob | 1.88 | 33% |
| Read | 2.20 | 27% |
| Grep | 1.90 | 26% |

**What this means.** Tool sequences are moderately predictable from first-order Markov transitions alone. The Read→Edit→Bash workflow is the dominant edit cycle. Grep nearly always leads to Read. WebSearch chains with itself 70% of the time (batched searches). These are not random — they reflect procedural patterns.

**Can a Markov chain replace the LLM for tool selection?** Not fully, because tool choice depends on *content* (what the Read found), not just the previous tool. But for speculative execution — pre-fetching the likely next tool call — a bigram model would be correct 40-55% of the time. PASTE (Pattern-Aware Speculative Tool Execution, arXiv:2603.18897) formalizes exactly this: it constructs "Pattern Tuples" of (context, prediction, function, probability) and uses symbolic value mapping to execute predicted tool calls before the LLM decides, reducing latency when the prediction hits.

A second-order Markov model (using the last two tools) would capture the stereotyped workflows more precisely. The Read→Edit→Bash pattern, for instance, has a clear conditional: after Read→Edit, Bash is the next tool 40% of the time (verification), compared to Read→X where Bash appears only 13.6% of the time. The bigram Read→Bash and the trigram Read→Edit→Bash encode different states.

## 3. Lightweight ML for Structured Decisions

The question is not "can ML replace LLMs?" — the question is "which decisions don't need language at all?"

### Decision Trees and Random Forests

For classification problems with structured features (type, domain, status, numerical thresholds), decision trees are interpretable, fast, and sufficient.

**Concrete applications in this system:**

- **Model tier selection**: Given task-type + estimated-complexity + formality-level, select haiku/sonnet/opus. This is currently prose in the helmsman's prompt. It could be a 5-node decision tree.
- **Task readiness**: Given task status + dependency-status-list + blocker-count, determine if a task is dispatchable. This is a boolean function over structured inputs.
- **Review severity**: Given diff-size + files-touched + domain + change-type, classify review urgency. The code-reviewer and rust-reviewer already use checklists that are decision trees in prose.

The SIGKDD 2024 paper "Oh LLM, Give Me a Decision Tree" (arXiv:2409.18594) shows that LLMs can generate interpretable decision trees from their own training data, without any labeled examples. This is a path from LLM-as-agent to LLM-as-compiler: use the LLM once to generate the tree, then run the tree forever after.

### Bayesian Networks

For decisions with causal dependencies — "should we escalate this?" given error-count, time-since-start, cost-spent, user-last-active — a Bayesian network encodes the joint probability structure and computes posteriors efficiently. The loop-operator's escalation logic (same error twice = stop, cost threshold = escalate) is already a degenerate Bayesian network with hard thresholds.

### Small Neural Networks

For tasks that need embedding-space similarity (matching a task description to an office description) but not generation, a small encoder model (DistilBERT, 66M parameters) running locally computes embeddings at ~1ms per inference on CPU. Compare this to an LLM API call at 500ms-2000ms. AgentFly (arXiv:2508.16153) demonstrates lightweight policy wrappers that plan and select tools while the LLM remains frozen — the controller learns from logged episodes.

### Graph Queries as Decision Procedures

This system's EAVT datastore (11,565 entities, 134,451 facts) supports Datalog-style queries. Several office duties reduce to graph queries:

- **Docs-lookup**: "find term X" = `graph_search(X)` → ranked results. Deterministic.
- **Harness-cleaner**: "find unused components" = count cross-references per component → flag those with count=0. Deterministic.
- **Quartermaster**: "flag stale records" = query records where `date-modified` < threshold. Deterministic.
- **Graph-analyst**: "find gaps" = query entities missing required relations. Deterministic.

These offices do not need language models. They need a query engine with a small amount of threshold logic.

## 4. Extracting Deterministic Programs from LLM Traces

The most ambitious direction: can you watch an LLM agent work, then extract a program that does the same thing without the LLM?

### Program Synthesis from Demonstrations

The L\*LM algorithm (arXiv:2402.07051) learns Deterministic Finite Automata from demonstrations and natural language descriptions. It combines the classical L\* DFA learning algorithm with LLM membership queries. The output is a minimal, interpretable automaton — not a neural network, not a language model. The DFA then runs deterministically.

Applied to agent duties: record the state transitions of an office (what it reads, what it decides, what it writes), then synthesize a DFA that reproduces those transitions. For high-formality offices (F3 constructors, F3 recognition), the DFA would be small. For the doc-updater — scan filesystem, diff against index, update — the DFA has perhaps 4 states.

### Structured Agent Distillation

Chen et al. (arXiv:2505.13820) present the first framework for distilling ReAct-style agents into smaller models while preserving reasoning structure. They segment agent trajectories into [REASON] and [ACT] spans and train span-level student models. The student models reach 760M parameters with near-teacher performance on structured tasks.

The key insight: the [ACT] spans (tool selection and parameter filling) are far more compressible than the [REASON] spans (natural language deliberation). For F3 offices where reasoning is minimal, the entire agent might compress to a few hundred parameters.

### Graph of Concept Predictors

Yu & Zhao (arXiv:2602.03006) distill LLM reasoning into a DAG of compact modular predictors — each node is a small classifier that handles one concept. The DAG structure preserves interpretability while reducing inference cost. This maps directly onto office structure: each office is a node; each node's predictor handles its recognition fiber.

## 5. What Actually Works Today

Mapping the research onto the F0-F3 formality scale:

| Formality | Replacement | Examples | Status |
|-----------|-------------|----------|--------|
| **F3** (algebraic) | Scripts, graph queries, lookup tables | Bookkeeper (double-entry), docs-lookup (graph search), harness-cleaner (reference counting), quartermaster (threshold queries) | **Implementable now** — these are already deterministic pipelines wearing agent costumes |
| **F2→F3** (structured, sharpenable) | Decision trees, small classifiers, state machines | Task routing, model tier selection, review severity, build-error→fix matching, observer pattern detection | **Implementable with training data** — the task history and tool-call logs provide it |
| **F2** (structured prose) | Markov chains + speculative execution, lightweight RL critics | Tool-call prediction, workflow acceleration, pre-fetching | **Research-ready** — PASTE and Retrospex demonstrate the approach |
| **F1** (narrative) | Distilled small models, fine-tuned encoders | Writing, research synthesis, architectural judgment | **Requires LLM** — these are irreducibly linguistic tasks |
| **F0** (implicit) | Nothing yet | Convention inference, unstated requirements | **Requires LLM** — arguably requires a *good* LLM |

### The Progressive Automation Path

The system's own Policy 001 states: "every task completion should produce a skill, script, runbook, or frontmatter pattern — not just the output." This is the distillation principle applied operationally. Each time an LLM agent completes a structured task, the trace becomes training data for a cheaper computation.

The practical sequence:

1. **Log everything.** Tool calls, decisions, inputs, outputs. (Already happening via `tool-calls.jsonl` and event records.)
2. **Identify F3 offices.** Replace them with scripts. Bookkeeper math, docs-lookup queries, harness-cleaner scans — these should not invoke an LLM at all.
3. **Train classifiers for routing.** Use completed task→office pairs as training data. A decision tree over frontmatter features handles the 80% case; fall back to LLM for the 20%.
4. **Build speculative execution.** Use Markov models on tool-call sequences to pre-fetch likely next calls. Even 40% hit rate reduces perceived latency.
5. **Distill stereotyped workflows.** The Read→Edit→Bash cycle, the Glob→Grep→Read search pattern — these can become state machines that run without LLM deliberation between steps, only invoking the LLM for content decisions within steps.

## What This Does Not Replace

Language models remain necessary for:

- **Novel task decomposition** — breaking an unfamiliar request into steps (planner, architect)
- **Reading comprehension** — understanding unstructured text to extract structured data (triage-processor, researcher)
- **Synthesis** — combining information from multiple sources into coherent output (chief-of-staff, writer)
- **Judgment under ambiguity** — deciding when a review finding is "critical" vs "suggestion" in context

These are the F0-F1 capabilities. They require *understanding*, not just classification. The point is not to eliminate LLMs — it is to stop using them for work that a `switch` statement could handle.

## See Also

- [Offices as Fuzzy Cells](../../../../../operations/command/endeavor/records/analyses/offices-as-fuzzy-cells.md) — the formality analysis this text builds on
- [Small Model Fine-Tuning for Agents](./small-model-fine-tuning-for-agents-2026.md) — adjacent topic on making smaller models handle agent work
- [Model Training as Algebraic Closure](./model-training-as-algebraic-closure.md) — the mathematical framing of training as formalization
