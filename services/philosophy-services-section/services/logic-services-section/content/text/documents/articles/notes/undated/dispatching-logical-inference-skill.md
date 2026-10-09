---
name: dispatching-logical-inference
description: Takes a work item that has been determined to need LLM consultation and routes it through the model picker. Use when dispatching-a-derivation or dispatching-an-inquiry has decided the work item cannot settle without external inference.
title: dispatching-logical-inference
---

## Requirements

- The work item carries a `skill:` field naming which skill is needed (e.g. `closing-a-question`).
- The work item carries a `prompt:` field with the text to send to the model. (If absent, the skill builds a default prompt from the target cell's body and depends-on neighborhood; v1 requires `prompt:` be supplied.)

### Inputs

- `workItem` — object with at minimum `{ skill, prompt, target }`. May carry `maxTokens` and other model parameters.

## Steps

1. Read `workItem.skill` and `workItem.prompt`.
2. Call `dispatching-to-a-logical-inference-model` with `{ skill, prompt, maxTokens }`.
3. Return the response cell, augmented with `target` and the source `workItem.skill` so the upper kind-dispatcher can decide where to write the response.

## Outcomes

- On success: a response cell `{ model, provider, text, sent-at, received-at, matched-skill, target }` returned to the calling kind-dispatcher.
- On no-match (no model advertises the needed skill): error propagated up. Caller decides whether to wait, broaden the search, or fail the work item.
