---
type: concept
class: contemporary
status: active
depends-on:
  - tool-use.md
see-also:
  - ../theorems/tool-use-expressivity.md
references: []
title: Code interpreter
description: A code interpreter is a sandboxed code-execution environment exposed to an LLM agent as a tool.
---

# Code interpreter

A **code interpreter** is a sandboxed code-execution environment exposed to an LLM agent as a tool.
It is the single most powerful tool: with code execution, the agent's effective action capacity becomes Turing-complete within the sandbox.

## What it provides

A code interpreter typically supports:

- **Arbitrary code execution.** Python (most common), JavaScript, others.
- **File I/O within sandbox.** Read/write files in isolated filesystem.
- **Library access.** Standard library + selected packages (numpy, pandas, plotting, etc.).
- **Persistent state.** Variables persist across calls within a session.
- **Output capture.** stdout, stderr, generated artifacts (plots, files) returned to model.

The interpreter is sandboxed to prevent escape into the host system.

## Why it's powerful

Code execution provides:

- **Computation.** Arithmetic, statistics, data manipulation that LLMs do unreliably in pure text.
- **Algorithmic reasoning.** Implementing and running algorithms instead of mentally simulating them.
- **Data analysis.** Loading, exploring, transforming data.
- **Visualization.** Generating plots and figures.
- **Verification.** Testing claims by running code.
- **Composition.** Combining simpler tools through scripted control.

A single tool that can execute arbitrary code subsumes many specialized tools.

## Code interpreter as universal tool

Per [tool-use-expressivity](../../documents/articles/notes/undated/tool-use-expressivity.md), an agent with code-interpreter access has Turing- complete action capacity within the sandbox: any computable function can in principle be invoked.
Other tools are special cases of "execute code that does X."

This makes the code interpreter the *most consequential* tool to provide; the choice is high-leverage.

## In contemporary AI

Code interpreters are standard:

- **OpenAI Code Interpreter / Advanced Data Analysis** (2023).
  The first widely-deployed code-interpreter tool for ChatGPT.
- **Anthropic Computer Use + bash tool.** Computer use with shell access.
- **Open-source.** OpenInterpreter, JupyterLab AI extensions, many LangChain/AutoGen integrations.
- **Programming-focused agents.** Devin, Cursor agent mode, GitHub Copilot Workspace — all rely heavily on code execution.

## Sandboxing

Critical to safe deployment:

- **Filesystem isolation.** Sandbox can read/write only designated paths.
- **Network isolation.** Code can't make arbitrary network calls (or only to allowlisted endpoints).
- **Resource limits.** CPU, memory, time limits prevent runaway processes.
- **Separation from production.** Sandbox processes isolated from host and from each other across users.

Sandbox escape is a serious incident class; defense in depth is necessary.

## Failure modes

- **Hallucinated code.** Model writes code that runs but does the wrong thing.
- **Library hallucination.** Imports nonexistent packages.
- **State confusion.** Model loses track of variables across multi-call sessions.
- **Sandbox escape.** Code attempts to break out of sandbox.
- **Resource exhaustion.** Code consumes all available CPU/memory.
- **Adversarial inputs.** Malicious data triggers exploitable code execution.

## Limits

- **Sandbox-bounded.** Capabilities limited to what the sandbox permits.
- **Side-effects within sandbox.** Code modifies sandbox state in ways the model may not track.
- **Verification.** Hard to verify generated code is correct without running it; running it is the verification.
- **Cost.** Code execution adds latency and resource cost.

## Status

Standard in production agentic systems.
Considered foundational tool for any analytical or programming task.
Continues to evolve with better sandboxing, richer library access, and tighter integration with agentic frameworks.
