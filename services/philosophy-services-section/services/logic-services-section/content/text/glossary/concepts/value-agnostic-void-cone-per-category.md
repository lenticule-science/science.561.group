---
kind: theorem
status: proved
depends-on: [value-agnostic-void-cone, void-cone-associated-graded-direct, four-bilattice, stochastic-settling, lawvere-laplacian-grothendieck-sites, lorentzian-causal-settling, continuous-valued-settling]
title: Value-agnostic void cone — per-category construction
description: Alternative proof of the value-agnostic void cone theorem via independent per-category proofs (bilattice, stochastic, Lawvere quantale, Boolean Lorentzian) followed by unification.
---

# Value-agnostic void cone — per-category construction

Alternative proof of the [value-agnostic void cone theorem](value-agnostic-void-cone.md) via independent per-category proofs (bilattice, stochastic, Lawvere quantale, Boolean Lorentzian) followed by unification. Where the original cross-category structural argument abstracts the shared structure first and instantiates afterward, this path proves each instance independently and only then identifies the common pattern.

## Proof

The four instances share a template: $(\mathcal{V}, \leq_T, \mathbf{0}_\mathcal{V}, T_\mathcal{V})$ where $\leq_T$ is closure-monotonic, $\mathbf{0}_\mathcal{V}$ is the $\leq_T$-bottom, and $T_\mathcal{V}$ is support-respecting. We prove the descent + pairing in each instance, then unify.

### Instance 1: Bilattice ($\mathcal{V} = \mathbf{FOUR}$)

- Closure-monotonic order: $\leq_k$ (knowledge order), with $\bot$ at bottom.
- Closure-trivial element: $\mathbf{0}_\mathcal{V} = \bot$.
- Closure operator: $T_k$ for any $\leq_k$-monotone, inflationary closure.

**Descent.** $T_k$ inflationary in $\leq_k$, so $v_\tau \leq_k v_{\tau+1}$ pointwise. If $v_{\tau+1}(s,o) = \bot$, then $v_\tau(s,o) \leq_k \bot$, so $v_\tau(s,o) = \bot$. Hence $V_{\tau+1} \subseteq V_\tau$.

**Pairing.** Each NSC firing $\mu \in L_{\mathrm{ns}}(\kappa)$ adds one cell, contributing one $\mathbb{Z}$-summand to both apex $H^1$ and void's associated graded. By [void-cone associated graded direct](void-cone-associated-graded-direct.md), the pairing is canonical at the chain level.

This is the original case, proved independently. $\square$ (Instance 1)

### Instance 2: Stochastic ($\mathcal{V} = [0,1]$)

- Closure-monotonic order: $0 \leq_T x \leq_T 1$ — values increase under closure (transition probabilities can only grow).
- Closure-trivial element: $\mathbf{0}_\mathcal{V} = 0$.
- Closure operator: $T_{\mathrm{stoch}}(v)(s, o) = \max(v(s, o), \max_z P(s, z) \cdot v(z, o))$ — Bellman-flavored relaxation.

**Descent.** $T_{\mathrm{stoch}}$ is non-decreasing in cell values: $v_\tau \leq_T v_{\tau+1}$ pointwise. If $v_{\tau+1}(s,o) = 0$, then $v_\tau(s,o) \leq 0$, forcing $v_\tau(s,o) = 0$ (in $[0,1]$). Hence $V_{\tau+1} \subseteq V_\tau$.

**Support-respecting.** $T_{\mathrm{stoch}}$ applied to all-zero presheaf: every term in the max is zero, so output is zero. ✓

**Pairing.** A cell $(s, o)$ leaves the void at firing $\mu$ iff $v_\mu(s, o) > 0$ for the first time. The firing-counting cohomology has one generator per such event. The pairing with apex side follows the same chain-level bijection as Instance 1.

For the empirical verification, see [the cross-instance comparison tool](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/tools/void-cone-comparison) — the stochastic settling on a 4-vertex graph gives $|V_\infty| = 8$ (matches bilattice) and 1 firing. $\square$ (Instance 2)

### Instance 3: Lawvere quantale ($\mathcal{V} = [0, \infty]$)

- Closure-monotonic order: $a \leq_T b \iff a \geq b$ (smaller distance is closer to the trivial element). Note the *reversed* natural order.
- Closure-trivial element: $\mathbf{0}_\mathcal{V} = \infty$ (no path = no closure-content).
- Closure operator: $T_{\mathrm{Lawv}}(v)(s, o) = \min(v(s, o), \min_z [v(s, z) + v(z, o)])$ — Bellman-Ford.

**Descent.** $T_{\mathrm{Lawv}}$ takes finite distances to (smaller or equal) finite distances, but cannot create infinity from finite — once a cell is finite-valued, it stays finite. So $V_\tau \supseteq V_{\tau+1}$ as cell sets. (Note: $\leq_T = \geq$ in the natural order, so $\leq_T$-bottom is $\infty$, and $\leq_T$-monotonicity reads as $T(v)(s,o) \leq v(s,o)$ in natural order, which is correct for shortest-path computation.)

**Support-respecting.** $T_{\mathrm{Lawv}}$ on the all-$\infty$-off-diagonal presheaf: $\min$ of $\infty$ values is $\infty$. ✓

**Pairing.** A cell leaves the void when its distance becomes finite. Firings add one generator per first-finite event. The pairing structure transfers.

Verified by the cross-instance tool: Lawvere settling on the 4-vertex graph also gives $|V_\infty| = 8$ and 1 firing. $\square$ (Instance 3)

### Instance 4: Boolean Lorentzian ($\mathcal{V} = \{0, 1\}$)

- Closure-monotonic order: $0 \leq_T 1$, the standard Boolean order.
- Closure-trivial element: $\mathbf{0}_\mathcal{V} = 0$.
- Closure operator: transitive closure of the seed causal-precedence relation.

**Descent and pairing.** Identical to Instance 1 (bilattice) restricted to $\{0,1\} \subset \mathbf{FOUR}$. The Boolean case is the most structural, with no value-category subtleties.

The [Lorentzian apex/void = timelike/spacelike theorem](lorentzian-apex-void-as-timelike-spacelike.md) gives the physical interpretation. $\square$ (Instance 4)

### Unification

Comparing the four instances:

| Instance | $\mathcal{V}$ | $\leq_T$ | $\mathbf{0}_\mathcal{V}$ | Closure |
|---|---|---|---|---|
| Bilattice | $\mathbf{FOUR}$ | knowledge order | $\bot$ | $T_k$ |
| Stochastic | $[0,1]$ | natural order | $0$ | matrix-style |
| Lawvere | $[0,\infty]$ | reversed natural | $\infty$ | Bellman-Ford |
| Lorentzian | $\{0,1\}$ | natural order | $0$ | transitive closure |

The four proofs share a **uniform structural skeleton**:
1. $T_\mathcal{V}$ is $\leq_T$-monotone and $\leq_T$-inflationary (modulo the order convention).
2. $T_\mathcal{V}$ is support-respecting.
3. The void $V_\tau = \{c : v_\tau(c) = \mathbf{0}_\mathcal{V}\}$ is descending under $\tau$.
4. The associated graded $\mathrm{gr}(\mathrm{Void}) = \bigoplus_\mu \mathbb{Z}$ is indexed by firing events.

Abstracting these four shared properties gives the value-agnostic statement: any $(\mathcal{V}, \leq_T, \mathbf{0}_\mathcal{V}, T_\mathcal{V})$ satisfying (1)–(4) yields the same descent and pairing structure.

The value-category-specific data (which order, which bottom, which closure formula) doesn't affect the cohomological conclusions — only the *combinatorial structure* of "cells leaving the void at firings" matters. $\square$

## What this path adds

The original [value-agnostic theorem](value-agnostic-void-cone.md) abstracts first and applies later. This path:

- **Verifies each instance independently.** Bilattice, stochastic, Lawvere, Lorentzian each have proved descent and pairing in their own terms.
- **Surfaces the abstraction.** The four proofs are *visibly* the same up to value-category translation. The unification is empirical (per-instance proofs match) plus structural (shared template).
- **Provides empirical cross-checks.** The [cross-instance comparison tool](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/tools/void-cone-comparison) verifies the four instances agree on $V_\infty$ and fired-cell sets across 5 graphs. Concrete data behind the abstract claim.

The trade-off: this path is more verbose than the original abstract version, but more directly verifiable and more concretely tied to applications.

## Position in the program

Companion proof to the [value-agnostic theorem](value-agnostic-void-cone.md). The two together establish the cross-category void-cone unification on two foundations:

- **Abstract foundation** (original): one structural argument with parameterized value category.
- **Concrete foundation** (this): four independent proofs with explicit unification.

For downstream uses involving specific value categories (stochastic-belief settlings, causal-set physics), the per-category form is the natural reference. For abstract structural reasoning across value categories, the original is more compact.

A third path — [axiomatic minimality](value-agnostic-void-cone-axiomatic.md) — extracts the minimal axioms on $(\mathcal{V}, \leq_T, \mathbf{0}_\mathcal{V}, T_\mathcal{V})$ that make the theorem hold. That gives the cleanest statement of *what structure is genuinely needed* for the value-agnostic form.
