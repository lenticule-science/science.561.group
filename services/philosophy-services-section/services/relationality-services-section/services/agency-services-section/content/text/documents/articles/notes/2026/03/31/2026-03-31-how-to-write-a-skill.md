---

title: "How to Write an Effective Skill"
description: "Practical guide to writing skill definition files that activate reliably, provide useful guidance, and compose well with other skills."
date-created: 2026-03-31
keywords:
  - agents
  - skills
  - activation-trigger
requires:
  - activation-trigger
  - slash-commands
teaches:
  - "How to structure a SKILL.md file"
  - "How to write activation triggers that fire reliably"
  - "How to choose between skills, agents, commands, and rules"
  - "Common failure modes in skill design"
references:
  - id: ref1
    type: document
    title: everything-claude-code
---

A skill is a markdown file that loads into an agent's context when the agent decides it is relevant.
The file has YAML frontmatter for metadata and a markdown body for instructions.
The agent reads the frontmatter to decide whether to load the skill.
If it loads, the agent follows the body's instructions.
If it does not load, the skill costs nothing — it is inert.

This guide covers how to write skills that activate at the right time and provide useful guidance when they do.

## The anatomy of a skill file

A skill lives in a directory named after it, containing a single `SKILL.md` file:

```
skills/
└── your-skill-name/
    └── SKILL.md
```

The file has two parts: frontmatter and body.

### Frontmatter

```yaml
---
name: your-skill-name
description: Brief description used for activation matching
---
```

The `name` field identifies the skill.
The `description` field is the activation trigger — the text the agent matches against the current context to decide whether this skill is relevant.
The description is load-bearing infrastructure.
A vague description produces unreliable activation; a precise description produces reliable activation.

### Body

The body follows a consistent structure:

1. **Title and overview** — what this skill covers, in one paragraph
2. **When to Activate** — concrete scenarios where this skill should fire
3. **Core guidance** — the actual instructions, organized by section
4. **Anti-patterns** — what NOT to do, with examples
5. **Related skills** — links to complementary skills

The "When to Activate" section is the most important section in the body.
It gives the agent fine-grained matching criteria beyond the coarse description.
List specific scenarios:

```markdown
## When to Activate

- When the user asks to write a new term definition
- When editing an existing term file in `library/*/terms/`
- When reviewing whether a term follows repository conventions
```

## How to write an activation trigger

The description field determines when the skill loads.
It must answer three questions: what does this skill do, when should it activate, and on what kind of input.

**Effective trigger:**

> "Conventions for writing term definition files.
> Covers structure, voice, frontmatter, and patterns for simple, lesson-style, and formal terms."

This fires reliably because it names the content type (term definitions), the scope (structure, voice, frontmatter, patterns), and the variants (simple, lesson-style, formal).

**Ineffective trigger:**

> "Writing guidelines."

This fires on everything or nothing.
It gives the agent no matching criterion.

**Proactive trigger:**

> "Use PROACTIVELY when users request feature implementation, architectural changes, or complex refactoring."

The word "proactively" signals the agent should invoke this skill without being asked.
The trigger conditions give matching criteria.
This pattern is used for agents more than skills, but the principle is the same.

## Choosing the right mechanism

Skills are one of several extensibility mechanisms.
Choose based on what the content does:

| Mechanism | What it is | When to use |
|-----------|-----------|-------------|
| **Skill** | Guidance that loads on demand | Domain knowledge, workflow procedures, style conventions |
| **Command** | User-invoked workflow | Multi-step interactive procedures |
| **Agent** | Specialized role with its own tools | Autonomous tasks requiring delegation |
| **Rule** | Guidance that loads every session | Constraints that always apply |
| **Hook** | Shell command on tool lifecycle events | Mechanical guardrails, validation, formatting |

Skills are for reference knowledge — how to do something.
Commands are for procedures — do this thing now.
The difference is whether the user is asking "how should I do this?"
(skill) or "do this for me" (command).

## Content guidelines

**Show, don't tell.** Include concrete examples.
A skill that says "use descriptive variable names" is less useful than one that shows a before-and-after.

**Include anti-patterns.** Knowing what NOT to do is as valuable as knowing what to do.
Mark anti-patterns clearly so the agent does not confuse them with instructions.

**Use checklists and decision trees.** These give the agent structured reasoning paths instead of open-ended prose to interpret.

**Keep it focused.** One skill covers one domain.
A skill that covers "frontend development" is too broad.
A skill that covers "React component patterns" is focused.
A skill that covers "writing term definitions for this repository" is focused.

**Stay under 500 lines.** 200-400 lines is typical.
If a skill exceeds 800 lines, it is trying to cover too much and should be split.

## Common failure modes

**The ghost skill.** The description is too vague to match any context.
The skill exists but never activates.
Fix: write a specific description and a "When to Activate" section.

**The false positive.** The description is too broad and the skill fires on irrelevant tasks.
Fix: narrow the description and add "When NOT to Activate" conditions.

**The encyclopedia.** The skill tries to cover an entire domain in one file.
The agent loads 800 lines of context when it needs 50.
Fix: split into focused skills and link them with "Related Skills."

**The orphan.** The skill provides useful guidance but references concepts, tools, or conventions that are not defined anywhere in the system.
Fix: ensure prerequisites exist as terms, other skills, or documentation before publishing.

**The stale skill.** The skill was written for a workflow that has since changed.
It fires and provides outdated guidance.
Fix: review skills periodically and update or remove ones that no longer match the current system.

## Testing a skill

Before committing a skill:

1. Verify the YAML frontmatter parses correctly
2. Confirm the name follows the convention (lowercase-with-hyphens)
3. Check that the description is specific enough to activate on the right contexts
4. Read the body as if you were the agent — are the instructions clear enough to follow without external context?
5. Verify any file paths, commands, or references in the body are current
6. Ensure no sensitive data (API keys, tokens, credentials) appears in the file
