---

title: "Toward a Falsifiable Definition of Agentic Systems"
description: "A review of competing definitions of 'AI agent' and 'agentic system,' identifying falsifiable criteria and marking the boundary between agent and non-agent."
domain: agents
requires: tool-use, cybernetics, autopoiesis
factors-through: large-language-model, rlhf
date-created: 2026-03-29
---

## 1. The problem

The term "agent" in AI discourse as of early 2026 refers to everything from a chatbot with web search to a multi-model system that writes, tests, and deploys code autonomously.
As Bent (2025, arXiv 2508.05338) puts it: "The term 'agent' has been diluted beyond utility."
If the word means everything, it distinguishes nothing.

A falsifiable definition specifies observable conditions a system must meet.
Its value is practical: it tells us what properties a system must demonstrate before we can predict its behavior, assess its risks, or compare it to alternatives.

## 2. Survey of definitions

### 2.1 Anthropic: workflows versus agents

Anthropic's "Building Effective Agents" (December 19, 2024) distinguishes **workflows** (LLMs and tools orchestrated through predefined code paths) from **agents** (systems where LLMs dynamically direct their own processes and tool usage).
Both are "agentic systems."
The distinction is the locus of control: in a workflow, the developer specifies the execution path; in an agent, the model selects it.

This definition identifies a real structural difference but is too broad to falsify: any system with a conditional branch controlled by an LLM qualifies as an agent, which includes most LLM applications.

### 2.2 Andrew Ng: four design patterns

Andrew Ng (BUILD 2024 keynote) identified four design patterns characteristic of agentic AI workflows: reflection (self-evaluation), tool use (API integration), planning (task decomposition), and multi-agent collaboration (role-specialized coordination).
He described agentic AI as "the most important AI trend today."

This is a pattern catalog, not a definition.
A system exhibiting one pattern (e.g., tool use alone) qualifies as agentic under this framing — which captures too much.
The patterns guide architecture well; they do not supply necessary and sufficient conditions.

### 2.3 MIT 2025 AI Agent Index

Staufer, Feng, Wei, Bailey, Duan, Yang, Ozisik, Casper, and Kolt (published 2026, data as of December 31, 2025) operationalize AI agent properties as four requirements:

1. **Autonomy** — operating with minimal human oversight, making consequential decisions independently.
2. **Goal complexity** — pursuing high-level objectives through planning and subgoal decomposition, with at least three autonomous tool calls.
3. **Environmental interaction** — directly interacting with the world through tools and APIs, creating substantial changes in the environment.
4. **Generality** — handling under-specified instructions and adapting to new tasks.

The "at least three autonomous tool calls" threshold is arbitrary and falsifiable: you can count tool calls.
The generality requirement is harder to operationalize; an agent that can only perform one task is a script with an LLM in the loop.

### 2.4 Sapkota, Roumeliotis, and Karkee: conceptual taxonomy

Sapkota, Roumeliotis, and Karkee (2025, arXiv 2505.10468) distinguish two levels:

- **AI Agents** — single-entity systems performing goal-directed tasks by invoking external tools, applying sequential reasoning, and integrating real-time information.
- **Agentic AI** — multi-agent systems where specialized agents collaboratively decompose goals, communicate, and coordinate.

Their five-dimensional taxonomy (autonomy level, task complexity, architectural composition, collaboration mechanism, learning/adaptation) classifies systems along gradients without specifying minimum conditions.
A system scores somewhere on each dimension; the taxonomy does not say where the threshold lies.

### 2.5 Bent: minimum requirements

Bent (2025, arXiv 2508.05338) proposes three necessary conditions:

1. **Active environmental impact** — actions must meaningfully and persistently alter the environment.
2. **Goal-directed behavior** — the system must operate toward defined objectives through multi-step planning (not mere reactive responses).
3. **State awareness** — the system must maintain and update representations of environmental state that persist between interactions.

Bent further proposes "agenticness" as a five-dimensional spectrum: environmental interaction sophistication, goal-directed behavior complexity, temporal coherence, learning/adaptation, and autonomy.

## 3. A working falsifiable definition

Building on Bent (2025), the following three conditions are jointly necessary and sufficient for an agentic system:

**Condition 1: Environmental action.** The system performs actions that modify persistent state outside itself through [tool use](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/terms/tool-use.md). *Test:* remove the system and observe whether the state changes it caused remain.
A system that writes files, calls APIs, or modifies databases meets this condition.
A chatbot that only returns text does not.

**Condition 2: Goal-directed planning.** The system decomposes high-level objectives into sequences of actions through multi-step reasoning, and selects among alternative action sequences based on their expected contribution to the goal. *Test:* present the system with a goal requiring at least two causally dependent actions (the output of action A is required as input to action B).
A system that identifies and executes this dependency without external specification of the execution order meets this condition.
A system running a predefined script does not, regardless of how many tools it calls.

**Condition 3: Persistent state.** The system maintains representations of its environment and its own progress that persist across interaction boundaries. *Test:* interrupt the system between actions and resume it.
A system that recovers its context and continues toward the goal without re-deriving its plan meets this condition.

A system that meets all three conditions is an agentic system.
A system that meets fewer than three is a tool, a workflow, a chatbot, or an automation.
Calling it an agent obscures its actual properties.

### 3.1 What this definition excludes

- **Chatbots.** They generate text but do not act on environments.
  Fail condition 1.
- **Predefined workflows.** They act on environments but do not plan — the execution path is specified by the developer.
  Fail condition 2.
- **Stateless tool-calling systems.** They act and may plan, but they do not persist state across interactions.
  Fail condition 3.
- **RAG systems.** They retrieve information and generate text but do not modify external state.
  Fail condition 1.
- **Single-turn function calling.** The model calls a function once in response to a query but does not pursue a multi-step plan.
  Fail condition 2.

### 3.2 What this definition includes

- **Claude Code** (Anthropic) in agent mode: writes files, plans multi-step implementations, maintains session state.
- **OpenHands** (formerly OpenDevin): writes and executes code in sandboxed environments, plans across files, event-sourced state.
- **Devin** (Cognition): autonomous software engineering agent with persistent workspace state.

### 3.3 Borderline cases

- **GitHub Copilot** in inline suggestion mode fails condition 1 (no persistent environmental action).
  Copilot Workspace in agentic mode passes all three.
- **LLM-in-a-loop** scripts that call tools iteratively until a condition is met pass conditions 1 and 2.
  They fail condition 3 when state is held only in conversation context, because conversation context is lost on process termination and cannot be recovered.
  Conversation context is not persistent state.

## 4. The spectrum beneath the threshold

The binary definition above is a floor.
Above it, Bent's five-dimensional spectrum provides useful gradation:

1. **Environmental interaction sophistication** — from single API calls to GUI manipulation to physical world interaction.
2. **Goal-directed behavior complexity** — from two-step causal chains to hierarchical planning with contingency.
3. **Temporal coherence** — from session-scoped state to indefinitely persistent memory.
4. **Learning and adaptation** — from no learning to in-context learning to fine-tuning on experience.
5. **Autonomy** — from human-in-the-loop at every step to fully autonomous operation with human review only at completion.

This spectrum is compatible with the three-condition floor: a system must clear all three conditions to register on the spectrum at all.

## 5. Terminological instability

The term "agentic" entered AI discourse in 2023–2024, popularized by Andrew Ng in early 2024.
The computer science literature previously used "software agent" (distributed systems), "autonomous agent" (artificial life), and "intelligent agent" (Russell and Norvig's *Artificial Intelligence: A Modern Approach*) with overlapping meanings.
The current usage is narrower: it refers to LLM-based systems that use [tool calling](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/terms/tool-use.md) for environmental interaction.

This instability makes it difficult to accumulate knowledge about agentic systems.
Papers and products using the same term discuss fundamentally different architectures.
A falsifiable definition provides an anchor: whatever we call these systems, we can agree on what properties they must demonstrate.

## 6. Connection to cybernetic theory

In [cybernetic](../../../../research/2026/07/31/lenticule-import/animating/science/theories/information/theories/cybernetics/terms/cybernetics.md) terms, an agentic system is a goal-seeking system with negative [feedback](../../../../research/2026/07/31/lenticule-import/animating/science/theories/information/theories/cybernetics/terms/cybernetics.md): it observes the gap between current state and goal state, selects actions to reduce that gap, and adjusts based on results.
This is Wiener's (1948) formulation applied to a new substrate.
Contemporary agentic AI differs from classical cybernetic controllers in the generality of goal specification (natural language instead of a reference signal) and the breadth of the action space (arbitrary tool calls instead of a fixed set of actuators).

The [autopoietic](../../../../../../../../../../../../../information-science-services-section/services/cybernetics-services-section/content/text/glossary/terms/autopoiesis.md) perspective raises a harder question: is an agentic system self-producing?
Current agentic systems are produced, deployed, and maintained by external processes — they do not generate their own components.
A system that modifies its own tools, updates its own instructions, and persists its own memory moves toward operational closure.
No existing agentic system has crossed this threshold as of March 2026.

## Sources

- Anthropic.
  "Building Effective Agents."
  December 19, 2024.
- Bent, O.
  "The Term 'Agent' Has Been Diluted Beyond Utility." arXiv 2508.05338, 2025.
- Sapkota, S., Roumeliotis, M., and Karkee, M.
  "AI Agents vs. Agentic AI: A Conceptual Taxonomy." arXiv 2505.10468, 2025.
- Staufer, A., Feng, B., Wei, B., et al. "2025 AI Agent Index."
  MIT, 2026.
- Ng, A.
  "Exploring the Rise of AI Agents and Agentic Reasoning."
  BUILD 2024 Keynote.
- Wiener, N. *Cybernetics: Or Control and Communication in the Animal and the Machine.* MIT Press, 1948.
- Russell, S. and Norvig, P. *Artificial Intelligence: A Modern Approach.* Pearson, 1995 (4th ed. 2020).
- Schick, T. et al. "Toolformer: Language Models Can Teach Themselves to Use Tools." arXiv 2302.04761, 2023.
