---
name: validate-trace-universe-axioms
id: validate-trace-universe-axioms
description: Validate the toy GFRTU against its axioms and fixed fibers. Use when
  checking consistency of a trace universe model.
type: learn
authors:
- gpt-5.2-codex
date-created: 2025-12-26
tags: []
runtime:
  invocation: inference
  tool: llm
part-of: mathematics/objects/universes/generative-fibered-recognition-trace-universe
region:
  reads: ["content/mathematics/objects/universes/generative-fibered-recognition-trace-universe/"]
  writes: ["content/mathematics/objects/universes/generative-fibered-recognition-trace-universe/"]
title: validate-trace-universe-axioms
---
- Confirm the trace category is small and finite.
- Confirm each fiber is a [Heyting algebra](../../../../../concepts/heyting-algebra/index.md).
- Confirm stabilizer and drift are monotone and commute.
- Confirm fixed fibers match the toy model.
- Confirm the closure sequence matches the golden output.
