---
title: "Cline Architecture Analysis"
description: "Architecture analysis of the Cline VS Code extension — Memory Bank, Plan Mode, context window management, .clinerules, MCP integration, and subagent patterns."
date-created: 2026-04-04
source-repo: operations/engineering/fars/src/cline/
related:
  - continuous-learning-in-agentic-harnesses.md
---

Cline is a VS Code extension that gives an AI agent access to IDE tools — file editing, terminal execution, browser automation, and MCP servers — through a structured task execution loop. This analysis reads the source code to extract architectural patterns relevant to our harness design.

## Architecture Overview

Cline follows a three-layer hierarchy:

1. **WebviewProvider** — manages VS Code webview lifecycle, HTML rendering, message passing
2. **Controller** — single source of truth for persistent state, coordinates tasks, manages MCP connections
3. **Task** — executes AI requests in a loop, handles tool approval, streams responses

The webview (React) communicates with the extension host through VS Code's `postMessage` system, serialized via gRPC-like protobuf. State lives in VS Code's global state, workspace state, and secrets storage.

## Plan Mode and Act Mode

Cline implements a hard modal split between planning and execution. The mode is stored in `chatSettings.mode` and toggled through the Controller.

In **Plan Mode**, the agent has access to exploration tools (read_file, search_files) plus a single output tool: `plan_mode_respond`. This tool takes a `response` parameter (the plan text) and an optional `needs_more_exploration` boolean. If the agent realizes mid-response that it needs to read more files, it sets `needs_more_exploration: true` to signal that its next turn will use exploration tools rather than presenting a plan.

In **Act Mode**, the agent has access to all tools except `plan_mode_respond` and focuses on implementation. The `attempt_completion` tool signals task completion.

The two modes can use different API providers and models — a cheaper model for planning, a more capable one for execution. Mode switching preserves model configurations bidirectionally.

The system prompt section `ACT MODE V.S. PLAN MODE` is injected into every conversation. The environment_details in each user message specifies the current mode. This is not a suggestion; it is a hard constraint on tool availability. The prompt frames Plan Mode as "a brainstorming session" and instructs the agent to ask the user to switch back to Act Mode when the plan is ready.

### Deep Planning

Cline also has a `/deep-planning` slash command that generates an extended planning prompt. This is model-family-aware — it produces different prompt variants for GPT-5.1, Gemini 3, and the generic fallback. Deep planning ends by calling the `new_task` tool to create a fresh task with the plan as preloaded context.

### What This Means For Us

Our harness implements planning through the `/plan` command and `EnterPlanMode`/`ExitPlanMode` tools, which is structurally similar but softer — we don't hard-gate tool availability by mode. Cline's hard modal split prevents the agent from accidentally executing during planning. Worth considering: our agent sometimes drifts from planning into execution. A hard gate would prevent that.

The `needs_more_exploration` parameter is clever. It lets the agent admit mid-output that it jumped the gun without losing the response. We don't have an equivalent — our plan mode either produces a plan or reads files, but can't signal "I started answering but realized I need more context" within a single tool call.

## Context Window Management

Cline has three mechanisms for handling context saturation:

### 1. Proactive Token-Based Truncation (Old System)

The `ContextManager` monitors token usage after each API request. When total tokens (input + output + cache writes + cache reads) exceed a model-specific threshold, it truncates conversation history.

Thresholds are defined in `context-window-utils.ts`:
- 64K models (DeepSeek): buffer of 27K tokens
- 128K models (most): buffer of 30K tokens
- 200K models (Claude): buffer of 40K tokens

Truncation always preserves the first user-assistant pair (the original task). It removes messages in even-numbered chunks to maintain the user-assistant alternation. Strategies are adaptive:
- **Half truncation**: when tokens exceed the threshold
- **Three-quarter truncation**: when half the tokens alone exceed the threshold (e.g., switching from a 200K to 64K model mid-conversation)

### 2. Auto-Condense / Summarize Task (New System)

When `useAutoCondense` is enabled, instead of programmatic truncation, Cline asks the agent itself to summarize the conversation using the `summarize_task` tool. The agent receives an explicit instruction block (`<explicit_instructions type="summarize_task">`) that mandates a structured summary covering:

1. Primary request and intent
2. Key technical concepts
3. Files and code sections (with snippets)
4. Problem solving status
5. Pending tasks
6. Task evolution (how the user's request changed over time)
7. Current work (most recent activity)
8. Next step (with verbatim quotes from recent messages)
9. Required files (paths relative to CWD)

The `SummarizeTaskHandler` then reads the "Required Files" section, auto-loads up to 8 files (max 100K characters), and prepends them to the continuation prompt. This means the new context starts with the summary plus the most relevant file contents already loaded.

A `PreCompact` hook runs before summarization, allowing external scripts to modify the context or cancel compaction entirely.

### 3. The new_task Tool (Session Chaining)

The `new_task` tool lets the agent propose starting a fresh conversation with preloaded context. The context parameter follows a 5-section structure: Current Work, Key Technical Concepts, Relevant Files and Code, Problem Solving, Pending Tasks and Next Steps. The user sees a preview and can approve, provide feedback, or continue the current conversation.

This is structurally different from `summarize_task` — `new_task` creates a genuinely new task ID with fresh state, while `summarize_task` truncates within the same task. The `new_task` tool is disabled in YOLO mode (fully autonomous operation) to prevent unsupervised session chaining.

### Context Error Recovery

The `context-error-handling.ts` module detects context window exceeded errors from every major provider (OpenAI, Anthropic, OpenRouter, Bedrock, Cerebras, Vercel) through provider-specific error pattern matching. When detected, Cline retries with more aggressive truncation. This is a safety net — the proactive mechanisms above should prevent most context overflows.

### What This Means For Us

Our harness uses Claude Code's built-in context compaction, which is opaque to us. Cline's approach is instructive because it is explicit and controllable:

- The structured summary template prevents lossy compaction. Our compaction sometimes loses track of what was being worked on. Cline's 9-section template with required verbatim quotes from recent messages is a direct countermeasure.
- Auto-loading required files after compaction is excellent. After our compaction events, the agent often has to re-read files it already had in context. Pre-loading them eliminates a round-trip.
- The `PreCompact` hook is powerful — it lets the harness inject additional context or override compaction behavior. Our hooks system could support this.

## .clinerules: Project-Specific Learning

Cline uses a `.clinerules/` directory in the project root for persistent project-specific instructions. The system loads rules from three scopes:

1. **Global rules** — from `~/.cline/rules/`, applied to all projects
2. **Local/workspace rules** — from `.clinerules/` in the project, excluding `workflows/`, `hooks/`, and `skills/` subdirectories
3. **Remote rules** — fetched from remote config, stored in global state

Rules support YAML frontmatter with conditional evaluation. A rule can specify conditions (e.g., file patterns, modes) that determine when it activates. Rules that fail parsing still load (fail-open) so the LLM sees the author's intent even if the frontmatter is malformed.

The `.clinerules/` directory in Cline's own repo demonstrates the pattern:
- `general.md` — tribal knowledge about the codebase (when to add: user had to intervene, multiple attempts needed, something worked differently than expected)
- `network.md` — proxy-aware networking requirements
- `cli.md` — CLI-specific development patterns
- `protobuf-development.md`, `storage.md` — domain-specific conventions
- `workflows/` — structured multi-step processes (PR review, hotfix release, documentation writing)

The `general.md` file is particularly instructive. Its preamble explicitly defines when to add entries: "User had to intervene, correct, or hand-hold," "Multiple back-and-forth attempts were needed," "Something worked differently than you expected." It also defines what NOT to add: "Stuff you can figure out from reading a few files, obvious patterns, or standard practices."

### What This Means For Us

Our rules system (`.claude/rules/`) is structurally identical. Our instinct system goes further — it automates pattern detection and confidence scoring that .clinerules requires humans to do manually. But .clinerules' explicit "what NOT to add" guidance is worth adopting. Our instinct system sometimes captures patterns that are derivable from reading the code, wasting context tokens.

The workflows subdirectory pattern — structured multi-step processes stored as rules files — maps directly to our skills system. The PR review workflow in `.clinerules/workflows/pr-review.md` is essentially a skill file with detailed step sequences.

## Skills System

Cline's skills are stored in directories under `~/.cline/skills/` (global) and `.clinerules/skills/` (project), each containing a `SKILL.md` file with YAML frontmatter (`name`, `description`) and instruction body. Skills are discovered at startup, and global skills override project skills of the same name.

The agent loads skills on-demand via the `use_skill` tool, which takes a `skill_name` parameter and returns the skill's instruction body. Skills appear in the system prompt as a list with name and description; the full instructions are only loaded when activated.

This is a two-phase pattern: metadata in the system prompt (always present, low token cost) and full instructions loaded on demand (high token cost, only when needed). Our skills use a similar pattern through deferred loading, but Cline's approach is more explicit about the cost tradeoff.

## Focus Chain (Task Progress Tracking)

Cline's Focus Chain system is a todo-list-as-tool-parameter pattern. Every tool call can include an optional `task_progress` parameter containing a markdown checklist. The system:

1. Persists the checklist to a markdown file on disk, watched by chokidar
2. Displays progress in the webview UI
3. Injects contextual reminders into the prompt at configurable intervals
4. Tracks completion percentage and adjusts reminder intensity
5. Allows the user to edit the file externally, with changes detected and flagged to the model

The checklist is mandatory when switching from Plan to Act mode. The system uses different prompt strategies based on state: initial creation prompts when no list exists, update reminders at configurable intervals, progress-percentage-based messages, and special handling when the user has edited the list.

### What This Means For Us

Our `TodoWrite` tool is equivalent but less integrated. Cline's approach of making task_progress a parameter on every tool call means the agent updates its progress tracking as a side effect of doing work, not as a separate action. This reduces the friction of keeping progress updated.

The file-watching pattern — writing todos to disk and letting external editors modify them — is interesting for our TUI context. Users could edit task lists in their preferred editor.

## Loop Detection

Cline detects when the model calls the same tool with identical parameters repeatedly. It uses a signature-based comparison that strips metadata parameters (`task_progress`) and sorts keys. At 3 identical consecutive calls (soft threshold), it injects a warning. At 5 (hard threshold), it escalates to the user.

### What This Means For Us

We don't have equivalent loop detection. Our agents can get stuck in read-the-same-file loops or repeated grep patterns without intervention. Implementing signature-based loop detection in our ToolExecutor would be a direct improvement.

## MCP Integration

Cline's MCP integration is through `McpHub`, a centralized manager that:
- Connects to MCP servers via stdio or SSE transport
- Discovers tools and resources at connection time
- Injects connected server details into the system prompt (tools with full JSON schemas, resources, prompts)
- Provides `use_mcp_tool` and `access_mcp_resource` tools for the agent
- Supports a `load_mcp_documentation` tool for lazy-loading server docs
- Manages server lifecycle (health monitoring, reconnection, timeout)
- Supports per-tool auto-approval settings

The system prompt section for MCP lists each connected server with its command, available tools (with full input schemas), resource templates, direct resources, and prompts. Only connected servers are included.

### What This Means For Us

Our MCP integration follows a similar pattern through the 561-datastore server. Cline's `load_mcp_documentation` tool for lazy-loading is notable — rather than putting all server documentation in the system prompt, it lets the agent request docs for specific servers on demand. This is the same two-phase pattern as skills: metadata always present, full content loaded on demand.

## Subagent System

Cline supports up to 5 parallel in-process subagents via the `use_subagents` tool. Each subagent:
- Gets its own prompt and a read-only tool set (file read, list files, search, list code definitions, bash for readonly operations, skills, attempt_completion)
- Can use a different model than the parent (configured per named agent in `.agents/`)
- Returns results through `attempt_completion` directly to the parent
- Runs with a system suffix that frames it as a "research subagent" focused on exploration
- Is instructed to keep results concise with a "Relevant file paths" section

Subagent configuration is loaded from `.agents/` directories with YAML frontmatter specifying name, description, model override, allowed tools, skills, and optional custom system prompt.

The tool is only available when `subagentsEnabled` is true and the current run is not itself a subagent (preventing recursive spawning).

### What This Means For Us

Our Agent tool is more flexible — subagents can write files, have richer type specialization, and run in worktrees. But Cline's constraint to read-only operations by default is a safety pattern we should consider for research-type agents. The hard limit of 5 parallel subagents is also a simple but effective resource control.

## VS Code Integration Patterns

Cline's VS Code integration includes:

- **State persistence** across webview reloads via VS Code global state, workspace state, and secrets storage
- **Multi-instance coordination** through file-based storage and event listeners
- **Git-based checkpoints** after every tool execution, enabling rollback to any point
- **Terminal management** with real-time output streaming, process state monitoring, and multi-terminal support
- **Browser automation** via Puppeteer at fixed 900x600 resolution
- **Diff view integration** for file changes, with revert capability
- **WebviewProvider** managing both sidebar and tab panel contexts

The gRPC-like protobuf communication layer between extension host and webview is notable. Rather than ad-hoc message types, Cline generates typed service definitions from `.proto` files, providing type safety across the boundary.

### What This Means For Us

For our TUI context, the relevant patterns are:
- **Checkpoint-per-tool-execution**: our git workflow is session-level, not tool-level. More granular checkpoints would enable safer autonomous operation.
- **Terminal management abstraction**: Cline's `TerminalManager` tracks terminal state, busy/idle status, and output history. Our Bash tool is more primitive.
- **State persistence layered by scope**: global (cross-project), workspace (per-project), and secrets (sensitive). We have session state and memory, but no workspace-scoped persistence.

## Patterns To Adopt

1. **Structured compaction template**: When context compaction triggers, require a structured summary with verbatim quotes from recent messages and a required-files list. Auto-load those files into the new context.

2. **Loop detection**: Implement signature-based repeated-tool-call detection with soft warning and hard escalation thresholds.

3. **Hard plan/act mode gating**: When in plan mode, prevent tool execution rather than relying on prompt instructions alone.

4. **Task progress as side-channel parameter**: Allow every tool call to carry a progress update, reducing the overhead of explicit progress-tracking tool calls.

5. **Two-phase skill loading**: Keep skill metadata (name + description) in the system prompt and load full instructions on demand via a dedicated tool call.

6. **PreCompact hooks**: Before compaction, run a hook that can inject context, modify the summary, or cancel compaction.

7. **Per-tool-execution checkpoints**: Create git checkpoints after each tool execution, not just at session boundaries.
