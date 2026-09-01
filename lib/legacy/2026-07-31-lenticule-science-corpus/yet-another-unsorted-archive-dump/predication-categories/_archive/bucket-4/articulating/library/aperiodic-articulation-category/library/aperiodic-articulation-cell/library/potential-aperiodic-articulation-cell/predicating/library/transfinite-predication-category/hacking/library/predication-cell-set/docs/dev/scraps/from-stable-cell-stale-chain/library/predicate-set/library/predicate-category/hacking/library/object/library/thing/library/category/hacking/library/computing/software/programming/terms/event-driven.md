---
part-of:
  - paradigms

name: "event-driven programming"
description: "Event-driven programming is a [programming paradigm](../_index.md) in which the flow of execution is determined by events -- signals that something has happened -- rather than by a predetermined sequence of instructions. The program defines handlers (also called listeners or callbacks) that respond to specific events, and an event loop dispatches events to the appropriate handlers as they arrive."
aliases:
  - "event-driven programming"
  - "event-driven"
  - "event-driven architecture"
date-created: 2026-01-01
tags: []
---

Event-driven programming is a [programming paradigm](../_index.md) in which the flow of execution is determined by events -- signals that something has happened -- rather than by a predetermined sequence of instructions. The program defines handlers (also called listeners or callbacks) that respond to specific events, and an event loop dispatches events to the appropriate handlers as they arrive.

This paradigm fits problems where the program must react to unpredictable external input: user interactions (mouse clicks, key presses), network messages, sensor readings, or timer expirations. Rather than polling for changes in a loop, an event-driven program registers its interest in particular events and waits.

Most graphical user interfaces are built on event-driven principles. When a user clicks a button, the operating system generates a click event; the application's event loop receives it and calls the handler bound to that button. JavaScript in the browser follows this model: the DOM exposes events, and developers attach listeners to respond to them.

Event-driven architecture also appears at the system level. Message queues, publish-subscribe systems, and reactive streams all organize computation around events flowing between producers and consumers. In these architectures, components communicate by emitting and handling events rather than by calling one another directly, which can reduce coupling between parts of a system.

The main challenge of event-driven programming is control flow. Because execution jumps between handlers in response to external stimuli, the program's behavior can be harder to trace than in sequential code. Callback chains, race conditions, and ordering dependencies require careful design.

