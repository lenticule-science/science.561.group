---
type: reference
class: foundational
status: active
authors: ["Zihang Dai", "Zhilin Yang", "Yiming Yang", "Jaime Carbonell", "Quoc V. Le", "Ruslan Salakhutdinov"]
year: 2019
venue: "ACL 2019"
title: "Transformer-XL: Attentive Language Models beyond a Fixed-Length Context"
---

# Dai et al. 2019 — Transformer-XL

Dai, Z., Yang, Z., Yang, Y., Carbonell, J., Le, Q. V., &
Salakhutdinov, R. (2019). Transformer-XL: Attentive Language
Models beyond a Fixed-Length Context. *ACL 2019*.

Transformer-XL extends the effective context of a transformer
language model by introducing *segment-level recurrence*:
hidden states from the previous segment are cached and reused
when processing the next segment, with a relative positional
encoding that supports the cross-segment attention.

The work was an early systematic attempt to address the
*fixed-context-window* limitation of vanilla transformers. It
established that the context-window bound is an
architectural constraint, not a fundamental one, and motivated
subsequent long-context work (Longformer, BigBird, ring
attention, sliding-window variants) that pushed context
windows to millions of tokens. It also implicitly raised
the question — still unresolved — of whether long context is
the right substrate for memory at all, or whether external
memory + short context is the better architecture (see
[why-context-is-not-memory](teaching/explanations/why-context-is-not-memory.md)).

Cited by:
[context-window](../objects/context-window.md),
[context-as-memory](teaching/explanations/context-as-memory.md).
