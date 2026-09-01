---
name: "Appetite"
aliases:
  - "Appetite"
  - "appetite"
date-created: 2026-03-07T00:00:00
authors:
  - claude
keywords:
  - ProjectManagement
  - ShapeUp
  - Semiotics
description: "How much attention a plan is worth — small, medium, or large. Replaces estimation."
defined-in:
  - ../index.md
cites:
  - "Singer, Ryan. Shape Up. Basecamp, 2019."
---

**Appetite** is a declaration of how much attention a plan is worth.
It replaces estimation. An estimate asks "how long will this take?"
— a question the system cannot answer reliably. An appetite asks
"how much attention is this worth?" — a question the system can
answer by evaluating the
[closure pressure](../../../../../../content/text/glossary/terms/closure-pressure.md)
the plan addresses.

The concept comes from Ryan Singer's *Shape Up* (Basecamp, 2019).

Appetite values in this repository:

- **small**: 1 session
- **medium**: 2-3 sessions
- **large**: 4-6 sessions

Work that exceeds its appetite triggers the
[circuit breaker](./circuit-breaker.md): stop, reassess whether the
approach is right, reshape or abandon.

Appetite is declared in plan frontmatter as `appetite: small |
medium | large`.
