---
type: example
status: verified
depends-on: [step-n-cohomological-rank-theorem, step-n-substitution-rule, tetranacci-substitution-settling, anderson-putnam-direct-limit, d-frame-cohomology-comparison, verdier-duality-bitopological-site, strong-mld-via-composed-duality, four-regime-dichotomy, step-n-and-bilattice-correspondence]
instantiates: [step-n-cohomological-rank-theorem, d-frame-cohomology-comparison, strong-mld-via-composed-duality, step-n-and-bilattice-correspondence]
title: "Benchmark 4: Tetranacci"
description: End-to-end computation conforming to the computation protocol.
---

# Benchmark 4: Tetranacci

End-to-end computation conforming to the [computation protocol](computation-protocol.md). The **cardinality boundary** case: $n = 4$ is the largest step-$n$ value where the alphabet matches a bilattice substructure cardinality, with the default labeling spanning $\{\bot, \mathbf{t}, \mathbf{f}, \top\}$. This benchmark tests whether the framework's distinctive content (especially the $\bot$-firing) is computationally meaningful at the cardinality boundary.

Computed via `python3 tools/predication_categories/examples/benchmark_1_fibonacci.py --substitution tetranacci`.

## Step 1: Specification

Tetranacci substitution: $\sigma : a \mapsto ab,\, b \mapsto ac,\, c \mapsto ad,\, d \mapsto a$. Substitution matrix $M = \begin{pmatrix} 1 & 1 & 0 & 0 \\ 1 & 0 & 1 & 0 \\ 1 & 0 & 0 & 1 \\ 1 & 0 & 0 & 0 \end{pmatrix}$. Default d-frame valuation: $a \mapsto \bot$, $b \mapsto \mathbf{t}$, $c \mapsto \mathbf{f}$, $d \mapsto \top$. Base $E = \omega_1$, $\Pi = \{P_a, P_b, P_c, P_d\}$, $\lambda = \omega_1 + 1$.

## Step 2: Regime classification

Aperiodic regime, $\kappa = \omega_1$. $M$ is primitive (witness $M^4$); $\det M = -1$ (unimodular); Perron eigenvalue $\approx 1.9276$ — the **tetranacci constant**, Pisot. Characteristic polynomial $\lambda^4 - \lambda^3 - \lambda^2 - \lambda - 1$.

## Step 3: $\mathbf{Ab}$-valued cohomology

By the [step-$n$ cohomological rank theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/step-n-cohomological-rank-theorem.md): $\check{H}^1(\Omega_\sigma) \cong \mathbb{Z}^4$. Smith invariants of $M^T$: $(1, 1, 1, 1)$ — unimodular, no torsion.

## Step 4: d-frame cohomology

Per-letter d-frame structure (with default valuation):

| letter | bilattice value | firing type | $L_+$ rank | $L_-$ rank | consistency |
|---|---|---|---|---|---|
| $a$ | $\bot$ | $\bot$-firing | 0 | 0 | trivial |
| $b$ | $\mathbf{t}$ | truth-only | 1 | 0 | trivial |
| $c$ | $\mathbf{f}$ | falsity-only | 0 | 1 | trivial |
| $d$ | $\top$ | $\top$-firing | 1 | 1 | fails-on-singleton-pair |

Firing-type counts: 1 truth-only, 1 falsity-only, 1 $\top$-firing, **1 $\bot$-firing**.

Shadow comparison: $\mathbb{S}(H^1_{\mathbf{dFrm}}) = (\mathbb{Z}^2, \mathbb{Z}^2)$ — both $b$ and $d$ contribute on truth side; both $c$ and $d$ on falsity side. Per-firing accounting: $1 + 1 + 1 + 1 = 4$ ✓ matches $\mathbf{Ab}$-valued rank $\mathbb{Z}^4$. **The $\bot$-firing on letter $a$ is invisible to the shadow on both sides** — the structural cell with no evidence content. Inclusion-exclusion: $|L_+| + |L_-| - |\top| + |\bot| = 2 + 2 - 1 + 1 = 4$.

## Step 5: Verdier dual

$H_1 = \mathrm{colim}(\mathbb{Z}^n, M)$ has rank 4, det $-1$, Smith invariants $(1, 1, 1, 1)$ — matching $H^1$. Verdier duality $H^1 \cong H_1$ verified.

## Step 6: Strong-MLD orbit type

**Mixed** orbit (both $\top$/$\bot$ symmetric and truth-only/falsity-only asymmetric firings). The $a$-firing ($\bot$) and $d$-firing ($\top$) are individually $\mathbb{D}_{\mathrm{val}}$-fixed; $b, c$ exchange.

Two notions of self-duality both fail:
- (1) Firing-pattern self-duality: false (the truth-only $b$-firing and falsity-only $c$-firing are not individually fixed).
- (2) Substitution-rule self-duality: false. Negation permutation: $a$ fixed, $b \leftrightarrow c$, $d$ fixed. Check $M \cdot P = P \cdot M$ — fails.

## Step 7: Literature comparison

The tetranacci substitution is a well-known step-4 Fibonacci-like substitution with cohomology $\mathbb{Z}^4$ and growth rate the tetranacci constant ($\approx 1.9276$). Agrees with Anderson-Putnam-style computations.

For higher-$n$ comparisons: pentanacci (step-5) gives $\mathbb{Z}^5$ with growth rate $\approx 1.966$ — still Pisot, monotonically increasing toward 2 as $n \to \infty$ per the [critical-exponents-at-step-n-fixed-point theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/critical-exponents-at-step-n-fixed-point.md). Tetranacci sits at the *bilattice cardinality boundary*: $n = 4$ matches $|\mathbf{FOUR}|$. For $n \geq 5$, no bilattice substructure has cardinality $\geq 5$.

## Step 8: What's new

Tetranacci is the **most distinctive case for d-frame content** in the substitution-tilings benchmark batch:

1. **Both $\top$- and $\bot$-firings present**, exhibiting all four firing types simultaneously. Padovan has $\top$ but no $\bot$; Fibonacci has neither. Tetranacci is the smallest named case with the full firing-type taxonomy.

2. **The $\bot$-firing's "invisible to evidence" character**: letter $a$ produces structural cells that contribute nothing to either evidence side under the default labeling. The shadow loses these completely — $\mathbb{S}(H^1_{\mathbf{dFrm}})$ has rank 2 + 2 = 4 in pair-form but the Ab-rank is also 4, with the $\top$-firing's double-counting compensating for the $\bot$-firing's invisibility. This is genuine d-frame content the shadow can't recover.

3. **Cardinality boundary of bilattice correspondence**: at $n = 4$, the alphabet exactly matches $|\mathbf{FOUR}|$. For $n \geq 5$ the cardinality match breaks (per the [step-$n$ / bilattice cardinality coincidence theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/step-n-and-bilattice-correspondence.md)). Tetranacci is *the last* substitution where every bilattice value is represented exactly once in the alphabet.

4. **Substitution-rule self-duality fails**: Tetranacci doesn't have the structural negation-symmetry that Thue-Morse has. The default labeling is a *labeling choice*, not a structural property of the substitution rule — confirming the bilattice-correspondence theorem's open question (no canonical structural correspondence at $n = 4$).

## Acceptance criteria checklist

- [x] **Reproducibility**: regenerable via `python3 tools/predication_categories/examples/benchmark_1_fibonacci.py --substitution tetranacci`.
- [x] **Triangulation**: AP rank theorem + sympy direct-limit + tetranacci-constant Pisot check + inclusion-exclusion arithmetic all consistent.
- [x] **Literature alignment**: agrees with substitution-dynamics treatments of $n$-bonacci constants and their cohomology.
- [x] **Distinctness or admission**: substantive d-frame content via the $\bot$-firing's invisibility and the four-firing-type stratification — content that's specifically novel at this $n$.
