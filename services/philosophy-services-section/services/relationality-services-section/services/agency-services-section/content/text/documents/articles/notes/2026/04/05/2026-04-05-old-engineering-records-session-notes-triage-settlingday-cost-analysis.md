---
name: settlingday-cost-analysis
date-created: 2026-04-05
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: settlingday-cost-analysis
description: $182.68 for a single day's work.
---


## Raw Numbers

| Metric | Value |
|--------|-------|
| Total sessions | 170 |
| Total cost | $182.68 |
| Total input tokens | 111.8M |
| Total output tokens | 1.2M |
| Average cost per session | $1.07 |
| Most expensive session | $6.79 (ECC hook retrofit, 115 tool calls) |

## What This Means

$182.68 for a single day's work. At this rate, 30 days = $5,480/month. That's not sustainable on a $12 VPS budget.

BUT: this was an extraordinary session. 170 sessions is 10-20x normal. The system produced:
- 25+ grounded library texts
- 15 deterministic tools (each saves ~$1 per future invocation)
- 7 agent demotions (permanent cost reduction)
- Research corpus covering every major agentic system
- Academy design, certification system, onboarding flow
- CL pipeline, auto-dispatch, heartbeat — infrastructure that runs without inference

## Cost Reduction Path

### Immediate (built today)
- 7 demoted agents → $0 per invocation (was ~$1 each)
- Auto-dispatch with adaptive scaling → prevents VPS overload
- Budget router tool → recommends cheapest model tier

### Near-term (designed, not built)
- Local 0.5B model on Hetzner CX32 → $0 inference for F3 work
- Session cost caps → prevent runaway sessions
- Smarter dispatch → don't dispatch tasks that cost more than their value

### What We Should Track
- Cost per completed task (not per session — some tasks take multiple sessions)
- Cost per library text produced
- Cost saved by deterministic tools (compare: tool invocation vs what agent would have cost)
- Running total by day/week/month

## Architectural Gaps Found

1. Sessions don't tag their office type in a parseable field
2. No per-session cost budget (a session can burn unlimited tokens)
3. No cost-benefit ratio tracking
4. Web search sessions cost disproportionately ($4+ for a few searches)
5. The first officer session is unbounded — hours of opus-tier inference
