---
title: "Feedback and Organizational Learning: How Review Findings Become Real Changes"
date-created: 2026-04-03
description: "How the operations loop closes â€” from Wiener's cybernetic feedback through Argyris's learning loops to Toyota kata, adaptive management, and decision records that embed learning into the system."
part-of: ops-research-foundations
references:
  wiener1948:
    authors: ["Norbert Wiener"]
    title: "Cybernetics: Or Control and Communication in the Animal and the Machine"
    publication: "MIT Press"
    year: 1948
  ashby1956:
    authors: ["W. Ross Ashby"]
    title: "An Introduction to Cybernetics"
    publication: "Chapman & Hall"
    year: 1956
  argyris-schon1978:
    authors: ["Chris Argyris", "Donald A. SchÃ¶n"]
    title: "Organizational Learning: A Theory of Action Perspective"
    publication: "Addison-Wesley"
    year: 1978
  rother2009:
    authors: ["Mike Rother"]
    title: "Toyota Kata: Managing People for Improvement, Adaptiveness, and Superior Results"
    publication: "McGraw-Hill"
    year: 2009
  holling1978:
    authors: ["C. S. Holling"]
    title: "Adaptive Environmental Assessment and Management"
    publication: "John Wiley & Sons"
    year: 1978
  nygard2011:
    authors: ["Michael Nygard"]
    title: "Documenting Architecture Decisions"
    note: "Blog post introducing Architecture Decision Records (ADRs)"
    year: 2011
  imai1986:
    authors: ["Masaaki Imai"]
    title: "Kaizen: The Key to Japan's Competitive Success"
    publication: "McGraw-Hill"
    year: 1986
---

Feedback is the act of modifying the system based on what was learned. Without feedback, review is theater â€” findings are documented and ignored. With feedback, each cycle of the operations loop produces a better-calibrated system. This is the stage that makes the loop a spiral of improvement rather than a circle of repetition.

## Cybernetic foundations: Wiener and Ashby

Norbert Wiener's *Cybernetics* (1948) establishes the mathematical framework for feedback systems. A system under feedback control has: a sensor (measures current state), a comparator (compares measured state to desired state), and an effector (acts to reduce the difference). The loop runs continuously: sense, compare, act, sense again.

The thermostat is the canonical example. Temperature sensor reads 68Â°F. Desired temperature is 72Â°F. Difference is 4Â°F. Effector turns on the heater. Temperature rises. Sensor reads again. When the difference reaches zero, the effector stops.

Wiener distinguishes positive feedback (amplifying deviation â€” a microphone pointed at its speaker) from negative feedback (reducing deviation â€” the thermostat). The operations loop uses negative feedback: review finds deviation from plan, feedback acts to reduce the deviation.

W. Ross Ashby's *Introduction to Cybernetics* (1956) adds the Law of Requisite Variety: a control system must have at least as much variety (range of responses) as the system it controls. If the environment can present 100 different disturbances, the controller must have at least 100 different responses. Fewer responses means some disturbances go uncontrolled.

In practice: the feedback stage must have enough variety to address the findings from review. If review identifies 5 types of problems (execution errors, planning errors, vocabulary gaps, resource constraints, priority misalignment), the feedback stage needs at least 5 types of responses (adjust execution, revise plan, define terms, reallocate resources, reprioritize). A feedback stage that can only "add more tasks" has insufficient variety.

## Double-loop learning applied to feedback

Argyris and SchÃ¶n's distinction between single-loop and double-loop learning (1978) determines what kind of feedback the system applies:

**Single-loop feedback** â€” change actions within the current plan. The review found a task took too long â†’ feedback adjusts the estimate for similar tasks. The plan structure is unchanged.

**Double-loop feedback** â€” change the plan, the goals, or the governing assumptions. The review found the plan was pursuing the wrong objective â†’ feedback revises the plan or the project goals. The structure itself changes.

**Triple-loop feedback** â€” change how the organization learns. The review found that reviews aren't happening â†’ feedback institutes a review cadence and enforcement. The learning process itself is redesigned.

Most organizations stay in single-loop. They get better at executing their current approach but never question whether the approach is right. The operations loop must explicitly support all three loops:

- Single-loop: the session review adjusts task estimates and execution tactics
- Double-loop: the plan review revises plan structure or project goals
- Triple-loop: the system review improves the loop itself (better automation, better tracking, better review protocols)

## Toyota kata: structured improvement

Mike Rother's *Toyota Kata* (2009) reveals that Toyota's continuous improvement is not cultural magic â€” it is a structured practice. The improvement kata has four steps:

1. **Understand the direction** â€” what is the long-term challenge or goal?
2. **Grasp the current condition** â€” what is the actual state right now? (Not what you think it is â€” measure it.)
3. **Establish the next target condition** â€” what specific, measurable state do you want to reach next? Not the final goal, but the next step toward it.
4. **Iterate toward the target** â€” what obstacle is preventing you from reaching the target? What experiment will you run to address it? What did you expect? What happened?

The kata is practiced daily. The coach asks the student the five kata questions. The student answers from their actual work. The iteration is fast â€” daily experiments with immediate measurement.

In practice, the improvement kata maps to session-level feedback. At the end of each session:
1. Direction: what is the project goal?
2. Current condition: what did the session accomplish? What's the plan progress?
3. Next target: what should the next session achieve?
4. Obstacle and experiment: what blocked progress? What should be tried differently?

A session evaluation should produce a structured kata assessment, not just raw activity metrics.

## Adaptive management: learning under uncertainty

C. S. Holling's adaptive management framework (1978), developed for ecological resource management, treats every management action as an experiment. The premise: in complex systems, you cannot predict outcomes with certainty. Therefore, every action should be designed to produce learning, not just results.

Adaptive management has three principles:

**Design actions as experiments.** Every plan should include: a hypothesis (what you expect to happen), a measurement plan (how you'll observe the outcome), and decision criteria (what outcome would cause you to change course).

**Monitor and learn.** Continuous tracking, not just end-of-project review. The system observes outcomes in real time and compares against hypotheses.

**Adjust based on evidence.** When evidence contradicts the hypothesis, change the approach. This is double-loop learning formalized as a management protocol.

In practice: plans should carry hypotheses. A plan's goal states what the plan achieves. An additional hypothesis could state what the plan assumes â€” what conditions must hold for the plan to work. The review stage checks: did the hypothesis hold? If not, the feedback stage adjusts the plan or creates a new one based on what was learned.

## Decision records: embedding learning

Michael Nygard's Architecture Decision Records (2011) provide a lightweight format for capturing decisions with their context, so future agents can understand WHY something was decided, not just WHAT was decided.

An ADR has: title, status (proposed/accepted/deprecated/superseded), context (what forces are at play), decision (what we decided), consequences (what follows from the decision).

Decision records are a feedback artifact. When the review stage identifies a significant learning, the feedback stage produces a decision record explaining the context, the decision, and the consequences. Future agents read the decision record and don't repeat the mistake.

The memory system serves a similar function but is less formal. A decision record is a first-class operational record; a memory is a behavioral hint. Both persist learning, but decision records are auditable and traceable â€” they participate in the work hierarchy (part-of a plan, serves a project) while memories float independently.

## Kaizen: continuous small improvement

Masaaki Imai's *Kaizen* (1986) describes the Japanese philosophy of continuous improvement through small, incremental changes. The key insight: large dramatic improvements (innovation) are rare and risky. Small daily improvements (kaizen) compound over time and are sustainable.

Kaizen principles for feedback:
- **Everyone improves.** Feedback is not the job of a special review team. Every agent, every session, contributes improvements.
- **Small changes preferred.** A one-line hook fix that prevents an error class is more valuable than a grand redesign that never ships.
- **Standardize, then improve.** Before improving a process, standardize it so you can measure the improvement. You can't improve what you can't describe.
- **Gemba â€” go to the source.** Don't analyze from a distance. Read the actual files, run the actual scripts, observe the actual behavior. Then improve.

Applied to session-based work, kaizen means the feedback stage operates at session granularity. Each session identifies one small improvement. The improvement is implemented immediately â€” a term correction, a metadata update, a process refinement. Over time, hundreds of small improvements compound into a qualitatively different system.

## Synthesis: feedback in the operations loop

The feedback stage takes review findings and produces changes:

| Review finding | Feedback action | Loop type |
|---------------|-----------------|-----------|
| Task estimates were wrong | Adjust estimates for similar tasks | Single-loop |
| Plan was structured wrong | Revise plan structure or decomposition | Double-loop |
| Review process missed something | Improve review protocol or hooks | Triple-loop |
| A term was used inconsistently | Define or correct the term in the library | Double-loop |
| An agent lacked necessary capability | Add a skill or update agent definition | Single-loop |
| A policy was violated without detection | Add an enforcement mechanism | Triple-loop |

Feedback produces artifacts: revised plans, new tasks, decision records, updated policies, improved automation, refined terms. Each artifact enters the operations loop as new input â€” the plan gets tracked, the task gets dispatched, the decision record informs future reviews. The loop spirals.
