---
type: narrative
discusses: [internal-z2-gauge, negation, four-bilattice, jung-rivieccio-duality, paired-priestley-space, predication-priestley-dual]
---

# The internal $\mathbb{Z}/2$ gauge and the Priestley swap

The bilattice [negation](../morphisms/negation.md) $\sim$ on $\mathbf{L}^\bowtie$ has order 2: applied twice, it returns to identity. As a unary operation on the value space, $\sim$ generates a $\mathbb{Z}/2$-action — the [internal $\mathbb{Z}/2$ gauge](../concepts/internal-z2-gauge.md) of the predication algebra. The non-trivial element acts as $\sim$, the identity as $\mathrm{id}$.

This $\mathbb{Z}/2$-action has a clean structural fingerprint:

- **It preserves the [knowledge order](../concepts/knowledge-order.md) $\leq_k$.** Both "told true" and "told false" sit at $\leq_k$-level $\mathbf{f}$/$\mathbf{t}$ above $\bot$ and below $\top$; swapping them does not move the orbit in the $\leq_k$ direction.
- **It reverses the [truth order](../concepts/truth-order.md) $\leq_t$.** $\mathbf{t}$ and $\mathbf{f}$ are $\leq_t$-extremes; the swap inverts polarity.
- **It fixes the symmetric values $\bot, \top$** — the points carrying no asymmetry between positive and negative evidence.

## The Priestley dual

Under [Jung–Rivieccio duality](../theorems/jung-rivieccio-duality.md), the $\mathbb{Z}/2$-action on $\mathbf{L}^\bowtie$ becomes the *swap involution* on the [paired Priestley space](../objects/paired-priestley-space.md). For [$\mathbf{FOUR}$](../objects/four-bilattice.md) specifically, the Priestley dual is the two-point space $\{+, -\}$ with $\sigma : + \leftrightarrow -$. The $\mathbb{Z}/2$ that lived as an internal operation on $\mathbf{FOUR}$ now lives as a *spatial* involution on the dual.

This is the Stone-dual perspective working as expected: an internal algebraic operation on the algebra side becomes a topological involution on the spatial side. What is distinctive about the bilattice case is that the negation is *not* the lattice complement but a separate algebraic structure — and so the dual swap is not the order-reversal of the underlying Priestley space but a genuinely additional involution. The "paired" in [paired Priestley space](../objects/paired-priestley-space.md) refers exactly to this swap.

## Gauge reading

Calling the action a *gauge* is more than analogy. Like a gauge in physics, it captures a symmetry that the formalism is invariant under but that the underlying values feel. Two valuations related by $\sim$ — same $\leq_k$-content, opposite truth polarity — are gauge-equivalent in the sense that the structural theorems (Frobenius, Beck–Chevalley, residuation) apply to both equally. The gauge does not project out: $\sim$-related cells are genuinely different epistemic states. But the algebraic and dual machinery treats the gauge action as a basic symmetry, much as physics treats electromagnetic gauge.

The Priestley-dual view makes the gauge geometric: the [predication settling Priestley dual](../objects/predication-priestley-dual.md) is a $\mathbb{Z}/2$-equivariant family of paired Priestley spaces, with the swap built into every fiber. Cohomology on this dual carries gauge-equivariant content: the cohomological invariants of the [aperiodic regime](../concepts/aperiodic-settling.md) are computed in this gauge-aware setting.
