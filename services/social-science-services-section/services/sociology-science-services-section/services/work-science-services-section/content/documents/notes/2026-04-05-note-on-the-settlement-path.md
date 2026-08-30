---
title: "The Settlement Path"
description: "The settlement path — from inquiry to process — is the organizing principle of a settlement-carrier system. Every piece of infrastructure serves the movement from uncertainty to determinism."
date-created: 2026-04-05
references:
  ref1:
    title: "Logic: The Theory of Inquiry (Dewey, 1938)"
  ref2:
    title: "Situated Learning: Legitimate Peripheral Participation (Lave and Wenger, 1991)"
  ref3:
    title: "Learning for Mastery (Bloom, 1968)"
connects-to:
  - settlement-path
  - progressive-automation
  - formality-level
  - work
  - closure-operator
---

The [settlement path](../../glossary/terms/settlement-path.md) is the organizing principle of a settlement-carrier system. Every agent, every hook, every skill, every design decision serves a single movement: the transformation of uncertain work into deterministic execution. This is not a metaphor applied after the fact. The system was built around this progression, and understanding the settlement path is understanding why every part of the system exists and where it sits relative to every other part.

## The progression

[Work](../terms/work.md) begins as [inquiry](../terms/inquiry.md) — neither the meaning nor the execution is known. Someone notices a problem, asks a question, observes a pattern. Through investigation, the meaning settles: a finding emerges, a concept gets defined, a decision gets made. The work becomes a [derivation](../terms/derivation.md) — the what is known, but the how remains open. Through encoding — writing down the steps, building the conditional logic, specifying the branches — the execution settles. The work becomes a [procedure](../terms/procedure.md) — both what and how are known, but edge cases remain. Through formalization — handling every branch, typing every input, testing every boundary — the work becomes a [process](../terms/process.md). Nothing is left to judgment. A machine can do it.

This is the settlement path: inquiry, derivation, procedure, process. Each step reduces the judgment required to perform the work. Each step makes the work executable by something less capable — less experienced, less expensive, less contextual — than what performed it before.

## The same structure everywhere

The settlement path is not one feature of the system. It is the structure that recurs at every level of description. The same four-stage progression appears in at least four parallel systems, each expressing the same movement from open to closed.

**The work taxonomy.** Inquiry has neither meaning nor execution settled. Derivation has meaning settled. Procedure has both settled under known conditions. Process has both settled unconditionally. This is the base layer — the conceptual vocabulary. Everything else is an instantiation.

**The formality scale.** The offices-as-fuzzy-cells analysis assigns each component of each [office](../terms/office.md) a [formality level](../terms/formality-level.md): F0 (implicit — not stated anywhere), F1 (narrative — natural language that resists formalization), F2 (structured prose — lists and patterns that could be formalized), F3 (algebraic — machine-checkable). F0 maps to inquiry. F1 to derivation. F2 to procedure. F3 to process. The formality scale measures how far along the settlement path a specification has traveled.

**The computation model.** Opus handles inquiry — open-ended research, architectural decisions, novel synthesis. Sonnet handles derivation — structured work where the goal is known but the path requires judgment. Haiku handles procedure — templated work with conditional branches. Scripts handle process — deterministic execution with no inference. The model tier allocated to a piece of work is proportional to how much of the settlement path remains unsettled. This is not a cost optimization. It is a statement about what kind of computation each stage requires.

**The automation pipeline.** An observation is recorded (inquiry — something happened, we don't know what it means). Repeated observations produce an instinct (derivation — we know what it means, but not yet how to act on it reliably). A validated instinct becomes a skill (procedure — we know how to act, with conditional logic). A fully formalized skill becomes a hook (process — deterministic, no inference required). This is the continuous learning pipeline, and it is the settlement path applied to the system's own behavior.

| Settlement stage | Work type | Formality | Compute | Automation |
|---|---|---|---|---|
| Open | Inquiry | F0 -- F1 | Opus | Observation |
| Meaning settled | Derivation | F1 -- F2 | Sonnet | Instinct |
| Execution settled | Procedure | F2 -- F3 | Haiku | Skill |
| Fully settled | Process | F3 | Script | Hook |

The columns are not analogies. They are the same structure described in different vocabularies. An office component at F1 is one that requires derivation-level work to operate, which means it needs Sonnet-tier inference, which means it is at the instinct stage of automation. Knowing the position in any one column tells you the position in all four.

## Why this is the organizing principle

A system needs an organizing principle when it has many parts that could be arranged in many ways. A settlement-carrier system may have dozens of offices, skills, hooks, multiple model tiers, a knowledge graph, a learning pipeline, a dispatch system, and a financial ledger. The question is: what determines where each part sits and how it relates to the others?

The settlement path answers this. Each part of the system exists to perform work at a specific settlement stage, or to move work from one stage to the next.

The triage processor exists at the inquiry stage. It takes unstructured input — babbles, notes, fragments — and produces structured output: terms, texts, tasks. Its work is to settle meaning from raw material. It operates at F1, requires Opus-tier inference, and resists automation precisely because its input is maximally unsettled.

The planner exists at the derivation stage. It takes a goal with settled meaning and produces a plan — a structured sequence of steps. The meaning (what we want) is known; the execution (how to get there) is what the planner settles. It operates at F1-F2 and requires Sonnet-tier inference.

The build error resolver exists at the procedure stage. It takes a typed compiler error and applies a known fix pattern. Both the meaning (what went wrong) and the execution (how to fix it) are substantially settled; only the specific application to this codebase remains open. It operates at F2-F3 and could, with further formalization, become a script.

The doc updater exists at the process stage, or nearly so. It scans the filesystem, diffs against indexes, and updates them. The analysis of offices as fuzzy cells identifies it as "almost fully automatable" — a deterministic pipeline. It operates at F3 and should become a hook or scheduled script. The fact that it is still an agent is a measure of incomplete settlement.

This is what [progressive automation](../terms/progressive-automation.md) means in practice: every task completion should encode the work so that something less capable can do it next time. The policy is not "automate everything." It is "move everything one step along the settlement path." An inquiry that produces a finding has been partially settled. A derivation that gets encoded into a procedure has been further settled. A procedure that gets all its edge cases formalized into a process has been fully settled. Progressive automation is the policy; the settlement path is the trajectory that policy follows.

## The closure structure

The mathematical structure underneath the settlement path is [closure](../../../../../../humanities/theories/math/theories/order/terms/closure-operator.md). Each settlement step applies rules that make implicit knowledge explicit — adding what is missing until nothing new appears. The closure of an inquiry under its resolution rules is a derivation. The closure of a derivation under procedural encoding is a procedure. The closure of a procedure under edge-case formalization is a process.

[Training as closure](../../../../../../education-science-services-section/content/documents/notes/2026-04-04-note-on-training-as-closure.md) makes this precise for the learning case: a trainee begins with generators (initial capacities), and the training process is a closure operator — extensive, monotone, idempotent. Competency is the fixed point where further training of the same kind produces no new capability. The settlement path is the same structure applied to work rather than workers. A piece of work begins with its initial specification (generators), and each settlement step is a closure operator. Full settlement is the fixed point where further specification produces no new determinism.

This is why the formality scale has exactly four levels. F0 is the initial state — implicit, unstated. F1 closes under articulation: what was implicit becomes narrated. F2 closes under structuring: what was narrated becomes patterned. F3 closes under formalization: what was patterned becomes algebraic. Each closure operator is stronger than the last, and each produces a fixed point that the next operator can act on. The settlement path is the composition of these three closures, applied in order.

## What this means for the system

If the settlement path is the organizing principle, then the health of the system is measured by the rate and direction of settlement. Work that moves along the path is producing value. Work that stalls is consuming resources without advancing. Work that regresses — a process that breaks, a procedure that loses its edge cases — represents lost settlement.

The cross-system adoption priorities analysis identifies the ten highest-leverage patterns for autonomous operation. Every one of them serves settlement. In-process hook execution makes settled work (hooks) cheaper to run — it removes friction from the process stage. Reflection-on-failure moves the learning pipeline from observation to instinct — it settles meaning on failures. Session save/resume prevents the loss of settlement between sessions — editorial judgments already made do not need to be re-derived. Loop detection prevents the most common form of wasted work — repeated attempts that produce no new settlement. The heartbeat system detects stalled settlement and dispatches corrections.

The formality distribution across offices reveals where the system's settlement is complete and where it is not. Constructors (tool allowlists) are at F3 in all 26 offices — fully settled. Sites (action domains) are at F2 or below in all 26 — unsettled. Recognition fibers range from F0 to F3. The system is not uniformly settled; it is settled in the dimensions that were formalized first (what tools an office can use) and unsettled in the dimensions that require more work (what an office recognizes as its domain).

The seven offices closest to full formalization — bookkeeper, docs lookup, graph analyst, harness cleaner, doc updater, observer, quartermaster — are the ones whose work is closest to process. They should be the next to settle into scripts or hooks. The five irreducibly fuzzy offices — architect, researcher, triage processor, chief of staff, planner — are the ones whose work is inquiry or derivation. They will remain agents because their work requires the judgment that only unsettled work demands.

This is the system understanding itself through its own vocabulary. The settlement path is not a description imposed on the system from outside. It is the principle the system was built around, visible in every design decision from model tier allocation to office formality to the continuous learning pipeline. To build the system is to settle work. To understand the system is to see where each part sits on the path.

## See also

- [Settlement path](../../glossary/terms/settlement-path.md) — the term definition
- [Work](../terms/work.md) — the base concept
- [Progressive automation](../terms/progressive-automation.md) — the policy that drives settlement
- [Formality level](../terms/formality-level.md) — the measurement scale
- [Training as Closure](../../../../../../education-science-services-section/content/documents/notes/2026-04-04-note-on-training-as-closure.md) — the closure structure applied to learning
- [Offices as Fuzzy Cells](../../../../../../../../operations/command/endeavor/records/analyses/offices-as-fuzzy-cells.md) — formality assessment of every office
- [Cross-System Adoption Priorities](../../../../../../../../operations/command/endeavor/records/analyses/cross-system-adoption-priorities.md) — infrastructure that serves settlement
