---
name: trace-calculus
kind: text
---

The act-derivation chain leaves [Recognition](../terms/recognition.md) `= (Void SelfNaming)` as the first proper two-place act. From there the chain develops a *trace calculus*: a sequence of acts that build oriented entry, then a structured trace, then head/tail/step decomposition. This text walks the chain in order. Each act is a composition of acts already earned; nothing is posited.

## Entry: pairing the two positions

`Entry = (Recognition Recognition)` — *Recognition* identifies two positions but does not yet describe how they engage. Letting *Recognition* witness itself records how the two positions jointly participate; that is *Entry*.

## Orienting: lead and trail

`LeadEntry = (Entry Recognition)` — *Entry* reveals two positions but is agnostic about which leads. Allowing *Entry* to witness *Recognition* singles out the first position as the leader.

`TrailEntry = (Entry LeadEntry)` — once the leader is identified, the remaining position must be characterized. *Entry* witnessing *LeadEntry* exposes the complementary position; this is the trailing orientation.

## Starting the trace

`StartTrace = (LeadEntry TrailEntry)` — with both orientations established, *LeadEntry* witnessing *TrailEntry* gives the first oriented pairing, marking the beginning of the recorded trace.

## Advancing and continuing

`AdvanceTrace = (TrailEntry Entry)` — *StartTrace* shows how a trace begins but not how it proceeds once the trailing orientation completes. The trailing orientation witnessing *Entry* restarts the act, advancing the trace by one step.

`ContinueTrace = (Entry StartTrace)` — *AdvanceTrace* reconnects the trail to *Entry* but leaves the new leading orientation undefined. *Entry* witnessing *StartTrace* produces the new lead, continuing the trace.

## Completing the trace

`CompleteTrace = (StartTrace AdvanceTrace)` — *ContinueTrace* alone does not record the full trace object. Forcing *StartTrace* to witness *AdvanceTrace* binds the initial step to its progression, yielding the trace object as such.

## Head, tail, step

`HeadTrace = (LeadEntry CompleteTrace)` — *CompleteTrace* captures the trace but leaves the immediate act unspecified. Letting the leading orientation witness the whole trace extracts the head.

`TailTrace = (TrailEntry CompleteTrace)` — once the head is isolated, the remainder must also be named. *TrailEntry* witnessing *CompleteTrace* yields the tail.

`TraceStep = (TailTrace StartTrace)` — even with head and tail, the chain must show how removing the head re-engages the start. *TailTrace* witnessing *StartTrace* produces the step: the unit of trace progression.

## What the trace calculus achieves

By act 25 the chain has produced enough structure to talk about traces as compositional objects: a trace has a beginning, a head, a tail, and an unfolding rule for advancing. Subsequent acts (renew-trace, rehead-trace, retail-trace, restep-trace, bind-trace, assign-trace) build the renewal and binding operations that make the trace usable as a substrate for context. Those continue the chain; this section closes when the trace is canonically decomposable.
