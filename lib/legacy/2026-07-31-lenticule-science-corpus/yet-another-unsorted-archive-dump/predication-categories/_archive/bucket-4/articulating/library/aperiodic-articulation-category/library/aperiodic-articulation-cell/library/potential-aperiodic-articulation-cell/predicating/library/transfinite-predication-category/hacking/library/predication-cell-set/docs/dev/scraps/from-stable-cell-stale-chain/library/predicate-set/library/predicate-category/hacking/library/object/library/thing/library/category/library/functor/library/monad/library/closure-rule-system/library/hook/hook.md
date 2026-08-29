---
name: hook
description: A registered handler that fires on a named lifecycle event in the surrounding runtime (Claude Code session lifecycle, git lifecycle, memory write, etc.). Structurally a sub-rule-system of the closure-rule system.
specializing: closure-rule-system
---

A **hook** is a handler registered to fire when a named lifecycle event occurs in the surrounding runtime. Lifecycles the 561 OS hooks into: the Claude Code session (SessionStart, Stop, PreToolUse, PostToolUse, etc.), git operations (pre-commit, post-commit, pre-push), the OS's own memory-write events, and the heartbeat. Per [agent.md:60–64](../../../../../../../../../../code/structures/agent.md) the hook mechanism is structurally a *sub-rule-system* of the closure-rule system: each hook is a positive-Π₁ closure rule whose premise is the matching lifecycle event and whose conclusion is the fired action.

## Hook = closure-rule firing at lifecycle-event boundary

The hook structure earns its place because *closure-rule firings can be triggered by external events*, not just by internal state transitions. A hook's premise is the event payload (e.g., the git commit's staged changes; the Claude Code Stop event's session-id); its conclusion is the fired action (e.g., reformatting a record; appending a witness row; printing a system-reminder). The dispatch is the same closure-2-monad firing as any internal closure-rule, parameterized by the event payload.

## Two faces: event and installer

A hook structure has two faces. The *event* face describes the lifecycle event itself — when it fires, what payload it carries, what response shape the runtime expects. The *installer* face describes the byte-level realization — the file path, the script the runtime invokes, the configuration block in settings.json or .git/hooks/. Specific specializations under [the library subdir](library/) bear one or both faces (e.g., `claude-stop` is the event; `git-pre-commit-hook` is the installer payload for the `git-pre-commit` event).

## Distinguishing predication-shape

- `fires-on(hook, event-slug)` — names the lifecycle event.
- `runtime(hook, {claude-code | git | mcp | memory})` — the surrounding runtime owning the lifecycle.
- `payload-shape(hook, structure)` — the shape of the event payload.
- `response-shape(hook, structure)` — the shape the runtime expects in response.
- `handler(hook, script)` — the script the runtime invokes when the event fires.
- `installed-at(hook, posix-path)` — the file the runtime reads to discover the hook (settings.json, .git/hooks/<name>, etc.).

## Event sub-structures live at their runtime's library

A hook is a closure-rule whose premise is an external lifecycle event. The events themselves belong to their source runtime, so each event sub-structure was relocated out of `hook/library/` into the runtime's library. From this layer 2 record, follow the runtime to find each event:

- Claude Code events at [claude-code](../../../../../../../../../system/library/operating-system/library/claude-code/library/) — currently: claude-stop, and (via auto-memory) memory-write.
- git events at [git](../../../../../../../../../system/library/git/library/) — currently: git-pre-commit, git-pre-commit-hook (the installer payload for the git-pre-commit event).

Each event sub-structure carries a `specializes-also: hook` cell to record the cross-layer fact that an event from a runtime is, qua firing semantics, a hook.
