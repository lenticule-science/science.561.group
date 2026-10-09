---
title: "Research Memo: Emacs and Agentic Programming"
date-created: 2026-08-20
description: "Date: June 17, 2026 Prepared for: emsenn Scope: Current public practices, packages, conventions, risks, and emerging paradigms for using Emacs as an environment for agentic programming."
---
# Research Memo: Emacs and Agentic Programming

**Date:** June 17, 2026  
**Prepared for:** emsenn  
**Scope:** Current public practices, packages, conventions, risks, and emerging paradigms for using Emacs as an environment for agentic programming.

---

## Executive summary

Emacs users are not, for the most part, replacing Emacs with a single AI-native IDE. They are integrating agentic programming into Emacs’s existing ecology of buffers, subprocesses, Lisp commands, version control, shells, project navigation, Org files, and personal workflows. The most important pattern is compositional: Emacs acts as a programmable workbench in which several kinds of agents can be embedded, supervised, scripted, and reviewed.

The current Emacs agentic-programming landscape falls into six broad families:

1. **Model-agnostic LLM clients inside Emacs**, especially `gptel`, `llm`, `Ellama`, and `chatgpt-shell`, which turn ordinary buffers into conversational, tool-using, or instruction-following surfaces.
2. **MCP-based tool integration**, especially `mcp.el` and `gptel-mcp`, which allow Emacs packages and LLM clients to call external Model Context Protocol servers.
3. **Terminal-native coding agents wrapped by Emacs**, especially Aider and Claude Code, typically used through `aider.el`, Aidermacs, `claude-code.el`, `claude-code-ide.el`, `eat`, `vterm`, `comint`, or project side windows.
4. **Protocolized agent front-ends**, especially `agent-shell` around the Agent Client Protocol, ECA around an editor/server protocol inspired by LSP, and `ai-code-interface` as a backend-agnostic command layer over multiple agent CLIs.
5. **Emacs-native agent experiments**, especially Efrit and Emigo, which attempt to make Emacs itself the agent’s operating environment rather than merely hosting a terminal or chat panel.
6. **Conventional coding-assistant layers**, especially Copilot-style inline completion and chat, which are not fully agentic on their own but often sit beside more agentic workflows.

The most distinctive Emacs pattern is not “AI autocomplete.” It is **agentic composition around ordinary text**: prompts are buffers, transcripts are files, task plans are Org or Markdown, diffs are reviewed in Ediff or Magit, test failures are fed back from compilation buffers, project context is curated from Dired/project.el/xref/LSP/tree-sitter, and agent capabilities are mediated through Elisp. This gives Emacs users a high degree of control, but also introduces security and governance problems: an agent with access to shell commands, filesystem tools, MCP servers, Emacs Lisp, and local notes can become an overly capable automation surface. Human-in-the-loop review, narrowed filesystem roots, worktrees, sandboxing, explicit context selection, and transcript logging are therefore emerging as core practices.

The near-term direction is toward **protocol pluralism**. MCP is becoming the dominant pattern for exposing tools and data sources to models. ACP-like protocols are emerging for a richer editor/agent relationship, including session state, permissions, diffs, terminal output, and file-change notifications. At the same time, Emacs’s native advantage remains Elisp: users can write small tools, commands, filters, review interfaces, and policy layers faster than most other editor communities can.

---

## 1. What “agentic programming” means in the Emacs context

For this memo, **agentic programming** means programming with AI systems that do more than complete a line or answer a single question. An agentic programming system can usually do several of the following:

- inspect a codebase;
- maintain task state over a session;
- select or request context;
- call tools;
- edit files;
- run shell commands or tests;
- react to compiler, linter, or test failures;
- propose or apply diffs;
- manage a loop of plan → act → observe → revise;
- ask for permission or confirmation before risky actions;
- coordinate with version control or project conventions.

This distinguishes agentic programming from three less-agentic forms of AI coding assistance:

- **Autocomplete**: predicting code at point, as in Copilot-style inline suggestions.
- **Chat**: asking questions in a side buffer or web UI.
- **One-shot transformation**: selecting a region and asking a model to rewrite, summarize, refactor, or explain it.

Those forms still matter. In Emacs, they often become ingredients inside agentic workflows. For example, a user may use Copilot for local completions, `gptel` for exploratory explanation, Aider for multi-file edits, Claude Code for repo-wide tasks, Magit for review, and Org for a task log. The agentic quality emerges less from any single package than from the **loop** connecting these tools.

---

## 2. Why Emacs is unusually well suited to agentic workflows

Emacs has several features that make it a natural host for agents.

First, Emacs is already a programmable environment rather than a narrow editor. The original Emacs design emphasized that users can extend or change editor behavior while the editor is running, using the same extension language in which much of the system is written.[^emacs-paper] This matters for agents because tool boundaries can be made very thin: a command that a human can call interactively can often be wrapped as an Elisp function and exposed to an LLM client or agent.

Second, Emacs treats text as a universal substrate. Code, prose, shell sessions, REPLs, logs, diffs, TODOs, email, notes, and chat transcripts can all live in buffers. Agent interactions can therefore be copied, narrowed, searched, versioned, killed, yanked, refiled, or folded with the same mechanisms users already know. `gptel`, for example, explicitly emphasizes that its chats are ordinary buffers that can be saved as Markdown, Org, or text.[^gptel-home]

Third, Emacs can supervise long-running subprocesses and shells. The built-in shell-command facilities can run commands asynchronously while the user continues editing.[^emacs-shell] Packages such as `vterm`, `eat`, `comint`, and `term` extend this into richer terminal and REPL workflows. This makes terminal-native agents such as Aider, Claude Code, Gemini CLI, or other CLIs feel less foreign inside Emacs than they might in a GUI-only environment.

Fourth, Emacs already has rich project instruments: Magit for Git, Dired for filesystem operations, Org for plans and task state, xref and LSP clients for code navigation, compilation buffers for build/test output, TRAMP for remote work, tree-sitter integrations for syntax structure, and project.el for project roots. Agentic programming benefits from all of these because agents need context, permissions, test loops, and review surfaces.

Fifth, Emacs culture is comfortable with “small pieces loosely joined.” Rather than requiring an all-in-one AI IDE, Emacs users tend to wire together packages, keybindings, advice, hooks, and transient menus. This is why the Emacs agent ecosystem contains both deep integrations, such as `claude-code-ide.el`, and thin wrappers, such as terminal side-window helpers.

---

## 3. Ecosystem map

### 3.1 Model-agnostic LLM clients and tool layers

#### gptel

`gptel` is currently one of the central Emacs packages for LLM interaction. Its manual describes it as a Large Language Model client for Emacs that supports multiple models and backends and exposes them uniformly in any buffer.[^gptel-manual] The project page lists support for OpenAI, Anthropic Claude, Gemini, Ollama, Groq, Perplexity, GitHub Models, local OpenAI-compatible servers, and other backends. It also supports tool use, MCP integration via `mcp.el`, multimodal input, reasoning content, and persistent ordinary-buffer chats.[^gptel-home]

The key agentic feature in `gptel` is that it can expose **client-side Elisp tools** to the model. The project documentation says the LLM can trigger tool calls, after which `gptel` runs those tools in Emacs and can return the results. The examples include creating or modifying files and directories, controlling the Emacs frame, querying local databases, and searching local or web resources.[^gptel-tools] In other words, `gptel` is not merely an Emacs chat client; it can turn Emacs into a tool host for an LLM loop.

Common uses:

- prompt from any buffer;
- maintain long-running chats in Org or Markdown;
- rewrite or explain selected regions;
- connect to local models through Ollama or OpenAI-compatible endpoints;
- use tools for local project inspection;
- expose project-specific Elisp functions as tools;
- combine with `mcp.el` to call MCP servers.

The Emacs-specific advantage is that the same buffer can be a note, prompt, transcript, task plan, and source of future context. Users who are already using Org or Markdown for research logs can turn those files into a durable LLM notebook without adopting a separate interface.

#### llm

The `llm` package provides an abstraction layer over language-model capabilities for Emacs Lisp programs. Its README describes support for chat, images, embeddings, prompt construction, and tool use with Elisp functions.[^llm] It is important less as an end-user interface and more as infrastructure used by other packages, especially Ellama. In the long run, packages like `llm` matter because they make it easier to write model-agnostic Emacs tools rather than binding each package directly to one provider.

#### Ellama

Ellama is a higher-level LLM assistant for Emacs, built on `llm`. Its documentation emphasizes local and cloud LLM use “without turning Emacs into a web app.” It supports chat, one-shot commands, longer sessions, agent loops, context from buffers/files/directories/Info nodes/images, text operations such as translation, summarization, proofreading, code review, code editing, and more agentic facilities such as reading `AGENTS.md`, skills/blueprints, plan-and-act loops, subagents, policy checks, and DLP hooks.[^ellama]

Ellama is especially relevant for users who want:

- local-first or Ollama-oriented workflows;
- more explicit plan-and-act behavior inside Emacs;
- a package that treats AI assistance as an Emacs-native interface rather than a terminal agent;
- hooks for privacy/policy constraints.

#### chatgpt-shell

`chatgpt-shell` represents a lighter-weight but influential lineage: the model interaction as a shell-like buffer. Its README describes a shell-hybrid compose buffer, region-based prompting, transient menus, inline editing, and review flows.[^chatgpt-shell] While not primarily a coding agent, it shows a recurring Emacs idiom: interaction with an LLM as a text process, not as a web chat widget.

### 3.2 MCP in Emacs: `mcp.el` and `gptel-mcp`

The Model Context Protocol is becoming one of the main ways agents gain access to external tools, data, and services. The MCP project describes the protocol as a way to reduce integration complexity and give agents access to a broader ecosystem of tools, data, and applications.[^mcp-intro] In the MCP tools specification, servers expose tools that language models can invoke, and the spec recommends human-in-the-loop confirmation and clear UI visibility for tool calls.[^mcp-tools]

`mcp.el` is an Emacs client for MCP. Its README lists support for MCP server connections, filesystem and generic servers, an extensible tool/prompt system, synchronous and asynchronous operations, resource management, server lifecycle management, and integration with both `gptel` and the `llm` package.[^mcp-el] The usage documentation shows configuration of `mcp-hub-servers` and examples such as filesystem, fetch, Qdrant, and Graphlit servers; it also documents integration with `gptel` through `gptel-mcp.el`.[^mcp-el-usage]

In practice, MCP changes the Emacs agentic story in two directions:

1. Emacs can consume the same tool ecosystem as other MCP-capable clients. This allows a user to connect LLM interactions inside Emacs to filesystem, browser, GitHub, database, search, memory, or documentation servers.
2. Emacs can become a place where MCP tools are supervised, constrained, and combined with editing workflows. The MCP call is not just an API request; it can be part of a buffer-local conversation, an Org task, a Magit review, or a project-specific command.

The main risk is that MCP can also normalize granting agents large tool surfaces. An MCP filesystem server pointed at a home directory, an MCP browser tool with active credentials, or a custom tool with shell access is a major trust boundary. In Emacs, where users may have years of notes, credentials, local config, and private data nearby, least privilege is especially important.

### 3.3 Aider family: Aider, `aider.el`, and Aidermacs

Aider is a terminal-based AI pair-programming tool. Its homepage describes it as a terminal AI pair programmer that can work with cloud and local LLMs, use a codebase map, support many programming languages, and integrate with Git.[^aider-home] Aider’s repo-map documentation explains that it builds a concise map of the entire repository, with important classes and functions, and sends relevant parts of that map to the LLM within a token budget.[^aider-repomap]

Emacs users commonly use Aider in three ways:

- directly in `vterm`, `eat`, `term`, or `comint`;
- through `aider.el`, a lightweight Emacs interface;
- through Aidermacs, a more featureful Emacs package built around Aider.

`aider.el` describes itself as a lightweight Emacs UI for Aider. Its documented workflows include AI-driven agile workflows, TDD and refactoring, legacy-code exploration, diff extraction and review, reading assistant workflows, planning, automated Flycheck fixes, context expansion, git blame/log integration, project bootstrapping, and repo-specific prompt files.[^aider-el] The package positions Aider as a daily coding assistant embedded in normal Emacs project work rather than as a separate IDE.

Aidermacs describes itself as AI pair programming in Emacs with Aider, bringing Cursor-like capabilities into Emacs while emphasizing model selection, Ediff integration, file management, and customizability.[^aidermacs] Its usage docs include a transient menu, session start/open commands, chat modes such as Code, Ask, Architect, and Help, file add/drop operations from current files, windows, and Dired, and support for adding web content or voice input.[^aidermacs-usage]

The Aider pattern is attractive for Emacs users because it is **Git- and diff-centered**. Aider is strongest when a user can give it a bounded task, point it at the relevant files, let it propose changes, run tests, and review or revert through Git/Magit. In Emacs, Magit and Ediff make this loop especially natural.

Typical Aider-in-Emacs workflow:

1. Open project in Emacs.
2. Start Aider session through Aidermacs, `aider.el`, or terminal.
3. Add relevant files from current buffer, Dired, project search, or recent errors.
4. Ask in Architect/Ask mode for a plan.
5. Switch to Code mode for edits.
6. Run tests or compile in Emacs.
7. Feed failures back to Aider.
8. Review changes with Ediff/Magit.
9. Commit, amend, or revert.

This is one of the most mature agentic workflows because it relies on existing developer rituals: file selection, tests, diffs, commits, and undo.

### 3.4 Claude Code family: terminal sidecar, `claude-code.el`, and `claude-code-ide.el`

Claude Code is Anthropic’s terminal-based agentic coding tool. Anthropic’s repository describes it as an agentic coding tool that lives in the terminal, understands a codebase, helps with routine tasks, explains code, and supports Git workflows.[^claude-code] The CLI documentation includes commands for starting sessions, piping content, continuing or resuming sessions, managing agents, configuring MCP, plugins, and remote-control behavior.[^claude-cli]

Emacs users use Claude Code in several increasingly integrated layers.

#### Raw terminal use

The simplest layer is to run Claude Code inside `vterm`, `eat`, or another terminal emulator. This is already useful because Emacs can keep the terminal beside code buffers, compilation output, Magit, and Org notes. Users can paste paths, snippets, error messages, and shell output into the agent, and then review file changes through Emacs.

This pattern is close to Bozhidar Batsov’s observation that terminal-native tools such as Claude Code and Aider fit naturally inside Emacs or Vim because they reduce context switching while allowing the editor to remain the integration platform.[^batsov]

#### `claude-code.el`

`claude-code.el` offers an Emacs interface for Claude Code. Its README lists features such as starting, managing, and interacting with Claude Code without leaving Emacs; fixing Flycheck/Flymake errors; pasting images; managing multiple instances; smart context; transient menus; session resume/continue; mode cycling; notifications; and several terminal choices.[^claude-code-el] The package supports starting Claude from a project and sending context such as regions, files, and errors at point.[^claude-code-el-context]

The key workflow is to keep Claude Code as a project-local sidecar. The human developer stays in Emacs buffers, selects context explicitly, and dispatches it to Claude Code. Claude may edit files, but the user reviews the result with ordinary Emacs tools. `claude-code.el` also documents hook integration, including hooks that can receive structured JSON and respond to Claude Code events.[^claude-code-el-hooks] This is a powerful integration point, but also a security boundary.

#### `claude-code-ide.el`

`claude-code-ide.el` goes deeper. It documents a transient menu, multi-project support through `project.el`, sessions per project, and commands for interacting with Claude Code.[^claude-code-ide] It also provides Ediff-based review, allowing users to see and modify Claude’s suggested changes before accepting them.[^claude-code-ide-ediff]

Most importantly, `claude-code-ide.el` exposes Emacs-aware MCP tools. The package documents built-in tools such as `xref-find-references`, `xref-find-apropos`, tree-sitter information, imenu, and project info, which can be enabled with `claude-code-ide-emacs-tools-setup`.[^claude-code-ide-tools] It also documents custom MCP tool registration through Elisp.[^claude-code-ide-custom]

This is one of the clearest examples of Emacs becoming more than a terminal host. Claude Code can be given access to editor-native semantic information: xref references, project metadata, tree-sitter-derived structure, imenu outlines, and custom commands. The agent can therefore ask Emacs questions about a project that are hard to ask from a generic shell.

### 3.5 Agent Client Protocol and `agent-shell`

The Agent Client Protocol (ACP) is an emerging protocol for connecting editors and agent backends. The ACP overview describes agents and clients communicating with methods and notifications over JSON-RPC.[^acp-overview] It describes prompt turns that can include progress updates, file operations, permissions, cancellation, and session behavior.[^acp-overview] Its tool-call documentation describes how agents can use tools such as file reading, code execution, and data fetching, while clients handle permission requests, diffs, and terminal outputs.[^acp-tools]

`agent-shell` is an Emacs package built around ACP. Its README describes it as a native Emacs shell for LLM agents powered by ACP, supporting agents such as Gemini CLI, Claude Agent, Auggie, Mistral Vibe, and any ACP-driven agent.[^agent-shell] It also has an expanding package ecosystem: skills, Docker sandboxing, sidebars, bookmarks, workspaces, manager packages, review interfaces, notifications, multi-agent coordination, Org transcripts, Org Babel support, transcript search/resume, TRAMP integration, and HUD-style status.[^agent-shell-ecosystem]

A blog post on an “agentic development workflow in Emacs” describes using `agent-shell` with regular buffer text prompts, reviewing changes with Magit, LSP navigation, conversations saved as Markdown, and status management.[^agent-shell-blog]

ACP-style systems differ from simple terminal wrappers in that they formalize the editor/agent relationship. Rather than treating the agent as a TTY program whose output must be parsed, ACP gives the editor a structured role in permissions, file edits, progress reports, and terminal displays. For Emacs, this points toward a future in which an agent can be both backend-agnostic and deeply integrated into editor affordances.

### 3.6 ECA and `ai-code-interface`

ECA, the Editor Code Assistant, is another protocolized approach. The Emacs client describes itself as an AI-powered pair-programming client for Emacs, inspired by JSON-RPC and `lsp-mode`, with an external ECA server process providing chat, code suggestions, and context management.[^eca-emacs] The ECA rationale emphasizes an editor-agnostic architecture, a well-defined protocol, a Clojure server inspired by LSP, tool-call management, multiple LLM support, telemetry, a single configuration file, and a shared UX across editors.[^eca]

`ai-code-interface` takes a complementary approach: it aims to provide a uniform Emacs interface for AI-assisted development across many backends, including Codex, Antigravity, Opencode, Claude Code, Copilot CLI, Gemini, Grok, Cursor, Kiro, Aider, and integrations such as ECA, `agent-shell`, `claude-code-ide`, and `claude-code.el`.[^ai-code-interface] Its README frames the key question as whether one wants deep integration with a particular agent or a stable workflow across tools.[^ai-code-interface]

Together, ECA and `ai-code-interface` express a growing Emacs concern: users do not want to rewrite their workflows every time the “best” agent backend changes. Emacs users are therefore building stable command surfaces, transient menus, and prompt/action conventions that can outlive particular model vendors.

### 3.7 Emacs-native agents: Efrit and Emigo

Efrit is an Emacs-native AI coding agent. Its README describes an agent that can execute natural-language commands, explore codebases, run shell commands, and support multi-turn conversations. The project’s model is “Claude makes all decisions, Efrit executes,” and its documentation explicitly calls out security implications.[^efrit] Efrit’s command examples include `efrit-do`, natural-language actions, task progress, TODOs, and expandable tool calls.[^efrit]

Emigo describes itself as an agentic Emacs-native AI assistant that understands and interacts with a codebase, as a successor to Aidermacs and inspired by tools such as Cursor, Aider, and Cline.[^emigo]

These packages are important even where they are experimental because they pursue the most Emacs-specific endpoint: not “run an agent in an Emacs terminal,” but “make Emacs itself the agent runtime.” If that pattern matures, package authors may increasingly expose commands, views, and project facts in an agent-readable way.

### 3.8 Copilot-style assistants

Copilot-style completion and chat are not, by themselves, the center of agentic programming, but they remain part of many users’ mixed workflows. `copilot.el` is an unofficial Copilot plugin for Emacs that supports inline completions, interactive chat, and Next Edit Suggestions through the official Copilot language server and JSON-RPC.[^copilot-el] `gh-copilot-chat` provides GitHub Copilot chat in Emacs and documents MCP server configuration through an MCP package.[^gh-copilot-chat] The Spacemacs Copilot layer similarly supports code completion, chat, experimental MCP tool integration, and automatic Git commit messages.[^spacemacs-copilot]

In practice, Copilot-style tools cover the low-friction “micro-assistance” layer: complete this function, suggest the next edit, draft a commit message, or answer a small question. Agentic tools handle the multi-step loop.

---

## 4. How people are using Emacs for agentic programming

### 4.1 Emacs as an LLM notebook

One common use pattern is to make ordinary Emacs buffers into persistent LLM notebooks. A user keeps an Org or Markdown file with prompts, questions, model responses, code snippets, TODOs, and follow-up tasks. `gptel` supports chats as ordinary buffers and can operate from any buffer, so the transcript is not trapped in a proprietary UI.[^gptel-home]

This pattern is especially common among users who already live in Org. They can maintain a research log, design doc, or debugging diary and call the model from inside it. Prompts can be folded under headings. Responses can be edited, archived, linked, exported, or turned into tasks. The “agent” may be relatively lightweight here, but the workflow is agentic when the model is given tools or when the human drives a repeated plan/act/check loop through the buffer.

Typical use cases:

- ask for explanations of unfamiliar code;
- draft implementation plans;
- generate tests or examples;
- summarize logs and error traces;
- transform notes into issues or commits;
- maintain project-specific prompt libraries;
- compare outputs from multiple models;
- use local models for private notes.

This is the lowest-friction starting point for agentic Emacs use because it does not require giving an agent direct write access to the repository. It also preserves a transcript for audit and memory.

### 4.2 Emacs as a supervisor for terminal agents

A second major pattern is to run a terminal agent in a side window and supervise it from Emacs. Aider and Claude Code are the most visible examples. The agent edits files and runs commands; Emacs provides context selection, review, test output, navigation, and version control.

Why this works well in Emacs:

- terminal buffers can live beside source buffers;
- project roots are already known through project.el, Projectile, or VC;
- file paths and regions can be sent from buffers to the agent;
- build/test output can be captured in compilation buffers;
- Magit provides a high-quality diff and commit interface;
- Ediff provides a precise accept/reject interface;
- Org can hold the plan or task list.

This is often the pragmatic workflow for people who want the power of a production coding agent but do not want to abandon Emacs. The agent may be terminal-native, but the human’s control plane remains Emacs.

### 4.3 Emacs as a context router

Another pattern is to use Emacs to route exactly the context an agent should receive. This is a response to one of the central problems in agentic coding: the whole repository is too large, too noisy, or too private to send wholesale.

Packages support this in different ways:

- `aider.el` and Aidermacs let users add or drop files, use Dired or current buffers, and move between chat modes.[^aidermacs-usage]
- `claude-code.el` can send regions, files, and errors at point to Claude Code.[^claude-code-el-context]
- `claude-code-ide.el` can expose xref, imenu, tree-sitter, and project information as MCP tools.[^claude-code-ide-tools]
- `gptel` can use buffer-local context and Elisp tools.[^gptel-tools]
- `mcp.el` can connect to filesystem and other MCP servers with configured roots.[^mcp-el-usage]

The larger pattern is that Emacs becomes a **context router**: it knows what buffer is active, what region is selected, what error is at point, what project is current, what files are marked in Dired, what functions xref can find, and what tests just failed. This allows context to be sent deliberately rather than passively.

### 4.4 Emacs as a tool host

When an LLM client can call Elisp functions, Emacs becomes a tool host. This is the more radical pattern. `gptel` explicitly supports client-side tools. `claude-code-ide.el` exposes Emacs-native MCP tools. Efrit is built around a model in which the agent decides and Emacs executes.

Possible tool categories include:

- project metadata: current project root, file list, ignored files;
- code navigation: xref references, definitions, imenu symbols;
- syntax: tree-sitter node at point, outline, function boundaries;
- diagnostics: Flycheck/Flymake errors, compiler output;
- version control: changed files, diff stats, recent commits;
- editing operations: apply patch, insert text, rename file;
- shell operations: run tests, compile, grep, ripgrep;
- documentation: lookup Info nodes, docstrings, package docs;
- note systems: search Org-roam, Denote, Logseq, or local notes;
- policy gates: reject paths, redact secrets, require confirmation.

The central design question is capability discipline. A tool that only returns xref references is low risk. A tool that evaluates arbitrary Elisp or runs shell commands is high risk. Emacs makes both easy.

### 4.5 Emacs as a review and governance layer

Agentic coding is most useful when it can edit files, but file edits require review. Emacs users are leaning on existing review tools:

- **Magit** for diff review, staging, committing, reverting, and bisecting;
- **Ediff** for accept/reject comparisons;
- **compilation-mode** for test/build output;
- **Flycheck/Flymake** for diagnostics;
- **Git worktrees** for isolating parallel agent branches;
- **Org/Markdown transcripts** for a persistent audit trail.

Aidermacs explicitly emphasizes Ediff integration.[^aidermacs] `claude-code-ide.el` documents Ediff-based review of Claude’s suggested changes.[^claude-code-ide-ediff] The broader pattern is that the agent proposes or applies changes, but the developer uses mature Emacs tools to inspect and decide.

### 4.6 Emacs as an agent protocol client

`agent-shell` and ECA point toward a more formal role: Emacs as an agent protocol client. ACP specifies structured communication between agents and clients over JSON-RPC, including progress, permissions, file changes, and terminal output.[^acp-overview] ECA uses a server/client split inspired by LSP.[^eca]

This matters because terminal wrappers eventually hit limits. A TTY can show output, but it is not an ideal representation of:

- proposed file edits;
- permission requests;
- structured tool calls;
- long-running subtasks;
- multiple agent sessions;
- diffs before and after a tool call;
- agent state that should be displayed in a sidebar;
- local editor commands that should be callable by the agent.

Protocolized agents allow Emacs packages to display these concepts using native buffers, overlays, menus, transient commands, sidebars, and review interfaces.

### 4.7 Emacs as a multi-agent workspace

A more experimental pattern is multi-agent orchestration. `agent-shell`’s ecosystem includes packages for multi-agent coordination and status management.[^agent-shell-ecosystem] Claude Code’s CLI includes commands for managing agents.[^claude-cli] Research on agentic coding tools also notes configurations such as skills, subagents, hooks, and delegation.[^dive-claude-code]

In Emacs, the natural expression of multi-agent work is not a glossy dashboard; it is likely to be:

- one buffer per agent session;
- one worktree per risky task;
- Org headings for tasks and statuses;
- Magit sections for diffs;
- compilation buffers for each test loop;
- project-local instruction files;
- a manager transient or sidebar.

This remains early, but it fits Emacs’s long-standing pattern of managing many textual processes inside one environment.

---

## 5. Emerging conventions and best practices

### 5.1 Keep project instructions in versioned files

Agentic coding tools increasingly rely on configuration artifacts in repositories. Recent research on agentic AI coding-tool configuration found that versioned Markdown and JSON artifacts dominate configuration, with context files especially important and `AGENTS.md` emerging as an interoperable standard across tools.[^configuring-agentic-tools] Another study of Claude Code manifests found that `Claude.md` files commonly provide context, identity, rules, operational commands, technical notes, and architecture information.[^agentic-manifests]

In Emacs workflows, this suggests a best practice: maintain project instructions in plain text files that are visible to both humans and agents. Examples include:

- `AGENTS.md` for general agent instructions;
- `CLAUDE.md` for Claude-specific instructions;
- `.aider.conf.yml` or Aider prompt files where appropriate;
- project Org files with task plans;
- `CONTRIBUTING.md` and architecture docs;
- test commands and coding-style notes.

The Emacs advantage is that these files are just buffers. They can be edited, searched, tangled, narrowed, folded, and committed.

### 5.2 Prefer explicit context over maximal context

Agent performance often improves when the right context is provided, but indiscriminate context creates cost, confusion, and privacy risk. Emacs users are developing workflows that curate context from:

- marked files in Dired;
- current buffer or region;
- project search results;
- xref definitions/references;
- tree-sitter or imenu outlines;
- failing test output;
- Magit diff hunks;
- documentation buffers.

This is a better default than giving an agent the whole project and hoping it finds what matters. Aider’s repo map is an example of automated context compression.[^aider-repomap] `claude-code-ide.el`’s xref and tree-sitter MCP tools are an example of editor-assisted context retrieval.[^claude-code-ide-tools]

### 5.3 Use plan-first, edit-second loops

Mature Emacs agent workflows often separate planning from editing. Aidermacs exposes modes such as Ask, Architect, and Code.[^aidermacs-usage] Claude Code users commonly ask for a plan before letting the agent modify files. `gptel` users can keep plans in Org and then dispatch smaller edits.

A useful loop is:

1. Ask the agent to restate the goal.
2. Ask it to identify relevant files and tests.
3. Ask for a plan without edits.
4. Review the plan.
5. Let it edit only a bounded set of files.
6. Run tests.
7. Feed failures back.
8. Review diffs.
9. Commit or revert.

This loop reduces the chance that an agent will make broad, unreviewable changes.

### 5.4 Use Git, Magit, Ediff, and worktrees aggressively

Git is the safety net. Magit and Ediff are the Emacs-specific review advantage. A strong agentic Emacs workflow should assume that every nontrivial agent edit will be inspected with:

- `magit-status` for the changed-file overview;
- `magit-diff` for file and hunk review;
- Ediff for side-by-side accept/reject;
- `git worktree` or Magit worktrees for risky or parallel tasks;
- small commits after coherent changes.

Worktrees are especially useful for agentic programming because they allow several experiments or agents to run without polluting the main working tree. They also make it easier to delete failed attempts.

### 5.5 Let tests and diagnostics structure the conversation

Emacs has mature support for compilation, diagnostics, and REPLs. Agentic workflows become much more reliable when the agent sees precise failure output rather than vague complaints.

Good practice:

- run a small, relevant test before editing;
- send the exact failure output to the agent;
- ask the agent to make the smallest change that should fix it;
- rerun tests from a compilation buffer;
- feed new failures back;
- stop after a bounded number of attempts and inspect manually.

Packages such as `aider.el` explicitly mention Flycheck-fix workflows.[^aider-el] `claude-code.el` supports fixing Flycheck/Flymake errors.[^claude-code-el] This is a natural Emacs pattern because diagnostics already have locations, buffers, and commands.

### 5.6 Preserve transcripts

Agentic coding can produce useful reasoning, but it can also produce misleading rationales. In either case, transcripts are valuable. They help answer:

- What did the agent see?
- What did it propose?
- What commands did it run?
- What files did it edit?
- What instructions shaped the result?
- Why did a bug enter the code?

`gptel` chats are ordinary buffers.[^gptel-home] `agent-shell` has ecosystem support for Org transcripts and transcript search/resume.[^agent-shell-ecosystem] A good Emacs practice is to store important sessions as Markdown or Org in the project or research log, especially for consequential changes.

### 5.7 Keep agents on a short leash

MCP and agentic coding tools encourage broad tool access. The MCP specification itself recommends human-in-the-loop confirmation and clear UI around tool invocation.[^mcp-tools] Emacs users should take that seriously.

Practical defaults:

- expose read-only tools before write tools;
- expose project roots, not home directories;
- make shell execution require confirmation;
- use separate API keys for agents;
- avoid giving agents access to browser sessions, mail, password stores, private notes, or `~/.emacs.d` unless absolutely required;
- use containers or worktrees for untrusted code;
- review all generated diffs;
- keep a denylist of sensitive paths;
- log tool calls where possible.

---

## 6. Security, safety, and governance

Agentic programming expands the attack surface of development tools. The issue is not merely that models hallucinate. The issue is that agents can be connected to tools that read, write, execute, fetch, commit, and communicate.

A 2026 preprint on AI-assisted development tools and prompt injection emphasizes that coding assistants and MCP-based tools can be exposed to indirect prompt-injection and tool-poisoning attacks. Untrusted instructions may appear in web pages, code comments, READMEs, package metadata, or other files the agent reads, and a compromised tool chain may lead to data exfiltration or unauthorized file modification.[^prompt-injection] The paper recommends defense in depth, least privilege, human approval, filtering, and adversarial testing.[^prompt-injection]

Emacs-specific risks include:

- **Local-file breadth**: Emacs users often keep code, research notes, email, agendas, credentials, and personal configuration close together.
- **Elisp power**: A tool that evaluates arbitrary Elisp can inspect buffers, read files, call processes, change editor state, or access loaded packages.
- **Shell access**: Agents that run commands can install packages, modify Git state, delete files, or leak environment variables.
- **MCP servers**: External servers can be misconfigured, over-privileged, stale, or malicious.
- **Hooks and automation**: Claude Code hooks, Emacs hooks, auto-revert behavior, and custom tool callbacks can turn agent actions into cascading side effects.
- **Untrusted project text**: README files, comments, issue bodies, docs, tests, and generated files may contain adversarial instructions.
- **TRAMP and remote systems**: If an agent can operate through TRAMP or remote shells, the blast radius includes remote machines.

Recommended controls:

1. **Least privilege by root**: Point filesystem tools at a project worktree, not `$HOME`.
2. **Least privilege by command**: Wrap safe commands rather than giving arbitrary shell access.
3. **Read-only first**: Expose xref, imenu, grep, and documentation tools before write/edit tools.
4. **Human confirmation**: Require approval for shell commands, network calls, large edits, and destructive operations.
5. **Use worktrees**: Run risky tasks in disposable worktrees or branches.
6. **Use containers**: Use Docker or other sandboxes for untrusted code or broad automation.
7. **Redact secrets**: Do not include `.env`, credentials, private keys, personal notes, or browser cookies in agent context.
8. **Review diffs**: Use Magit or Ediff before accepting changes.
9. **Log sessions**: Preserve prompts, tool calls, and outputs for significant edits.
10. **Treat repo text as untrusted**: Tell agents not to follow instructions found in dependencies, docs, comments, or generated files unless explicitly confirmed.
11. **Separate identities**: Use dedicated agent API keys or accounts with constrained permissions where possible.
12. **Monitor generated commands**: Build scripts, package-install commands, and curl/bash patterns deserve special scrutiny.

The safest mental model is: an agent is a junior developer with shell access, high speed, imperfect judgment, and susceptibility to malicious text. Emacs gives you unusually good supervisory instruments, but it also gives the agent unusually powerful hooks if you expose them.

---

## 7. What is distinctive about Emacs compared with AI IDEs

### 7.1 Emacs favors integration over replacement

Many commercial AI coding tools ask users to move into a new IDE, install a vendor extension, or accept a vertically integrated environment. Emacs workflows usually move in the opposite direction: keep Emacs as the center and integrate whichever agent is useful today.

That is why the same user might maintain:

- `gptel` for model-agnostic chat;
- Ellama for local workflows;
- Aider for codebase edits;
- Claude Code for larger agentic tasks;
- `mcp.el` for tool access;
- Magit for review;
- Org for planning;
- ECA or `agent-shell` for protocolized experiments.

### 7.2 Emacs turns prompts into first-class text

In many AI IDEs, prompts are UI events. In Emacs, prompts can be files. This changes the practice. A prompt can be versioned, refactored, included from a project file, folded under an Org heading, executed through an Elisp command, or reused across models.

This is especially valuable for agentic programming because high-quality agent use depends on durable instruction artifacts: coding standards, repository architecture, testing commands, review criteria, and task plans.

### 7.3 Emacs makes tools cheap to write

A small Elisp function can answer a project-specific question or perform a constrained action. For example:

- “return the current project root and Git branch”;
- “list failing Flycheck diagnostics in the current buffer”;
- “return imenu symbols for this buffer”;
- “grep only under `src/` and `test/`”;
- “apply this patch, but only under these directories”;
- “open an Ediff review for this file.”

Because `gptel` and `claude-code-ide.el` can expose tools, and because MCP creates a standard tool boundary, these small functions can become agent capabilities. This is likely to be one of Emacs’s long-term advantages.

### 7.4 Emacs is textually auditable

Agentic programming needs auditability. Emacs users already work with explicit buffers: shell transcript, compile log, Magit diff, Org plan, chat transcript, source file. A well-designed Emacs agent workflow can keep these artifacts visible and searchable.

This contrasts with systems where the agent’s state is hidden behind a web UI or proprietary session model. It does not automatically make Emacs safer, but it makes safety work more inspectable.

---

## 8. Package comparison table

| Package / tool | Primary role | Agentic capability | Emacs integration surface | Best use | Caveats |
|---|---|---:|---|---|---|
| `gptel` | Model-agnostic LLM client | Medium to high with tools | Any buffer, Elisp tools, MCP via `mcp.el`, multimodal inputs | Persistent chats, local/cloud model switching, custom tools | Tool safety depends on user-defined functions and MCP configuration |
| `llm` | Elisp abstraction library | Infrastructure | Elisp API for model capabilities | Building model-agnostic packages | Not mainly an end-user agent UI |
| Ellama | Emacs LLM assistant | Medium to high | Buffers, files, dirs, Info, images, plan/act, subagents, DLP hooks | Local/cloud assistant, privacy-sensitive workflows, plan-and-act loops | Feature breadth can require configuration discipline |
| `mcp.el` | MCP client | High as tool connector | MCP server lifecycle, tools, prompts, resources, `gptel`/`llm` integration | Connecting Emacs LLM workflows to external tools/data | MCP servers can be over-privileged or risky |
| Aider | Terminal coding agent | High | Terminal; wrapped by `aider.el` or Aidermacs | Multi-file edits, repo-map context, Git-centered workflows | External CLI; agent may make broad edits if context/task is loose |
| `aider.el` | Lightweight Emacs UI for Aider | High through Aider | Transient workflows, file/context commands, Flycheck/Git integration | Aider from normal Emacs project buffers | Depends on Aider CLI and model setup |
| Aidermacs | Featureful Aider integration | High through Aider | Transient menu, chat modes, file add/drop, Ediff, Dired | Cursor-like Aider workflow inside Emacs | More opinionated and package-specific |
| Claude Code | Terminal coding agent | High | Terminal; MCP, hooks, agents, plugins via CLI | Large agentic coding tasks, codebase exploration, Git workflows | Vendor tool; requires careful permission/data practices |
| `claude-code.el` | Emacs interface to Claude Code | High through Claude Code | Project sessions, context sending, Flycheck/Flymake errors, notifications, terminal choices | Claude Code as sidecar while staying in Emacs | Hook integrations can create powerful side effects |
| `claude-code-ide.el` | Deep Claude Code / Emacs integration | High | MCP tools for xref, imenu, tree-sitter, project.el; Ediff review | Emacs-aware Claude Code workflows | More complex setup; Claude-specific |
| `agent-shell` | ACP-native Emacs shell | High depending on agent | ACP sessions, transcripts, sidebars, review ecosystem | Protocolized agent sessions across ACP agents | ACP ecosystem still emerging |
| ECA | Editor/server AI assistant | Medium to high | Emacs client + external server, JSON-RPC/LSP-inspired | Backend-agnostic pair-programming UX | Less mature than dominant vendor CLIs |
| `ai-code-interface` | Backend-agnostic Emacs command layer | Varies by backend | Stable action interface over many AI CLIs and packages | Users who switch agents but want stable Emacs commands | Abstraction may trade off deep integration |
| Efrit | Emacs-native coding agent | High, experimental | Natural-language Emacs commands, shell, codebase exploration | Experiments in agent-as-Emacs-operator | Security-sensitive; experimental |
| Emigo | Emacs-native agentic assistant | High, experimental | Codebase-aware Emacs assistant | Experimental Cursor/Aider/Cline-like native agent | Early-stage relative to Aider/Claude Code integrations |
| `copilot.el` | Completion and chat | Low to medium | Inline completions, chat, NES via language server | Micro-assistance while coding | Not a full agent loop by itself |
| `chatgpt-shell` | Shell-like LLM interaction | Low to medium | Shell/compose buffer, region prompts, transient menus | Lightweight chat, rewrite, review workflows | Less autonomous than coding agents |

---

## 9. Recommended stacks by use case

### 9.1 Conservative starting stack

For users who want useful AI help without immediately granting broad edit or shell powers:

- `gptel` for model-agnostic chat in ordinary buffers;
- optional `mcp.el` with narrowly scoped, mostly read-only tools;
- Magit and Ediff for all code review;
- Org or Markdown transcripts for task state;
- local models through Ollama where privacy matters.

This stack starts with explanation, planning, summarization, and small transformations. It can become more agentic by adding safe Elisp tools incrementally.

### 9.2 Coding-agent stack for production work

For active coding in repositories:

- Aider via Aidermacs or `aider.el` for multi-file edits and Git-centered loops;
- Claude Code via `claude-code.el` or `claude-code-ide.el` for larger coding-agent tasks;
- Magit/Ediff for review;
- compilation buffers and Flycheck/Flymake for feedback loops;
- project-specific `AGENTS.md` or `CLAUDE.md`;
- Git worktrees for risky or parallel tasks.

This is the most practical stack today for users who already trust Aider or Claude Code and want Emacs to remain the control plane.

### 9.3 Local-first / privacy-sensitive stack

For users who prefer local models or want to limit cloud exposure:

- Ellama with local providers through `llm`;
- `gptel` with Ollama or local OpenAI-compatible endpoints;
- manually curated context rather than whole-repository upload;
- no broad filesystem MCP servers;
- transcripts kept locally;
- optional read-only tools for project inspection.

This stack may be weaker than top cloud models for large agentic edits, but it is attractive for private notes, research materials, and proprietary code.

### 9.4 Protocol-experiment stack

For users interested in where editor-agent integration is going:

- `agent-shell` for ACP agents;
- ECA for server/client, editor-agnostic workflows;
- `ai-code-interface` for stable commands across changing backends;
- `mcp.el` for tool ecosystem integration;
- experimental packages such as Efrit or Emigo in disposable projects.

This stack is less about immediate stability and more about discovering durable interaction patterns.

### 9.5 Minimal “safe-ish” workflow template

A practical baseline for a code task:

1. Create or switch to a Git worktree.
2. Open the project in Emacs.
3. Write the goal in `AGENTS.md`, `CLAUDE.md`, or an Org task.
4. Ask the agent for a plan without edits.
5. Add only relevant files or expose only relevant read tools.
6. Let the agent make a small change.
7. Run tests in a compilation buffer.
8. Feed exact failures back.
9. Review all changes in Magit or Ediff.
10. Commit only after human inspection.

This is slower than “agent, do everything,” but it is much more compatible with serious programming.

---

## 10. Limitations and open problems

### 10.1 Fragmentation

The Emacs AI ecosystem is vibrant but fragmented. There are multiple LLM clients, multiple Claude wrappers, multiple Aider wrappers, protocol experiments, local-model packages, and Copilot interfaces. This is normal for Emacs, but it can overwhelm newcomers.

The likely solution is not one winner. More likely, users will converge on stable command surfaces and protocols: MCP for tools, ACP/ECA-like protocols for agent/editor sessions, and package-level abstractions for model selection.

### 10.2 Safety defaults are still immature

Many packages expose powerful behavior, but the ecosystem has not fully standardized permission models. MCP itself recommends human-in-the-loop confirmation,[^mcp-tools] but implementation details vary. Emacs users will need conventions for:

- path allowlists;
- read/write tool categories;
- shell-command approval;
- audit logs;
- secret redaction;
- untrusted-context warnings;
- package-level security reviews.

### 10.3 Context quality remains hard

Agents often fail not because they are weak in the abstract but because they see the wrong context. Emacs has excellent context sources, but users still need better ways to package them:

- semantic slices from xref/tree-sitter/LSP;
- dependency-aware file sets;
- failing-test minimization;
- prompt templates bound to project types;
- automatic but inspectable context manifests.

### 10.4 Review burden can move, not disappear

Agentic coding can reduce typing but increase review. Large diffs, invisible assumptions, over-broad refactors, and plausible but incorrect test changes can all cost time. Emacs helps by giving strong review tools, but users need discipline around small changes and explicit acceptance.

### 10.5 Vendor and protocol churn

Models, CLIs, protocols, and APIs are changing quickly. Emacs users who tie their workflow too tightly to one backend may face churn. This is why model-agnostic packages, protocol clients, and backend-neutral command layers are strategically important.

---

## 11. Research agenda: where Emacs agentic programming may go next

### 11.1 Agent-readable Emacs packages

A major opportunity is for Emacs packages to expose safe, structured tool surfaces. For example:

- Magit could expose read-only diff summaries and constrained staging tools.
- Org could expose task lookup, refile suggestions, and agenda summaries.
- Dired could expose marked files and safe file operations.
- Eglot/LSP clients could expose definitions, references, diagnostics, and workspace symbols.
- tree-sitter packages could expose structural edits and syntax facts.

The key is not to expose arbitrary Emacs power, but to expose precise capabilities with clear permissions.

### 11.2 Standard agent transcripts

Emacs could become a leader in agent audit formats because it already stores everything as text. A useful standard transcript might include:

- model and backend;
- prompt and system instructions;
- selected context files;
- tool calls and results;
- shell commands and exit codes;
- diffs before acceptance;
- user approvals/rejections;
- final commit hash.

Org Mode would be a natural container for this, but Markdown would be more interoperable.

### 11.3 Worktree-native multi-agent workflows

As agents become cheaper and more capable, users will want to run multiple agents on alternate branches. Emacs could provide:

- one worktree per agent;
- one status buffer across agents;
- Magit-driven comparison of agent branches;
- automatic test matrices;
- transcript-to-commit linking;
- safe deletion of failed attempts.

### 11.4 Local/private agent governance

Emacs users often have sensitive local knowledge bases. A mature Emacs agent framework should support:

- local models by default for private notes;
- policy hooks before context leaves the machine;
- path-based redaction;
- tool permissions by project;
- secret scanning before prompt submission;
- explicit “cloud boundary” indicators in the mode line or header.

Ellama’s DLP/policy-hook direction is notable here.[^ellama]

### 11.5 Protocol convergence

MCP, ACP, LSP-like assistant servers, and package-specific tool APIs are all evolving. Emacs may end up with several layers:

- MCP for tools/resources/prompts;
- ACP-like protocols for agent sessions, permissions, and diffs;
- Elisp APIs for local editor facts;
- backend-neutral command layers for user workflows.

The best Emacs interfaces will likely hide backend churn while preserving inspectability.

---

## 12. Practical evaluation criteria for choosing tools

When selecting an Emacs agentic-programming setup, evaluate tools against these questions:

1. **Where does the agent run?** In an Emacs buffer, terminal, external server, remote service, or local model process?
2. **What can it read?** Current buffer, selected files, whole repo, home directory, browser, mail, notes, MCP resources?
3. **What can it write?** Buffers only, project files, arbitrary filesystem paths, Git commits, external services?
4. **Can it run commands?** If yes, are commands confirmed, logged, allowlisted, sandboxed?
5. **How are diffs reviewed?** Ediff, Magit, inline patch, auto-apply, external CLI?
6. **How is context selected?** Manual file selection, repo map, xref, tree-sitter, MCP tools, automatic scan?
7. **Are sessions persistent?** Markdown/Org transcripts, CLI session store, hidden vendor state?
8. **Can it use local models?** Useful for private or offline work.
9. **Can it switch providers?** Important given model churn.
10. **Does it support project instructions?** `AGENTS.md`, `CLAUDE.md`, `.aider` files, prompt libraries.
11. **What is the failure mode?** Bad diff, failed tests, hidden state, destructive command, leaked secret?
12. **Can it be audited later?** Transcript, tool log, Git commit, shell history.

A tool that scores well here is usually better for serious work than a tool with only impressive demos.

---

## 13. Bottom-line assessment

Emacs is becoming an agentic programming environment through accretion rather than replacement. Its users are assembling agents out of buffers, shells, project navigation, version control, Org workflows, Elisp tools, MCP servers, and external coding CLIs. This makes the Emacs ecosystem messier than an integrated AI IDE, but also more adaptable.

The most robust current workflows are:

- `gptel` or Ellama for buffer-native model interaction;
- Aider through Aidermacs or `aider.el` for Git-centered code edits;
- Claude Code through `claude-code.el` or `claude-code-ide.el` for agentic repo tasks;
- `mcp.el` for controlled tool access;
- Magit/Ediff/worktrees/tests as the human review and safety layer.

The most interesting emerging workflows are:

- ACP-based sessions through `agent-shell`;
- ECA-style editor/server abstractions;
- backend-neutral action layers through `ai-code-interface`;
- Emacs-native agents such as Efrit and Emigo;
- project instruction files and agent configuration artifacts such as `AGENTS.md` and `CLAUDE.md`.

The strategic lesson is that Emacs’s old strengths are newly relevant. Because Emacs is a live Lisp environment organized around text buffers and subprocesses, it can make agents inspectable, scriptable, and composable. But the same power makes security discipline essential. The best Emacs agentic workflows will be the ones that combine agent autonomy with explicit context, bounded permissions, durable transcripts, and rigorous human review.

---

## Sources

[^emacs-paper]: Richard Stallman, “EMACS: The Extensible, Customizable Display Editor,” GNU. <https://www.gnu.org/software/emacs/emacs-paper.html>

[^emacs-shell]: GNU Emacs Manual, “Shell Commands.” <https://www.gnu.org/software/emacs/manual/html_node/emacs/Shell.html>

[^org-mode]: Org Mode Manual. <https://orgmode.org/org.html>

[^gptel-manual]: `gptel` manual, introduction. <https://gptel.org/manual.html>

[^gptel-home]: `gptel` project site. <https://gptel.org/>

[^gptel-tools]: `gptel` GitHub documentation on tool use. <https://github.com/karthink/gptel>

[^mcp-intro]: Model Context Protocol documentation, introduction. <https://modelcontextprotocol.io/docs/getting-started/intro>

[^mcp-tools]: Model Context Protocol specification, tools. <https://modelcontextprotocol.io/specification/2025-06-18/server/tools>

[^mcp-el]: `mcp.el` README. <https://github.com/lizqwerscott/mcp.el>

[^mcp-el-usage]: `mcp.el` usage documentation. <https://github.com/lizqwerscott/mcp.el>

[^llm]: `llm` Emacs package. <https://github.com/ahyatt/llm>

[^ellama]: Ellama README. <https://github.com/s-kostyaev/ellama>

[^chatgpt-shell]: `chatgpt-shell` README. <https://github.com/xenodium/chatgpt-shell>

[^aider-home]: Aider homepage. <https://aider.chat/>

[^aider-repomap]: Aider documentation, repository map. <https://aider.chat/docs/repomap.html>

[^aider-el]: `aider.el` README. <https://github.com/tninja/aider.el>

[^aidermacs]: Aidermacs README. <https://github.com/MatthewZMD/aidermacs>

[^aidermacs-usage]: Aidermacs usage documentation. <https://github.com/MatthewZMD/aidermacs>

[^claude-code]: Anthropic Claude Code repository. <https://github.com/anthropics/claude-code>

[^claude-cli]: Claude Code CLI reference. <https://code.claude.com/docs/en/cli-reference>

[^claude-code-el]: `claude-code.el` README. <https://github.com/stevemolitor/claude-code.el>

[^claude-code-el-context]: `claude-code.el` context-sending documentation. <https://github.com/stevemolitor/claude-code.el>

[^claude-code-el-hooks]: `claude-code.el` hooks documentation. <https://github.com/stevemolitor/claude-code.el>

[^claude-code-ide]: `claude-code-ide.el` README. <https://github.com/manzaltu/claude-code-ide.el>

[^claude-code-ide-ediff]: `claude-code-ide.el` Ediff documentation. <https://github.com/manzaltu/claude-code-ide.el>

[^claude-code-ide-tools]: `claude-code-ide.el` built-in Emacs MCP tools. <https://github.com/manzaltu/claude-code-ide.el>

[^claude-code-ide-custom]: `claude-code-ide.el` custom MCP tool examples. <https://github.com/manzaltu/claude-code-ide.el>

[^agent-shell]: `agent-shell` README. <https://github.com/xenodium/agent-shell>

[^agent-shell-ecosystem]: `agent-shell` related packages and extensions. <https://github.com/xenodium/agent-shell>

[^agent-shell-blog]: “Agentic development workflow in Emacs.” <https://blog.viktomas.com/posts/agentic-development-workflow-in-emacs/>

[^acp-overview]: Agent Client Protocol, overview. <https://agentclientprotocol.com/protocol/v1/overview>

[^acp-tools]: Agent Client Protocol, tool calls. <https://agentclientprotocol.com/protocol/v1/tool-calls>

[^eca-emacs]: ECA Emacs client README. <https://github.com/editor-code-assistant/eca-emacs>

[^eca]: ECA rationale and architecture. <https://github.com/editor-code-assistant/eca>

[^ai-code-interface]: `ai-code-interface.el` README. <https://github.com/tninja/ai-code-interface.el>

[^efrit]: Efrit README. <https://github.com/steveyegge/efrit>

[^emigo]: Emigo README. <https://github.com/MatthewZMD/emigo>

[^copilot-el]: `copilot.el` README. <https://github.com/copilot-emacs/copilot.el>

[^gh-copilot-chat]: `gh-copilot-chat.el` README. <https://github.com/chep/gh-copilot-chat.el>

[^spacemacs-copilot]: Spacemacs Copilot layer documentation. <https://develop.spacemacs.org/layers/+tools/copilot/README.html>

[^batsov]: Bozhidar Batsov, “Emacs and Vim in the Age of AI.” <https://batsov.com/articles/2026/03/09/emacs-and-vim-in-the-age-of-ai/>

[^configuring-agentic-tools]: “Configuring Agentic AI Coding Tools,” arXiv:2602.14690. <https://arxiv.org/abs/2602.14690>

[^agentic-manifests]: “Agentic Coding Manifests: Characterizing Claude Code Context Files in the Wild,” arXiv:2509.14744. <https://arxiv.org/abs/2509.14744>

[^dive-claude-code]: “A Dive into Claude Code: Architecting Agentic Coding Tools,” arXiv:2604.14228. <https://arxiv.org/abs/2604.14228>

[^prompt-injection]: “Are AI-assisted Software Development Tools Immune to Prompt Injection?” arXiv:2603.21642. <https://arxiv.org/abs/2603.21642>
