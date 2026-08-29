---

title: "Agentic Coding"
description: "Software development in which an AI agent autonomously reads, writes, executes, and tests code — acting on the codebase rather than advising a human to do so."
defines: Agentic Coding
domain: agents
extends: agentic-system
requires:
  - large-language-model
  - tool-use
  - tool-call
acts-on: codebase
governed-by: permission-model
delivers:
  - file-editing
  - code-execution
  - test-execution
  - git-workflow
contrasts-with: code-completion
date-created: 2026-03-30
aliases:
  - Agentic Coding
  - agentic coding
  - AI coding agent
references:
  - id: anthropic-best-practices
    type: document
    title: Claude Code Best Practices
    author:
      - literal: Anthropic
    container-title: Anthropic Engineering
    issued:
      - year: 2025
    URL: https://www.anthropic.com/engineering/claude-code-best-practices
  - id: anthropic-autonomous
    type: document
    title: Enabling Claude Code to work more autonomously
    author:
      - literal: Anthropic
    container-title: Anthropic Blog
    issued:
      - year: 2025
    URL: https://www.anthropic.com/news/enabling-claude-code-to-work-more-autonomously
---

Agentic coding is software development in which an AI [agent](./agentic-system.md) autonomously reads, writes, executes, and tests code — acting directly on the codebase and development environment rather than suggesting changes for a human to apply.
The agent forms a plan, takes actions (editing files, running commands, reading output), observes results, and iterates.
The human's role shifts from writing code to reviewing the agent's work and providing direction.

The distinction from **code completion** (autocomplete, inline suggestions) is the locus of action.
Code completion predicts what a human is about to type and offers fragments; the human remains the actor.
Agentic coding inverts this: the agent is the actor, the human is the reviewer.
The distinction from **chat-based code assistance** (asking an AI to explain or generate a snippet) is that agentic coding includes execution — the agent does not just produce text, it runs it, observes the output, and responds to errors.

Agentic coding requires three capabilities from the underlying [language model](../../../../on-device-inference/terms/large-language-model.md): [tool use](./tool-use.md) (the ability to invoke functions like file-read, file-write, shell-execute), multi-step reasoning (the ability to form plans that span many [tool calls](./tool-call.md) and adjust based on intermediate results), and long [context](../../../terms/context-window.md) (the ability to hold enough of the codebase in working memory to make coherent changes across files).

The approach introduces a new category of risk: the agent can write insecure code, delete files, push to remote repositories, or execute destructive commands.
This makes the [permission model](../../software/terms/permission-model.md) — the set of rules governing which actions require human approval — a load-bearing design decision rather than an afterthought.

[Claude Code](../../software/terms/claude-code.md) is Anthropic's implementation of agentic coding.
Other implementations include GitHub Copilot Workspace, Cursor, Windsurf, and various open-source frameworks.
