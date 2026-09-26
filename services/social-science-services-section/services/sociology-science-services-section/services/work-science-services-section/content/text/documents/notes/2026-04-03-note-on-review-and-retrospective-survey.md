---
title: "Review and Retrospective: How You Assess What Happened vs. What Was Planned"
date-created: 2026-04-03
description: "How organizations assess outcomes â€” from the US Army's After Action Review through Deming's PDCA to Argyris's double-loop learning, blameless post-mortems, and Haudenosaunee council review."
part-of: ops-research-foundations
references:
  army-aar1993:
    authors: ["US Army"]
    title: "A Leader's Guide to After-Action Reviews"
    publication: "Training Circular 25-20"
    year: 1993
  deming1986:
    authors: ["W. Edwards Deming"]
    title: "Out of the Crisis"
    publication: "MIT Press"
    year: 1986
  argyris-schon1978:
    authors: ["Chris Argyris", "Donald A. SchÃ¶n"]
    title: "Organizational Learning: A Theory of Action Perspective"
    publication: "Addison-Wesley"
    year: 1978
  schon1983:
    authors: ["Donald A. SchÃ¶n"]
    title: "The Reflective Practitioner: How Professionals Think in Action"
    publication: "Basic Books"
    year: 1983
  derby-larsen2006:
    authors: ["Esther Derby", "Diana Larsen"]
    title: "Agile Retrospectives: Making Good Teams Great"
    publication: "Pragmatic Bookshelf"
    year: 2006
  dekker2006:
    authors: ["Sidney Dekker"]
    title: "The Field Guide to Understanding Human Error"
    publication: "Ashgate"
    year: 2006
  cooper1990:
    authors: ["Robert G. Cooper"]
    title: "Stage-Gate Systems: A New Tool for Managing New Products"
    publication: "Business Horizons, 33(3)"
    year: 1990
---

Review is the act of comparing actual outcomes against planned outcomes. It takes what happened and what was supposed to happen and produces a judgment: what went right, what went wrong, and why. Review is where the operations loop learns.

## After Action Review: the Army method

The US Army's After Action Review (AAR) protocol (Training Circular 25-20, 1993) is the most influential structured review format in the world. Developed from Vietnam-era training reforms and formalized at the National Training Center, the AAR asks four questions:

1. **What was supposed to happen?** â€” the plan, the intent, the expected outcome
2. **What actually happened?** â€” observed facts, not opinions
3. **Why was there a difference?** â€” root cause analysis of variance
4. **What can we do better next time?** â€” concrete, actionable improvements

The AAR has strict procedural rules. It happens immediately after the event, not weeks later. All participants contribute, regardless of rank. The focus is on actions and outcomes, not individuals. The facilitator prevents blame and keeps the discussion on what happened and what to change.

The Army discovered that units that do AARs after every significant event improve faster than units that train more but review less. The review IS the learning mechanism. Training without review is practice without correction â€” you might be practicing the wrong thing.

In practice, every work session that does significant work should produce an AAR-structured record. What was the plan? What actually happened? Why the difference? What to change? Automated session logging can capture some of this (what was worked on, what tools were used) but often does not capture variance analysis. A review stage should add: planned work vs. actual work, time spent vs. expected, and concrete adjustments for future sessions.

## PDCA: the Deming cycle

W. Edwards Deming's Plan-Do-Check-Act cycle (1986) is the general form of the review loop:

**Plan** â€” establish objectives and processes needed to deliver results. This is the planning stage.

**Do** â€” implement the plan, execute the processes. This is dispatch + execution.

**Check** â€” monitor and evaluate the processes and results against objectives. This is tracking + review.

**Act** â€” take actions to improve performance based on results. This is feedback.

Deming's insight: the cycle is not a one-time sequence. It is a continuous loop. Each "Act" feeds into the next "Plan." The system improves iteratively. The first cycle is rough â€” the plan is uncertain, execution reveals surprises, the check shows large variances. Each subsequent cycle narrows the variance because previous reviews have identified and addressed the largest sources of error.

In practice, PDCA maps directly onto any operations loop. A six-stage loop (planning, dispatch, execution, tracking, review, feedback) is Plan-Do-Check-Act decomposed into finer stages. It adds dispatch (between Plan and Do) and separates tracking from review (splitting Check into continuous observation and periodic judgment). But the underlying cycle is Deming's.

## Double-loop learning: Argyris and SchÃ¶n

Chris Argyris and Donald SchÃ¶n's *Organizational Learning* (1978) distinguishes two types of learning:

**Single-loop learning** â€” detecting and correcting errors within the current framework. The thermostat detects temperature deviation and adjusts the heater. The review asks: "did we execute the plan correctly?" and adjusts execution tactics. Single-loop learning improves performance within existing assumptions.

**Double-loop learning** â€” questioning and modifying the framework itself. Not "did we execute the plan?" but "was the plan the right plan?" Not "are we building the product right?" but "are we building the right product?" Double-loop learning changes the governing variables â€” the assumptions, goals, and mental models that shape single-loop behavior.

Most organizations do only single-loop learning. They get better at executing their current strategy but never question whether the strategy is right. Argyris identifies "defensive routines" â€” organizational habits that protect current assumptions from examination. Review processes that focus only on execution variance ("why was this task late?") and never on plan quality ("should this task have existed?") are single-loop.

In practice, the review stage must explicitly include both loops. The session review asks: "did the agent do what was planned?" (single-loop). The plan review asks: "was the plan the right plan for this project?" (double-loop). The project review asks: "is this project advancing the goal?" (also double-loop). The feedback stage takes both kinds of findings and routes them appropriately: single-loop findings adjust task execution, double-loop findings adjust plans, projects, or goals.

## The reflective practitioner: SchÃ¶n

Donald SchÃ¶n's *The Reflective Practitioner* (1983) describes how professionals actually learn from experience. The key concepts:

**Knowing-in-action** â€” the knowledge embedded in skilled practice. A doctor who examines a patient is not consciously running through diagnostic algorithms. The knowledge is in the action itself. An agent that has done many similar tasks develops instincts (captured by accumulated experience) that are knowing-in-action.

**Reflection-in-action** â€” thinking about what you're doing while you're doing it. When something unexpected happens, the practitioner pauses, reframes the situation, and adjusts. This is real-time review â€” not waiting for a retrospective but reflecting during execution. Any mechanism that presents an agent with its operational context on every turn (an environment briefing, a dashboard refresh) is a form of reflection-in-action, enabling continuous situation awareness.

**Reflection-on-action** â€” thinking about what you did after the fact. The classic review. This is what AARs, retrospectives, and PDCA's "Check" stage do. The distinction from reflection-in-action: reflection-on-action happens after the work, with the benefit of knowing the outcome.

In practice, both are needed. Reflection-in-action is the per-turn environment awareness. Reflection-on-action is the session review. An agent that only reviews after sessions misses opportunities to correct course during work. An agent that only reflects in-action never steps back to see patterns across sessions.

## Blameless post-mortems

Sidney Dekker's *The Field Guide to Understanding Human Error* (2006) argues that human error is not a cause but a symptom. When something goes wrong, asking "who made the mistake?" produces blame. Asking "what conditions made the mistake likely?" produces learning.

Blameless post-mortems (adopted widely in software engineering from practices at Google, Etsy, and others) follow this principle. The question is never "who is responsible?" but always "what in the system allowed this to happen?" The focus is on systemic factors: missing information, unclear procedures, time pressure, tool failures, communication gaps.

In practice, when an agent produces bad output or goes down the wrong path (e.g., rebuilding functionality that already exists), the blameless question is: "what in the system failed to prevent this?" Often the answer is that the session-start orientation omitted critical context. The fix is systemic (improve onboarding and orientation) not personal (blame the agent).

This principle should be encoded in the review stage. Review records should have a field like `systemic-factor:` that identifies what in the system allowed the problem, not who caused it. The feedback stage then targets the systemic factor for improvement.

## Stage-gate reviews

Robert Cooper's stage-gate model (1990) adds structured checkpoints to project execution. At each gate, the project is evaluated against criteria: is the business case still valid? Are the technical risks manageable? Should we continue, pivot, or kill?

The gate review is different from a retrospective. A retrospective asks "what happened?" A gate review asks "should we continue?" Gates are decision points, not just learning points. They require authority â€” someone must decide go/no-go.

In a work management system, plan milestones serve as stage gates. When a plan reaches a milestone (a recognizable configuration of task completions), a gate review evaluates: is the plan still advancing the project? Should we continue, modify the plan, or abandon it? The review stage should support both retrospectives (learning from what happened) and gate reviews (deciding what happens next).

## Synthesis: review in the operations loop

The review stage takes tracking data (what happened) and plan data (what was supposed to happen) and produces:

1. **Variance analysis** â€” where actual deviated from planned (single-loop)
2. **Root cause analysis** â€” why the variance occurred, focusing on systemic factors
3. **Plan evaluation** â€” whether the plan itself was appropriate (double-loop)
4. **Improvement recommendations** â€” concrete, actionable changes
5. **Gate decisions** â€” whether to continue, modify, or stop

Review produces records. These records feed the feedback stage, which modifies future plans, adjusts processes, updates policies, or redefines terms. The loop closes.

## See also

- [The Ontology of Work Operations](./2026-04-03-note-on-ontology-of-work-operations.md) â€” the base mapping
- [Tracking and Measurement Survey](./2026-04-03-note-on-tracking-and-measurement-survey.md) â€” what review examines
- [Planning and Scheduling Survey](./2026-04-03-note-on-planning-and-scheduling-survey.md) â€” what review evaluates
