---
name: inference-model
description: A structure realizing a (stochastic) partial function from a set of queries to a set of inferences. The 561 OS records inference-models for dispatch but does not realize them internally — each record names an external endpoint (provider, URL, adapter, auth) accessed over the wire. Outbound-only in the dispatch graph; the codomain of every inferring morphism.
specializing: system
handed-as: outbound-only
codomain-of-inferring: inferring
references:
  - id: shannon1948
    type: article-journal
    title: A mathematical theory of communication
    volume: 27
    issue: 3
    author:
      - literal: Shannon, Claude E.
    container-title: Bell System Technical Journal
    page: 379-423
    issued:
      - year: 1948
  - id: kleisli1965
    type: article-journal
    title: Every standard construction is induced by a pair of adjoint functors
    volume: 16
    issue: 3
    author:
      - literal: Kleisli, Heinrich
    container-title: Proceedings of the American Mathematical Society
    page: 544-546
    issued:
      - year: 1965
---

An **inference-model** is a structure realizing a partial function $f : Q \to I$ from a set of queries $Q$ to a set of inferences $I$. The function is typically stochastic — for a query $q \in Q$, the model returns a sample from a conditional distribution $P(i \mid q)$ — so an inference-model is most precisely an object of the Kleisli category $\mathbf{Set}_T$ of the distribution monad $T : \mathbf{Set} \to \mathbf{Set}$ [@kleisli1965; @shannon1948]. A morphism $Q \to I$ in $\mathbf{Set}_T$ is a function $Q \to T(I) = $ distributions over $I$; an inference-model is one such morphism, with $Q$ and $I$ fixed by the provider's API contract.

The 561 OS does not realize inference-models internally; each inference-model record names an *external* realization — a provider's hosted endpoint accessed via HTTP. The record carries the endpoint URL, the wire protocol, the authentication environment variable, the adapter module that translates between the OS's query format and the provider's wire format, and the capabilities the model exposes (text-generation, tool-calling, structured-output, reasoning, etc.).

Inference-models are *outbound-only* in the dispatch graph: the OS dispatches queries to them; they cannot initiate work, admit envelopes, or sign witnesses. They are the codomain of every [inferring](../operating-system/library/computer-operating-system/doing/working/inferring/inferring.md) morphism: an inferring step consists of selecting an inference-model whose capabilities cover the work item's needed skill, translating the query through the model's adapter, sending it across the wire, and returning the sampled inference.

The recursive template's library subdir collects specific inference-model instances — one per `(provider, model)` pair. Each instance is its own $thing carrying the same identity files (`_index.md`, `[$slug].md`, `[$slug].schema.json`, `[$slug].jsonl`) plus the instance-specific cells: `provider`, `model-name`, `base-url`, `adapter`, `auth-env-var`, `provides-capabilities`, `rate-limit-rpm`, `context-window-tokens`, and the `skills:` list the dispatcher walks to route work.

## Why "system" and not "operating-system"

An inference-model is a system in the [structure-bearing-a-running-transformer](../system/system.md) sense — the model runs (responds to queries, holds session state at the provider) — but its running happens externally, not at the 561 OS's doing/working/running slot. It is therefore a sibling of [operating-system](../operating-system/operating-system.md) under the system library subdir, not a sub-kind of operating-system. The 561 computer-operating-system *uses* inference-models for dispatch but does not *own* them.
