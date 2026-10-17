---
name: injecting-context
description: "The injecting transformer specialized to act on a context. injecting-context takes a context (per the context structure at library/context/) plus a Claude Code hook event name and emits the context's body wrapped in the protocol envelope the hook event expects."
specializing: injecting
injecting: context
agent-noun: injector-of-a-context
gerund: injecting-context
imperative: inject-a-context
originating: context
terminating: emission
---

An **injecting-context** is the specialization of the [injecting transformer](../injecting.md) whose content is constrained to a [context](../../../../library/context/context.md).
The input is `{content: context, site: hook-event-name}` where `context` carries `{source, body, trigger}` per the [context JSON schema](../../../../library/context/context.schema.json) and `site` names which Claude Code hook event is the consumer (`UserPromptSubmit`, `PreToolUse`, `PostToolUse`, `Stop`, `SessionStart`).
The output is an `emission` record carrying the protocol envelope appropriate to that hook event.

The hook-protocol shape per Claude Code: `UserPromptSubmit` receives `{hookSpecificOutput: {hookEventName: "UserPromptSubmit", additionalContext: <body>}}`; `PreToolUse` receives `{hookSpecificOutput: {hookEventName: "PreToolUse", permissionDecision: "deny", permissionDecisionReason: <body>}}`; `Stop` receives `{decision: "block", reason: <body>}`.

Further specializations bind the trigger condition that decides when an injection fires.
The first such specialization is [the injecting-context-after-noticing-a-vague-token transformer](injecting-context-after-noticing-a-vague-token/injecting-context-after-noticing-a-vague-token.md), which fires after the scanner notices a vague-token surface in the text being scanned and injects the precise vocabulary present in the surrounding window as the context body.
