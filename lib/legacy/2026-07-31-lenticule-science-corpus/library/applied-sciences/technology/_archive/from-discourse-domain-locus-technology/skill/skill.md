---

description: "A reusable body of knowledge that an agent loads on demand to perform a specific kind of work — the unit of learned competence in an agentic system."
defines: skill
aliases: [skills]
made-of: [knowledge, procedure, judgment]
distinguished-from: [tool, command, rule, hook]
used-by: agent
component-of: [workflow, endeavor]
instances: [writing-skill, verification-skill, research-skill]
date-created: 2026-04-01
---

A skill is a reusable body of knowledge that an [agent](./agent.md) loads on demand to perform a specific kind of work. A [tool](../../../../humanities/domains/philosophy/terms/tool.md) extends what an agent can do. A skill shapes how the agent does it. A hammer lets you drive nails; knowing carpentry tells you where to put them.

The distinction between tool and skill runs through every domain that studies competence. Aristotle distinguished *technē* (the knowledge of how to produce something) from the instruments used in production. A surgeon's scalpel is a tool; the surgeon's knowledge of anatomy, trained judgment about when to cut, and practiced hand are skills. Gilbert Ryle, in *The Concept of Mind* (1949), formalized this as the difference between "knowing that" (propositional knowledge) and "knowing how" (practical competence). A skill is knowing how — it cannot be fully captured in a set of propositions, though propositions can guide its development.

In agentic systems, a skill is a file that encodes domain-specific knowledge for an agent to use during a particular kind of work. In Claude Code, skills live in `.claude/skills/` and are loaded when their activation conditions match. A skill differs from a [command](./command.md) in that a command is a single named operation, while a skill is a body of knowledge that may guide many operations. A skill differs from a [rule](./rule.md) in that a rule is always active, while a skill is loaded on demand. A skill differs from a [hook](./hook.md) in that a hook fires automatically on a system event, while a skill is activated by context matching.

A skill has three components. Knowledge: the facts and distinctions the agent needs — what counts as good work in this domain, what the common errors are, what the standards require. Procedure: the sequence of actions that typically produces good results — what to do first, what to check, when to stop. Judgment: the criteria for making decisions the procedure doesn't fully determine — when to deviate from the standard approach, when something is good enough, when to ask for help.

The maturation of a skill follows a progression observed across human expertise research. Stuart Edward Dreyfus and Hubert Lederer Dreyfus described five stages in *Mind Over Machine* (1986): novice (follows rules rigidly), advanced beginner (recognizes situational elements), competent (plans and prioritizes), proficient (sees patterns intuitively), and expert (acts fluidly without deliberation). An agentic skill file encodes competence at one level of this progression — typically the competent or proficient stage, where the knowledge can be articulated as guidelines and criteria rather than rigid rules or inarticulate intuition.
