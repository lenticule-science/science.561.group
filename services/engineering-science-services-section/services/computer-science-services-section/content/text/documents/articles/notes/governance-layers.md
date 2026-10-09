---
title: "Governance Layers: Policies, Decisions, and Agent Instructions"
date-created: 2026-03-07T00:00:00
authors:
  - claude
type: text
keywords:
  - governance
  - policies
  - decision-records
  - agent-instructions
description: "Analysis of the three-layer governance system in the emsemioverse: policies as stabilized habits, decisions as rationale records, and agent instructions as rendered presentation."
requires:
  - ../concepts/policy.md
  - ../plans/decisions/index.md
  - ../plans/index.md
---

The emsemioverse has three governance mechanisms that interact but
are not interchangeable: **policies**, **decision records**, and
**agent instructions**. This text maps their relationship.

## The three layers

### Policies: what kind of thing we always do

[Policies](../concepts/policy.md) are standing commitments —
stabilized habits that constrain all work. They answer "what kind of
thing do we always do?" rather than "what do we do about X?" They
are the repository-level reflection of the modal closure operator *j*:
patterns that have stabilized through practice.

Policies live at
`content/personal/projects/emsemioverse/policies/` (source of
truth) and are mirrored to `.claude/rules/policies/` for automatic
loading by Claude Code.

Key properties:
- One commitment per file (policy 002 applied to itself)
- Numbered for reference stability, not ranked
- Constrain simultaneously — no policy overrides another
- Revised when closure pressure forces it, not on a schedule
- Not goals (goals are achieved and retired)
- Not rules (rules are enforced mechanically)

### Decisions: how we got here

[Decision records](../plans/decisions/index.md) capture choices that
affect how the repository works. They are modeled on Architecture
Decision Records (ADRs). They answer "what was decided, and why?"

Key properties:
- Append-only — supersede, never edit
- Carry status: accepted, superseded, deprecated
- Record context, decision, consequences, alternatives
- Are retrospective: they document choices already made
- Form an immutable audit trail of governance evolution

### Agent instructions: what you need to know right now

CLAUDE.md and AGENTS.md files are the presentation layer — they
tell agents what they need to know to work in a given context.
They are currently hand-written but
[decision 0003](../plans/decisions/0003-agent-instructions-from-policies.md)
specifies that they should eventually be generated from resolved
policies.

Key properties:
- Progressive disclosure: root CLAUDE.md → content CLAUDE.md →
  discipline AGENTS.md → topic AGENTS.md
- Derived from policies (source of truth) plus directory-specific
  context
- May include setup instructions, essential vocabulary, and
  operational rules that are not policies (e.g., "run
  `git submodule update`")
- Are the only governance layer agents read directly at session
  start

## How they relate

```
POLICIES (source of truth)
  │
  ├── generate → AGENT INSTRUCTIONS (presentation)
  │                  CLAUDE.md, AGENTS.md
  │
  └── produce → DECISIONS (rationale)
                   when a policy leads to a choice,
                   or when a choice leads to a new policy
```

**Policies are prior.** A decision implements or refines a policy. An
agent instruction presents the policy in context. The policy itself
is the commitment.

**Decisions are retrospective.** They record why something is the way
it is. A policy can exist without a decision record (it emerged from
practice, not from a deliberate choice). A decision can exist without
creating a policy (it was a one-time choice, not a standing
commitment). But often a decision creates or revises a policy, and
the decision record documents why.

**Agent instructions are derived.** They should reflect the current
state of policies, filtered by context. Currently they are hand-
written and may drift from the actual policies. Decision 0003
specifies the path to generation.

## Where the layers live

| Layer | Source of truth | Mirror / rendered | Loaded by |
|---|---|---|---|
| Policies | `content/.../policies/*.md` | `.claude/rules/policies/` | Claude Code (auto) |
| Decisions | `content/.../plans/decisions/` | — | Agent (on demand) |
| Instructions | `CLAUDE.md`, `AGENTS.md` | — | Claude Code (auto) |

## Current gaps

### 1. Mirror synchronization

Policies exist in two places: `content/.../policies/` and
`.claude/rules/policies/`. These are currently maintained by a
script (`scripts/install-policies.sh`), but the synchronization is
manual. If a policy is edited in content, the mirror may be stale.

**Gap**: No automated check that `.claude/rules/policies/` matches
`content/.../policies/`.

### 2. Policy inheritance

[Decision 0003](../plans/decisions/0003-agent-instructions-from-policies.md)
specifies that policies cascade: project-level → discipline-level →
topic-level, with specificity winning on conflict. But currently
only project-level policies exist. No discipline or topic has its
own policies directory.

**Gap**: The inheritance mechanism is specified but untested because
only one level exists.

### 3. Instruction generation

Decision 0003 specifies that AGENTS.md files should be generated
from resolved policies. This is plan 0001 (per-directory agent
instructions) and plan 0011 (generated agent instructions). Neither
is active.

**Gap**: Instructions are hand-written and may not reflect current
policies.

### 4. Claude Rules vs. policies

Claude Code's `.claude/rules/` directory is a platform mechanism.
The repository's `policies/` directory is a semiotic concept. They
happen to be mirrored, but their relationship is contingent, not
necessary. If the emsemioverse moved to a different agent platform,
the policies would stay; the Claude Rules directory would not.

This means: **policies are the portable governance layer.** Agent
instructions (including Claude Rules) are platform-specific
renderings of policies. The policy is the commitment; the rule is
the enforcement mechanism.

### 5. Decision-policy connection

Decision records do not currently declare which policy they
implement or revise. Adding a `policy:` field to decision frontmatter
would make this connection machine-readable.

**Gap**: No typed relation between decisions and policies.

## Relationship to semiotic-project-management

The [semiotic-project-management](../../semiotic-project-management/index.md)
specification describes governance in section 5: anarchic structure,
review-based decision-making, plan lifecycle as evidence
accumulation. That specification defines the *theory* of governance.
This text maps the *current implementation* and identifies where the
implementation diverges from the theory.

The key divergence: the theory says policies emerge from closure
pressure and dissolve when circumstances change. The implementation
has policies that were written by agents during sessions and
accepted by emsenn. Whether they "emerged from closure pressure" or
were "imposed by an agent following a pattern" is a question the
system should be able to answer — but currently cannot, because the
provenance of policies is not tracked.
