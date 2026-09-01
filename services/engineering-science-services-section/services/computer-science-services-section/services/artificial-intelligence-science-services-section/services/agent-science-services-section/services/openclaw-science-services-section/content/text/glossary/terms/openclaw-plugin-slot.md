---
aliases:
  - plugin slot (openclaw)
description: An exclusive plugin category in OpenClaw where only one plugin can own a given runtime role.
identity: openclaw-plugin-slot
name: OpenClaw Plugin Slot
provenance:
  date-created: 2026-03-09
  date-modified: 2026-03-09
  sources:
    - OpenClaw Plugins
    - OpenClaw Vision
---
An OpenClaw plugin slot is an exclusive plugin category where only one
plugin can own a given runtime role at a time. Slots let OpenClaw keep
its core lean while making selected extension points explicit and
mutually exclusive.

## Examples

OpenClaw documents `memory` and `contextEngine` as plugin slots. If
multiple plugins declare the same exclusive kind, only the selected
plugin loads for that slot and the others remain disabled.

## Architectural function

Plugin slots separate extension from aggregation. They allow OpenClaw
to swap implementations for a core runtime role, such as memory or
context orchestration, without loading competing implementations
simultaneously.

## Sources

- [OpenClaw Plugins](https://docs.openclaw.ai/tools/plugin)
- [OpenClaw Vision](https://github.com/openclaw/openclaw/blob/main/VISION.md)
