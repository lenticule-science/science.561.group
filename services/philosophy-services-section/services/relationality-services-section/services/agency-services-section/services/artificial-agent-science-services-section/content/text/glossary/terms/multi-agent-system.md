---
name: "Multi-Agent System"
description: "A computational system composed of multiple autonomous, interacting agents — each with its own information, goals, or role — that together solve a task no single agent's architecture is organized to complete alone, spanning a classical lineage from Smith's 1980 contract net protocol through Wooldridge's and Shoham-and-Leyton-Brown's textbook foundations to today's LLM-agent frameworks such as CAMEL, AutoGen, MetaGPT, and ChatDev."
date-created: 2026-08-22
aliases:
  - "multi-agent system"
  - "MAS"
  - "multiagent system"
  - "multi-agent systems"
instance-of: agent-architecture
---

A multi-agent system (MAS) is a computational system composed of two or more autonomous agents that perceive, decide, and act — typically with their own local information, objectives, or assigned role — and that interact, through some communication or coordination mechanism, to jointly accomplish a task. What distinguishes a MAS from a merely parallelized single-agent system is that the interaction itself is load-bearing: the agents negotiate, divide labor, check each other's work, or aggregate independently-produced answers, rather than each simply running the same procedure on a disjoint slice of the problem.

The classical lineage begins with distributed problem solving and task allocation by negotiation — Reid Smith's contract net protocol (1980) being the founding case, in which nodes with tasks announce them, candidate nodes bid, and the announcer awards the task to a bidder without centralized control. This lineage matured into a substantial textbook literature covering agent architectures (belief-desire-intention and its successors), agent communication languages, and the game-theoretic and mechanism-design apparatus (auctions, voting, incentive-compatible allocation) needed once agents might act strategically rather than cooperatively.

The 2023-onward LLM multi-agent turn reframes the same core problem — how should autonomous, interacting decision-makers divide and check work — around large language models as the individual agent's reasoning engine. Frameworks such as CAMEL (role-playing dyads), AutoGen (general-purpose multi-agent conversation), MetaGPT (standardized-operating-procedure role assignment), and ChatDev (a simulated software company) are all, in this classical sense, multi-agent systems: each assigns distinct roles or contexts to separate LLM instances and coordinates their interaction toward a shared task. Whether that coordination reliably outperforms a single well-resourced agent, and under what conditions, remains a live and contested empirical question rather than a settled architectural advantage.

See the fuller literature survey in [the study note on multi-agent systems science](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-multi-agent-systems-science.md).
