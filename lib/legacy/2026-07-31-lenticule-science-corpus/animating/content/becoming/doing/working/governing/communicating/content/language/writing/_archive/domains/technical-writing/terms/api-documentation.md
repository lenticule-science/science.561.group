---
name: "API Documentation"
aliases:
  - "API Documentation"
  - "API documentation"
  - "API docs"
  - "API reference"
date-created: 2026-03-06
tags: []
---

***API documentation*** is reference and instructional writing for application programming interfaces — the surfaces through which software systems communicate. API docs serve developers who need to understand what an API does, how to use it, and what to expect from it.

API documentation typically includes several content types:

- **Reference documentation** — a systematic description of every endpoint, method, parameter, and response. This is the lookup material: what does this function accept, what does it return, what errors can occur. Reference docs are organized for scanning, not reading — developers arrive with a specific question and need to find the answer fast.
- **Guides and tutorials** — narrative documentation that walks the developer through common tasks: authentication, making a first request, handling pagination. These are [procedural documentation](./procedural-documentation.md) for developers, organized by goal rather than by API surface.
- **Code examples** — working code in relevant languages that demonstrates usage. Examples are often the first thing developers look at; many skip the prose entirely and work from examples. Examples that don't work — that contain errors, use deprecated methods, or skip necessary setup — destroy trust.
- **Changelogs and migration guides** — documentation of what changed between versions and how to adapt. Especially important for APIs that external developers depend on.

The primary challenge is keeping documentation current with the code. API docs that are out of date are worse than no docs — they lead developers to write code that doesn't work and waste time debugging problems the documentation caused.

Good API documentation is tested. If the code examples are extracted from the docs and run automatically, they can't drift out of sync with the actual API. If the reference is generated from code annotations, it stays current as the code changes.

## Related terms

- [procedural documentation](./procedural-documentation.md) — API guides are a specialized form of procedural documentation
- [audience](../../../terms/audience.md) — API docs serve developers, whose needs and reading patterns differ from general audiences
- [information architecture](../../../terms/information-architecture.md) — how API docs are organized determines whether developers can find what they need
