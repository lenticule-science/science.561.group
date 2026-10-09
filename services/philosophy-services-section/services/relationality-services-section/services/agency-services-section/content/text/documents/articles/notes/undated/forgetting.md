---
type: morphism
class: classical
status: active
depends-on:
  - ../objects/memory-trace.md
  - ../objects/memory-store.md
see-also:
  - encoding.md
  - retrieval.md
  - rehearsal.md
references: []
title: Forgetting
description: Forgetting is the loss, decay, or erasure of stored memory-traces.
---

# Forgetting

**Forgetting** is the loss, decay, or erasure of stored
[memory-traces](memory-trace.md). It is not a bug
of memory systems but a feature: a system that cannot forget
fills its capacity with irrelevant material and degrades on
retrieval.

## Three forgetting mechanisms

- **Decay.** Trace strength weakens over time absent
  rehearsal. The classical Ebbinghaus forgetting curve
  is exponential decay; in computational memory, decay can
  be implemented as access-count-weighted eviction or
  explicit time-based pruning.
- **Interference.** New traces overwrite or blur older
  ones. *Retroactive* interference: new learning impairs
  retrieval of old. *Proactive* interference: old learning
  impairs encoding of new. In neural networks, interference
  is the substrate of catastrophic forgetting.
- **Active erasure.** The system or its operator deliberately
  removes traces. Right-to-be-forgotten requests, content
  moderation, and scheduled deletion all instantiate this.

## Why forgetting is necessary

A memory system that retains everything and forgets nothing
faces:

- **Capacity exhaustion.** Storage is finite.
- **Retrieval degradation.** Larger stores increase the
  number of false positives at any retrieval threshold.
- **Stale information dominance.** Old items outnumber new
  ones; without decay, retrieval is biased toward stale
  content.
- **Privacy and security risk.** Permanent storage is a
  liability surface.

Forgetting is the architectural mechanism that makes a
memory system sustainable across time.

## Forgetting in different substrates

- **Replay buffer (RL).** Typically FIFO — when buffer is
  full, oldest experience is overwritten. Variants include
  importance-weighted retention (keep high-TD-error
  experiences longer).
- **Vector index.** Forgetting requires explicit deletion;
  no automatic decay. Most production indexes don't forget
  unless instructed.
- **LLM weights.** No fine-grained deletion. Unlearning a
  specific fact from weights is an open problem
  (machine unlearning literature).
- **LLM context window.** Items fall out at window
  boundary; eviction is structural, not chosen.

## Catastrophic forgetting

A particular failure mode of neural networks: training on a
new task can destroy performance on a previously-learned
task. The mechanism: shared weights, optimized for the new
task, no longer support the old.

Mitigations include Elastic Weight Consolidation (penalize
weight changes important to old tasks), generative replay
(rehearse synthetic samples of old task while learning new),
and explicit task-conditional networks. None fully solves the
problem. See [memory-superposition-collapse](memory-superposition-collapse.md)
for the structural reason.

## Selective forgetting as alignment

A relevant alignment-adjacent observation: an agent that can
selectively forget can also be *required* to forget. Privacy
regulations (GDPR right to erasure), content takedowns, and
safety-critical interventions all require the system to drop
specific items. Whether current LLM-agent architectures can
satisfy these requirements is not settled.
