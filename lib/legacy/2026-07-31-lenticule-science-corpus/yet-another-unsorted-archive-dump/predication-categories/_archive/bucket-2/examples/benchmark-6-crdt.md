---
type: example
status: verified
depends-on: [d-frame-cohomology-comparison, four-regime-dichotomy, settling-cohomology, strong-mld-via-composed-duality, crdts-and-calm]
instantiates: [d-frame-cohomology-comparison, four-regime-dichotomy]
lineage: 5
---

# Benchmark 6: CRDT convergence

End-to-end computation conforming to the [computation protocol](../narratives/computation-protocol.md). Tests whether the framework computes useful classification content for **distributed-systems convergence** — specifically, paraconsistent state in CRDT (Conflict-free Replicated Data Type) merging.

Computed via `python3 tools/predication_categories/examples/benchmark_5_epistemic_kripke.py --example three-replica-paraconsistent-merge`.

## Step 1: Specification

Three-replica CRDT system with concurrent conflicting updates:
- **Replicas**: $R = \{r_1, r_2, r_3\}$.
- **Keys**: $\{p\}$ (a single tracked value).
- **Initial operations**:
  - $r_1$: sets $p = \mathbf{t}$ (the value is true).
  - $r_2$: sets $p = \mathbf{f}$ (the value is false — concurrent contradictory update).
  - $r_3$: no operation (state $\bot$).

The corpus encoding: $E = R$, $\Pi = \{p\}$, with the closure rule computing $v(r, p)$ via the bilattice **knowledge-join** (≤_k-lub) over all replicas — the natural CRDT merge for paraconsistent state. The merge produces $\top$ when concurrent values conflict.

This is the canonical CRDT convergence problem: *how does the framework classify a CRDT state where replicas have made concurrent contradictory updates?* The standard CRDT literature treats such a conflict either by tombstoning, by last-writer-wins, or by tracking it as a vector clock conflict. The corpus's framework treats it as a **paraconsistent fact**: the value is $\top$, both true and false simultaneously.

## Step 2: Regime classification

**Strict regime**, $\kappa = 1$. The merge converges in 1 stage: each replica sees the other replicas' values and computes the knowledge-join. After 1 round, all replicas have $p = \top$ (the conflict is propagated and recognized).

3 total firings (one per replica).

## Step 3: $\mathbf{Ab}$-valued cohomology

For a strict-regime settling, $H^0$ is non-trivial (the post-merge state) and $H^{\geq 1} = 0$. The $\mathbf{Ab}$-shadow at $H^0$: each replica has $p$ as "non-bottom" — that's all the shadow can say. The shadow loses the *type* of conflict ($\top$ vs $\mathbf{t}$ vs $\mathbf{f}$).

## Step 4: d-frame cohomology

Per-firing d-frame structure (3 firings):

| firing type | count |
|---|---|
| truth-only ($\mathbf{t}$) | 0 |
| falsity-only ($\mathbf{f}$) | 0 |
| $\top$-firing (paraconsistent) | **3** |
| $\bot$-firing (no info) | 0 |

**All 3 firings are $\top$-firings** — the highest-purity paraconsistent settling in the benchmark suite. Every replica's final value is $\top$, the bilattice's "both true and false" element. The d-frame structure makes the conflict explicit in a way the standard CRDT literature's "vector clock indicates conflict" approach does not.

## Step 5: Verdier dual

Strict regime: $H^1 = H_1 = 0$. Trivial duality.

## Step 6: Strong-MLD orbit type

**Self-dual** orbit, orbit size 1. Per the firing-pattern characterization theorem: every firing is $\top$ (or $\bot$), so the settling is fixed under the composed duality $\mathbb{D} = \mathbb{D}_{\mathrm{sp}} \circ \mathbb{D}_{\mathrm{val}}$. $\mathbb{D}_{\mathrm{val}}$ acts as bilattice negation, which fixes $\top$ canonically.

This benchmark is the suite's **first concrete self-dual orbit case**: a settling where every firing is $\top$, so the framework's strong-MLD classification puts it in the smallest orbit possible (size 1, self-dual).

## Step 7: Literature comparison

CRDT convergence is well-studied; the standard CRDT literature treats concurrent conflicting updates via:
- **Tombstones** (OR-Set, observed-remove): keep history; explicit "removed" markers.
- **Vector clocks**: detect concurrent conflicting updates as incomparable vector-clock states.
- **Last-Writer-Wins (LWW)**: arbitrary resolution by timestamp.
- **Application-defined merge**: domain-specific resolver.

None of these treats the conflict as a *first-class semantic value*. The corpus's framework is closest to **paraconsistent logic** approaches to distributed state (rare in the CRDT literature) — it gives "$p$ is $\top$" as a coherent, propagatable, query-able state.

The framework's framing aligns with formal-methods literature on paraconsistent program semantics (Belnap-Ginsberg) more than with the typical Akka / Riak / automerge CRDT-engineering literature.

## Step 8: What's new

Three concrete findings:

1. **Self-dual orbit type from the CRDT structure**: the conflict-induced $\top$-firings give the settling the "purest" paraconsistent classification possible — every firing is $\top$, the settling is its own composed-duality fixed point. This is the first benchmark case to land in the **paraconsistent stratum** identified in the [strong-MLD theorem](../theorems/strong-mld-via-composed-duality.md).

2. **Strict-regime convergence in 1 step**: CRDT merge is structurally a single-stage operation (knowledge-join over all replicas), so the closure ordinal is minimal. Distinguishes CRDT-flavored settlings from substitution settlings (which have $\kappa = \omega_1$) and from epistemic Kripke frames (which often have $\kappa$ in the $\omega$-range for higher-order knowledge facts).

3. **The framework treats CRDT conflict as a coherent semantic value**, not as an error to be resolved. The paraconsistent value $\top$ propagates through predication categories' closure correctly and admits a well-defined cohomological classification (trivial in this strict-regime case, but the *firing-orbit type* is the substantive content). This suggests an application: CRDT conflict-detection that's typed at the framework level, with $\top$-orbit-self-dual settlings as the "fully-conflicted" classification.

## Acceptance criteria checklist

- [x] **Reproducibility**: regenerable via `python3 tools/predication_categories/examples/benchmark_5_epistemic_kripke.py --example three-replica-paraconsistent-merge`.
- [x] **Triangulation**: bilattice knowledge-join + per-replica state convergence + firing-pattern characterization all consistent.
- [x] **Literature alignment**: classification differs in framing from standard CRDT literature (paraconsistent-typed conflict vs. vector-clock-detection), but doesn't *contradict* it — both correctly identify the same conflict, with different vocabulary.
- [x] **Distinctness or admission**: 3/3 firings are $\top$ — full self-dual orbit. The d-frame structure produces the framework's most-distinctive classification (paraconsistent stratum) on this case. Substantive non-tiling content.
