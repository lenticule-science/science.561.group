---
title: "Multi-Agent Failure Mode"
description: "An empirically-characterized way a multi-agent LLM system produces a wrong or unverified result even when its constituent agents are individually competent, as catalogued by Cemri et al.'s peer-reviewed MAST taxonomy (NeurIPS 2025) into 14 modes across three categories — system design issues, inter-agent misalignment, and task verification — derived from over 1,600 annotated execution traces across seven popular multi-agent frameworks, and contrasted with two 2026 preprints reporting that automatically-generated or unconstrained multi-agent systems can underperform a single agent given an equal compute budget."
date-created: 2026-08-22
aliases:
  - "multi-agent failure mode"
  - "MAST"
  - "MAST taxonomy"
  - "multi-agent system failure"
defines:
  - "Multi-Agent Failure Mode"
  - "MAST"
  - "MAST taxonomy"
instance-of: research-finding
---

A multi-agent failure mode is a way that a multi-agent LLM system's *coordination* — not any single agent's underlying model — produces an incorrect, incomplete, or unverified outcome. The distinction matters because it separates failures attributable to a weak model from failures attributable to how multiple, individually-competent agents were organized, which is a design problem rather than a capability problem.

The reference source is Mert Cemri, Melissa Z. Pan, Shuyi Yang, and colleagues, ["Why Do Multi-Agent LLM Systems Fail?"](https://arxiv.org/abs/2503.13657), accepted at *NeurIPS 2025* (Datasets and Benchmarks Track, spotlight). Built from over 1,600 human- and LLM-annotated execution traces across seven popular open-source multi-agent frameworks, the paper's MAST (Multi-Agent System Failure Taxonomy) identifies 14 distinct failure modes grouped into three categories:

- **System design issues** — the task, role boundaries, or success criteria given to the agents were ambiguous, incomplete, or internally inconsistent.
- **Inter-agent misalignment** — agents fail to share information they each individually possessed, misinterpret each other's messages, or otherwise coordinate incorrectly despite each agent's own reasoning being locally sound.
- **Task verification** — the system terminates, or accepts a result, without adequately checking that result against the original task — including premature termination before the task is actually complete.

A separate and more recent empirical thread bears on the same question from a different angle: whether multi-agent coordination reliably helps at all, once compute is held constant. Two 2026 preprints — Tran and Kiela's ["Single-Agent LLMs Outperform Multi-Agent Systems on Multi-Hop Reasoning Under Equal Thinking Token Budgets"](https://arxiv.org/abs/2604.02460) and Jwalapuram et al.'s ["The Illusion of Multi-Agent Advantage"](https://arxiv.org/abs/2606.13003) — report that under matched token or compute budgets, a single agent (or single-agent self-consistency voting) matches or beats automatically-generated multi-agent systems. Neither has been confirmed at a peer-reviewed venue as of this writing, and neither is a "failure mode" in MAST's specific empirical sense — they instead argue that the *baseline comparison* used to demonstrate multi-agent advantage in much prior work was itself confounded by unequal compute, a methodological point adjacent to, but distinct from, MAST's own catalogue of coordination breakdowns.

See the fuller literature survey, including how these findings bear on this library's own draft-then-verify multi-agent practice, in [the study note on multi-agent systems science](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-multi-agent-systems-science.md).
