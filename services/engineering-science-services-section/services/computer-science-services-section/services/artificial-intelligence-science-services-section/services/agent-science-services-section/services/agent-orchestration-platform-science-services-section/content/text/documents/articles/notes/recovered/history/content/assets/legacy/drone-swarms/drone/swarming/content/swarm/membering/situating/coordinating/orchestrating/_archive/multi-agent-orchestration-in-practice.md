---

title: "Multi-Agent Orchestration in Practice"
description: "How concrete multi-agent patterns — dispatch, orchestration workflows, handoffs, worktree isolation — implement the theoretical concepts of delegation, role-filling, non-interference, and the orchestration/choreography distinction."
surveys: [agent-orchestration, multi-agent-system]
date-created: 2026-04-03
sources:
  - "Anthropic. Claude Code documentation: Agent tool, subagent dispatch. 2025."
  - "Everything Claude Code (ECC). https://github.com/anthropics/ecc. 2025."
  - "Milner, Robin. *Communicating and Mobile Systems: the π-Calculus*. Cambridge University Press, 1999."
  - "Honda, Kohei, Nobuko Yoshida, and Marco Carbone. 'Multiparty Asynchronous Session Types.' *POPL 2008*."
  - "W3C Web Services Choreography Working Group. 'Web Services Choreography Description Language.' 2005."
  - "Gerkey, Brian P., and Maja J. Matarić. 'A Formal Analysis and Taxonomy of Task Allocation in Multi-Robot Systems.' *IJRR* 23, no. 9 (2004): 939-954."
  - "Mintzberg, Henry. *The Structuring of Organizations*. Prentice-Hall, 1979."
---

This text maps between the theoretical concepts in this repository's library — [delegation](../../../../../../../../../../humanities/theories/sociology/theories/work/terms/delegation.md), [role](../../../../../../../../../../humanities/theories/sociology/theories/work/theories/governance/terms/role.md), [office](../../../../../../../../../../humanities/theories/sociology/theories/work/terms/office.md), [dispatch](../../../../../../../../../../humanities/theories/sociology/theories/work/terms/dispatch.md) — and the concrete multi-agent patterns implemented in Claude Code harnesses and the Everything Claude Code (ECC) reference system.

## The orchestration/choreography distinction

The W3C Web Services Choreography Working Group (2005) and Milner's π-calculus (1999) establish a foundational distinction: **orchestration** is coordination by a central process that directs participants, while **choreography** is coordination through a shared protocol that each participant follows independently.

In agent harness terms: - **Orchestration**: A parent agent spawns subagents, assigns tasks, collects results, decides what happens next.
Claude Code's `Agent` tool implements this — the main conversation is the orchestrator, subagents are workers. - **Choreography**: Agents follow a shared protocol and interact peer-to-peer.
Claude Agent SDK's `TeammateTool` implements this — agents message peers directly without routing through a parent.

Most practical multi-agent systems mix both.
A Claude Code session orchestrates subagents (centralized dispatch) while those subagents follow shared conventions encoded in skills and rules (decentralized protocol adherence).

## Four concrete patterns

### 1. Parallel dispatch

The simplest multi-agent pattern: send the same task to multiple agents simultaneously, merge results.

```
/dispatch reviewer+security-reviewer Review the auth module
```

This is **Gerkey and Matarić's single-task, multi-robot allocation** (2004): one task, multiple agents, each bringing different capabilities.
The dispatch mechanism must solve: - **Capability matching** — does this agent have the tools and knowledge for this task? - **Non-interference** — can these agents run concurrently without conflicting writes? - **Result merging** — how are separate findings unified into a single report?

In the [delegation](../../../../../../../../../../humanities/theories/sociology/theories/work/terms/delegation.md) framework: each dispatched agent receives bounded authority (read access to the relevant scope), the principal (parent agent) retains accountability for the merged result, and the grant is revocable (the parent can cancel or override any subagent).

Non-interference in parallel dispatch is achieved by constraint: background agents can only read.
Write access requires foreground dispatch, which serializes.

### 2. Sequential pipeline

Agents execute in order, each building on the previous agent's output.

```
planner → [user works] → reviewer
```

This is Mintzberg's **standardization of output** (1979): each agent's output is specified well enough that the next agent can pick it up without negotiation.
The handoff document is the interface:

```markdown
## Handoff: planner → reviewer
### Findings
- [Key findings with file paths]
### Files Modified
- [What changed and why]
### Open Questions
- [Unresolved decisions]
```

The handoff document is the concrete implementation of what Honda, Yoshida, and Carbone (2008) formalize as **session types**: a typed protocol specifying what each participant sends and receives at each step.
A well-typed handoff guarantees that the receiving agent has sufficient context to proceed.

### 3. Phased orchestration

Complex workflows combine sequential and parallel phases.

```
architect → planner → [user works] → reviewer + security-reviewer → doc-updater
```

This is the `infrastructure` workflow in the `/orchestrate` command.
Each phase serves a different function: - **Architect** assesses structural impact (analysis role) - **Planner** breaks work into steps (planning role) - **User** implements (execution — not delegated to agents) - **Reviewer + security-reviewer** evaluate quality and safety in parallel (review roles) - **Doc-updater** maintains indexes (maintenance role)

Each agent fills a [role](../../../../../../../../../../humanities/theories/sociology/theories/work/theories/governance/terms/role.md) in the formal sense: a capability signature (what tools the agent can use), a norm-set (what the agent must and must not do), and a position in the orchestration hierarchy (what it subsumes and what subsumes it).
The reviewer role subsumes the security-reviewer role — any finding a security reviewer makes, a reviewer could in principle make, but the security reviewer's specialized capability signature makes it more likely to catch security-specific issues.

### 4. Worktree isolation

For tasks where multiple agents must write to overlapping files, git worktrees provide isolation:

```bash
git worktree add ../feature-auth feat/auth
git worktree add ../feature-billing feat/billing
# Each agent works in its own worktree
# Merge branches when done
```

This is the practical solution to the **non-interference** open problem identified in the [multi-agent-system](../terms/multi-agent-system.md) term.
Rather than proving at the type level that agents on overlapping regions commute, the system enforces disjointness at the filesystem level.
Each agent gets an isolated copy; conflicts surface only at merge time, where they can be resolved by a human or a coordinating agent.

The ECC `dmux` tool extends this further: multiple agent sessions run in parallel tmux panes, each in its own worktree, with a merge command (`m`) that brings results back to the main session.

## How delegation theory maps to agent dispatch

The [delegation](../../../../../../../../../../humanities/theories/sociology/theories/work/terms/delegation.md) term defines four invariants.
Each has a concrete implementation in agent orchestration:

| Invariant | In delegation theory | In agent dispatch |
|---|---|---|
| **Derivativity** | Principal can only delegate what principal holds | Parent agent can only grant tools it has access to |
| **Accountability non-transfer** | Principal remains answerable for outcomes | Parent agent presents results to user, not the subagent |
| **Boundedness** | Grant is strictly specified | Each agent has defined tools, model, and scope |
| **Revocability** | Principal may revoke at will | Parent can cancel background agents; user can deny tool calls |

The [assignment](../../../../../../../../../../humanities/theories/sociology/theories/work/terms/assignment.md) term adds three conditions for dispatching work to an agent: **capability** (can the agent do this?), **authority** (is the agent allowed to do this?), **capacity** (is the agent available?).
In practice:

- **Capability** is checked against the agent's tool list and description
- **Authority** is enforced by the permission model (background agents are read-only; tool calls require user approval)
- **Capacity** is bounded by the recommendation of 4 maximum parallel agents — beyond that, coordination cost exceeds specialization benefit

## Agents as officeholders

Each agent in the harness corresponds to an [office](../../../../../../../../../../humanities/theories/sociology/theories/work/terms/office.md) in the normative sense:

- The **agent definition** (markdown file with frontmatter) is the office — it specifies the normative structure, action domain, deontic profile, and installation mechanism independent of any particular instance.
- Each **spawned subagent** is an [officer](../../../../../../../../../../humanities/theories/sociology/theories/work/theories/governance/terms/officer.md) — a particular instance bound to the office's profile for the duration of the task.
- The **handoff document** is the [officium](../../../../../../../../../../humanities/theories/sociology/theories/work/theories/governance/terms/officium.md) discharge record — evidence that the positional obligation was fulfilled.

The office persists across sessions.
A reviewer agent invoked today and a reviewer agent invoked tomorrow fill the same office — they have the same tools, the same norms, the same position in the orchestration hierarchy.
The specific model instance is the body natural; the agent definition is the body politic.

## What remains open

Three problems from the theoretical terms remain unsolved in practice:

1. **Formal non-interference.** Worktree isolation is a practical fix, not a formal proof.
  A system that could statically verify which agents can run concurrently on which file regions — based on their declared capabilities and the task's scope — would eliminate the merge step entirely.

2. **Dynamic role composition.** Current agents have fixed capability signatures.
  A system where agents could compose capabilities at runtime — "I need a reviewer who also understands security and can access the database" — would require the role meet/join operations described in the [role](../../../../../../../../../../humanities/theories/sociology/theories/work/theories/governance/terms/role.md) term.

3. **Accountability tracing.** When a multi-agent workflow produces a wrong result, tracing the error through handoff documents is manual.
  An event-sourced architecture where every agent action is logged with its delegation chain would make accountability auditable.

## See also

- [agent-orchestration](../terms/agent-orchestration.md) — the coordination layer definition
- [multi-agent-system](../terms/multi-agent-system.md) — the architecture pattern
- [dispatch and delegation survey](../../../../../../../../../../humanities/theories/sociology/theories/work/texts/dispatch-and-delegation-survey.md) — theoretical grounding in organizational theory
- [agent reliability in production](./agent-reliability-in-production.md) — operational patterns for reliable multi-agent systems
- [multi-agent failure modes](./multi-agent-failure-modes.md) — MASFT study findings
