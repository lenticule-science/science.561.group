---
title: "Basics of Agentic Orchestration Platforms"
date-created: 2026-07-24
date-modified: 2026-07-26
kind: research-note
keywords:
  - agentic-orchestration
  - verification
  - capability-cells
  - deterministic-computation
  - language-model-inference
  - independent-verification
status: rewritten-2026-07-26
declared-by: claude-interactive-session-supplying-lenticule-science
---


This note replaces an 820-line version written on 2026-07-24. That version was a
chat reply pasted into the repository: it addressed the Leader in the second
person, surveyed the general field for a reader who does not exist, and reached
the settlement's own systems in one paragraph at the end. The survey is not
reproduced here. What follows is the part of it that this settlement can check
against its own disk, and what those checks returned on 2026-07-26.

## The distinction the survey was reaching for

An agent is a worker inside a process. An orchestration platform owns the
process. If each agent decides what the task means, which tools to use, when it
is finished, and whether its own answer is right, the platform owns nothing. The
work is distributed improvisation wearing a workflow's name.

This settlement already draws that line. Its providers are workers: a hired
inference team answers one bounded lot and returns text. Its loop is the
process: mint a demand, hire a provider, land the answer, record a receipt. The
question this note asks is whether the process holds when the workers fail.

## The four states a platform must keep apart

Work was attempted. Work was performed. An artifact was produced. The intended
capability was delivered.

Collapsing the last two is the failure this settlement has. A file exists, so
the task counts as complete — even when the file is empty, invalid,
unregistered, or disconnected from whatever was supposed to consume it. Presence
is not capability. Production is not delivery.

## What the disk returned

Work order `wo-claude-interactive-session-authoring-gate-c9aabc710bd7` demanded a
PreToolUse hook that would stop sessions from hand-authoring records. A hired
provider (`llama-3.1-8b-instant`, via `groq-inference-team`) answered with
JavaScript that cannot run. It imports two modules that do not exist in this
repository. It contains a syntax error. Its own header names a target path that
cannot be a file. The realizer wrote that text into the tree as a markdown
document, committed it, and closed the order as `realized` on 2026-07-24.

Nothing in that sequence checked whether the answer worked. The realizer's
content gate hires an independent judge to ask whether prose defines a term. No
stage asks whether code parses. For a `define` order whose demand is a hook,
"does this text define the term" is the wrong question, and it passed.

So the platform produced an artifact and recorded a delivered capability. The
capability does not exist. The gate that would have stopped sessions from
hand-authoring records has never run.

## Why independence is the load-bearing property

A generator that also defines correctness, checks its work against its own
assumptions, and declares itself done produces agreement, not evidence. The same
mistaken reading contaminates every stage, and the stages agree because they
share it.

Independence of error matters more than the number of checks. Three agents
agreeing means little when all three share a model family, a prompt, or an
upstream summary. In this settlement the strongest available independence is not
another model — it is the deterministic instruments already on disk. A parse. A
schema validator. A test run. A registry probe. Those fail for reasons unrelated
to why a model was wrong, which is the only property that makes a check worth
running.

The realizer knows this in one direction and not the other. It validates
glossary terms through `reading-a-schema`, the settlement's one validator, and
refuses records that fail. It applies no equivalent to anything landing as a
markdown document, and the counterfeit hook landed as a markdown document.

## Verification effort should scale with consequence

Verification is not free, and exhaustive verification can cost more than
generation. The level that is worth paying rises with the probability of error,
the harm if the error stands, the difficulty of catching it later, and the
difficulty of reversing it.

A term definition that reads oddly is cheap to catch and cheap to fix. A hook
that was supposed to bind every future session, recorded as installed and never
installed, is none of those things: it fails silently, it fails permanently, and
every session after it inherits an unbounded process while the records report a
membrane. That order deserved a parse check. It received a prose judge.

## The state of the loop

Every demand-to-hire timer on `bare-cedar-fog` has been inactive since
2026-07-24 14:13, with no reason on the record. The session-start hook still
reports the loop as running, because it counts work orders rather than asking
systemd whether anything drains them.

That is the same defect one layer up. A count of open orders is an artifact. A
draining loop is a capability. The hook reads the first and reports the second.

## What this settlement still owes itself

Three things, none of them a survey:

- A realizer that runs a check matching its order's class. Code parses or the
  order fails. A record validates or the order fails. Prose gets the judge it
  already has.
- The counterfeit-realized orders reopened, starting with the authoring gate,
  so the forgeries are on the record rather than closed behind a commit.
- A session-start reading that observes the timers instead of counting the
  files they would have moved.

## Deployment boundary

`bare-cedar-fog.561.group` is Bare Cedar Fog Colony's federated public
territory. Its ActivityPub actors, colony-facing market activities, and
colony-routed agent interfaces belong there.

`actions.561.group` is cloud execution territory. A service deployed there can
be discovered and hired as an external provider. Its cloud location does not
make it a colony actor, and it does not transfer the colony's identity,
authority, memory, scheduling, or market control to that service.

Orchestration must hold this boundary in identifiers and routing. It must not
route by actor path while ignoring the hostname, mint a colony actor under
`actions.561.group`, or treat cloud execution infrastructure as the colony's
federation or control plane.
