---

description: "A user-defined action that fires automatically when a specific system event occurs — the mechanism by which a user extends system behavior without modifying the system itself."
aliases: [hooks, git hook, lifecycle hook]
made-of: [event, action]
distinguished-from: [rule, command, skill]
triggered-by: event
instances: [pre-commit-hook, post-tool-use-hook, pre-build-hook]
extends: callback
date-created: 2026-04-01
---

A hook is a user-defined action that fires automatically when a specific system event occurs.
The system defines the events.
The user defines what happens when they fire.
This separation — the system controls when, the user controls what — is what makes hooks a mechanism for extension without modification.

The pattern originates in operating systems.
Unix signals (Dennis MacAlistair Ritchie and Kenneth Lane Thompson, 1971) allowed a process to register a handler for a system event like `SIGTERM` or `SIGINT`.
The operating system raises the signal; the process's registered handler runs.
The Emacs text editor (Richard Matthew Stallman, 1976) generalized this into named hook variables: `before-save-hook`, `after-init-hook`, and hundreds of others.
Each hook is a list of functions.
When the event occurs, Emacs calls every function on the list.
Users customize Emacs by adding functions to hooks rather than modifying Emacs itself.

Git adopted the convention for version control.
A git hook is a script in `.git/hooks/` that runs when a specific git event occurs — `pre-commit` before a commit is created, `post-merge` after a merge completes, `pre-push` before pushing to a remote.
If the hook script exits with a non-zero status, the operation is aborted.
This gives hooks veto power: a `pre-commit` hook can prevent a commit that fails linting or contains secrets.

In agentic systems like Claude Code, hooks are shell commands configured in `.claude/settings.json` that fire on tool-use events.
A hook can run before or after a tool call, inspect the tool's parameters, and allow, modify, or block the operation.
Hooks differ from [rules](./rule.md) in that rules shape the agent's reasoning continuously, while hooks intercept specific system events.
Hooks differ from [commands](./command.md) in that commands are explicitly invoked by a user, while hooks fire without user action.
Hooks differ from [skills](./skill.md) in that skills provide knowledge for the agent to use, while hooks execute external code the agent does not control.

The power of hooks is that they compose.
Multiple hooks can attach to the same event.
Each runs independently.
The system's extended behavior is the product of all registered hooks, just as the behavior of a rule-based system is the product of all active [rules](./rule.md).
Adding a hook does not require modifying existing hooks or the system itself.
