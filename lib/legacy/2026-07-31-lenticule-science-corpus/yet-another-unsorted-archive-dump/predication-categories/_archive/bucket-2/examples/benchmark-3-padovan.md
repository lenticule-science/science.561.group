---
type: example
status: verified
depends-on: [step-n-cohomological-rank-theorem, step-n-substitution-rule, padovan-substitution-settling, anderson-putnam-direct-limit, d-frame-cohomology-comparison, verdier-duality-bitopological-site, strong-mld-via-composed-duality, four-regime-dichotomy]
instantiates: [step-n-cohomological-rank-theorem, d-frame-cohomology-comparison, strong-mld-via-composed-duality]
---

# Benchmark 3: Padovan

End-to-end computation conforming to the [computation protocol](../narratives/computation-protocol.md). The first **mixed-orbit** case in the suite — Padovan has both asymmetric (truth-only, falsity-only) firings AND a $\top$-firing, exhibiting the d-frame structure's most complex orbit type.

Computed via `python3 tools/predication_categories/examples/benchmark_1_fibonacci.py --substitution padovan`.

## Step 1: Specification

Padovan substitution: $\sigma : a \mapsto b,\, b \mapsto c,\, c \mapsto ab$. Substitution matrix $M = \begin{pmatrix} 0 & 1 & 0 \\ 0 & 0 & 1 \\ 1 & 1 & 0 \end{pmatrix}$. Default d-frame valuation: $a \mapsto \mathbf{t}$, $b \mapsto \mathbf{f}$, $c \mapsto \top$. Base $E = \omega_1$, $\Pi = \{P_a, P_b, P_c\}$, $\lambda = \omega_1 + 1$.

## Step 2: Regime classification

Aperiodic regime, $\kappa = \omega_1$. $M$ is primitive (witness $M^5$); $\det M = 1$ (unimodular); Perron eigenvalue $\rho \approx 1.3247$ — the **plastic number**, smallest Pisot number. Characteristic polynomial $\lambda^3 - \lambda - 1$.

## Step 3: $\mathbf{Ab}$-valued cohomology

By the [step-$n$ cohomological rank theorem](../theorems/step-n-cohomological-rank-theorem.md): $\check{H}^1(\Omega_\sigma) \cong \mathbb{Z}^3$. Smith invariants of $M^T$: $(1, 1, 1)$ — unimodular, no torsion. Three generators corresponding to letter types $\{a, b, c\}$.

## Step 4: d-frame cohomology

Per-letter d-frame structure:

| letter | bilattice value | firing type | $L_+$ rank | $L_-$ rank | consistency |
|---|---|---|---|---|---|
| $a$ | $\mathbf{t}$ | truth-only | 1 | 0 | trivial |
| $b$ | $\mathbf{f}$ | falsity-only | 0 | 1 | trivial |
| $c$ | $\top$ | $\top$-firing | 1 | 1 | fails-on-singleton-pair |

Firing-type counts: 1 truth-only, 1 falsity-only, 1 $\top$-firing, 0 $\bot$-firings.

Shadow comparison: $\mathbb{S}(H^1_{\mathbf{dFrm}}) = (\mathbb{Z}^2, \mathbb{Z}^2)$ — both $a$ and $c$ contribute on the truth side; both $b$ and $c$ on the falsity side. Per-firing accounting: $1 + 1 + 1 + 0 = 3$ ✓ matches $\mathbf{Ab}$-valued rank $\mathbb{Z}^3$. The $\top$-firing on $c$ is **double-counted** in the shadow (appears on both sides) but counted once in the Ab total — visible inclusion-exclusion: $|L_+| + |L_-| - |\top| = 2 + 2 - 1 = 3$.

## Step 5: Verdier dual

$H_1 = \mathrm{colim}(\mathbb{Z}^n, M)$ has rank 3, det 1, Smith invariants $(1, 1, 1)$ — matching $H^1$. Verdier duality $H^1 \cong H_1$ verified.

## Step 6: Strong-MLD orbit type

**Mixed** orbit (both $\top$ and asymmetric firings present). The $c$-firing is fixed by $\mathbb{D}_{\mathrm{val}}$ individually (it's $\top$, both sides present); the $a$- and $b$-firings exchange under $\mathbb{D}_{\mathrm{val}}$. Orbit size depends on whether $a \leftrightarrow b$ swap leaves the substitution structure invariant.

Two notions of self-duality both fail:
- (1) Firing-pattern self-duality: false ($a$- and $b$-firings are not $\top$ or $\bot$).
- (2) Substitution-rule self-duality: false. Negation-induced permutation: $a \leftrightarrow b$, $c$ fixed. Check $M \cdot P = P \cdot M$ where $P$ is the swap matrix:

$$M \cdot P = \begin{pmatrix} 0 & 1 & 0 \\ 0 & 0 & 1 \\ 1 & 1 & 0 \end{pmatrix} \cdot \begin{pmatrix} 0 & 1 & 0 \\ 1 & 0 & 0 \\ 0 & 0 & 1 \end{pmatrix} = \begin{pmatrix} 1 & 0 & 0 \\ 0 & 0 & 1 \\ 1 & 1 & 0 \end{pmatrix} \neq P \cdot M.$$

So Padovan's substitution rule does **not** respect bilattice negation — distinguishing it from Thue-Morse.

## Step 7: Literature comparison

Agrees with Anderson-Putnam: $\check{H}^1(\Omega_\sigma) \cong \mathbb{Z}^3$ for the Padovan substitution. The plastic-number eigenvalue $\rho \approx 1.3247$ is the smallest Pisot number, well-documented in the substitution-dynamics literature. The Smith invariants $(1, 1, 1)$ confirm unimodular structure.

## Step 8: What's new

The d-frame structure on Padovan has **substantive content beyond the shadow**:

1. **The $\top$-firing on letter $c$** has consistency-relation structure (fails-on-singleton-pair) the $\mathbf{Ab}$-valued shadow loses. This is the first concrete case in the suite where a single firing carries genuine paraconsistent content.
2. **The shadow inclusion-exclusion** explicitly: $|L_+| + |L_-| - |\top| = 3$, showing how the $\top$-firing's double-counting in the shadow relates to the Ab total. Padovan is the smallest case where this relation has a non-trivial $|\top|$ term.
3. **Mixed orbit type**: the $c$-firing is $\mathbb{D}$-fixed individually while $a, b$ exchange. The full settling's $\mathbb{D}$-orbit is therefore size 2 (paired with the negation), but with one firing fixed and two firings exchanged — a richer orbit structure than Fibonacci's "pure exchange" or Thue-Morse's "substitution-rule self-duality."

These three features each represent d-frame content the underlying $\mathbf{Ab}$-cohomology doesn't capture, and each was predicted by the framework's theorems before computation.

## Acceptance criteria checklist

- [x] **Reproducibility**: regenerable via `python3 tools/predication_categories/examples/benchmark_1_fibonacci.py --substitution padovan`.
- [x] **Triangulation**: AP rank theorem + sympy direct-limit + plastic-number eigenvalue check all consistent.
- [x] **Literature alignment**: agrees with substitution-dynamics literature on plastic-number Pisot growth and rank-3 cohomology.
- [x] **Distinctness or admission**: three substantive d-frame contributions (consistency relation on $\top$-firing, inclusion-exclusion, mixed orbit), each adding content beyond the shadow.
