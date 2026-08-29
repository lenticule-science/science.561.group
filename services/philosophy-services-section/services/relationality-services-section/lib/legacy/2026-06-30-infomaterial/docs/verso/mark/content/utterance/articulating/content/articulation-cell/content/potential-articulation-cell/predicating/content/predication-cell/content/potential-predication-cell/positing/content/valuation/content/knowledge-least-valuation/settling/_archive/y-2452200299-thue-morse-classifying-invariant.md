---
kind: example
status: verified
depends-on: [aperiodic-regime-classification, thue-morse-substitution-settling, thue-morse-d-frame-cohomology, fibonacci-classifying-invariant, anderson-putnam-direct-limit, step-n-cohomological-rank-theorem, step-n-and-bilattice-correspondence]
instantiates: [aperiodic-regime-classification, anderson-putnam-direct-limit]
lineage: 5
---

# Aperiodic classifying invariant of the Thue-Morse substitution settling

The L5b instance of the corpus's [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md). Thue-Morse is a **non-standard case** for the corpus's step-$n$ family: its substitution matrix is singular ($\det M = 0$), so the [step-$n$ cohomological rank theorem](../theorems/step-n-cohomological-rank-theorem.md) (which assumes $\det M \neq 0$) does not apply directly. Computational verification gives $\check{H}^1 = \mathbb{Z}[1/2]$ (rank 1, dyadic rationals) rather than $\mathbb{Z}^2$.

This file was previously written claiming $\check{H}^1 \cong \mathbb{Z}^2$ on a Fibonacci template. That claim was **incorrect** and has been corrected here, surfaced by [benchmark 2](benchmark-2-thue-morse.md)'s computational verification.

## The substitution matrix is singular

Thue-Morse $\sigma : 0 \mapsto 01,\, 1 \mapsto 10$ has substitution matrix

$$M_{\text{TM}} = \begin{pmatrix} 1 & 1 \\ 1 & 1 \end{pmatrix}.$$

This is singular: $\det M = 0$. Eigenvalues are $2$ (Perron) and $0$. The kernel direction is $(1, -1)$; the image direction is $(1, 1)$.

The [step-$n$ cohomological rank theorem](../theorems/step-n-cohomological-rank-theorem.md) requires $\det M \neq 0$ (Q-localization argument breaks otherwise). So the theorem's prediction $\mathrm{cl}\text{-}\mathrm{inv}^{(2)} \cong \mathbb{Z}^2$ does **not** apply to Thue-Morse.

## What the cohomology actually is

The Anderson-Putnam direct limit for Thue-Morse:

$$\check{H}^1(\Omega_{TM}) = \mathrm{colim}_k \,(\mathbb{Z}^2 \xrightarrow{M^T} \mathbb{Z}^2 \xrightarrow{M^T} \cdots).$$

Since $M^T$ has kernel $(1, -1)$, that direction collapses in the colimit. On the image side $\mathrm{span}((1, 1))$, the action is multiplication by $2$ (the Perron eigenvalue). The colimit is therefore

$$\check{H}^1(\Omega_{TM}) \cong \mathbb{Z}[1/2],$$

the dyadic rationals as a $\mathbb{Z}$-module — rank 1, not 2. This matches the published Anderson-Putnam result for Thue-Morse and is verified computationally via `tools/anderson-putnam-cohomology/compute.py` and `tools/verdier-dual/compute.py` (both show Smith invariants $(1, 0)$ and rank 1).

The pre-quotient corpus classifying invariant still has uncountable rank ($|L_{\mathrm{ns}}^+| + |L_{\mathrm{ns}}^-|$ generators); after settling-shift quotient and the appropriate $\mathbb{Z}[1/2]$-localization induced by the substitution's action, the post-quotient invariant is $\mathbb{Z}[1/2]$.

## Bigraded refinement on the d-frame side

By [thue-morse-d-frame-cohomology](thue-morse-d-frame-cohomology.md), the d-frame $H^1$ structure on Thue-Morse has both truth-side and falsity-side content:

$$\mathrm{cl}\text{-}\mathrm{inv}^{(t)}(v_{\text{Thue-Morse}}) = \sum_{\mu \in L_{\mathrm{ns}}^+} e_\mu^{(t)}, \qquad \mathrm{cl}\text{-}\mathrm{inv}^{(\top)}(v_{\text{Thue-Morse}}) = 0$$

(no $\top$-firings in this encoding), and on the falsity side:

$$\mathrm{cl}\text{-}\mathrm{inv}^{(f)}(v_{\text{Thue-Morse}}) = \sum_{\mu \in L_{\mathrm{ns}}^-} e_\mu^{(f)}.$$

After settling-shift quotient, each side localizes at $2$ (the Perron eigenvalue), giving $\mathbb{Z}[1/2]$ per side rather than the full per-side rank.

## What's distinctive at L5b

Thue-Morse exhibits structural features the rest of the step-$n$ family does not:

1. **Singular substitution matrix** (det = 0) — falls outside the step-$n$ rank theorem's hypothesis.
2. **Substitution-rule self-duality** — $M$ commutes with the bilattice-negation-induced alphabet swap (per the [step-$n$ / bilattice cardinality coincidence theorem](../theorems/step-n-and-bilattice-correspondence.md)). This is the corpus's only verified positive case of structural negation correspondence.
3. **Localization at the Perron eigenvalue** — the post-quotient invariant is $\mathbb{Z}[1/2]$, not free abelian of rank $n$.

Features 1 and 3 distinguish Thue-Morse from Fibonacci/Padovan/Tribonacci/Tetranacci. Feature 2 distinguishes Thue-Morse from *all* other named step-$n$ cases.

## Why this case fell outside the corpus's standard story

The step-$n$ family was developed around primitive non-singular substitution matrices (Fibonacci, Padovan, Tetranacci, etc., where $|\det M| = 1$). Thue-Morse's $\det M = 0$ situates it in a different sub-family: **constant-length substitutions** where every letter image has the same length. Constant-length substitutions are well-studied in the literature (their cohomology generally localizes at the substitution length) but the corpus's step-$n$ framework was not initially scoped to include them.

The right way to incorporate Thue-Morse is as a **separate sub-stratum** within the meta-aperiodic stratum — neither in $\mathscr{M}^{(n)}$ for any $n$ (since the rank theorem doesn't apply) nor in the residue (since it *is* substitution-flavored). A "constant-length sub-stratum" with localization-style invariants would be a natural framework extension.

## Position in Lineage 5

The L5b classifying invariant. **Now the first verified instance of the framework's behavior outside the standard primitive-non-singular substitution case.** Pairs with [thue-morse-d-frame-cohomology](thue-morse-d-frame-cohomology.md) (the d-frame structure) and [benchmark 2](benchmark-2-thue-morse.md) (the end-to-end protocol verification).

The substitution-rule self-duality content (feature 2 above) is the corpus's most concrete d-frame structural prediction — see [step-$n$ / bilattice cardinality coincidence](../theorems/step-n-and-bilattice-correspondence.md)'s Thue-Morse positive case.
