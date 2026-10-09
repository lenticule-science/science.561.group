---
title: "SWE-agent Architecture Analysis"
description: "Analysis of SWE-agent's Agent-Computer Interface, trajectory recording, evaluation harness, and configuration system"
date-created: 2026-04-04
source: "https://github.com/princeton-nlp/SWE-agent"
related:
  - reflexion-and-lats-analysis.md
  - cline-architecture-analysis.md
  - agentic-harness-landscape-2026.md
  - continuous-learning-in-agentic-harnesses.md
---

SWE-agent is an autonomous software engineering agent from Princeton NLP that solves GitHub issues by operating inside a containerized environment with a carefully designed set of tools. Its core contribution is the **Agent-Computer Interface (ACI)** — the principle that how you expose the environment to an agent matters as much as the model itself. This analysis covers the architecture from the source at commit depth 1 of `princeton-nlp/SWE-agent`.

## 1. Agent-Computer Interface (ACI)

The ACI is SWE-agent's central design idea: rather than giving the agent a raw shell, you give it a curated set of commands that constrain the action space to operations the agent can reason about reliably.

### Tool Bundles

Tools are organized as **bundles** — directories containing a `config.yaml` (command definitions), a `bin/` directory (executable scripts), and an optional `install.sh`. The `Bundle` class (`sweagent/tools/bundle.py`) loads these at config time and validates that hidden tools actually exist.

Each bundle's `config.yaml` defines commands as structured objects with:
- **name, signature, docstring** — what the agent sees
- **arguments** — typed, with descriptions, required flags, and optional enums
- **end_name** — for multi-line commands, the termination marker (e.g., `end_of_edit`)

The `ToolConfig` class (`sweagent/tools/tools.py`) aggregates bundles and enforces uniqueness — no two bundles can define the same command name.

### The Default Tool Set

The default configuration (`config/default.yaml`) gives the agent:

1. **registry** — an empty tool set that provides the filemap utility (a Python file summarizer that shows structure while eliding function bodies)
2. **edit_anthropic** — the `str_replace_editor` tool, modeled after Anthropic's computer use demo. Supports `view`, `create`, `str_replace`, `insert`, and `undo_edit` operations on files
3. **review_on_submit_m** — a submit command that triggers a self-review before finalizing
4. **bash** — a general-purpose shell command (enabled by default)

An older alternative tool set (`windowed_edit_linting`) provides a different editing model: `open` a file into a scrollable window, navigate with `goto`/`scroll_up`/`scroll_down`, and edit with line-range replacement. Edits are validated with flake8 before being accepted — if the edit introduces syntax errors, it is automatically reverted and the agent sees the error alongside the before/after code.

### Command Blocklist

The `ToolFilterConfig` blocks interactive programs (`vim`, `nano`, `less`, `gdb`, `python` standalone, `bash` standalone) that would hang the agent. Commands matching `blocklist` prefixes or `blocklist_standalone` exact matches are rejected with a template error message. There is also a `block_unless_regex` mechanism for tools like `radare2` that are only safe with the `-c` flag.

### State Commands

Each bundle can declare a `state_command` — a shell command that writes to `/root/state.json`. After every action, the `ToolHandler` runs all state commands and reads the combined state. This state is injected into the observation template, giving the agent contextual information (current file, working directory, diff) without the agent having to ask for it.

The `diff_state` bundle, for example, provides `_state_diff_state` which writes the current git diff into state — so the agent always sees what it has changed.

### Function Calling vs. Text Parsing

SWE-agent supports two modes of command invocation:

- **Function calling** (`FunctionCallingParser`) — commands are exposed as OpenAI-style function definitions. Each `Command` can generate its function calling schema via `get_function_calling_tool()`. This is the default for modern configs.
- **Text parsing** (`ThoughtActionParser`, `ActionOnlyParser`) — the model outputs text in a structured format (thought + action), and the parser extracts the command. Multi-line commands use heredoc-style terminators.

## 2. Editing Commands: Safe File Modification

SWE-agent provides two distinct editing interfaces, both designed to prevent common agent editing failures:

### str_replace_editor (Anthropic-style)

The `str_replace` operation requires the agent to provide an exact match of the old text. If the match is not unique in the file, the replacement is rejected. This forces the agent to include enough context to unambiguously identify the edit location — preventing off-by-one and wrong-location edits.

Operations:
- `view` — shows file contents with line numbers (like `cat -n`), supports range viewing
- `create` — creates new files (fails if file exists)
- `str_replace` — exact-match find-and-replace
- `insert` — insert text after a given line
- `undo_edit` — revert the last edit

### Windowed Editor with Linting

The older editing system (`windowed_edit_linting`) takes a different approach:

1. The agent must `open` a file first, creating a scrollable window (default 100 lines)
2. The agent navigates with `goto`, `scroll_up`, `scroll_down`
3. Edits use line ranges: `edit <start>:<end>` followed by replacement text terminated by `end_of_edit`
4. Before accepting an edit, the system runs **flake8** on the file. If the edit introduces new lint errors, it is **automatically reverted** and the agent sees the error, the would-be result, and the original code

The linting gate is significant: it means the agent cannot introduce syntax errors. The `format_flake8_output` function filters to show only errors introduced by the edit (not pre-existing ones), adjusting line numbers for the replacement's effect on line count.

## 3. Trajectory Recording

Every agent run produces a `.traj` file — a JSON document containing the complete record of the agent's behavior.

### TrajectoryStep

Each step records (`sweagent/types.py`):
- `action` — the command executed
- `observation` — the environment's response
- `response` — the raw model output
- `state` — environment state at step end (from state commands)
- `thought` — the agent's reasoning (if using thought-action parsing)
- `execution_time` — wall clock time for the step
- `query` — the messages sent to the model
- `extra_info` — arbitrary metadata

### Trajectory File Contents

The `get_trajectory_data()` method on `DefaultAgent` saves:
- `trajectory` — the list of `TrajectoryStep` objects
- `history` — the full message history (every message sent to and received from the model)
- `info` — agent metadata including model stats, exit status, submission, version hashes
- `replay_config` — the full configuration needed to replay this trajectory
- `environment` — which environment was used

### Replay

The `run_replay` module can take a `.traj` file and re-execute every action in a fresh environment. This serves two purposes:
1. **Demo creation** — record a human solving a problem, replay it to get clean environment output, use as a few-shot demonstration
2. **Debugging** — reproduce exact agent behavior to diagnose tool or environment issues

Demonstrations can be injected into the agent's history as few-shot examples, either as a single concatenated message or step-by-step into the conversation history.

### Inspector

SWE-agent includes a web-based trajectory inspector (`sweagent/inspector/`) — a local HTTP server that renders trajectories as interactive step-by-step views. The inspector adds the problem statement as the first step and the submission as the last, making the full solve visible.

## 4. Evaluation Harness

### SWE-bench Integration

The `run-batch` command (`sweagent/run/run_batch.py`) runs the agent over datasets of problem instances, most notably SWE-bench. The `BatchInstanceSourceConfig` supports loading from SWE-bench (by subset and split), from files, or from HuggingFace datasets. Instances can be filtered, sliced, and shuffled.

Each instance gets:
- A Docker container with the repository at the correct commit
- The problem statement (issue text)
- A clean environment with tools installed

The agent runs, produces a patch (via the submit command), and the patch is evaluated against the SWE-bench test suite.

### RetryAgent

The `RetryAgent` wraps `DefaultAgent` with a retry loop controlled by a `RetryLoopConfig`:

1. The agent attempts to solve the problem
2. A **reviewer** evaluates the submission — either scoring it (`ScoreRetryLoop`) or choosing among attempts (`ChooserRetryLoop`)
3. If the reviewer rejects the submission and budget remains, the environment is hard-reset and a new attempt begins
4. The best attempt is selected and its patch submitted

The reviewer is itself an LLM — it receives the trajectory and submission, then predicts whether the solution is correct. This implements a lightweight form of **self-verification**.

Cost controls are layered:
- `per_instance_cost_limit` — budget per attempt
- `cost_limit` on the retry loop — total budget across all attempts
- `per_instance_call_limit` — maximum API calls per instance
- `total_cost_limit` — absolute ceiling

### Submission and Review

The `review_on_submit_m` bundle intercepts the submit command and injects a review step. When the agent calls `submit`, instead of immediately finalizing, it:
1. Shows the agent the full diff of its changes
2. Asks it to verify: re-run reproduction scripts, remove test files, revert test modifications
3. Requires a second `submit` call to confirm

This self-review catches cases where the agent forgot to clean up reproduction scripts or accidentally modified test files.

## 5. Configuration System

### YAML-Based Configuration

Agent behavior is fully parameterized via YAML config files loaded by Pydantic models. The configuration hierarchy:

```
RunSingleConfig / RunBatchConfig
├── agent: AgentConfig
│   ├── templates: TemplateConfig (system, instance, observation templates)
│   ├── tools: ToolConfig
│   │   ├── bundles: list[Bundle]
│   │   ├── filter: ToolFilterConfig
│   │   ├── parse_function: ParseFunction
│   │   └── env_variables, registry_variables
│   ├── history_processors: list[HistoryProcessor]
│   └── model: ModelConfig
├── env: EnvironmentConfig
│   ├── deployment: DeploymentConfig (Docker, Modal, etc.)
│   └── repo: RepoConfig
└── problem_statement: ProblemStatementConfig
```

### Template System

All messages are Jinja2 templates. Available variables include:
- `problem_statement` — the issue text
- `command_docs` — auto-generated documentation for all available tools
- `observation` — the last command output
- `working_dir` — the repository path
- State variables from state commands (e.g., `open_file`, `diff`)

The `max_observation_length` parameter (default 100,000 characters) truncates long outputs, and separate templates handle empty outputs, truncated outputs, timeouts, and syntax errors.

### History Processors

History processors transform the conversation history before sending it to the model. They are a pipeline — each processor receives the output of the previous one.

Key processors:
- `DefaultHistoryProcessor` — identity (pass-through)
- `LastNObservations` — elides all but the last N observation messages, replacing them with "Old environment output: (N lines omitted)". Supports `polling` (batch updates for cache friendliness) and tag-based exceptions
- `TagToolCallObservations` — adds tags to observations from specific tools, used to mark certain tool outputs for special treatment by `LastNObservations`
- `CacheControl` — adds Anthropic prompt caching markers to the last N messages

### Deployment Flexibility

The environment runs through SWE-ReX (`swerex`), an abstraction layer supporting:
- Docker containers (default)
- Modal (serverless GPU)
- Local execution

The `SWEEnv` class communicates with the deployment via bash sessions, handling command execution, file I/O, and environment reset.

## 6. What We Should Adopt

### ACI Design Principle

SWE-agent's core lesson: **the action space is a design surface, not a given.** Rather than exposing the full shell, constrain tools to operations the agent handles reliably. Our harness already does this (Read, Edit, Write, Grep, Glob instead of raw bash), but SWE-agent's bundle system suggests we could make tool sets more composable and swappable per task type.

### Linting Gate on Edits

The windowed editor's automatic lint-and-revert pattern is directly applicable. When an agent edit introduces errors, immediately revert and show the agent what went wrong. Our hooks system could implement this — a post-edit hook that runs a linter and blocks the edit if it introduces new errors.

### State Commands

Injecting environment state (current file, working directory, git diff) into every observation template eliminates a class of agent confusion. Our state is currently implicit in the conversation history; explicit state injection would reduce wasted context on "what file am I looking at?" queries.

### Trajectory Recording for Learning

SWE-agent records everything: every action, observation, model query, and state. This enables:
- **Replay** — reproduce exact behavior for debugging
- **Demo creation** — turn successful runs into few-shot examples
- **Analysis** — the inspector lets humans study agent decision patterns

Our session logs capture high-level events but not the full action-observation trace. Recording at SWE-agent's granularity would feed our continuous learning system with richer training signal.

### Self-Review Before Submission

The review-on-submit pattern — showing the agent its own diff and asking it to verify — is cheap and effective. We could add a pre-commit hook that shows the agent the full diff and asks for confirmation, similar to what our code-review command does but integrated into the commit flow.

### Cost Controls as Architecture

SWE-agent's layered cost limits (per-attempt, per-instance, total) prevent runaway spending. Our harness has some of this via model routing and task budgets, but SWE-agent's approach of embedding cost limits into the retry loop configuration is more systematic.

## See Also

- [Reflexion and LATS Analysis](./reflexion-and-lats-analysis.md) — retry and self-reflection patterns
- [Cline Architecture Analysis](./cline-architecture-analysis.md) — another IDE-integrated agent
- [Continuous Learning in Agentic Harnesses](./continuous-learning-in-agentic-harnesses.md) — trajectory-based learning
- [Agentic Harness Landscape 2026](./agentic-harness-landscape-2026.md) — broader survey of agent frameworks
