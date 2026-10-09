---
type: theorem
class: classical
status: informal
depends-on:
  - ../objects/memory-store.md
see-also:
  - memory-superposition-collapse.md
  - no-free-lunch-memory-systems.md
references: []
title: Capacity-retrieval tradeoff
description: "Any memory system trades storage capacity against retrieval accuracy along an information-theoretic frontier: holding the substrate fixed (number of synapses, bits of vector index, dimensions of distributed representation), increasing the…"
---

# Capacity-retrieval tradeoff

## Statement (informal)

Any memory system trades **storage capacity** against
**retrieval accuracy** along an information-theoretic
frontier: holding the substrate fixed (number of synapses,
bits of vector index, dimensions of distributed
representation), increasing the number of stored items
beyond a threshold degrades retrieval — by miss, by
intrusion, or by interference — at a rate that information
theory bounds below.

## The intuition

Suppose the memory substrate has $C$ bits of storage and the
agent stores $N$ items each requiring $b$ bits to specify
uniquely. Three regimes:

- **$N \cdot b \ll C$**: ample headroom; retrieval is
  essentially perfect (subject to noise in the substrate).
- **$N \cdot b \approx C$**: at-capacity regime; retrieval
  starts to confuse items.
- **$N \cdot b \gg C$**: over-capacity regime; the substrate
  cannot uniquely encode all items; retrieval returns
  information-theoretically degraded results.

The transition is not sharp; even before strict capacity
exhaustion, *interference* causes retrieval degradation in
substrates that store distributively (vector spaces, neural
weights).

## Sharpenings in specific substrates

- **Hopfield networks.** A Hopfield network with $n$ neurons
  can store approximately $0.14n$ random patterns reliably.
  Beyond this, stored patterns interfere, and retrieval
  collapses to spurious mixtures (the "blackout
  catastrophe").
- **Modern Hopfield (transformers).** Updated bounds (Ramsauer
  et al. 2020) show modern continuous Hopfield networks
  store exponentially many patterns in the hidden dimension,
  but retrieval probability still degrades smoothly with
  pattern count and noise.
- **Vector index (ANN).** Index recall declines with $N$ at
  fixed compute budget; doubling the number of stored items
  approximately requires doubling lookup time at constant
  recall.
- **LLM weights.** Empirical scaling-law evidence shows
  parametric factual recall scales sublinearly with
  parameter count — past a threshold, additional facts
  *displace* rather than *add to* prior memorization.

## Why it's stated informally

The general statement holds across substrates but the precise
form depends on:
- The substrate's storage scheme (sparse vs distributed,
  fixed-precision vs adaptive).
- The retrieval mechanism (exact match vs nearest neighbor
  vs pattern completion).
- The query distribution (random vs typical vs adversarial).

A *fully general* theorem would have to be parameterized by
all of these. The Hopfield, ANN, and LLM cases are the
precisely-stated specializations.

## Why it matters

The tradeoff is the structural reason that:
- **Forgetting is necessary** — a system that doesn't
  forget eventually exhausts capacity and degrades on all
  retrievals, not just the new ones.
- **Bigger memory ≠ better memory** — naive scale-up of
  storage size hits diminishing returns at the substrate's
  capacity boundary.
- **Hierarchical memory is helpful** — separating frequent
  from infrequent items into different stores allows each
  to operate below its capacity boundary.

It also bounds the asymptotic gains achievable by simply
giving an agent more memory. Past the substrate's frontier,
additional storage requires architectural change, not just
more bits.
