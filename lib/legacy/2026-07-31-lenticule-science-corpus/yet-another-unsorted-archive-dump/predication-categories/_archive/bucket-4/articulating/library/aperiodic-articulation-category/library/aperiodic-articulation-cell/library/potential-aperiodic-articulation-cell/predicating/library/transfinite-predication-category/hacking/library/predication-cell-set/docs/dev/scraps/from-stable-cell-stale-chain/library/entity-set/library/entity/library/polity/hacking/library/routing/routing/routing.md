---
name: routing
gerund: routing
agent-noun: router
imperative: route
description: Directing an incoming operation to its correct target location, by permitting, blocking, or redirecting it.
---

A routing transformer. Input is an incoming operation (an attempted tool call, an incoming message, a session event). Output is a routing decision: permit, block with message, or redirect to a named target.

## Domain and codomain

- **Domain:** a routing-spec — a tuple of `(operation-kind, operation-payload)` describing the attempted operation.
- **Codomain:** a routing decision — `permit`, `block-with-message`, or `redirect-to(target)`.

## Morphological forms in naming grammar

- `gerund: routing` heads skills built on this transformer: `routing-a-memory-write`, etc.
- `agent-noun: router` heads agents that invoke such skills: `router-of-a-memory-write`, etc.
- `imperative: route` heads scripts that body such skills: `route-a-memory-write.mjs`, etc.
