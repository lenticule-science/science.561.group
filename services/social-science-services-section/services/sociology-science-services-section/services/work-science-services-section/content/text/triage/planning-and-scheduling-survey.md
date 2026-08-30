---
title: "Planning and Scheduling: From Critical Path to Seven Generations"
date-created: 2026-04-03
description: "How people and organizations plan work â€” from CPM's directed graphs through Goldratt's constraints to Bratman's intentions and Haudenosaunee seven-generation thinking."
part-of: ops-research-foundations
references:
  kelley-walker1959:
    authors: ["James E. Kelley Jr.", "Morgan R. Walker"]
    title: "Critical-Path Planning and Scheduling"
    publication: "Proceedings of the Eastern Joint Computer Conference"
    year: 1959
  malcolm1959:
    authors: ["D. G. Malcolm", "J. H. Roseboom", "C. E. Clark", "W. Fazar"]
    title: "Application of a Technique for Research and Development Program Evaluation"
    publication: "Operations Research, 7(5)"
    year: 1959
  goldratt1984:
    authors: ["Eliyahu M. Goldratt", "Jeff Cox"]
    title: "The Goal: A Process of Ongoing Improvement"
    publication: "North River Press"
    year: 1984
  goldratt1997:
    authors: ["Eliyahu M. Goldratt"]
    title: "Critical Chain"
    publication: "North River Press"
    year: 1997
  allen2001:
    authors: ["David Allen"]
    title: "Getting Things Done: The Art of Stress-Free Productivity"
    publication: "Viking"
    year: 2001
  bratman1987:
    authors: ["Michael E. Bratman"]
    title: "Intention, Plans, and Practical Reason"
    publication: "Harvard University Press"
    year: 1987
  drucker1967:
    authors: ["Peter F. Drucker"]
    title: "The Effective Executive"
    publication: "Harper & Row"
    year: 1967
  reinertsen2009:
    authors: ["Donald G. Reinertsen"]
    title: "The Principles of Product Development Flow"
    publication: "Celeritas Publishing"
    year: 2009
  lyons-mohawk1992:
    authors: ["Oren Lyons"]
    title: "The American Indian in the Past"
    note: "Speeches and writings on the Great Law of Peace and seven-generation principle"
    year: 1992
---

Planning is the act of creating a structured container of work entities whose collective completion advances a goal. This survey covers how the practice of planning has been understood across operations research, management science, cognitive philosophy, and indigenous governance â€” because effective organizational planning draws on all of these, not any one of them.

## Network scheduling: CPM and PERT

The modern discipline of project scheduling begins with two methods published in 1959: the Critical Path Method (Kelley and Walker 1959) and the Program Evaluation and Review Technique (Malcolm et al. 1959).

CPM models a project as a directed acyclic graph. Nodes are activities. Edges are dependencies. Each activity has a duration. The critical path is the longest path through the graph â€” the sequence of activities whose total duration determines the minimum project duration. Any delay on the critical path delays the entire project. Activities not on the critical path have float â€” they can be delayed without affecting the total duration.

The insight is structural: the project's duration is not determined by the average activity or the total work, but by the specific chain of dependencies that forms the longest path. Two projects with the same total work can have vastly different durations if their dependency structures differ.

PERT adds uncertainty. Instead of a single duration per activity, PERT uses three estimates: optimistic, most likely, pessimistic. The expected duration is $(o + 4m + p) / 6$, a weighted mean. The critical path is computed on expected durations, but the variance propagates â€” so the project completion time is a distribution, not a point. PERT answers: "what is the probability of finishing by date X?"

The implication for any work-tracking system is direct. Plans have tasks. Tasks have dependencies. The dependency graph IS the network. The critical path IS computable from the work records â€” query all tasks in a plan, follow dependency edges, find the longest chain. Float identifies which tasks can be deferred without affecting the plan.

## Constraint theory: Goldratt

Eliyahu Goldratt's *The Goal* (1984) and *Critical Chain* (1997) argue that traditional scheduling misses the real bottleneck. CPM treats all resources as unlimited. In practice, the constraint that limits throughput is usually a shared resource â€” a machine, a specialist, a review bottleneck â€” not a dependency chain.

The Theory of Constraints (TOC) says: identify the system's constraint, exploit it (ensure it is never idle), subordinate everything else to it (non-constraints serve the constraint), elevate it (invest in increasing its capacity), and repeat.

Critical Chain project management applies TOC to scheduling. Instead of padding individual task estimates (which Goldratt shows leads to Parkinson's Law â€” work expands to fill the time), you aggregate uncertainty into buffers at the end of chains. The project buffer protects the completion date. Feeding buffers protect merge points. Buffer consumption is the tracking metric â€” if buffers are consumed faster than work progresses, the project is at risk.

In practice: constraint identification means finding which agent, capability, or resource limits throughput. In session-based work, that constraint is often session capacity â€” the amount of effective work per session and the number of sessions per day. The system should subordinate other concerns to that constraint â€” which means making each session as effective as possible, not scheduling more sessions.

## Personal productivity: Allen and Drucker

David Allen's *Getting Things Done* (2001) is a personal planning system with two key insights. First: the mind is for having ideas, not holding them. Capture everything into a trusted system so your mind is free for thinking. Second: the unit of planning is the "next action" â€” the concrete physical action you would take next to advance a project. Not "plan the conference" but "call the venue and ask about March availability."

Allen's system has five stages: capture (collect inputs), clarify (decide what each input is and what it requires), organize (put things where they belong), reflect (review regularly), engage (do the work). This maps to the operations loop: capture is input processing, clarify is planning, organize is dispatch, reflect is review, engage is execution. Allen's insight is that the loop must be continuous and lightweight â€” not a quarterly exercise but a daily habit.

Peter Drucker's *The Effective Executive* (1967) makes a different claim: effective people do not start with tasks. They start with time. Drucker observes that executives who track their time discover they spend it very differently than they think. His recommendation: consolidate discretionary time into large blocks, because knowledge work requires sustained attention. Small fragmented blocks produce the illusion of productivity without the substance.

In practice: Allen's capture-clarify-organize loop maps to any input processing pipeline. Every input should be captured, clarified (what type of record is this?), and organized (where does it go in the work hierarchy?). Drucker's time-first principle means the system should help agents and humans protect large blocks for deep work, not just schedule more small tasks.

## Cognitive planning: Bratman

Michael Bratman's *Intention, Plans, and Practical Reason* (1987) provides the philosophical foundation for why plans exist at all. Bratman argues that intentions are not just predictions or desires â€” they are commitments that constrain future deliberation. Once you form the intention to take the 3pm flight, you stop deliberating about transportation and start planning what needs to happen before 3pm.

Plans, for Bratman, are partial hierarchical structures of intentions. They are partial because they don't specify every detail â€” you plan to fly but haven't chosen a seat yet. They are hierarchical because high-level intentions (attend the conference) decompose into sub-intentions (book the flight, prepare the talk, arrange lodging). And they are stable â€” once formed, a plan resists reconsideration unless something significant changes. This stability is not rigidity; it is cognitive efficiency. Replanning everything every moment would paralyze action.

The stability principle is critical for the operations loop. Plans should resist casual modification. When a task is harder than expected, the default should be "keep the plan and try harder," not "revise the plan." Replanning should require explicit justification â€” a review that shows the plan is wrong, not just a feeling that it's hard. This is what `status: active` means: the plan is a commitment, not a suggestion.

Bratman also distinguishes between plan-based reasoning and opportunistic action. Sometimes you should abandon the plan and seize an opportunity. The question is when. Bratman's answer: when the expected value of the opportunity exceeds the expected value of continuing the plan PLUS the cost of replanning. In the operations loop, this is what the review stage evaluates: is the plan still the best use of resources, or has something changed that warrants a different approach?

## Flow-based scheduling: Reinertsen

Donald Reinertsen's *The Principles of Product Development Flow* (2009) argues that traditional scheduling (CPM, waterfall, even agile sprints) optimizes for the wrong thing. They optimize for resource utilization â€” keeping everyone busy. Reinertsen argues you should optimize for flow â€” minimizing the time from work entering the system to work leaving the system.

Key principles: (1) Keep queues short. Long queues mean long cycle times, regardless of how fast individual workers are. (2) Limit work in progress. Starting less work means finishing more work, because multitasking has overhead. (3) Use economic decision rules. Every decision in the system â€” prioritization, resource allocation, scope trade-offs â€” should be made against a common economic framework (typically cost of delay). (4) Variability is not the enemy; variability without management is. Some variation is inherent in knowledge work. Managing it (buffers, capacity margins) is better than trying to eliminate it.

In practice: queue length and WIP limits are directly measurable from work records. Count open tasks per plan, count tasks "in progress" per agent, measure time from task creation to completion. Any operational dashboard that shows open task counts is the beginning of flow metrics. The system should surface WIP violations ("agent has 12 tasks in progress, limit is 5") and queue length warnings ("plan has 30 unstarted tasks, consider decomposition").

## Seven-generation thinking: Haudenosaunee governance

The Haudenosaunee Confederacy (Iroquois) governance structure, formalized in the Great Law of Peace (Gayanashagowa), operates on a principle often stated as considering the impact of decisions on seven generations forward. Oren Lyons, Faithkeeper of the Onondaga Nation, has articulated this principle in numerous speeches and writings: decisions must account for their effects on people not yet born.

This is not metaphorical long-term thinking. It is a structural principle of governance. The Haudenosaunee clan mothers â€” who hold the power to nominate and recall chiefs â€” evaluate leaders partly on their capacity for multi-generational reasoning. A chief who optimizes for the current generation at the expense of future ones can be removed.

The operations loop cannot optimize only for the current session or the current quarter. When a system serves generational goals â€” goals that span decades, not quarters â€” plans should be evaluated not just by "does this advance the immediate goal?" but by "does this build capability that serves the goal across time?" Infrastructure work (like building the operations loop itself) has low immediate output but high multi-generational value. The seven-generation principle provides the justification for investing in foundation when immediate deliverables are pressing.

This connects to the settlement path: inquiry and derivation (open work types) build the foundation that process and procedure (settled work types) exploit. A system that only does settled work is efficient in the short term but incapable of adaptation. A system that balances inquiry with process â€” that invests in understanding before optimizing â€” builds multi-generational capability.

## Synthesis: what planning means for the operations loop

Planning is the act of creating a [plan](../terms/plan.md) (container) populated with [tasks](../terms/task.md) (things) connected by dependencies (relations), assigned to agents (acts), and evaluated against goals (qualities). The planning stage of the operations loop draws on all the traditions above:

- **Network structure** from CPM/PERT â€” dependencies form a graph, the critical path determines duration
- **Constraint awareness** from Goldratt â€” identify and protect the bottleneck
- **Capture-and-clarify** from Allen â€” every input becomes a record, every record has a next action
- **Intention stability** from Bratman â€” plans resist casual revision, replanning requires justification
- **Flow optimization** from Reinertsen â€” minimize queues, limit WIP, measure cycle time
- **Multi-generational scope** from Haudenosaunee governance â€” evaluate plans against long-term capability, not just immediate output

The planning stage produces plans. The dispatch stage assigns tasks from plans to agents. The execution stage advances tasks. The tracking stage observes progress. The review stage evaluates outcomes. The feedback stage modifies future plans. The loop continues.
