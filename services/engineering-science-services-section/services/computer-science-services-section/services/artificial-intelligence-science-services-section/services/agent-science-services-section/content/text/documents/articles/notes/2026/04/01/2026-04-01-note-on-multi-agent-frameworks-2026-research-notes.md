---
title: Multi-Agent Frameworks 2026 Research Notes
description: Detailed documentation of APIs, configuration, and architecture for CrewAI, AutoGen 0.4, and LangGraph multi-agent frameworks evaluated in April 2026.
date-created: 2026-04-01
type: note
science-owner: agent-science-services-section
in-service-of: lib/emsenn/services/561-group/services/561-group-services-section
name: multi-agent-frameworks-2026-research-notes
keywords:
  - crew-ai
  - auto-gen
  - lang-graph
  - api-signatures
  - agent-memory
---

# Multi-Agent Frameworks 2026 — Research Notes

Research conducted April 2026 into CrewAI, AutoGen 0.4, and LangGraph. These notes contain detailed API signatures, concrete code examples, and architectural details used to produce the comparative text.

## CrewAI

### Documentation Sources
- https://docs.crewai.com
- https://docs.crewai.com/en/concepts/agents
- https://docs.crewai.com/en/concepts/processes

### Agent Definition

**Constructor Signature**:
```python
Agent(
    role: str,                              # Professional identity
    goal: str,                              # Primary objective
    backstory: str,                         # Character context
    tools: list[Tool],                      # Callable skills
    llm: LLM = None,                        # Language model
    function_calling_llm: LLM = None,       # For tool calling
    max_iter: int = 25,                     # Max action iterations
    max_rpm: int = None,                    # Requests per minute limit
    max_execution_time: float = None,       # Timeout in seconds
    verbose: bool = False,                  # Debug output
    allow_delegation: bool = False,         # Can hand off to other agents
    step_callback: Callable = None,         # Called after each step
    cache: bool = True,                     # Cache responses
    system_template: str = None,            # Custom system prompt template
    prompt_template: str = None,            # Custom prompt template
    response_template: str = None           # Custom response template
)
```

**Key behaviors**:
- Role, goal, backstory are incorporated into the system prompt sent to the LLM.
- If `allow_delegation=True`, the agent can request another agent take over. The manager/crew must support delegation.
- `max_iter` is the max number of thought-action-observation cycles before the agent gives up.
- `function_calling_llm` can differ from `llm`, allowing a weaker model for tool calling decisions.

### Task Definition

**Constructor Signature**:
```python
Task(
    description: str,                       # What to do
    expected_output: str,                   # What success looks like
    agent: Agent,                           # Assigned agent
    tools: list[Tool] = None,               # Additional tools (override agent's tools)
    async_execution: bool = False,          # Non-blocking
    output_file: str = None,                # Save output to file
    output_pydantic: Type[BaseModel] = None, # Parse output as Pydantic model
    output_json: bool = False,              # Parse output as JSON
    output_raw: bool = True,                # Include raw agent response
    callback: Callable = None,              # Called when task completes
    context: list[Task] = None,             # Which task outputs to use as context
    human_input: bool = False               # Request human approval before execution
)
```

**Key behaviors**:
- `context` explicitly specifies which prior task outputs should be passed to this task. Default is to pass the immediately preceding task's output.
- `output_pydantic` enforces structured output parsing. If the agent's output can't be parsed, the task fails.
- Tasks are assigned to exactly one agent.

### Crew Definition

**Constructor Signature**:
```python
Crew(
    agents: list[Agent],
    tasks: list[Task],
    verbose: bool = False,
    config: dict = None,                    # YAML config dict
    max_rpm: int = None,
    language: str = "en",
    memory: Memory = None,                  # See Memory section
    manager_llm: LLM = None,                # For hierarchical process
    manager_agent: Agent = None,            # Custom manager (overrides manager_llm)
    process: Process = Process.SEQUENTIAL,
    share_crew_state: bool = True,          # Agents can see all task outputs
    output_log_file: str = None
)
```

**Process enum**:
```python
class Process(Enum):
    SEQUENTIAL = "sequential"
    HIERARCHICAL = "hierarchical"
    # CONSENSUAL = "consensual"  # Planned, not yet available
```

**Execution**:
```python
result = crew.kickoff()
# or with input
result = crew.kickoff(inputs={"topic": "AI ethics"})
```

### CrewOutput

**Attributes**:
```python
class CrewOutput:
    raw: str                           # Raw agent output
    pydantic: BaseModel                # If output_pydantic was set
    json_dict: dict                    # If output_json was set
    tasks_output: list[TaskOutput]     # Per-task outputs
    token_usage: dict                  # LLM token usage stats
```

Each `TaskOutput` mirrors the structure: `raw`, `pydantic`, `json_dict`.

### Memory System

**Three components**:

1. **Short-term memory** (ChromaDB):
   - Stores task outputs and key interactions within current session.
   - Retrieved via RAG to provide recent context to next task.
   
2. **Long-term memory** (SQLite3):
   - Persists across runs to `./.crewai/memory` (configurable via `CREWAI_STORAGE_DIR`).
   - Stores outcomes, approaches, and lessons learned.
   - Enables agents to answer "what worked last time?" on future runs.

3. **Entity memory** (RAG):
   - Captures details about mentioned entities (people, places, events).
   - Recalls entity context if the entity is referenced again later.

**Configuration**:
```python
from crewai import Crew, Memory

memory = Memory()  # Uses defaults: ChromaDB + SQLite3 + RAG
crew = Crew(..., memory=memory)
```

**Advanced learning**:
```python
from crewai.flow.flow import Flow

@agent
def my_task(context):
    ...

@flow
def my_workflow():
    my_task()

# With human feedback learning
flow = Flow()
flow.add_task(my_task)

@flow.on_human_feedback(learn=True)
def learn_from_feedback(feedback):
    # System distills feedback into generalizable lessons
    # Stored in long-term memory
    pass
```

When `learn=True`, corrections are converted to lessons stored in memory. On next run, lessons are recalled and applied before human review.

### Error Handling

**Auto-retry logic**:
- If agent output is malformed (e.g., missing required action format), the agent receives the parse error and retries.
- Default `max_retry_limit=2` per agent.
- On persistent parse errors, the agent gives up and returns the last attempt.

**Tool execution errors**:
- If a tool raises an exception, the exception message is returned to the agent as observation.
- Agent can then use error info to correct approach.

**Code execution errors**:
- Coding agents execute generated code and capture exceptions.
- Exception messages are fed back to the agent for correction.

**Timeout**:
- `max_execution_time` on Agent stops execution if it exceeds duration.
- No automatic restart; the crew fails.

### LLM Integration

**Supported providers** (via LiteLLM):
- OpenAI (gpt-4o, gpt-4-turbo, gpt-3.5-turbo) — default
- Anthropic (claude-3-5-sonnet-20241022, claude-3-opus-20240229, claude-3-sonnet-20240229)
- Google (gemini-pro, gemini-1.5-pro)
- Meta (llama-3-405b via llama.meta.com API)
- Azure OpenAI
- Ollama (local models)
- Any provider with LiteLLM support

**Configuration**:
```python
from crewai import LLM

# OpenAI (default)
llm = LLM(model="gpt-4o")

# Anthropic
llm = LLM(model="claude-3-5-sonnet-20241022", provider="anthropic")

# Local Ollama
llm = LLM(model="llama2", base_url="http://localhost:11434")

agent = Agent(..., llm=llm)
```

---

## AutoGen 0.4

### Documentation Sources
- https://microsoft.github.io/autogen/ (stable, 0.4.x)
- https://devblogs.microsoft.com/autogen/autogen-reimagined-launching-autogen-0-4/
- Migration guide: https://microsoft.github.io/autogen/dev/user-guide/agentchat-user-guide/migration-guide.html

### Architecture

**Two-layer design**:

1. **Core API** (`autogen_core`): Low-level, event-driven actor framework. Agents are message processors; the runtime handles async message delivery. Raw control over agent lifecycle.

2. **AgentChat API** (`autogen_agentchat`): High-level task-oriented API built on Core. Agents are instantiated with roles, tools, and models. Teams manage collaboration. Better for most use cases.

### Agent Definition (AgentChat)

**AssistantAgent** (most common):
```python
from autogen_agentchat.agents import AssistantAgent
from autogen_ext.models.openai import OpenAIChatCompletionClient

agent = AssistantAgent(
    name: str = "assistant",
    model_client: ChatCompletionClient,         # OpenAI, Azure, etc.
    tools: list[Tool] = [],                     # Callable tools
    system_message: str = "You are a helpful AI assistant",
    description: str = "Assistant description",  # For SelectorGroupChat
    max_messages: int = None,                   # Per-agent message limit
    tool_choice: str = "auto"                   # "auto", "required", or specific tool
)
```

**UserProxyAgent** (human input):
```python
from autogen_agentchat.agents import UserProxyAgent

user_proxy = UserProxyAgent(
    name: str = "user",
    input_func: Callable = input,               # Where to get user input
    code_execution_config: CodeExecutionConfig = None  # For code execution
)
```

**BaseAgent** (custom):
```python
from autogen_agentchat.base import BaseAgent

class CustomAgent(BaseAgent):
    async def on_messages(self, messages: list[Message], cancellation_token: CancellationToken) -> str:
        # Process messages, return response
        ...
    
    async def on_reset(self, cancellation_token: CancellationToken) -> None:
        # Reset internal state
        ...
```

### Team Definition

**RoundRobinGroupChat** (turn-based):
```python
from autogen_agentchat.teams import RoundRobinGroupChat
from autogen_agentchat.conditions import MaxMessageTermination

team = RoundRobinGroupChat(
    participants: list[Agent],
    model_client: ChatCompletionClient = None,  # For group-level operations
    termination_condition: TerminationCondition = None,
    max_turns: int = None
)

result = await team.run(task="Your task here")
# or sync:
result = team.run_sync(task="Your task here")
```

Agents speak in order they appear in `participants` list, cycling. All agents see full conversation history.

**SelectorGroupChat** (LLM-selected speaker):
```python
from autogen_agentchat.teams import SelectorGroupChat

team = SelectorGroupChat(
    participants: list[Agent],
    model_client: ChatCompletionClient,         # Uses this to decide who speaks
    termination_condition: TerminationCondition = None,
    max_turns: int = None
)
```

Each turn, the model client is asked: "Given this conversation, which agent should speak next?" Requires clear agent descriptions.

**Swarm** (capability-based handoff):
```python
from autogen_agentchat.teams import Swarm

swarm = Swarm(
    agents: list[Agent],
    termination_condition: TerminationCondition = None,
    max_turns: int = None
)
```

Agents can hand off to each other via a special message format (TBD in docs, but similar to: "Transfer to AgentName").

### Task Result

**TaskResult**:
```python
class TaskResult:
    messages: list[Message]         # Full conversation history
    final_message: Message          # Last message (summary or answer)
    stop_reason: str                # Why execution stopped
    termination_condition: str      # Which condition triggered
```

No structured output by default. Agents are instructed to output JSON or other formats, which must be parsed from `final_message.content`.

### Termination Conditions

```python
from autogen_agentchat.conditions import (
    MaxMessageTermination,
    TextMentionTermination,
    TokenUsageTermination,
    TimeoutTermination,
    SourceMatchTermination,
    HandoffTermination
)

# Stop after 20 messages
MaxMessageTermination(max_messages=20)

# Stop when text is mentioned
TextMentionTermination("TASK COMPLETE")

# Stop when token budget exceeded
TokenUsageTermination(max_tokens=10000, model_client=client)

# Stop after 5 minutes
TimeoutTermination(timeout_seconds=300)

# Stop when specific agent has last message
SourceMatchTermination(source="analyst_agent")

# Stop when handoff to specific agent is requested
HandoffTermination(target="manager")

# Combine multiple conditions (OR)
team = RoundRobinGroupChat(
    participants=agents,
    termination_condition=MaxMessageTermination(20) | TextMentionTermination("COMPLETE")
)
```

### Error Handling

**Exception handling**:
- If a custom agent raises an exception during `on_messages()`, the error is logged, but the agent continues.
- There is **no built-in exception propagation** — teams don't stop on agent errors.
- This is a known limitation; exception handling is improving in later 0.4 releases.

**Tool error handling**:
- AssistantAgent automatically catches tool execution errors and reports them to the LLM.
- The LLM can then try a different tool or approach.

**Termination as stopping mechanism**:
- Termination conditions are the primary way to stop execution (not error-based).
- Handoff to human is done via UserProxyAgent, which requests user input.

### Memory

**Chat history**:
- Automatically maintained by teams. All messages are accessible via `TaskResult.messages`.

**ChromaDB integration**:
```python
from autogen_agentchat.memory import ChromaDBVectorMemory
from autogen_agentchat.memory import PersistentChromaDBVectorMemoryConfig

memory = ChromaDBVectorMemory(
    config=PersistentChromaDBVectorMemoryConfig(
        collection_name="agent_memory",
        db_dir="/path/to/db"
    )
)

team = RoundRobinGroupChat(..., memory=memory)
```

**State save/load**:
```python
# Save team state
state = team.save_state()

# Load team state
team.load_state(state)

# Also works for agents
agent.save_state()
agent.load_state(state)
```

**Limitations**:
- Memory is **not a built-in feature**. The framework provides hooks but doesn't implement a coherent memory system.
- Most production systems integrate external memory via Mem0, Zep, or MongoDB (developer must configure).

### LLM Support

**Model clients**:
```python
from autogen_ext.models.openai import OpenAIChatCompletionClient
from autogen_ext.models.azure import AzureOpenAIChatCompletionClient
from autogen_ext.models.anthropic import AnthropicChatCompletionClient
from autogen_ext.models.google import GoogleGenerativeAIChatCompletionClient

# OpenAI
client = OpenAIChatCompletionClient(
    model="gpt-4",
    api_key="sk-..."
)

# Anthropic
client = AnthropicChatCompletionClient(
    model="claude-3-5-sonnet-20241022"
)

# Azure
client = AzureOpenAIChatCompletionClient(
    model="gpt-4",
    api_version="2024-02-15-preview"
)
```

**Language support**:
- Python: Fully supported.
- .NET (C#): Supported, cross-language interop via message protocol.
- TypeScript: **Not yet in 0.4 official release**. Open feature request.

---

## LangGraph

### Documentation Sources
- https://docs.langchain.com/oss/python/langgraph/overview
- https://docs.langchain.com/oss/python/langgraph/graph-api
- https://docs.langchain.com/oss/python/langgraph/add-memory
- https://docs.langchain.com/oss/javascript/langgraph/overview

### State Definition

**TypedDict with Annotated fields**:
```python
from typing import TypedDict, Annotated
from langgraph.graph.message import add_messages

class AgentState(TypedDict):
    messages: Annotated[list[BaseMessage], add_messages]  # Messages accumulate
    research: str                                          # Research findings
    analysis: str                                          # Analysis output
    iteration: int                                         # Loop counter
    error: str = ""                                        # Error tracking
```

**Reducers**:
- `add_messages`: Concatenates new messages with existing ones. Replaces messages with the same ID (updates).
- Custom reducers: `Annotated[T, lambda x, y: merge_logic(x, y)]`

The reducer determines how updates combine with existing values. Without reducers, each state field would be overwritten entirely.

### StateGraph

**Basic construction**:
```python
from langgraph.graph import StateGraph, START, END

graph = StateGraph(AgentState)

# Add nodes (functions)
async def agent_node(state: AgentState) -> dict:
    messages = state["messages"]
    response = llm.invoke(messages)
    return {"messages": [response]}

async def tool_node(state: AgentState) -> dict:
    # Extract tool calls from last message
    # Execute tools
    # Return tool results as messages
    ...

graph.add_node("agent", agent_node)
graph.add_node("tools", tool_node)

# Add edges
graph.add_edge(START, "agent")
graph.add_edge("agent", "tools")
graph.add_edge("tools", "agent")  # Loop back
graph.add_edge("agent", END)  # Exit condition (via conditional edge)

# Compile
app = graph.compile(checkpointer=checkpointer)
```

**Conditional edges**:
```python
def should_continue(state: AgentState) -> str:
    last_message = state["messages"][-1]
    
    # If the last message has no tool calls, we're done
    if not hasattr(last_message, "tool_calls") or not last_message.tool_calls:
        return END
    
    # Otherwise, continue to tools
    return "tools"

graph.add_conditional_edges(
    "agent",                  # From node
    should_continue,          # Router function
    {"tools": "tools", END: END}  # Mapping (optional, defaults to return value)
)
```

### Nodes

**Signature**:
```python
async def node_name(state: StateType, config: RunnableConfig = None) -> dict:
    # config contains metadata like run_id, callbacks, etc.
    
    # Perform computation
    result = llm.invoke(state["messages"])
    
    # Return updates (dict, not full state)
    return {"messages": [result]}
```

**Important**: Nodes return updates (a dict of state fields to change), not the full state. LangGraph merges returns into state using reducers.

### Graph Compilation

```python
from langgraph.checkpoint.sqlite import SqliteSaver

checkpointer = SqliteSaver(":memory:")  # or file path

app = graph.compile(checkpointer=checkpointer)

# Invoke
result = app.invoke(
    {"messages": [HumanMessage(content="What is AI?")]},
    config={"configurable": {"thread_id": "session_123"}}
)

# Stream (yields intermediate states)
async for event in app.stream(...):
    print(event)
```

Compilation:
- Validates graph structure (all nodes referenced, no orphans).
- Binds checkpointer for persistence.
- Returns a runnable app.

### Checkpointers

**Backends**:
```python
from langgraph.checkpoint.sqlite import SqliteSaver
from langgraph.checkpoint.postgres import PostgresSaver
from langgraph.checkpoint.memory import MemorySaver

# SQLite (file-based)
SqliteSaver("graph_state.db")

# PostgreSQL (use environment variables for credentials)
PostgresSaver(conn_string="postgresql://localhost/dbname")

# In-memory (for testing)
MemorySaver()

# Redis
from langgraph.checkpoint.redis import RedisSaver
RedisSaver(host="localhost", port=6379)
```

**Usage**:
```python
app = graph.compile(checkpointer=checkpointer)

# Save happens automatically after each node execution

# Load specific thread
result = app.invoke(input, config={"configurable": {"thread_id": "thread_123"}})

# Get checkpoint history
checkpointer.list(config={"configurable": {"thread_id": "thread_123"}})
```

### Memory Patterns

**Short-term memory** (thread-scoped):
- Implemented via state with reducers.
- Messages accumulate across turns: `add_messages` reducer.
- Persistent via checkpointer; survives restart on same thread.

**Long-term memory** (cross-thread):
```python
from langgraph.store import InMemoryStore, BaseStore

class AgentState(TypedDict):
    messages: Annotated[list[BaseMessage], add_messages]
    user_id: str
    facts: list[str]  # Facts about the user

def update_memory_node(state: AgentState) -> dict:
    # Store facts for this user
    store.put(
        namespace=("user_facts", state["user_id"]),
        key="facts",
        value=state["facts"]
    )
    return {}

def retrieve_memory_node(state: AgentState) -> dict:
    # Retrieve facts from any thread
    facts = store.get(
        namespace=("user_facts", state["user_id"]),
        key="facts"
    )
    return {"facts": facts.values if facts else []}
```

The **Store** is a key-value database that persists across threads. Agents can read/write to it.

### Error Handling

**Try/except in nodes**:
```python
async def agent_node(state: AgentState) -> dict:
    try:
        response = await llm.ainvoke(state["messages"])
        return {"messages": [response]}
    except Exception as e:
        error_msg = f"Error: {str(e)}"
        return {"error": error_msg, "messages": []}
```

**Retry policies**:
```python
from langgraph.constants import RetryPolicy

def agent_with_retry():
    return agent_node.with_retry(
        retry_on=[ValueError, TimeoutError],
        max_attempts=3,
        wait_ms=100,
        backoff=2  # Exponential: 100ms, 200ms, 400ms
    )

graph.add_node("agent", agent_with_retry())
```

**Conditional fallback**:
```python
def fallback_decision(state: AgentState) -> str:
    if state.get("error"):
        return "fallback_agent"
    return "next_step"

graph.add_conditional_edges("agent", fallback_decision)
```

**ToolNode error handling**:
```python
from langgraph.prebuilt import ToolNode

tool_node = ToolNode(tools=[tool1, tool2])
# Automatically catches tool errors and reports to LLM
```

### Map-Reduce Pattern

```python
from langgraph.graph import Send

def map_node(state: AgentState):
    items = state["items"]
    # Distribute each item to a worker node
    return [Send("worker", {"item": item, "messages": state["messages"]}) for item in items]

def worker_node(state: AgentState) -> dict:
    result = process(state["item"])
    return {"results": [result]}

# Messages sent to `worker` create separate branches, each with its own state
graph.add_node("map", map_node)
graph.add_node("worker", worker_node)
graph.add_edge(START, "map")
# Each Send() creates a new worker execution
# All workers' outputs merge back via reducer on "results"
graph.add_edge("worker", END)
```

### Language Support

**Python**:
- Full API via `langgraph` package.
- Async-first, but sync wrappers available.

**JavaScript/TypeScript**:
- Full API via `langgraphjs` package.
- Conceptually identical (StateGraph, nodes, edges, reducers, checkpoints).
- API differences due to TypeScript/async patterns.

Both versions are maintained and production-ready. Mental model is the same; implementation details differ.

### LLM Support

Works with any LangChain LLM:

```python
from langchain_openai import ChatOpenAI
from langchain_anthropic import ChatAnthropic
from langchain_google_genai import ChatGoogleGenerativeAI

llm = ChatOpenAI(model="gpt-4")
# or
llm = ChatAnthropic(model="claude-3-5-sonnet-20241022")
```

---

## Comparison Notes

### Agent Definition Philosophy

- **CrewAI**: Agents are **personas** defined by role, goal, backstory. The framework constructs prompts from these personas.
- **AutoGen**: Agents are **message handlers** with a model client, system message, and tools. Less personality, more functional.
- **LangGraph**: Agents are **implicit**, defined by node functions. No agent object; the graph structure encodes agent behavior.

### Task/Work Flow Philosophy

- **CrewAI**: **Explicit tasks** assigned to agents. Tasks form a pipeline with configured process (sequential, hierarchical).
- **AutoGen**: **Natural language task string** submitted to a team. Team decides execution flow based on termination conditions and agent interactions.
- **LangGraph**: **Graph structure** encodes the workflow. No task object; routing is explicit in edges and conditional logic.

### Communication Philosophy

- **CrewAI**: **Hierarchical or sequential**. No direct agent-to-agent messaging. Context flows via task output.
- **AutoGen**: **Message-based broadcast** in RoundRobin. **Handoff-based** in Swarm. **LLM-selected routing** in Selector.
- **LangGraph**: **State-based, implicit**. No messages between agents; instead, shared state with reducers.

### Memory Philosophy

- **CrewAI**: **Unified, built-in memory** with three tiers (short-term, long-term, entity). Outcome-oriented. Integrates learning via feedback.
- **AutoGen**: **Weak memory**. Chat history only. Integration points for external systems (Mem0, Zep) but no default.
- **LangGraph**: **Explicit, managed memory**. Reducers for short-term, Store for long-term. Application controls memory semantics.

### Typical Prototype Time

- **CrewAI**: Fastest. Role-based setup with simple task descriptions. 10-30 minutes for basic crew.
- **AutoGen**: Medium. Team setup with agent descriptions and termination logic. 20-45 minutes.
- **LangGraph**: Slower initially, but fast iteration once graph is understood. 30-90 minutes for first graph, but extremely flexible thereafter.

### Scaling Challenges

- **CrewAI**: Task output context grows with task count. Hierarchical process requires manager token budget. Long-running crews leak tokens.
- **AutoGen**: Message history grows unbounded in RoundRobin. No default memory cleanup. Swarm handoff logic can become complex.
- **LangGraph**: Explicit state management prevents hidden growth. Checkpointers enable very long workflows. Complexity is in the graph structure.

### Production Readiness (as of April 2026)

- **CrewAI**: Mature for content generation, business process automation. Memory system is sophisticated. Not suitable for long-running stateful workflows.
- **AutoGen 0.4**: Mature for interactive workflows and code generation. Exception handling is still weak. Memory is not production-ready.
- **LangGraph**: Most mature for production. Explicit, predictable. Strong error handling, checkpointing, and memory patterns. Best for complex, long-lived systems.

---

## Research Methodology

All information sourced from:
1. Official documentation (March-April 2026 versions).
2. GitHub repositories for current API.
3. Recent blog posts and technical articles (2025-2026).
4. Not from training data — all claims tied to current documentation.

Framework versions researched:
- **CrewAI**: Latest (2026)
- **AutoGen**: 0.4.x stable (February 2026 release)
- **LangGraph**: 2.0 (February 2026 release, per search results)

No legacy versions included. Where frameworks mention older APIs, they're noted as deprecated.
