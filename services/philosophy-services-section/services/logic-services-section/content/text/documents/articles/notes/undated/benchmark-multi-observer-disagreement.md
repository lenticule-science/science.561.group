---
kind: example
status: verified
depends-on: [multi-observer-system, four-bilattice, internal-z2-gauge, four-regime-dichotomy]
instantiates: [multi-observer-system]
title: "Multi-observer benchmark: two observers with bilattice-negated views"
description: "A small concrete case of a multi-observer system: two observers, the same closure rule, but starting from bilattice-negated initial states."
---

# Multi-observer benchmark: two observers with bilattice-negated views

A small concrete case of a [multi-observer system](../../../../glossary/terms/multi-observer-system.md): two observers, the same closure rule, but starting from bilattice-negated initial states. Demonstrates how consensus and disagreement work in the smallest non-trivial setting.

## Setup

- **Base** $B$: $\mathbf{L} = \mathbf{2}$, $E = \{e_1, e_2\}$ (just two entities), $\Pi = \{P\}$, $\mathcal{C}$ discrete, $\lambda = 2$.
- **Observer category** $O$: discrete with 2 objects, $o_+$ and $o_-$. No non-identity morphisms.
- **Closure rule** (shared by both): $\sigma : v(P)(e_1, e_1) = \mathbf{t} \implies v(P)(e_2, e_2) \geq_k \mathbf{t}$.
- **Initial states**:
  - Observer $o_+$ starts with $v_+^{(0)}(P)(e_1, e_1) = \mathbf{t}$ ("evidence is true at $e_1$").
  - Observer $o_-$ starts with $v_-^{(0)}(P)(e_1, e_1) = \mathbf{f}$ ("evidence is false at $e_1$").

The observers see *bilattice-negated* initial states. Each runs the closure rule independently.

## Per-observer settling

**Observer $o_+$**: closure rule fires (antecedent $\mathbf{t}$ is satisfied). Settling:
- $V(o_+)(e_1, e_1) = \mathbf{t}$, $V(o_+)(e_2, e_2) = \mathbf{t}$.
- Other cells $\bot$.

**Observer $o_-$**: closure rule does *not* fire (antecedent $\mathbf{t}$ is not satisfied — the cell value is $\mathbf{f}$, not $\mathbf{t}$). Settling:
- $V(o_-)(e_1, e_1) = \mathbf{f}$, $V(o_-)(e_2, e_2) = \bot$.
- Other cells $\bot$.

The closure rule's *asymmetric* structure (it fires on $\mathbf{t}$ but not on $\mathbf{f}$) means the two observers reach *different settlings* of different complexity: $o_+$ has 2 cells determined; $o_-$ has 1 cell determined.

## Consensus settling

Pointwise bilattice-meet:

| Cell | $V(o_+)$ | $V(o_-)$ | $\mathrm{meet}_k$ |
|---|---|---|---|
| $(e_1, e_1)$ | $\mathbf{t}$ | $\mathbf{f}$ | $\bot$ (no consensus) |
| $(e_2, e_2)$ | $\mathbf{t}$ | $\bot$ | $\bot$ |
| Others | $\bot$ | $\bot$ | $\bot$ |

The consensus settling $V_{\mathrm{cons}}$ is **trivial** — every cell is $\bot$. **The two observers have no common information.**

This is the cleanest possible consensus-failure: bilattice-negated initial states, asymmetric closure rule, observers diverge to non-overlapping settlements.

## Disagreement

For discrete $O$, cohomology $H^1(O, \mathcal{V}) = 0$ formally. Disagreement appears as *pairwise difference*. Per cell:

- $(e_1, e_1)$: observers' values $\mathbf{t}$ vs. $\mathbf{f}$ — fully disagreeing on the truth axis.
- $(e_2, e_2)$: $\mathbf{t}$ vs. $\bot$ — $o_+$ has information $o_-$ lacks.
- Other cells: agreement (both $\bot$).

If we *combine* the two observers' info via the bilattice-join (knowledge join):

| Cell | $V(o_+)$ | $V(o_-)$ | $\mathrm{join}_k$ |
|---|---|---|---|
| $(e_1, e_1)$ | $\mathbf{t}$ | $\mathbf{f}$ | $\top$ (paraconsistent!) |
| $(e_2, e_2)$ | $\mathbf{t}$ | $\bot$ | $\mathbf{t}$ |
| Others | $\bot$ | $\bot$ | $\bot$ |

The join produces a $\top$-cell at $(e_1, e_1)$ — **the disagreement makes the joint state paraconsistent**. This mirrors the corpus's [CRDT benchmark](examples-benchmark-6-crdt.md) where conflicting concurrent updates produce $\top$-state.

So the multi-observer system has:
- *Consensus*: trivial (no shared information, by knowledge-meet).
- *Joint state* (knowledge-join): paraconsistent at the disagreed cell.

These are both real structural objects: consensus is what observers *agree on*, joint state is what they *jointly know including the conflict*.

## Strong-MLD orbit type, per observer

- $V(o_+)$: 2 truth-only firings, conflation-self-dual.
- $V(o_-)$: 1 falsity-only firing (at $(e_1, e_1)$), conflation-self-dual.

Both observers are conflation-self-dual; the multi-observer system inherits conflation-symmetry.

The *negation involution* exchanges $V(o_+)$ with $V(o_-)$ (swapping their initial states). So in the negation-orbit on multi-observer systems, this 2-observer system is *paired with itself* — observe-1-truth-2-falsity is the negation-image of observe-1-falsity-2-truth, but both are this same system viewed from different angles. Negation is a self-action on this 2-observer system.

## What this exhibits

Two findings:

1. **The consensus / join distinction.** Consensus (knowledge-meet) discards conflicts; join (knowledge-supremum) preserves them as $\top$-content. Both are valid multi-observer aggregations; they encode different epistemic stances ("only what we agree on" vs. "everything we together know including conflicts").

2. **Paraconsistency arises naturally from disagreement.** A cell where two observers conflict ($\mathbf{t}$ vs. $\mathbf{f}$) becomes $\top$ in the join — exactly the paraconsistent value the corpus's bilattice was designed for. **The multi-observer setting structurally produces $\top$-content from disagreement.** This is the corpus's most distinctive content (paraconsistent classification) arising from a *purely epistemic* setting — multiple observers, contradictory evidence — not from substitution dynamics or pre-built paraconsistent witness worlds.

## Position in the program

Smallest non-trivial multi-observer benchmark. Demonstrates the framework's content on a 2-observer disagreement: consensus is computable, the join is paraconsistent, the per-observer Klein-four orbit types are well-defined, and the negation involution acts on the multi-observer system as a whole.

Pairs with the [multi-observer-system definition](../../../../glossary/terms/multi-observer-system.md) (formal setup) and the [Kripke benchmark](examples-benchmark-5-epistemic-kripke.md) (which used multi-agent dynamics within a single settling; here we extract the multi-observer structure as a system of independent settlings).

Open extensions:
- **Non-discrete observer category $O$**: 2 observers connected by a settling-morphism, encoding "$o_2$ refines $o_1$." Cohomology $H^1(O, \mathcal{V})$ becomes potentially non-zero.
- **Larger systems**: 3-observer, group-action observer categories.
- **Aperiodic / transfinite multi-observer systems**: each observer runs an aperiodic settling; the per-observer orbit types compose into a multi-observer orbit-type structure.
