---

title: "Activation Trigger"
description: "The mechanism by which an agentic system decides to load a skill or invoke an agent based on matching a description field against the current context."
defines: activation-trigger
aliases: [auto-activation, skill matching, context matching]
domain: agents
mechanism: description-matching
acts-on: [skill, agent, command]
requires: [skill, agent-orchestration]
enables: [proactive-delegation, progressive-disclosure]
contrasts-with: explicit-invocation
date-created: 2026-03-31
---

An activation trigger is the mechanism by which an agentic system decides — without explicit user instruction — to load a skill, invoke an agent, or modify its behavior.
The system matches a description field in the skill or agent's metadata against the current conversational context.
If the description matches, the skill loads.
If it does not, the skill stays inert.
The description is therefore load-bearing infrastructure, not documentation.

The mechanism works by semantic matching, not keyword lookup.
A skill described as "Use when writing Python test files" will activate when the user asks to add tests to a Python module, even if they never say the word "skill."
The model reads the description, reads the context, and decides whether the skill is relevant.
This means the quality of the description directly determines whether the skill fires at the right time, fires at the wrong time, or never fires at all.

Two activation modes exist.
Explicit activation is when a user invokes a skill by name — typing `/write-term` in a Claude Code session, for instance.
Automatic activation is when the system loads a skill because its description matches the current task.
Explicit activation is reliable but requires the user to know what's available.
Automatic activation is convenient but depends entirely on the description being well-written.
Most mature agentic systems use both: automatic activation for common patterns, explicit invocation for specialized workflows.

The description field has a specific anatomy that determines activation quality.
It must state what the skill does, when it should activate, and on what kind of input.
Descriptions that say "Use PROACTIVELY when users request feature implementation" activate more reliably than descriptions that say "Planning tool."
The word "proactively" signals to the model that it should invoke the skill without waiting to be asked.
The trigger conditions ("when users request feature implementation") give the model a matching criterion.
Vague descriptions produce vague activation.

This creates a design tension.
A description broad enough to catch all relevant contexts will also fire on irrelevant ones.
A description narrow enough to avoid false positives will miss valid cases.
The practical solution is to err toward specificity and provide a "When to Activate" section in the skill body that lists concrete scenarios.
The description handles coarse matching; the body handles fine-grained guidance.

Activation triggers are the mechanism that makes progressive disclosure work.
A system can have hundreds of skills without overwhelming the user or the model, because only the relevant ones load.
The cost of each additional skill is near zero — it only consumes context when activated.
This is why the everything-claude-code project can ship over 130 skills without degrading performance: most of them are dormant in any given session.

The concept extends beyond skills to agents.
An agent's description field determines when the orchestrator delegates work to it.
A planner agent described as "Use PROACTIVELY when users request feature implementation, architectural changes, or complex refactoring" will be invoked automatically when the user asks to build something complex.
The activation trigger is the same mechanism operating at a different level of the system.
