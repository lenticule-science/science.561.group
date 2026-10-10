---
name: "Code Sample"
aliases:
  - "Code Sample"
  - "code sample"
  - "code example"
  - "code samples"
  - "code examples"
date-created: 2026-03-06
tags: []
---

A ***code sample*** is a piece of working code included in documentation to show the reader how to use an API, library, tool, or language feature. It is the technical writer's equivalent of a worked example — concrete demonstration that grounds abstract description.

Code samples serve two audiences simultaneously: readers who learn by reading (they study the sample to understand the pattern) and readers who learn by doing (they copy the sample, run it, and modify it). Both audiences need the sample to work — a code sample that doesn't run teaches the reader to distrust the documentation.

Effective code samples follow principles from [John Carroll](../../../../general/people/john-carroll.md)'s minimalist documentation research [@carroll1990]:

- **Complete and runnable.** The reader should be able to copy the sample, paste it, and see a result. Samples that require unlisted prerequisites, missing imports, or undeclared variables break trust.
- **Minimal.** The sample should demonstrate one concept. A sample that authenticates, queries a database, transforms the result, and renders HTML is teaching four things at once — and the reader can't tell which part does what.
- **Annotated.** Brief comments or surrounding prose should explain what the code does and why. Not every line needs a comment, but the reader should be able to follow the logic. Comments like "// do the thing" are worse than no comment.
- **Realistic.** The sample should solve a plausible problem. Samples that use variable names like `foo` and `bar` or process meaningless data miss the opportunity to show the reader what the code is for.

Code samples are the most-consulted sections of [API documentation](./api-documentation.md) and [tutorials](./tutorial.md). When developers evaluate a new tool, they often read the code samples before the prose. A documentation set with clear, working samples will be used; one without will be abandoned for Stack Overflow.

## Related terms

- [API documentation](./api-documentation.md) — code samples are the core of API docs
- [tutorial](./tutorial.md) — builds understanding through a sequence of code samples
- [reference documentation](./reference-documentation.md) — typically includes a code sample for each endpoint or method
- [quickstart](./quickstart.md) — often structured as a single, complete code sample with steps
