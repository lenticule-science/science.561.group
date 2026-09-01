---
kind: example
status: verified
depends-on: [step-n-cohomological-rank-theorem, step-n-substitution-rule, fibonacci-substitution-settling, anderson-putnam-direct-limit, d-frame-cohomology-comparison, verdier-duality-bitopological-site, strong-mld-via-composed-duality, four-regime-dichotomy]
instantiates: [step-n-cohomological-rank-theorem, d-frame-cohomology-comparison, verdier-duality-bitopological-site, strong-mld-via-composed-duality]
---

# Benchmark 1: Fibonacci

End-to-end computation conforming to the [computation protocol](../narratives/computation-protocol.md). The simplest aperiodic case in the corpus's framework — a regression test for the toolchain.

Computed via `python3 tools/run-benchmark/run.py --substitution fibonacci`.

## Step 1: Specification

Fibonacci substitution: $\sigma : a \mapsto ab,\, b \mapsto a$. Substitution matrix $M = \begin{pmatrix} 1 & 1 \\ 1 & 0 \end{pmatrix}$ (rows = input letter, columns = letters in $\sigma(\text{input})$). Base $E = \omega_1$, $\Pi = \{P_a, P_b\}$, $\mathcal{C}$ discrete on $\{P_a, P_b\}$, $\lambda = \omega_1 + 1$. Default d-frame valuation: $a \mapsto \mathbf{t}$, $b \mapsto \mathbf{f}$.

## Step 2: Regime classification

Aperiodic regime, $\kappa = \omega_1$. $M$ is primitive (witness $M^2$ strictly positive); $\det M = -1$ (unimodular); Perron eigenvalue $\phi = (1 + \sqrt{5})/2 \approx 1.618$, Pisot. Characteristic polynomial $\lambda^2 - \lambda - 1$.

## Step 3: $\mathbf{Ab}$-valued cohomology

By the [step-$n$ cohomological rank theorem](../theorems/step-n-cohomological-rank-theorem.md): $\check{H}^1(\Omega_\sigma) \cong \mathbb{Z}^2$. Smith invariants of $M^T$: $(1, 1)$ — unimodular, no torsion. Two generators corresponding to the two letter types $\{a, b\}$.

## Step 4: d-frame cohomology

Per-letter d-frame structure (with default valuation):

| letter | bilattice value | firing type | $L_+$ rank | $L_-$ rank | consistency |
|---|---|---|---|---|---|
| $a$ | $\mathbf{t}$ | truth-only | 1 | 0 | trivial |
| $b$ | $\mathbf{f}$ | falsity-only | 0 | 1 | trivial |

Firing-type counts: 1 truth-only, 1 falsity-only, 0 $\top$-firings, 0 $\bot$-firings.

Shadow comparison: $\mathbb{S}(H^1_{\mathbf{dFrm}}) = (\mathbb{Z}^1, \mathbb{Z}^1)$ — one generator per evidence side. Per-firing accounting: $1 + 1 + 0 + 0 = 2$ ✓ matches $\mathbf{Ab}$-valued rank $\mathbb{Z}^2$. No $\top$- or $\bot$-firings, so the shadow is exactly the $\mathbf{Ab}$-valued split.

## Step 5: Verdier dual

$H_1 = \mathrm{colim}(\mathbb{Z}^n, M)$ has rank 2, det $-1$, Smith invariants $(1, 1)$ — same as $H^1$. Verdier duality $H^1 \cong H_1$ verified at the $\mathbf{Z}$-module level.

## Step 6: Strong-MLD orbit type

**Exchange-mixed** orbit, orbit size 2 under $\mathbb{D}$. The settling pairs with its bilattice-negated counterpart (same firing-ordinal set, but truth-only and falsity-only firings exchanged).

Two notions of self-duality both fail:
- (1) Firing-pattern self-duality: false — firings are not all $\top$ or $\bot$.
- (2) Substitution-rule self-duality: false — $M$ does not commute with the negation-induced alphabet swap. Concretely: $M \cdot \mathrm{swap} \neq \mathrm{swap} \cdot M$.

## Step 7: Literature comparison

Agrees with [@anderson-putnam1998] and the substitution-tilings literature: $\check{H}^1(\Omega_\sigma) \cong \mathbb{Z}^2$ for the Fibonacci substitution. The corpus's framework recovers this via the [step-$n$ cohomological rank theorem](../theorems/step-n-cohomological-rank-theorem.md) reduction to AP. The Smith-invariant data $(1, 1)$ matches the unimodular nature of the Fibonacci substitution matrix.

## Step 8: What's new

The d-frame structure adds **per-firing evidence-side classification** beyond the $\mathbf{Ab}$-valued shadow: each generator of $H^1$ is tagged as a truth-side or falsity-side firing. This is concrete content the shadow loses — though for Fibonacci specifically, the per-side rank ($\mathbb{Z}^1, \mathbb{Z}^1$) is just the partition of the $\mathbf{Z}^2$ generators by letter type.

The strong-MLD orbit-type analysis confirms Fibonacci is in a non-trivial $\mathbb{D}$-orbit (size 2, paired with its negation). **Fibonacci does not exhibit substitution-rule self-duality** — distinguishing it cleanly from Thue-Morse (benchmark 2), the only named step-2 case where $M$ commutes with the negation-induced alphabet swap.

The framework's distinctive contribution on Fibonacci is therefore minimal at the cohomological level (matches AP) but real at the orbit-classification level (distinguishes Fibonacci from negation-symmetric step-2 substitutions).

## Acceptance criteria checklist

- [x] **Reproducibility**: regenerable via `python3 tools/run-benchmark/run.py --substitution fibonacci`.
- [x] **Triangulation**: AP rank theorem + sympy direct-limit computation + unimodular determinant all give $\mathbb{Z}^2$ independently.
- [x] **Literature alignment**: agrees with [@anderson-putnam1998].
- [x] **Distinctness or admission**: distinguished from Thue-Morse via the substitution-rule self-duality test (substantive d-frame content); cohomologically equivalent to AP shadow (the d-frame layer adds tagging, not new generators).
