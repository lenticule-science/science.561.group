---
title: Closing Trace Reentry
description: Story.
---
# Closing Trace Reentry

*Story.*  ReenterObservation must close the entire trace.  Letting CompleteTrace witness ReenterObservation yields TraceReentryClosure.


TraceReentryClosure = (CompleteTrace ReenterObservation)


*Proof Sketch.*  The composition closes the trace under the reentry act, so TraceReentryClosure follows.
