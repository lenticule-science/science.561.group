---
title: Multi-agent orchestration frameworks 2026
description: "Comparative analysis of CrewAI, AutoGen 0.4, and LangGraph — three leading frameworks for building multi-agent AI systems. Covers agent definition, task delegation, communication patterns, result composition, learning, process types, failure handling, and architecture."
date-created: 2026-04-04
sources:
- https://docs.crewai.com
- https://docs.crewai.com/en/concepts/agents
- https://docs.crewai.com/en/concepts/processes
- https://docs.crewai.com/en/concepts/llms
- https://docs.crewai.com/en/concepts/memory
- https://microsoft.github.io/autogen/
- "https://microsoft.github.io/autogen/stable/user-guide/agentchat-user-guide/tutorial/agents.html"
- "https://microsoft.github.io/autogen/stable/user-guide/agentchat-user-guide/tutorial/teams.html"
- "https://microsoft.github.io/autogen/stable/user-guide/agentchat-user-guide/tutorial/termination.html"
- "https://microsoft.github.io/autogen/stable/user-guide/agentchat-user-guide/memory.html"
- https://devblogs.microsoft.com/autogen/autogen-reimagined-launching-autogen-0-4/
- https://langchain-ai.github.io/langgraph/
- https://docs.langchain.com/oss/python/langgraph/overview
- https://docs.langchain.com/oss/python/langgraph/graph-api
- https://docs.langchain.com/oss/python/langgraph/add-memory
- https://docs.langchain.com/oss/javascript/langgraph/overview
relations:
- orchestration
- multi-agent systems
- agent architecture
---

Three frameworks have emerged as dominant platforms for building multi-agent AI systems as of 2026: **CrewAI**, **AutoGen 0.4**, and **LangGraph**. Each represents a different design philosophy and targets different use cases. Understanding their core differences is essential for choosing the right orchestration layer for a given problem.

## Framework Overview

### CrewAI

**Architecture**: Python-only, high-level, role-playing oriented. Independent of LangChain, built entirely from scratch as a lean, lightning-fast framework.

**Core metaphor**: A crew of specialists, each with a role, goal, backstory, and set of tools. Tasks flow through the crew sequentially or hierarchically, with agents executing against LLM-backed personas.

**Typical use case**: Content generation, research analysis, business process automation where clear role-based delegation fits the problem.

### AutoGen 0.4

**Architecture**: Complete rewrite from 0.2, adopting asynchronous, event-driven design. Two-layer API: Core (low-level actor framework) and AgentChat (high-level task API). Python-first with .NET support; TypeScript support under development.

**Core metaphor**: Teams of agents collaborating through message-passing. Groups can be round-robin (all agents speak in turns), hierarchical (manager orchestrates), or swarm-based (agents hand off based on capabilities).

**Typical use case**: Interactive multi-step workflows, code generation and execution, human-in-the-loop scenarios with flexible team structures.

### LangGraph

**Architecture**: Graph-based, state-machine oriented. Low-level, explicit state management with reducers and checkpointers. Python and JavaScript/TypeScript versions maintain parity of concepts but differ in API details.

**Core metaphor**: Directed graph where nodes are computation steps, edges are control flow, and state flows through the graph as reducer-managed updates. Compilation produces a runnable app with persistence.

**Typical use case**: Complex, long-running stateful workflows, research agents with tool loops, applications requiring explicit state tracking and checkpoint persistence.

---

## Agent Definition

### CrewAI

Agents are defined with **role**, **goal**, **backstory**, and **tools**:

```python
from crewai import Agent

agent = Agent(
    role='Data Analyst',
    goal='Extract actionable insights',
    backstory="""You're a data analyst at a large company...""",
    tools=[tool1, tool2],
    llm=my_llm,
    verbose=True,
    allow_delegation=False
)
```

- **Role**: Professional identity and function (e.g., "Senior Researcher").
- **Goal**: Primary objective guiding decision-making (e.g., "Find patterns in dataset").
- **Backstory**: Character depth and context, influencing the agent's thinking style.
- **Tools**: Executable capabilities (API calls, file reads, web searches, vector DB queries).
- **allow_delegation**: Whether the agent can hand off work to other agents.

Behind the scenes, CrewAI constructs a rich prompt incorporating role, goal, and backstory into the system prompt sent to the LLM.

### AutoGen 0.4 (AgentChat API)

Agents are defined as instances of predefined classes or by extending base agents. Key agent types:

- **AssistantAgent**: LLM-backed agent with tool support, initialized with a model client and system message.
- **UserProxyAgent**: Represents human input and can execute code or approve decisions.
- **Custom agents**: Extend `BaseAgent` to define custom behavior.

Example (WeatherAgent):

```python
from autogen_agentchat.agents import AssistantAgent
from autogen_ext.models.openai import OpenAIChatCompletionClient

weather_agent = AssistantAgent(
    name="WeatherAgent",
    model_client=OpenAIChatCompletionClient(model="gpt-4"),
    system_message="You are a helpful AI assistant. You are good at using tools to solve tasks.",
    tools=[get_weather],  # async function
    description="An intelligent agent that provides weather information"
)
```

Agents have properties: **name**, **model_client**, **system_message**, **tools**, **description**. The framework handles message routing and tool invocation.

### LangGraph

LangGraph does not define agents as objects. Instead, agents are implicitly defined by nodes in the graph. A node is a function (sync or async) that:

1. Takes the current state as input.
2. Performs computation or tool calls.
3. Returns an updated state.

Example node:

```python
from langgraph.graph import StateGraph, START, END

def agent_node(state):
    messages = state["messages"]
    response = llm.invoke(messages)
    return {"messages": messages + [response]}

graph = StateGraph(AgentState)
graph.add_node("agent", agent_node)
graph.add_edge(START, "agent")
graph.add_edge("agent", END)
app = graph.compile()
```

The "agent" is implicitly defined by its node function. Multiple nodes can represent different agents or roles, with edges defining how they collaborate.

---

## Task Assignment and Delegation

### CrewAI

Tasks are explicit, first-class objects with a description, expected output, and an assigned agent:

```python
from crewai import Task

task = Task(
    description="Research the topic",
    expected_output="A comprehensive report",
    agent=research_agent
)

crew = Crew(agents=[agent1, agent2], tasks=[task1, task2])
result = crew.kickoff()
```

In **sequential** process, tasks run in order, with each task's output becoming context for the next.

In **hierarchical** process, a manager agent (LLM-backed or explicitly provided) oversees all tasks, plans execution, delegates based on agent capabilities, and validates completion.

Output from one task flows automatically into the next as context. You can also explicitly specify which tasks' outputs should be used as context for a given task.

### AutoGen 0.4 (AgentChat API)

Tasks are submitted to a **Team**, which orchestrates agents to solve the task. A Team is a group of agents with defined collaboration patterns.

```python
from autogen_agentchat.teams import RoundRobinGroupChat

team = RoundRobinGroupChat(
    agents=[agent1, agent2, agent3],
    model_client=model_client,
    termination_condition=MaxMessageTermination(max_messages=10)
)

task_result = team.run_sync(task="Analyze this data")
```

**Team types**:
- **RoundRobinGroupChat**: Agents take turns speaking, all receive context from previous turns.
- **SelectorGroupChat**: An LLM selects which agent should speak next based on task progress.
- **Swarm**: Agents can hand off to each other based on capabilities, implementing OpenAI's Swarm pattern.

Tasks are strings (natural language) submitted to the team. The team determines who speaks, in what order, and how long to continue based on termination conditions.

### LangGraph

Tasks are implicit in graph execution. There is no task object; instead, the workflow itself IS the task. The graph structure encodes how work flows:

```python
graph = StateGraph(AgentState)
graph.add_node("researcher", research_node)
graph.add_node("analyst", analysis_node)
graph.add_edge("researcher", "analyst")
graph.add_edge("analyst", END)

app = graph.compile()
result = app.invoke({"messages": [HumanMessage(content="Research topic X")]})
```

Work flows from node to node based on edges (conditional or fixed). If conditional edges are used, the graph can route to different nodes based on state:

```python
def should_continue(state):
    if state["iteration"] < 3:
        return "researcher"
    else:
        return END

graph.add_conditional_edges("analyst", should_continue)
```

There is no explicit delegation: routing is determined by edges and state.

---

## Agent Communication

### CrewAI

Communication is **implicit and hierarchical**. 

- In sequential process: agents do not directly communicate; context flows through task output.
- In hierarchical process: the manager agent communicates with all team members, collecting reports and deciding next steps.

Agents are not aware of each other; they receive context as part of their task prompt.

### AutoGen 0.4

Communication is **message-based and explicit**.

In **RoundRobinGroupChat**, all agents see the conversation history. When an agent speaks, the message is broadcast to all other agents, who can respond in the next round. This creates a shared conversational context.

In **Swarm**, agents send **handoff messages** to request task transfer to a specific agent, enabling more explicit delegation:

```python
# In agent code, request handoff
return "I need to hand this off to the WebResearchAgent"
```

The framework routes the handoff, and the target agent takes over.

In **SelectorGroupChat**, an LLM-driven selector decides which agent should respond next based on the conversation state.

### LangGraph

Communication is **state-based and implicit**. 

There are no direct messages between nodes. Instead, nodes update shared state, and downstream nodes read that state.

Example: 

```python
def researcher_node(state):
    research_result = llm.invoke(state["messages"])
    return {"research": research_result}

def analyzer_node(state):
    # Read research output from state
    research = state["research"]
    analysis = llm.invoke(f"Analyze: {research}")
    return {"analysis": analysis}
```

The research result flows through state, not through direct message passing. This decoupling allows complex workflows without explicit handoff logic.

If multi-agent interaction is needed, use the **messages** field in state to accumulate messages (with appropriate reducers) and have nodes read and respond to them.

---

## Result Composition

### CrewAI

Results are composed via the **CrewOutput** class:

```python
result = crew.kickoff()
print(result.raw)          # Raw text output
print(result.json_dict)    # Structured JSON
print(result.pydantic)     # Pydantic model instance
print(result.usage_metrics) # Token usage
```

Each task produces a **TaskOutput** with:
- Raw output (agent's response)
- JSON output (if task specified `output_json=True`)
- Pydantic model (if task specified `output_pydantic=MyModel`)

In sequential process, outputs chain: task N+1 receives task N's output as context.

In hierarchical process, the manager collects outputs from all tasks and synthesizes a final result based on the original request.

The final CrewOutput aggregates all task outputs, optionally formatting the final result according to the crew's output specification.

### AutoGen 0.4

Results come from **team.run_sync()** or **team.run()** (async), returning a **TaskResult**:

```python
result = team.run_sync(task="Task description")
print(result.messages)      # Full message history
print(result.final_message) # Last message from agents
```

The TaskResult contains the full conversation history and can be parsed for final outputs. Since agents communicate through messages, the result is the full dialogue plus any extracted final answer.

For structured results, agents are instructed to output JSON or other structured formats, which must be parsed from the message.

### LangGraph

Results come from **app.invoke()** or **app.stream()**, returning the final state:

```python
result = app.invoke({"messages": [HumanMessage(...)]})
print(result["messages"])      # All messages (reduced via add_messages)
print(result["analysis"])      # Custom state field
print(result["final_answer"])  # Another custom field
```

The result is the entire final state. You design state fields to hold intermediate results:

```python
class AgentState(TypedDict):
    messages: Annotated[list[BaseMessage], add_messages]
    research: str
    analysis: str
    final_answer: str
```

Nodes can write to any state field. Results are composed by examining the final state's relevant fields.

---

## Learning and Memory

### CrewAI

CrewAI provides a **unified Memory** system with three components:

1. **Short-term memory**: Stored in ChromaDB with RAG. Records task outputs and interactions within the current session. When the next task starts, the system queries this memory for relevant recent context.

2. **Long-term memory**: Stored in SQLite3. Persists insights and task results across multiple runs, enabling agents to learn what approaches worked and refine their knowledge base.

3. **Entity memory**: Uses RAG to capture and recall details about mentioned entities (e.g., "Lisbon," "May trip"). If an entity is referenced again, the system can provide stored context.

Memory is configurable and persists to `./.crewai/memory` by default. 

Advanced feature: **@human_feedback(learn=True)** distills corrections into generalizable lessons stored in memory. On the next run, the system recalls and applies those lessons before human review.

Learning is **outcome-oriented**: the system stores what worked, not just conversation history.

### AutoGen 0.4

Memory in AutoGen 0.4 is **weak relative to other frameworks**. The system provides:

- **Chat history**: The stream of messages exchanged between agents.
- **Persistent storage via ChromaDBVectorMemory**: Optional integration for semantic memory.
- **State save/load**: Teams and agents can save and load state via `save_state()` and `load_state()`.

However, AutoGen 0.4 does **not enforce** a robust memory module by default. The framework provides hooks to integrate external memory systems (Zep, Mem0, MongoDB), but developers must select and configure the backend themselves.

Learning mechanisms are not built-in; memory integration is external.

### LangGraph

LangGraph uses **reducers and checkpointers** as the core memory mechanism.

**Short-term memory** (thread-scoped):
- Implemented via state managed by reducers. 
- The **add_messages reducer** accumulates messages: `{"messages": add_messages}` combines new messages with existing ones instead of replacing them.
- Any state field can have a reducer to implement custom accumulation.

**Long-term memory** (across threads):
- Implemented via **Store**: A key-value store that persists independently of graph state.
- Agents can write to and read from Store at any time using the `store.put()` and `store.get()` methods.

**Checkpointers**:
- Save the entire state graph periodically (after each node execution or on demand).
- Support backends: SQLite, Redis, Postgres, MongoDB.
- Enable recovery from failures and resumption of long-running workflows.

**Learning**:
- **Episodic memory**: Implement via few-shot examples in system prompts, learning from past sequences.
- **Semantic memory**: Use tools to store facts about users/entities in Store and retrieve them in future interactions.
- **Procedural memory**: Embed in system prompts and optimize with feedback.

LangGraph does **not** implement learning as automatic behavior improvement; memory is explicit and must be managed by the application.

---

## Process Types

### CrewAI

CrewAI defines **processes** as the orchestration pattern for task execution:

1. **Sequential**: Tasks execute in order. Output of task N becomes input for task N+1. No parallelism. Simplest to understand and debug.

2. **Hierarchical**: A manager agent (LLM-backed, automatically created or explicitly provided) oversees all tasks. The manager:
   - Plans the work.
   - Delegates tasks to agents based on their capabilities.
   - Reviews outputs.
   - Decides if a task needs to be reassigned or if work is complete.
   
   The manager agent receives a manager_llm parameter and is given a view of all agents' capabilities.

3. **Consensual**: Planned for future release. Will enable democratic decision-making among agents on task execution order and approach.

The process is specified when creating the Crew:

```python
from crewai import Crew, Process

crew = Crew(
    agents=[...],
    tasks=[...],
    process=Process.HIERARCHICAL,  # or SEQUENTIAL
    manager_llm=my_llm  # for HIERARCHICAL
)
```

### AutoGen 0.4

AutoGen 0.4 defines **Team types** as the orchestration pattern:

1. **RoundRobinGroupChat**: Agents take turns speaking in a fixed rotation. Each agent sees the full conversation history and can respond in turn. Continues until termination condition is met. Good for collaborative problem-solving.

2. **SelectorGroupChat**: An LLM-driven selector examines the conversation and decides which agent should speak next based on task progress. More flexible than round-robin but requires the selector to understand agent capabilities and current state.

3. **Swarm**: Agents can hand off to each other based on capabilities. An agent decides which other agent is better suited for the current sub-task and hands off via a special message. OpenAI's Swarm pattern adapted for AutoGen.

4. **Hierarchical teams** (via Swarm): A manager agent can coordinate others by handing off work based on agent descriptions.

Teams are instantiated with agents and a termination condition:

```python
team = RoundRobinGroupChat(
    agents=[agent1, agent2],
    termination_condition=MaxMessageTermination(max_messages=20)
)
```

### LangGraph

LangGraph does not define named process types. Instead, the graph structure itself encodes the process:

- **Sequential**: Linear chain of nodes with fixed edges. `add_edge("node1", "node2")` creates sequential flow.
  
- **Branching**: Conditional edges route based on state. `add_conditional_edges("node", router_fn)` branches to different nodes.

- **Looping**: Edges can loop back. An agent node that outputs `{"continue": True}` can route back to itself via conditional edge, implementing iteration.

- **Parallel/Map-Reduce**: Using **Send API**, one node can distribute updates to multiple node instances. For example, "call tool X on each item in a list":
  ```python
  def map_node(state):
      items = state["items"]
      return [Send("process_item", {"item": item}) for item in items]
  ```

- **Hierarchical**: Structure the graph so one "manager" node reads state, decides next steps, and routes to worker nodes.

The process emerges from the graph topology. No predefined process types; full control through explicit graph structure.

---

## Failure and Retry

### CrewAI

Error handling:

- **LLM output parsing errors**: Agents retry automatically (default max_retry_limit=2). If an agent outputs malformed action/final-answer, it receives the error and retries.

- **Tool execution errors**: If a tool raises an exception, the agent receives the error message and can attempt correction or provide alternative solutions.

- **Code execution errors**: The coding agent feature includes error handling. If executed code raises an exception, the error is reported back to the agent.

- **Custom error handling**: Implement via custom LLM classes inheriting from the base client, adding retry logic, fallback models, and structured logging.

- **Task-level retries**: Specify `max_retry_limit` on tasks. If a task fails, it can be retried up to the limit.

No built-in timeout handling at the framework level; use `max_execution_time` on agents to constrain execution.

### AutoGen 0.4

Termination conditions are the primary failure/stopping mechanism:

- **MaxMessageTermination**: Stop after N messages.
- **TextMentionTermination**: Stop when specific text (e.g., "TASK COMPLETE") is mentioned.
- **TokenUsageTermination**: Stop when token budget is exceeded.
- **TimeoutTermination**: Stop after specified duration.
- **SourceMatchTermination**: Stop when a specific agent has the last message.
- **HandoffTermination**: Stop when a handoff to a specific target is requested.

Error handling for exceptions in agent code:

- If a custom agent raises an exception, the error is processed, but the agent continues (known limitation). There is no built-in exception propagation or retry.

External memory (Mem0, Zep) can provide recovery context, but this is application-managed.

### LangGraph

Error handling is **explicit in node code**:

- **Try/except blocks**: Wrap logic in nodes with try/except to catch errors, log them, update state with error info, and decide next steps via conditional edges.

- **Retry policies**: Attach a `RetryPolicy` to any node:
  ```python
  graph.add_node("agent", agent_node, retry=RetryPolicy(max_retries=3, backoff="exponential"))
  ```
  Automatically retries on failure with exponential backoff.

- **Fallback strategies**:
  - Use conditional edges to route to a fallback node on error.
  - Chain LLM models with `.with_fallbacks()`: try primary model, on error try backup.

- **Tool error handling**: The `ToolNode` in LangGraph automatically captures tool execution errors and reports them to the LLM, allowing it to self-correct.

- **Bounded retries and circuit breakers**: Implement via state tracking (e.g., `state["retry_count"]`) and conditional edges that break the loop when retry limit is exceeded.

Checkpoints enable recovery: if a workflow fails partway through, you can resume from the last checkpoint with updated inputs.

---

## Language and Platform Support

### CrewAI

- **Language**: Python only.
- **LLM providers**: OpenAI (GPT-4o default), Anthropic (Claude 3.5), Google (Gemini), Meta (Llama API), and any provider supported by LiteLLM.
- **Local models**: Ollama integration for local LLM inference.
- **Deployment**: Typically Python backend; API generation is planned.

### AutoGen 0.4

- **Language**: Python primary, .NET support (C#), TypeScript support is under development.
- **LLM providers**: OpenAI, Azure, Anthropic, Google, and others via extensible client interface.
- **Runtime**: Event-driven, async-first architecture. Supports both in-process and distributed agents.
- **Deployment**: Python backend, can be wrapped in REST APIs.

### LangGraph

- **Languages**: Python and JavaScript/TypeScript. Both versions maintain conceptual parity (StateGraph, nodes, edges, checkpoints), but API details differ.
- **LLM providers**: Works with any LLM via LangChain's model integration layer (OpenAI, Anthropic, Cohere, Ollama, etc.).
- **Deployment**: 
  - Python: LangServe for REST API wrapping.
  - JavaScript: HTTP server via Node.js.
  - LangGraph Cloud: Commercial platform for hosting and management.

---

## Summary Table

| Aspect | CrewAI | AutoGen 0.4 | LangGraph |
|--------|--------|------------|-----------|
| **Agent Definition** | Role, goal, backstory, tools | Name, model client, system message, tools | Implicit (node functions) |
| **Task Model** | Explicit Task objects, assigned to agents | Natural language string to Team | Implicit (graph routing) |
| **Process Types** | Sequential, Hierarchical, Consensual (planned) | RoundRobin, Selector, Swarm | Graph topology (sequential, branching, looping, map-reduce, hierarchical) |
| **Communication** | Implicit, hierarchical or sequential | Message-based, broadcast/handoff | State-based, implicit |
| **Result Composition** | CrewOutput (raw, JSON, Pydantic) | TaskResult (message history) | Final state (custom fields) |
| **Memory/Learning** | Short-term, long-term, entity memory; feedback distillation | Weak; chat history + external integrations | Reducers, checkpoints, Store; manual episodic/semantic/procedural |
| **Error Handling** | Auto-retry on parse errors, tool errors logged | Termination conditions, limited exception handling | Try/except in nodes, RetryPolicy, conditional fallback |
| **Language** | Python only | Python, .NET, TypeScript (dev) | Python, JavaScript/TypeScript |
| **LLM Support** | OpenAI, Anthropic, Google, Meta, Ollama | OpenAI, Azure, Anthropic, Google, etc. | Any LangChain integration |
| **Typical Use Case** | Content generation, business process automation with roles | Interactive multi-step workflows, code generation, human-in-loop | Complex stateful workflows, research agents, explicit control |

---

## Comparison: Office/Duty Structure vs. Framework Patterns

The 561 Group's agent harness uses an **office/duty** model: named agents (librarian, researcher, operations-officer, etc.) each have a defined role, tools, and standing instructions. Work is dispatched to agents via the helmsman or duty-officer command. This maps most directly to CrewAI's approach, but with significant differences.

| Dimension | 561 Office Model | CrewAI | AutoGen 0.4 | LangGraph |
|-----------|-----------------|--------|-------------|-----------|
| **Agent identity** | Named office with role description, tools, model tier | Role + goal + backstory persona | Name + system message + tools | Implicit (node function) |
| **Task routing** | Helmsman dispatches based on task type; duty-officer for external | Crew assigns tasks to agents by capability | Team type determines turn order or handoff | Graph edges determine flow |
| **Delegation** | Agent can spawn subagents via Agent tool | `allow_delegation=True` enables inter-agent handoff | Swarm handoff or Selector routing | Conditional edges to other nodes |
| **Memory** | File-based memory system, instinct learning, session records | Three-tier memory (short/long/entity) + feedback distillation | Weak; external integrations | Checkpoints + Store |
| **Process** | Flexible — sequential plans, parallel dispatch, orchestrated workflows | Sequential or Hierarchical (fixed) | RoundRobin, Selector, Swarm (fixed) | Any graph topology |

**What CrewAI's persona model offers that we lack**: Backstory as a first-class property. Our agent definitions have role descriptions but no narrative persona shaping the agent's reasoning style. CrewAI's finding is that backstory meaningfully improves role adherence — the agent "thinks like" its character. This could be added to our agent frontmatter.

**What we have that these frameworks lack**: The office model treats agents as persistent organizational roles, not ephemeral instances. Our agents accumulate instincts, have standing orders, and participate in reviews. CrewAI crews are instantiated per run; our offices persist across sessions. The instinct/observation learning loop is closer to CrewAI's feedback distillation than anything in AutoGen or LangGraph, but operates at the harness level rather than the framework level.

**What LangGraph's state machine offers that we should adopt**: Explicit state with typed reducers. Our current dispatch is fire-and-forget — we dispatch an agent, it returns a result. LangGraph's model of accumulating state through a graph with checkpoints would enable resumable multi-step workflows and better failure recovery than our current session-based approach.

**What AutoGen's team patterns offer**: The Swarm handoff pattern — where an agent decides mid-task that another agent is better suited — maps to what our agents do informally when they spawn subagents. Making this a first-class pattern with explicit handoff protocols would improve traceability.

## Design Implications

1. **Add backstory/persona to agent definitions** — CrewAI's evidence suggests this improves role adherence. Low cost to implement in our agent frontmatter.

2. **Typed state for orchestrated workflows** — Adopt LangGraph's pattern of explicit state fields with reducers for multi-agent workflows that need to accumulate results.

3. **Formalize handoff protocols** — AutoGen's Swarm pattern should inform how our agents delegate mid-task. Currently informal; should be a structured handoff document.

4. **Memory convergence** — CrewAI's three-tier memory (short/long/entity) maps to what we're building with session records, file-based memory, and the knowledge graph. The feedback distillation pattern (`@human_feedback(learn=True)`) is worth studying for our instinct system.

5. **Don't adopt framework-level LLM abstraction** — All three frameworks wrap LLM calls in their own abstraction layers. Our harness talks directly to Claude via Claude Code. This is simpler and avoids the abstraction tax.

---

## See Also

- [Orchestration vs choreography survey](theories/artificial-intelligence/theories/agents/texts/orchestration-vs-choreography-survey.md) — Centralized vs decentralized coordination patterns
- [Multi-agent orchestration in practice](theories/artificial-intelligence/theories/agents/texts/multi-agent-orchestration-in-practice.md) — Concrete patterns from our own dispatch system
- [Multi-agent failure modes](theories/artificial-intelligence/theories/agents/texts/multi-agent-failure-modes.md) — MASFT taxonomy of 14 failure modes across 3 categories
- [Accountability tracing in multi-agent systems](theories/artificial-intelligence/theories/agents/texts/accountability-tracing-in-multi-agent-systems.md) — Responsibility invariants for agent systems
- [LangGraph](theories/artificial-intelligence/theories/agents/terms/langgraph.md) — Term definition with checkpoint persistence details
- [Multi-agent system](theories/artificial-intelligence/theories/agents/terms/multi-agent-system.md) — Four coordination patterns and three open problems
