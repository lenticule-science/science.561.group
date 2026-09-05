---
title: "Dispatch and Delegation: How Work Reaches the Agent Who Does It"
date-created: 2026-04-03
description: "How work gets assigned to agents â€” from Mintzberg's coordination mechanisms through kanban pull systems to multi-agent task allocation and Hohfeldian authority structures."
part-of: ops-research-foundations
references:
  mintzberg1979:
    authors: ["Henry Mintzberg"]
    title: "The Structuring of Organizations"
    publication: "Prentice-Hall"
    year: 1979
  fayol1916:
    authors: ["Henri Fayol"]
    title: "Administration Industrielle et GÃ©nÃ©rale"
    year: 1916
    note: "English translation: General and Industrial Management, Pitman, 1949"
  barnard1938:
    authors: ["Chester I. Barnard"]
    title: "The Functions of the Executive"
    publication: "Harvard University Press"
    year: 1938
  anderson2010:
    authors: ["David J. Anderson"]
    title: "Kanban: Successful Evolutionary Change for Your Technology Business"
    publication: "Blue Hole Press"
    year: 2010
  gerkey-mataric2004:
    authors: ["Brian P. Gerkey", "Maja J. MatariÄ‡"]
    title: "A Formal Analysis and Taxonomy of Task Allocation in Multi-Robot Systems"
    publication: "International Journal of Robotics Research, 23(9)"
    year: 2004
  hohfeld1913:
    authors: ["Wesley Newcomb Hohfeld"]
    title: "Some Fundamental Legal Conceptions as Applied in Judicial Reasoning"
    publication: "Yale Law Journal, 23(1)"
    year: 1913
---

Dispatch is the act of routing work to the agent who will do it.
It is the bridge between planning (work exists and is structured) and execution (work is being done).
How this bridge works determines whether the right work reaches the right agent at the right time with the right authority.

## Coordination mechanisms: Mintzberg

Henry Mintzberg's *The Structuring of Organizations* (1979) identifies five mechanisms by which organizations coordinate work.
These are not alternatives â€” most organizations use all five, with different mechanisms dominating at different scales.

**Mutual adjustment** â€” coordination through informal communication.
Two people working side by side adjust to each other in real time.
This works for very small groups and, paradoxically, for very complex work where no one person can specify in advance what others should do.
In a multi-agent system, mutual adjustment is what happens when agents share a workspace and observe each other's actions â€” any mechanism that provides shared context (a shared dashboard, a common environment briefing) is a form of mutual adjustment.

**Direct supervision** â€” one person takes responsibility for the work of others, issuing instructions and monitoring output.
The manager.
In practice, this is the default mode for small teams: one coordinator issues directives and workers execute.
The limitation: direct supervision doesn't scale.
One supervisor can effectively coordinate perhaps 5-10 agents.
Beyond that, the supervisor becomes the bottleneck.

**Standardization of work processes** â€” specifying the content of work itself.
The assembly line.
In a work management system, a process-type task is standardized work: the steps are determined, the agent follows them.
Skills and runbooks encode standardized processes.
The more work is standardized, the less coordination is needed per instance â€” but the upfront investment in standardization is high.

**Standardization of outputs** â€” specifying what results must be produced, without specifying how.
The budget target.
In practice, a task's goal statement is an output specification.
The agent decides how to achieve it.
This enables autonomy: the dispatcher says "produce X" and the agent figures out how.
The limitation: output specifications must be precise enough to verify.

**Standardization of skills** â€” specifying the training required to do the work, then trusting the trained professional.
The surgeon.
In practice, agent capability profiles serve this role.
An agent with a specific skill is trusted to perform that work without step-by-step supervision.
Skill-based dispatch means: check the agent's capabilities, assign work that matches, trust the agent to execute.

Mintzberg's insight: as organizations grow, they shift from mutual adjustment to direct supervision to standardization.
The operations loop should support all five mechanisms.
Small-scale work (a single session) uses mutual adjustment.
Routine work uses standardization.
Complex cross-domain work uses direct supervision (the user or a coordinator agent).
The dispatch system should not assume one mechanism fits all work.

## Authority and acceptance: Barnard and Hohfeld

Chester Barnard's *The Functions of the Executive* (1938) introduced a radical idea about authority: authority flows upward, not downward.
An order has authority only if the person receiving it accepts it.
Barnard's "zone of indifference" is the range of orders a subordinate will accept without question.
Orders inside the zone are executed.
Orders outside the zone are questioned, resisted, or ignored.

This applies directly to AI agent dispatch.
An agent's tool list defines its zone of indifference â€” it will execute any action within its tool capabilities without question.
An action outside its tools is impossible.
An action within its tools but outside its role description is where interesting dispatch decisions happen.

Wesley Newcomb Hohfeld's *Some Fundamental Legal Conceptions* (1913) provides the formal structure for authority.
The four Hohfeldian positions â€” power, duty, privilege, immunity â€” map directly to dispatch constraints:

| Position | In dispatch | Example |
|----------|------------|---------|
| **Power** | Can change others' normative positions | A principal can assign work to agents |
| **Duty** | Must perform or refrain | An agent must complete assigned work |
| **Privilege** | May do without obligation | An agent may read any file in its scope |
| **Immunity** | Cannot have position changed by others | An agent cannot be reassigned by another agent of equal rank |

A dispatch system that uses Hohfeldian positions should enforce them: an agent cannot accept work it lacks the power to complete, and a dispatcher cannot assign work that exceeds the agent's authority scope.

## Pull vs. push: kanban dispatch

David Anderson's *Kanban* (2010) introduces a fundamentally different dispatch model.
In push systems (traditional project management), work is assigned to agents by a dispatcher.
In pull systems (kanban), agents pull work from a queue when they have capacity.

The pull model has advantages for knowledge work: (1) it naturally limits work-in-progress because agents only pull when ready, (2) it eliminates the dispatcher bottleneck, (3) it gives agents autonomy over sequencing.
The limitation: pull requires a well-ordered queue, which requires prioritization â€” someone must decide what's at the top of the queue.

In practice, both models are needed.
Routine work (process/procedure types) should be pull-based: the agent queries for the highest-priority open task matching its capabilities and starts it.
Complex work (derivation/inquiry types) should be push-based: a coordinator explicitly assigns it to a specific agent with the right expertise.

A work management datastore supports both models.
Pull: query for open tasks sorted by priority.
Push: explicitly record an assignment linking a task to an agent.

## Multi-agent task allocation: Gerkey and MatariÄ‡

Gerkey and MatariÄ‡'s *A Formal Analysis and Taxonomy of Task Allocation in Multi-Robot Systems* (2004) provides the most systematic framework for multi-agent dispatch.
Their taxonomy classifies allocation problems along three dimensions:

**Single-task vs. multi-task robots**: can each agent do one thing at a time, or multiple?
In most work management systems, agents can technically run in parallel (via isolated workspaces), but each instance handles one task at a time.

**Single-robot vs. multi-robot tasks**: does each task require one agent, or multiple?
Most tasks in a typical work system are single-agent.
Some (e.g., parallel research surveys dispatched to multiple agents) are multi-agent.

**Instantaneous vs. time-extended allocation**: is the allocation decided once, or does it evolve?
Most real work systems need time-extended allocation â€” tasks can be reassigned if an agent fails, and new tasks emerge during execution.

The optimal allocation strategy depends on the problem class.
For single-task single-agent instantaneous allocation (the simplest case), auction-based methods work well: each task is "offered" and agents "bid" based on their capability and capacity.
For time-extended allocation, market-based approaches with re-auctioning outperform static assignment.

In practice, the dispatch stage should implement capability-based matching as a first step.
Each agent has capabilities (from its profile or definition).
Each task has requirements (from its work type and domain).
The dispatcher matches tasks to agents by checking capability overlap â€” a query for agents whose capabilities include the task's domain and work type.

## Synthesis: dispatch in the operations loop

The dispatch stage connects planning to execution.
It takes structured plans (containers of tasks with dependencies) and routes individual tasks to agents who can do them, subject to authority constraints, capacity limits, and coordination mechanisms appropriate to the work type.

In a work management system, dispatch means: - **Query for ready work** â€” find open tasks with no blockers (dependencies met, status is "ready") - **Match capabilities** â€” the task's domain and work type must match the agent's profile - **Check authority** â€” the agent must have the privileges required for this scope - **Check capacity** â€” the agent must not exceed its WIP limit - **Create the assignment** â€” a record of who, what, when, and under what authority - **Choose the mechanism** â€” push (explicit assignment) for inquiry/derivation, pull (queue-based) for process/procedure

The output of dispatch is an assignment event: a timestamped record linking a task to an agent.
The execution stage begins when the agent picks up the assignment.

## See also

- [delegation](../terms/delegation.md), [office](../terms/office.md) â€” governance terms for authority structures
- [The Ontology of Work Operations](./ontology-of-work-operations.md) â€” the base mapping
- [Planning and Scheduling Survey](./planning-and-scheduling-survey.md) â€” what happens before dispatch
