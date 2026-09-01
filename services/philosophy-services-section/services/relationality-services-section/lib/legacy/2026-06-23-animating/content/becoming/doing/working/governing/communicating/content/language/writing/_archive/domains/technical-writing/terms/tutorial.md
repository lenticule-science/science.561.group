---
name: "Tutorial"
aliases:
  - "Tutorial"
  - "tutorial"
  - "tutorials"
date-created: 2026-03-06
tags: []
---

A ***tutorial*** is a document that teaches the reader how to do something by walking them through a complete, worked example. It differs from [procedural documentation](./procedural-documentation.md) in its purpose: procedural documentation helps the reader complete a task they already understand; a tutorial teaches the reader a skill they don't yet have.

The distinction matters because it changes what the writer must provide. Procedural documentation can assume the reader knows why they're performing each step; a tutorial cannot. The tutorial must explain not just *what* to do but *why* — building the reader's understanding so they can eventually work without the tutorial.

[John Carroll](../../../../general/people/john-carroll.md)'s minimalist documentation research found that learners prefer to start doing things immediately rather than reading background material first [@carroll1990]. This means tutorials should get the reader into action quickly — "create a file called X and add the following code" — and introduce concepts as they become relevant rather than front-loading theory.

Effective tutorials follow a consistent pattern:

- **State the learning goal** — what the reader will be able to do after completing the tutorial.
- **State prerequisites** — what the reader needs to know or have installed before starting.
- **Build incrementally** — each section adds one new concept or technique to what the reader already has working. The reader should have something that works at each stage, not just at the end.
- **Show expected results** — after each significant step, show the reader what they should see. This confirms they're on track and builds confidence.
- **Explain the "why"** — briefly, after each step. Not before (which delays action) and not at length (which loses momentum), but enough that the reader builds understanding alongside skill.

The tutorial's greatest risk is the "happy path" problem: the tutorial works perfectly when followed exactly but gives the reader no help when they deviate. Including a troubleshooting section for common problems — and explaining *why* those problems occur — makes the tutorial robust.

## Related terms

- [procedural documentation](./procedural-documentation.md) — tells the reader how; a tutorial teaches the reader why and how
- [minimalism](../../../terms/minimalism.md) — Carroll's principle of getting the reader into action immediately
- [cognitive load](../../../terms/cognitive-load.md) — tutorials manage load by introducing concepts incrementally
- [progressive disclosure](../../../terms/progressive-disclosure.md) — tutorials reveal complexity gradually
