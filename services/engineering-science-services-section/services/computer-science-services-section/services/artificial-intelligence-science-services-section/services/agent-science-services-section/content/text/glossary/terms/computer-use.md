---
description: The capability of a language model to interact with graphical desktop environments by interpreting screen content and producing mouse and keyboard actions — extending tool use from APIs to GUIs.
identity: computer-use
name: Computer Use
date-created: 2026-03-29
date-modified: 2026-03-29
provenance:
  sources:
    - anthropic-computer-use-2024
references:
  anthropic-computer-use-2024:
    authors:
      - Anthropic
    title: Introducing computer use, a new Claude 3.5 Sonnet, and Claude 3.5 Haiku
    publication: Anthropic Blog
    year: 2024
    url: https://www.anthropic.com/news/3-5-models-and-computer-use
relations:
  extends: tool-use
  requires: large-language-model
  acts-on: graphical-user-interface
  governed-by: human-in-the-loop
domain: agents
extends: tool-use
requires: large-language-model
acts-on: graphical-user-interface
governed-by: human-in-the-loop
cites:
  - anthropic-computer-use-2024
---
Computer use is the capability of a [large language model](../../../../../../../../content/text/glossary/terms/large-language-model.md) to interact with graphical desktop environments by interpreting screen content (screenshots) and producing mouse clicks, keyboard inputs, and other GUI actions. Anthropic released computer use as a beta capability with Claude 3.5 Sonnet on **October 22, 2024**.

Standard [tool use](./tool-use.md) connects a model to APIs — structured interfaces with defined inputs and outputs. Computer use extends this to graphical interfaces that have no API. The model receives a screenshot of the current screen state, reasons about what it sees (buttons, text fields, menus, error messages), and emits actions (click at coordinates, type text, press key combinations) that the host environment executes. The cycle repeats: act, observe the new screen state, act again.

The implementation uses three built-in tools:

- **`computer`** — move the mouse, click, type, take screenshots, scroll
- **`text_editor`** — view and edit text files
- **`bash`** — execute shell commands

The model combines these tools to perform tasks that span both GUI and command-line interfaces: filling out web forms, navigating desktop applications, configuring settings, and interacting with software that exposes no programmatic interface.

Computer use is slower and less reliable than API-based tool use. Screenshot interpretation introduces latency and error — the model must parse visual layout, identify interactive elements, and map pixel coordinates to actions. Misidentifying a button or clicking the wrong coordinates produces cascading failures that the model must detect and recover from. The error rate on GUI tasks is higher than on API tasks because the interface is ambiguous (visually similar elements, dynamic layouts, pop-ups).

Computer use matters for [agentic systems](./agentic-system.md) because it extends the action space from programmatic interfaces to any software a human can operate. An agent with computer use can interact with legacy applications, proprietary web tools, and desktop software that will never have an API or [MCP](../../../../services/model-context-protocol-science-services-section/content/text/glossary/terms/model-context-protocol.md) server.

## Related terms

- [Tool use](./tool-use.md) — the API-based mechanism computer use extends
- [Agentic system](./agentic-system.md) — systems whose action space computer use expands
- [Human-in-the-loop](./human-in-the-loop.md) — review pattern for high-risk computer use actions
