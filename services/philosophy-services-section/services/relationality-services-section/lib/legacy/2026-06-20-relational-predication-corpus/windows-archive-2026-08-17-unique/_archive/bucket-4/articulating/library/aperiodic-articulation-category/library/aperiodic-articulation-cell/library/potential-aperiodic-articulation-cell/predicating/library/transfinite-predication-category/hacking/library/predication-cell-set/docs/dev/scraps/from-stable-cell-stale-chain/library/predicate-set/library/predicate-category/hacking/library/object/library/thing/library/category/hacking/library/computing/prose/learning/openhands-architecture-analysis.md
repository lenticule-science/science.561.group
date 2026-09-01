---
title: "OpenHands Architecture Analysis"
description: "Analysis of OpenHands (formerly OpenDevin) — runtime isolation, event streams, state management, and multi-agent delegation"
date-created: 2026-04-04
domain: computing
keywords:
  - agentic-systems
  - architecture-analysis
  - open-source
sources:
  - https://github.com/All-Hands-AI/OpenHands
---

OpenHands (formerly OpenDevin) is an open-source AI software development platform. This analysis covers the V0 architecture (deprecated April 2026, with V1 migrating to a separate Software Agent SDK). The patterns here remain instructive regardless of version.

## Runtime Isolation

OpenHands isolates agent execution inside Docker containers. Each agent session gets a dedicated container (`openhands-runtime-{session_id}`) with its own filesystem, network, and process namespace. The container runs as a dedicated non-root user (`openhands`, UID 42420) to prevent UID conflicts with the host.

The architecture splits into two sides:

- **Host side** (`ActionExecutionClient`): sends HTTP POST requests to the container's `/execute_action` endpoint with JSON-serialized actions. A semaphore ensures one action at a time.
- **Container side** (`ActionExecutor`): a FastAPI server inside the sandbox that executes commands via tmux-based bash sessions, Jupyter kernels, a file editor, and a browser environment.

Communication uses dynamic port mapping (range 30000-39999) with thread-safe port locks. Every request requires an `X-Session-API-Key` header — a per-session cryptographic token injected as an environment variable when the container starts. Only `/alive` and `/server_info` bypass authentication.

File system access uses controlled Docker volume mounts with three modes: `rw` (read-write, default), `ro` (read-only), and `overlay` (copy-on-write — the host path is the lower read-only layer, with a per-container upper layer capturing writes). This overlay pattern allows multiple containers to share a read-only source while maintaining independent modifications.

Pluggable security analyzers inspect actions before execution: an LLM-based risk assessor, an invariant analyzer (detects secret leaks and dangerous commands), and a Gray Swan integration for AI safety monitoring. Each returns LOW/MEDIUM/HIGH/UNKNOWN risk; HIGH-risk actions require user confirmation.

Key files: `openhands/runtime/impl/docker/docker_runtime.py` (container lifecycle, volume mounts), `openhands/runtime/action_execution_server.py` (FastAPI server inside sandbox), `openhands/runtime/utils/bash.py` (tmux session management).

## Event Stream Architecture

The EventStream is the central communication hub. Every component — agent controller, runtime, memory system, server — subscribes to it and receives events asynchronously.

Events divide into two types:

- **Actions**: what the agent or user wants to happen. Types include `CmdRunAction`, `FileReadAction`, `FileEditAction`, `MessageAction`, `AgentDelegateAction`, `AgentFinishAction`, `IPythonRunCellAction`, `BrowseInteractiveAction`, and `MCPAction`.
- **Observations**: what actually happened. Types include `CmdOutputObservation`, `FileReadObservation`, `ErrorObservation`, `AgentDelegateObservation`, `RecallObservation`, and `AgentCondensationObservation`.

Each event carries an `id` (position in stream), `timestamp`, `source` (AGENT, USER, or ENVIRONMENT), and `cause` (ID of the triggering event, enabling causality tracking). LLM call metrics attach to events that triggered LLM usage.

The flow:
1. Event added to stream with timestamp and sequential ID
2. Serialized to dict with secret masking
3. Cached in a write page, then persisted to file storage
4. Queued for async distribution to all subscribers
5. Each subscriber's callbacks execute in a dedicated thread pool with its own event loop

Thread safety is enforced via `threading.Lock` on cache page management and ID assignment. Subscribers are identified by role: AGENT_CONTROLLER, RESOLVER, SERVER, RUNTIME, MEMORY, MAIN, TEST.

Key files: `openhands/events/event.py` (base Event class), `openhands/events/stream.py` (EventStream with subscription and distribution), `openhands/events/action/` and `openhands/events/observation/` (type hierarchies).

## The Observation-Action Loop

The `AgentController` orchestrates the loop. It subscribes to the EventStream and responds to events:

1. **Trigger**: a user message or runtime observation arrives
2. **should_step()**: determines if the agent should act (yes for user messages, observations, delegate completions; no if a delegate is active or state is not RUNNING)
3. **_step()**: the core execution method:
   - Checks agent state is RUNNING and no pending action blocks progress
   - Runs stuck detection (loop detection) if enabled
   - Checks iteration and budget control flags
   - Calls `agent.step(state)` to get the next action from the LLM
   - Runs security analysis on runnable actions
   - Publishes the action to the EventStream
4. **Runtime execution**: the runtime subscriber receives the action, executes it in the sandbox, and publishes an observation
5. **Cycle repeats**: the observation triggers the next `should_step()` evaluation

Error handling wraps the entire step in exception catching for LLM errors (authentication, rate limits, context window exceeded, content policy violations), mapping them to appropriate state transitions and error messages.

Key file: `openhands/controller/agent_controller.py` (lines 863-1038 for `_step()`, 413-452 for `should_step()`).

## State Management

The `State` object tracks execution context:

- `history`: filtered list of events (excludes NullAction/Observation and hidden events)
- `agent_state`: current AgentState enum (LOADING, RUNNING, PAUSED, FINISHED, ERROR, etc.)
- `iteration_flag` and `budget_flag`: control flags with current/max values, shared across delegation levels
- `delegate_level`: depth of agent delegation nesting
- `start_id` and `end_id`: event stream range boundaries for this controller's scope
- `metrics`: LLM call metrics, shared globally across all delegates

State persists via pickle + base64 encoding to a FileStore. History is not pickled — it reconstructs from the EventStream on restore. The `StateTracker` manages this persistence, filtering events and tracking stream boundaries.

The `View` system provides a memory-aware lens over history. It tracks `forgotten_event_ids` from condensation actions and filters them from the agent's visible history, inserting summary observations at the appropriate offset.

Key files: `openhands/controller/state/state.py`, `openhands/controller/state/state_tracker.py`, `openhands/memory/view.py`.

## Memory and Context Management

Three layers handle memory:

**ConversationMemory** (`openhands/memory/conversation_memory.py`): converts event history into LLM message format. Handles tool call actions in function-calling mode, respects forgotten event IDs from condensation, truncates large observations to `max_message_chars`, and supports vision/image URLs.

**Condenser** (`openhands/memory/condenser/condenser.py`): abstract interface for history reduction. When the LLM raises a ContextWindowExceededError, the controller publishes a `CondensationRequestAction`. The condenser processes this, producing a condensed view that preserves essential context while reducing token usage. Multiple condenser implementations are configurable.

**Memory Component** (`openhands/memory/memory.py`): subscribes to the EventStream as the MEMORY subscriber. Listens for `RecallAction` events and retrieves workspace context or knowledge based on `recall_type`, publishing `RecallObservation` responses. This is the microagent knowledge retrieval system.

## Multi-Agent Delegation

Delegation uses a parent-child controller pattern:

1. **Initiation**: the agent emits an `AgentDelegateAction` with a target agent name and input parameters
2. **start_delegate()**: the parent controller creates a new agent instance from the registry, a new `AgentController` with `is_delegate=True`, and an isolated `State` with:
   - Incremented `delegate_level`
   - New `start_id` in the event stream (scoping the delegate's history)
   - Shared `metrics`, `iteration_flag`, and `budget_flag` objects
3. **Event forwarding**: while a delegate is active, the parent forwards all events to it and skips its own `should_step()` (returns false)
4. **end_delegate()**: when the delegate reaches FINISHED/ERROR/REJECTED, the parent collects results into an `AgentDelegateObservation`, synchronizes iteration counts and metrics, destroys the delegate, and resumes its own execution

Delegates do not subscribe directly to the EventStream — the parent acts as a proxy, preventing duplicate event processing. This is a clean single-subscriber-per-level design.

Available agents: CodeActAgent (primary, tool-use via function calling), ReadOnlyAgent (read-only file exploration), BrowsingAgent (web browsing via BrowserGym), LocAgent (lines-of-code analysis), DummyAgent (deterministic testing). Agents register via `Agent.register('Name', Class)` and instantiate via `Agent.get_cls('Name')`.

Prompt management uses Jinja2 templates with dynamic filename selection (e.g., `system_prompt_long_horizon.j2` when plan mode is enabled). Tool composition is config-driven: each agent assembles its tool list based on enabled features (`enable_cmd`, `enable_jupyter`, `enable_browsing`, etc.).

Key files: `openhands/controller/agent_controller.py` (lines 735-861 for delegation), `openhands/controller/agent.py` (base class and registry), `openhands/agenthub/` (agent implementations).

## Patterns Worth Adopting

**Event stream as single source of truth.** All communication flows through one EventStream with typed events, causality tracking, and persistent storage. This gives full observability and replay capability. Our system uses separate event logs, session files, and tool call records — a unified stream would simplify debugging and enable replay.

**Structured action/observation types.** Every agent action and every runtime response has a typed dataclass with known fields. This constrains the action space and makes it parseable. Our hooks use JSON on stdin/stdout but without a formal type hierarchy.

**Condensation as a first-class operation.** When context overflows, OpenHands emits a `CondensationAction` that flows through the same event stream, is tracked with an ID, and produces a summary that replaces forgotten events in the view. This is more principled than our auto-compaction, which happens outside the agent's awareness.

**Delegate isolation with shared budgets.** Delegates get scoped history (new `start_id`) but share iteration and budget counters with the parent. This prevents delegates from consuming unbounded resources while giving them clean context. Our subagents currently inherit the full context window cost without explicit budget sharing.

**Overlay filesystem for sandboxing.** The copy-on-write overlay mount pattern (read-only lower layer from host, writable upper layer per container) is a clean way to let agents modify files without affecting the source. Worth considering if we move toward containerized execution.

**Security analysis in the loop.** Pluggable security analyzers that inspect actions before execution — not as a hook that blocks, but as a typed risk assessment that can trigger confirmation flows. This is more granular than our safety-guard hook.

## Patterns to Avoid

**Pickle-based state persistence.** State serializes via pickle + base64, which is fragile across versions (they have explicit backward-compatibility shims in `__getstate__`/`__setstate__`). Our JSON/markdown approach is more durable.

**Monolithic controller class.** `AgentController` at ~1000 lines handles event routing, delegation, security, stuck detection, error handling, and state management. This makes it hard to reason about any single concern.

**Port range allocation.** Dynamic port mapping with ranges (30000-39999) and lock files is operationally fragile. Unix domain sockets or a reverse proxy would be simpler.
