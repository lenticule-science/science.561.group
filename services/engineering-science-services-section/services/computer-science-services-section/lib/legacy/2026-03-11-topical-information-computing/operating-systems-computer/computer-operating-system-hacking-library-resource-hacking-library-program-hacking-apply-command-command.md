---

description: "A named operation that a user invokes by identifier to trigger a defined action — the basic unit of human-to-system interaction in command-line and agent-based interfaces."
aliases: [commands, slash command, slash commands]
made-of: [name, argument]
distinguished-from: [function, rule, hook, skill]
instances: [shell-command, slash-command]
governed-by: [interface, convention]
date-created: 2026-04-01
---

A command is a named operation that a user invokes to trigger a defined action.
The user supplies the name, optionally with arguments, and the system executes the corresponding operation.
The command is the basic unit of interaction in any system where a human directs a machine by naming what they want done rather than doing it directly.

The concept originates with the Multics and Unix operating systems of the 1960s and 1970s.
Kenneth Lane Thompson and Dennis MacAlistair Ritchie designed the Unix shell as a command interpreter: the user types a name (`ls`, `cd`, `grep`), the shell looks up the corresponding program, and executes it.
Each command is a standalone program with a defined interface — it reads input, does one thing, and produces output.
Douglas Stuart McIlroy's Unix philosophy (1978) codified this: "Write programs that do one thing and do it well."
The command is the atom of that philosophy.

Slash commands extend the pattern to chat and agent interfaces.
In IRC (1988), typing `/join #channel` invoked the join command.
Slack adopted the convention in 2014.
In agentic systems like Claude Code, a slash command (`/commit`, `/plan`, `/help`) names an operation the agent should perform, often expanding into a full prompt or [skill](./skill.md) invocation.
The slash is a sigil — it marks the text as a command rather than natural language.

A command differs from a [function](../../../humanities/theories/math/terms/function.md) in that a command is invoked by a user at an interface boundary, while a function is called by other code internally.
A command differs from a [rule](./rule.md) in that a command is explicitly invoked, while a rule applies automatically when its conditions are met.
A command differs from a [hook](./hook.md) in that a command is triggered by the user's choice, while a hook is triggered by a system event.
A command differs from a [skill](./skill.md) in that a command names a single operation, while a skill is a body of knowledge that may be invoked by a command but encompasses more than one action.

The structure of a command is a name plus zero or more arguments.
The name identifies which operation to perform.
The arguments parameterize it.
In a Unix shell: `grep -r "pattern" ./src` — `grep` is the command name, `-r`, `"pattern"`, and `./src` are arguments.
In a slash command system: `/publish my-site` — `publish` is the command name, `my-site` is the argument.
