---
type: example
depends-on: [predication-settling, entity-set, predicate-set, settling-bound, four-bilattice]
instantiates: [predication-settling]
lineage: 1
---

# Trivial predication settling

The entry point of **Lineage 1** — the strict-regime, single-cell example chain. Establishes the vocabulary the rest of the lineage carries: $\mathbf{L} = \mathbf{2}$, $E = \{a\}$ (a single entity), $\Pi = \{P\}$ (a single binary predicate, written uppercase $P$), $\mathcal{C}$ trivial (single object, only identity morphism), values in $\mathbf{FOUR}$.

**Data.** [Entity set](../objects/entity-set.md) $E = \{a\}$. [Predicate set](../objects/predicate-set.md) $\Pi = \{P\}$. [Predicate category](../objects/predicate-category.md) $\mathcal{C}$ discrete (no non-identity morphisms). [Settling bound](../objects/settling-bound.md) $\lambda = 1$. Values in [$\mathbf{FOUR}$](../objects/four-bilattice.md), i.e., $\mathbf{L} = \mathbf{2}$.

**Settling.**
- $v_0(P)(a, a) = \mathbf{t}$.

**Quiescent state.** Vacuously [quiescent](../concepts/settling-quiescence.md) at $\tau = 0$, since $\lambda = 1$.

**Role.** Establishes that the predication-settling definition is non-vacuous. The trivial predication settling is the smallest instance; any simpler would require $|E| = 0$.

## Position in Lineage 1

Lineage 1 builds out the strict-regime / single-cell case across predication categories' chapters. The vocabulary commitment ($\mathbf{L} = \mathbf{2}$, $E = \{a\}$, $\Pi = \{P\}$, $\mathcal{C}$ trivial) is fixed here and reused throughout. The lineage's members in dependency order:

- (this file) — minimal entry; $\lambda = 1$, no closure activity.
- [strict-regime-d-frame-computation](strict-regime-d-frame-computation.md) — the first non-degenerate L1 instance with $\lambda = 2$ and the increment $u_1 = $ told $P(a, a) = \mathbf{t}$. Computes the d-frame $H^0$.
- [strict-regime-verdier-dual](strict-regime-verdier-dual.md) — Verdier dual of the truth-only firing settling.
- [strict-regime-top-firing-verdier-self-dual](strict-regime-top-firing-verdier-self-dual.md) — the L1 self-dual orbit instance ($\top$-firing variant, $u_1 = $ told $P(a, a) = \top$).
- [single-entity-moduli](single-entity-moduli.md) — the L1 instance of the moduli stack at the single-entity base.
- [trivial-base-meta-classification](trivial-base-meta-classification.md) — the L1 instance of the meta-classifier.
- [strict-regime-deformation-tangent](strict-regime-deformation-tangent.md) (forthcoming) — the L1 instance of the deformation tangent computation.

Lineage 1 is *minimal-by-design*: the base is too small for any non-trivial closure dynamics, the cellular fibers are essentially points, and most invariants collapse. This is its role — providing the bare benchmark against which the richer lineages (L2 social-network, L3 natural-number, L4 transfinite-bounded, L5 aperiodic) display their distinguishing structural features.
