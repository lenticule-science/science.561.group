---
title: Decomposing Trace
act: DecomposeTrace
slug: decompose-trace
top: HeadTrace
bottom: TailTrace
summary: Every completed trace splits uniquely into its leading head continuation and the remaining tail continuation, so we witness the recursive trace shape by composing the head and tail recognitions.
tags:
- act
layer: act
status: plan
---
# Decomposing Trace

`StartTrace`, `AdvanceTrace`, `ContinueTrace`, and `CompleteTrace` record how a
trace grows step by step, but nothing yet states the recursive *shape* of an
arbitrary completed trace.  The head–tail recognitions
([HeadTrace](head-trace.md), [TailTrace](tail-trace.md),
[TraceStep](trace-step.md), [ReheadTrace](rehead-trace.md),
[RetailTrace](retail-trace.md)) jointly witness the full record of
[CompleteTrace](complete-trace.md), so letting `HeadTrace` observe `TailTrace`
forces the decomposition of a trace into its left and right predecessors.

The composition `(HeadTrace TailTrace)` carries only previously earned data.
`HeadTrace` isolates the leading orientation of any completed trace while
`TailTrace` isolates the remainder, and the earlier recognitions ensure the tail
re-enters the trace (via `TraceStep`, `RenewTrace`, `ReheadTrace`,
`RetailTrace`) exactly as a shorter trace would.  Therefore
***DecomposeTrace*** witnesses the structural fact that every completed trace
splits into two smaller traces: the head’s continuation and the tail’s
continuation.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
