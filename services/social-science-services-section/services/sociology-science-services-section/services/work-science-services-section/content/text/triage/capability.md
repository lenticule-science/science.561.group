---
title: "Capability"
extends: [thing]
display:
  headline: title
  body: description
  metadata: [provides-capability-of, requires-skill, related]
help-predicates: [id, description, related]
restricts: [agent, action]
description: "The categorical signature of action domain an agent can act on — what kind of work an agent is trusted to perform without step-by-step supervision. Distinct from skill (a named procedure), role (an organizational position), and work-type (a settlement classification)."
date-created: 2026-05-01
references:
  - id: mintzberg1979
    type: document
    title: The Structuring of Organizations
    author:
      - literal: Henry Mintzberg
    container-title: Prentice-Hall
    issued:
      - year: 1979
  - id: hohfeld1913
    type: document
    title: Some Fundamental Legal Conceptions as Applied in Judicial Reasoning
    author:
      - literal: Wesley Newcomb Hohfeld
    container-title: Yale Law Journal, 23(1)
    issued:
      - year: 1913
  - id: searle1995
    type: document
    title: The Construction of Social Reality
    author:
      - literal: John R. Searle
    container-title: Free Press
    issued:
      - year: 1995
---

A **capability** is the categorical signature of action domain an agent can act on — *what kind of work it is trusted to perform without step-by-step supervision*. The writer has the *writing* capability. The reviewer has the *review* capability. The architect has *plan-decomposition* and *inquiry*.

Capabilities are the matching surface between work that needs doing and the agent that can do it. A task declares `requires-capabilities: [...]`; an agent declares `provides-capabilities: [...]`; dispatch is a set inclusion check.

## What capability is not

A capability is not a [skill](./skills.md). A skill is a named operational primitive — a specific procedure with a name, runtime, inputs, outputs (e.g., `process-triage-note`, `validate-frontmatter`). A capability is the abstraction over a cluster of related skills: many writing skills (`writing-a-term-or-concept`, `write-directory-agent-instructions`, `fix-frontmatter`) all enable the *writing* capability.

A capability is not a [role](./role.md). A role is an organizational position grouping a set of capabilities under a job title (writer, reviewer, planner). The role names the position; the capabilities name what the position can do.

A capability is not a [work-type](./work.md). Work-types — process, procedure, derivation, inquiry — describe the *settlement state* of work (how settled is the meaning, how settled is the execution). A capability describes the *action domain* (what is being acted on). They are orthogonal: a `procedure` task can require the `writing` capability; a `derivation` task can require `review`.

## Why this matters

Without a capability vocabulary distinct from skills and roles, dispatch collapses into ad-hoc keyword matching. The library's [dispatch survey](../texts/dispatch-and-delegation-survey.md) cites Mintzberg's "standardization of skills" as a coordination mechanism: the dispatcher trusts the trained professional to perform within their capability without supervision. That trust is defined at the capability level, not at every individual skill.

Hohfeld's framework (1913) gives us *power* — the capacity to alter normative state. A capability is the mundane analog: not the capacity to alter normative state, but the capacity to act competently in a domain. Searle's status function declarations (1995) install someone in an office that confers powers; capabilities are what the office's incumbent must possess to discharge those powers.

## Origin

The capability concept emerged from operational pressure: when the dispatch script collapsed `work-type` and required-action-signature into one match, it produced false positives (any procedure-handling agent could take any procedure task) and false negatives (no agent could simultaneously provide writing AND review for a composite task). Separating capability from work-type fixed both: a `procedure` task with `requires-capabilities: [writing, review]` either decomposes (no single agent provides both) or matches a multi-capability agent.
