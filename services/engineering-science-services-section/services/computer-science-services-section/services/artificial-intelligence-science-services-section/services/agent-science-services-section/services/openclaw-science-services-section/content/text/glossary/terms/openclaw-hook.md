---
description: A directory-discovered event handler in OpenClaw that runs when command or lifecycle events fire.
identity: openclaw-hook
name: OpenClaw Hook
date-created: 2026-03-09
date-modified: 2026-03-09
provenance:
  sources:
    - OpenClaw Hooks
---
An OpenClaw hook is a directory-discovered event handler that runs when
command or lifecycle events fire inside the Gateway. Hooks are the
event-driven automation layer of OpenClaw.

## Structure

The official hooks docs describe a hook as a directory containing
`HOOK.md` plus a TypeScript handler. Hooks are discovered from
workspace, managed, and bundled directories, with workspace hooks
having highest precedence.

## Role

Hooks let operators attach automation to events such as `/new`,
bootstrap, or gateway startup. The bundled `session-memory`,
`bootstrap-extra-files`, `command-logger`, and `boot-md` hooks show the
main current uses: memory capture, workspace augmentation, audit
logging, and startup actions.

## Sources

- [Hooks](https://docs.openclaw.ai/automation/hooks)
