---
type: example
status: draft
depends-on: [void-cone-cohomology, four-regime-dichotomy, scott-continuous-closure]
instantiates: [void-cone-cohomology, four-regime-dichotomy]
title: Scott-continuous closure with non-trivial apex of void
description: A countable cell system in the Scott-continuous regime with non-empty $V\infty$.
---

# Scott-continuous closure with non-trivial apex of void

A countable cell system in the Scott-continuous regime with non-empty $V_\infty$. Demonstrates that the "apex of void" invariant $H_0^{\mathrm{apex of Void}}(v) = \mathbb{Z}^{V_\infty}$ is independent of the firing-counting cohomology $\mathrm{gr}(\mathrm{Void}_v)$ — they vanish at different rates.

## Construction

Cell set: $\{c_n : n \in \mathbb{N}\} \cup \{d_n : n \in \mathbb{N}\}$ — two parallel countable chains.

Rules: for each $n \in \mathbb{N}$, the rule

$$R_n: \quad c_n = \mathbf{t} \;\Rightarrow\; c_{n+1} = \mathbf{t}.$$

No rules involve any $d_n$. The two chains are dynamically uncoupled.

Seed: $\{c_0\}$.

## Trajectory

- $v_0 = \{c_0\}$.
- $v_1 = \{c_0, c_1\}$.
- $v_n = \{c_0, c_1, \ldots, c_n\}$.
- $v_\omega = \bigcup_n v_n = \{c_n : n \in \mathbb{N}\}$.
- $T(v_\omega) = v_\omega$ (closure-stable; every $R_n$ already fired).

Closure ordinal $\kappa = \omega$.

## Regime

Scott-continuous: $\kappa = \omega$, with the closure operator commuting with directed colimits ($T$ is finitary — each $R_n$'s antecedent involves a single cell). Per the [four-regime dichotomy](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md), this is the Scott-continuous regime.

## Void cone

- $V_0 = \{d_n : n\} \cup \{c_n : n \geq 1\}$ — uncountably... no, countably infinite.
- $V_n = \{d_m : m\} \cup \{c_m : m > n\}$.
- $V_\omega = \bigcap_n V_n = \{d_n : n \in \mathbb{N}\}$.

So $V_\infty = V_\omega = \{d_n : n \in \mathbb{N}\}$, **countably infinite**.

## Cohomology

**$H^1(\mathcal{F}_v)$.** All firings happen at successor ordinals $\tau = n+1$, the firing of cell $c_{n+1}$ from rule $R_n$. There are no non-Scott-continuous firings: every firing happens at a successor, and the limit step $\tau = \omega$ adds no new content (closure is finitary). So $L_{\mathrm{ns}}(\omega) = \emptyset$.

By the [aperiodic-regime cohomology via direct limit theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-regime-cohomology-via-direct-limit.md) specialized to the Scott-continuous case, $H^1(\mathcal{F}_v) = \bigoplus_{\mu \in L_{\mathrm{ns}}} \mathbb{Z} = 0$.

**$\mathrm{gr}(\mathrm{Void}_v)$.** By the [void-cone (co)homology theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/lorentzian-causal-settling/references/void-cone-cohomology.md), $\mathrm{gr}(\mathrm{Void}_v) \cong \bigoplus_{\mu \in L_{\mathrm{ns}}} \mathbb{Z} = 0$.

So both the apex's first cohomology and the void's associated graded vanish. This matches the prediction: the Scott-continuous regime has trivial firing-counting cohomology.

**$H_0^{\mathrm{apex of Void}}(v)$.** Per the void-cone (co)homology theorem's separate-invariant section:

$$H_0^{\mathrm{apex of Void}}(v) \;=\; \mathbb{Z}^{V_\infty} \;=\; \mathbb{Z}^{\{d_n : n \in \mathbb{N}\}} \;\cong\; \bigoplus_{n \in \mathbb{N}} \mathbb{Z}.$$

A free abelian group on countably many generators — substantially non-trivial.

## What this shows

The two invariants are **structurally orthogonal**:

| Invariant | Counts | Value here |
|---|---|---|
| $H^1(\mathcal{F}_v)$ | NSC firings | $0$ |
| $\mathrm{gr}(\mathrm{Void}_v)$ | cells leaving the void at NSC firings | $0$ |
| $H_0^{\mathrm{apex of Void}}(v)$ | cells permanently $\bot$ | $\bigoplus_\mathbb{N} \mathbb{Z}$ |

The Scott-continuous regime has trivial firing-counting cohomology (the regime's defining property). But the apex-of-void can be arbitrarily rich, recording cells that the closure simply never reaches — here, an entire parallel countable chain.

This dispels a possible reading of the regime classification: that "Scott-continuous regime" means "all cohomology trivial." It only means "*firing-counting* cohomology trivial." The apex-of-void carries independent structural information.

## Why this matters

Two structural points:

1. **Two-axis cohomology.** The corpus's cohomological invariants split into two independent axes: firing-counting (trivial in strict and Scott-continuous regimes; non-trivial in transfinite-bounded and aperiodic) and apex-of-void (independent of regime, can be non-trivial anywhere). The full cohomological description of a settling needs both.

2. **Detecting structural decoupling.** Non-trivial $H_0^{\mathrm{apex of Void}}$ in the Scott-continuous regime is a signal of structural decoupling — cells whose dynamics are entirely independent of the seed-derived part. This is the cohomological imprint of "uncoupled subsystems" in the closure-rule structure.

## Variants

- **Stochastic uncoupled chain.** Replace the bilattice values with stochastic: $v(c_n) = $ probability of being at $c_n$. The same structure holds, with $V_\infty$ = cells with zero probability. By the [value-agnostic-void-cone theorem](../../research/2026/07/31/lenticule-import/theorems/value-agnostic-void-cone.md), the apex-of-void analysis transfers.

- **Lawvere quantale uncoupled chain.** Replace with shortest-path. $V_\infty$ = pairs with infinite distance. Same orthogonal apex-of-void / firing-counting structure.

- **Disconnected-graph void-cone benchmark** in `tools/predication_categories/theorems/void_cone_associated_graded_direct.py/` is the strict-regime ($n = 5$) finite analog of this construction. It shows $|V_\infty| = 16$ across all four value categories with $H^1 = $ trivial — confirming the orthogonal-axis behavior persists in the strict case.

## Position in predication categories

Concrete witness that the [void-cone (co)homology theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/lorentzian-causal-settling/references/void-cone-cohomology.md)'s "apex of void" invariant is independent of the firing-counting cohomology, even within a single regime. Suggests the cohomological description should be presented as a **pair** $(\mathrm{firings}, V_\infty)$ rather than a single number, with the regime classification controlling only the first component.

Open downstream:

- *Apex-of-void by regime*: cataloging $V_\infty$ structures across the four regimes. The aperiodic regime canonically has $V_\infty = \emptyset$ (substitution fills everything); the other three regimes can have $V_\infty$ arbitrarily large.
- *Apex-of-void cohomology*: $V_\infty$ as a sheaf in its own right (with restriction maps from the predicate / settling structure on the ambient site). Whether $V_\infty$ has non-trivial higher cohomology — perhaps recording the "shape" of structural decoupling — is open.
