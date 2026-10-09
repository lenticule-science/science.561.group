---
specialization: serves
---

# serves-system

`serves-system` is the specific predicate for "X serves the computer-system Y." Authors use it instead of bare `serves:` when the served object is a named system (FARS, an engine package, a deployed service, etc.).

The frontmatter declares the specialization morphism: every claim `(X, serves-system, Y)` cascades into the `serves` fiber as `(X, serves, Y)` with the same value. Downstream consumers walking the `serves` fiber pick up both general and specific serving claims uniformly; consumers that care specifically about system-service walk the `serves-system` fiber directly.

Authoring convention: prefer `serves-system:` over bare `serves:` whenever the object is a computer-system. Parallel sibling predicates (`serves-goal`, `serves-plan`, `serves-project`, …) will live in their own term files when they are introduced, each with the same `specialization: serves` declaration.
