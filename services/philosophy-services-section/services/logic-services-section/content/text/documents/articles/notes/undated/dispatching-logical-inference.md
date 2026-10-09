---
name: dispatching-logical-inference
description: The bridge between the kind-dispatchers (derivation, inquiry) and the model picker — extracts the skill and prompt from a work item that needs LLM consultation and hands off to the picker.
specializing: logical-inference
composes:
  - dispatching-to-a-logical-inference-model
title: dispatching-logical-inference
---

The narrowing step from "this work item needs inference" to "the dispatch chain should find a model and route." Carries no model-selection logic itself; that is in `dispatching-to-a-logical-inference-model`.
