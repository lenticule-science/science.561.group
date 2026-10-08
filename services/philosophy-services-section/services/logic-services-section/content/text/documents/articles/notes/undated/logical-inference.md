---
name: logical-inference
description: The image-cell of one inferring-arrow firing — one act of inference produced by an inference-model on a query. The Kleisli-arrow's image as a record carrying the query, the sampled output, the model and the witness signature.
specializing: inference-model
realizes: kleisli-arrow-image
title: logical-inference
---

A **logical-inference** is one act of inference: one sample drawn from the conditional distribution $P(i \mid q)$ by an [inference-model](inference-model.md) on a query $q$. Per the inference-model record's Kleisli-of-distribution-monad framing, an inference-model is a morphism $Q \to T(I)$ in $\mathbf{Set}_T$; a logical-inference is the *image* of one such application — the (query, sampled-output) pair together with the model identifier and the witness signature.

## Why a sub-structure under inference-model

The logical-inference is the codomain of the dispatching-logical-inference morphism — the morphism dispatches one inference act, and that act is the cell that lands in the witness log. Promoting it to its own sub-structure under inference-model/library/ gives the morphism a lawful codomain attachment per the path-alternation rule.

The inference-model itself is *not* the codomain of dispatching-logical-inference; the model is the *intermediary* the dispatch routes through. The codomain — the thing actually produced — is the logical-inference act.

## Distinguishing predication-shape

- `produced-by(logical-inference, inference-model)` — the model that drew the sample.
- `from-query(logical-inference, query)` — the input query.
- `sampled-output(logical-inference, output)` — the conditional sample.
- `at-time(logical-inference, time)` — when the model returned.
- `wire-witness(logical-inference, message-pair)` — references to the sent and received messages.
- `cost(logical-inference, token-count)` — input/output token counts for accounting.

## Not synonymous with

- **Inference-model** — the model is the Kleisli object (the morphism); the logical-inference is the image of one application of the morphism.
- **Turn** — a turn is the session-level pair of messages plus tool calls. A logical-inference is the underlying model invocation; a turn may package multiple logical-inferences when tool calls trigger reasoning loops.
