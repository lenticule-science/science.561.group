---
identity: inference-as-tool
name: Inference as a Tool
provenance:
  date-created: 2026-01-06
---
When a work chain needs “inference” (reasoning, summarization, planning), treat it as
a tool with a well-specified contract rather than an implicit side-effect.

- **Invocation kinds:** prefer `runtime.invocation: inference` (LLM/human) alongside
  `runtime.invocation: manual` for human-only steps. Use `entrypoint: none` when no
  script exists and the action is conversational.
- **Skill shape:** define inputs/outputs so tool calls can be validated and logged.
  For LLM-backed calls, accept `messages` + `context` and return `text` plus any
  structured fields the chain needs.
- **Routing:** callers supply credentials via headers (e.g., `X-OpenAI-Key`) or
  session context; skills should not embed provider keys.
- **Audit:** log tool calls and results as skill executions, even for inference-only
  steps, to keep chains observable.
- **Fallbacks:** allow manual/human fulfillment by setting `invocation: manual`
  and recording the resulting text in the same output schema.

This keeps inference interchangeable (LLM or human), observable, and composable with
other skills in an [agential semioverse](../../../../../../../../content/text/glossary/topics/agential-semioverse.md).
