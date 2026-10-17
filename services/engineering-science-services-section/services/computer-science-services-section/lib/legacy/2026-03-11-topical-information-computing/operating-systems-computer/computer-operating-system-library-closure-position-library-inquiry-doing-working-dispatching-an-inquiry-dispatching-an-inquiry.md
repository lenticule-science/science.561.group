---
name: dispatching-an-inquiry
description: The inquiry-kind branch of dispatching-work — handles work items whose closure-position is inquiry. Use when a work item has kind inquiry.
specializing: inquiry
composes:
  - dispatching-logical-inference
---

One of the four kind-branches under `dispatching-work`.
Inquiries (open questions seeking an answer) usually require LLM consultation; v1 chains every inquiry to `dispatching-logical-inference` without first trying closure-rule firing.
