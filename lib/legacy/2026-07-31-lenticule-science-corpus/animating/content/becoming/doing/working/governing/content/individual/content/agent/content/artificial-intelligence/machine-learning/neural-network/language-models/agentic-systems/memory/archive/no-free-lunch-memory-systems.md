---
type: theorem
class: classical
status: informal
depends-on:
  - ../objects/memory-store.md
see-also:
  - capacity-retrieval-tradeoff.md
references: []
---

# No free lunch for memory systems

## Statement (informal)

No memory architecture optimizes the four primary axes —
**retrieval accuracy**, **storage capacity**, **query
latency**, and **update cost** — simultaneously. Improvements
on one axis come at the cost of others. The choice of memory
architecture for a given workload is the choice of which
tradeoffs to accept.

## The four axes

- **Retrieval accuracy.** Probability that a query returns
  the relevant item (recall) and that returned items are
  relevant (precision).
- **Storage capacity.** Number of items the system can hold
  per unit of physical storage.
- **Query latency.** Wall-clock time per query.
- **Update cost.** Wall-clock or compute cost to insert,
  delete, or modify an item.

(A fifth axis, **interpretability**, is sometimes included.)

## Tradeoffs across substrates

| Substrate | Accuracy | Capacity | Latency | Update cost |
|---|---|---|---|---|
| Hash table (exact) | perfect | high | $O(1)$ | $O(1)$ |
| Knowledge graph | perfect on schema | high | $O(\log n)$ | low |
| ANN vector index | approximate | high | $O(\log n)$ | medium |
| Hopfield network | approximate | $O(n)$ patterns | $O(n)$ | medium |
| LLM weights | approximate | high (in scale) | $O(1)$ inference | very high (retrain) |
| In-context window | high (within window) | very low | $O(n^2)$ attention | trivial |
| RAG (vector + LLM) | bounded by retrieval | high | retrieval + inference | low (add to index) |

No row dominates all others. Each cell of the table represents
a distinct architectural commitment.

## Why no single optimum

The structural reasons trace to information-theoretic and
algorithmic constraints:

- **Accuracy ↔ capacity.** At fixed substrate, more items
  require more interference, by
  [memory-superposition-collapse](memory-superposition-collapse.md)
  and
  [capacity-retrieval-tradeoff](capacity-retrieval-tradeoff.md).
- **Latency ↔ accuracy.** Approximate-nearest-neighbor
  trades query time for recall; exact retrieval is slower.
- **Update cost ↔ inference latency.** Parametric storage
  (LLM weights) has cheap inference but expensive update;
  external storage (vector index) is the reverse.
- **Capacity ↔ interpretability.** Distributed substrates
  store more per cell but each cell is less interpretable.

## Architectural implications

Production memory systems are *hybrids* combining substrates
to recover good behavior on multiple axes:

- **Cache + cold storage** — frequent items in fast
  substrate, rare items in slow substrate.
- **Parametric + retrieval** — LLM weights for general
  knowledge, vector index for long-tail and recent facts.
- **Working memory + long-term store** — context window for
  current task, external store for cross-session.
- **Symbolic + neural** — knowledge graph for structured
  facts, neural store for unstructured similarity.

The hybrid structure is not a workaround for primitive
substrates; it is the structural response to no-free-lunch.
Even if individual substrates improve, the four-axis tension
remains, and hybrid architectures will continue to dominate.

## Status

Informal but widely accepted. Specific tradeoffs are
quantified per-substrate (Hopfield capacity bounds, ANN
recall-vs-latency curves, LLM scaling laws). The general
"no free lunch" framing organizes the design space.
